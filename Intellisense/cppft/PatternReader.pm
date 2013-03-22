#-----------------------------------------------------------------------------
# C++ Plugin for Vim Intellisense.                                               
# Author    : Madhan Ganesh                                                   
# Dated     : August 21st 2004                                                
# Version   : cppft 1.0                                                       
#                                                                          
# You can modify the source, provided you leave this header information.
#-----------------------------------------------------------------------------

#use strict;
use Logger;
use File::Basename;
use Symbols;

#-----------------------------------------------------------------------------
# This class is used to search for a particular pattern in the include files.
# When asked to search a pattern, it starts searching in a first file. 
# While doing so it also traks the files included in the search file and 
# updates IncludeFileQueue. The usage pattern is,
#
#                            IncludeFileQueue    
#                   ---------------------------     
#                   O O O O O O .....   (include files)             
#                   ---------------------------
#      (getNextAvailableFileName)             (addIncludeFileName)
#                   
#
#               class PatternReader
#               {
#               
#                   list<string> m_captures;
#                   
#                   bool readPatter(string pattern, int nrOfCapturs,IncludeFileQueue queue)
#                   {
#                       * get the next filename from the queue.
#                       
#                       * search for pattern in the fn. while searching if include is found,
#                         push the included file name to the queue. 
#
#                       * if the search patter is found in the queue return true copying the
#                         captures 1 to nrOfCapturs in the m_captures container.                    
#                                              
#                   }
#
#                   list<string> getCaptures()
#                   {
#                       return m_captures;
#                   }
#               };
#       
#              
#              Usage:
#              ======
#
#              PatterReader pr = new PatterReader();
#              if (pr->searchPattern("class (.*)",1,includeFileQueue))
#              {
#                   @captures = pr->getCaptures();
#                   className = $captures[0];
#              }
#              
#               
#              Note:
#              =====
#              *) The IncludeFileQueue is a singleton class. 
#              *) Multiple instances of PatternReader can access IncludeFileQueue (concurrently).
#              
#
package PatternReader;
{
    sub new
    {
        my ($class) = @_;
        my $self = {
            m_captures => [],
            m_foundInFile => undef
        };
        bless $self,$class;
        return $self;
    }

    sub searchPattern
    {
        my ($self,$ifq,$pattern,$nrOfCaptures,$sourceFolder) = @_;
        my $searchFile = $ifq->getNextSearchFile();
        my $found = 0;

        local @searchedFiles;
        while (defined($searchFile))
        {
            push(@searchedFiles, $searchFile);

            my $filePathName = $self->findFilePathName($searchFile,$sourceFolder);
            $found = $self->searchPatternInFile($pattern,$nrOfCaptures,$filePathName,$ifq);
            if ($found == 1)
            {
                $self->{m_foundInFile} = $filePathName;
                last;
            }
            $searchFile = $ifq->getNextSearchFile();
        }

        # log information if patter not found.
        if (!$found)
        {
            Logger->logWarning("Patten '$pattern' not found in the available include files: @searchedFiles",__LINE__,__FILE__);
        }
        else
        {
            my $temp = "";
            for ($self->getCaptures())
            {
                $temp .= "[$_]";
            }
            Logger->logInfo("Pattern '$pattern' found in file " . $self->getFoundInFile() . " with captures '" . $temp . "'",__LINE__,__FILE__);
        }
        
        return $found;
    }

    sub getCaptures
    {
        my ($self) = @_;
        return @{$self->{m_captures}};
    }

    sub getFoundInFile
    {
        my ($self) = @_;
        return $self->{m_foundInFile};
    }

    # Class helper methods.

    #----------------------------------------------------------------
    # This method searches the given pattern in the given file. While 
    # searching if it reads a #include line the included file is pushed
    # to the include file queue.
    #
    # Parameters:
    #   $self       - the blessed reference of the class object.
    #   $pattern    - the pattern to to be searched in the file.
    #   $nrOfCaptures - the number of captures in the search string.
    #   $ifq        - the include file queue.
    #
    # Return Value:
    #   bool - true, if the pattern is found.
    #        - false if the pattern is not found.
    sub searchPatternInFile
    {
        my ($self,$pattern,$nrOfCaptures,$searchFile,$ifq) = @_;
        my $line = "";
        my $found = 0;
        my $incc = 0;
        my $includeStarted = 0;
       
        if (defined($searchFile) and -f $searchFile)
        {
            open(SF,$searchFile);
            LOOP:
            while ($line = <SF>)
            {
                # chomp line and trim it.
                chomp($line);

                # you can get some funny files when changing filetypes in vim
                # and cygwin
                $line =~ s/[\r\n]*$//g;

		        $line =~ s/(^\s*(?=.)|(?<=.)\s*$)//g;

                # if the line is a comment or inside comment block continue 
                # with next line.
        		if ($incc == 0 && $line =~ /\/\*/) {$incc = 1;}
		        if ($incc == 1 && $line =~ /\*\//) {$incc = 0;next;}
        		if ($incc == 1 || $line =~ m/^\/\// || $line eq "") 
                {
                    next;
                }

                # if a comment is ther in the line but not in the start 
                # better strip the comment.
                $line =~ s/\/\/.*$//g;
               
                # if the line happens to be an #include ... store the included filr
                # in the IFQ.
		        if ($line =~ /^#include\s+(["<])(.+)[">]/)
		        {
                    my $symbol = $1;
                    my $ifile = $2;
                    if ($symbol eq "\"")
                    {
                        if ($searchFile !~ m/$Symbols::EDIT_FILE/) 
                        {
                            $searchFile =~ s#\\#/#g; #convert to unix

                            my $temp = File::Basename::dirname($searchFile);
                            $ifile =  "$temp/$ifile";                        
                        }
                    }
                    $ifq->addSearchFile($ifile);
                    $includeStarted = 1;
                }

                # if the pattern is "" the search is requested to only pick include
                # files to the IFQ. In this case break once the #includes are over.
                # 
                # NOTE : i am assuming in a C++ header file if #include has started
                # only #include should follow. Of course empty lines are allowed.
                if ($pattern eq "")
                {
                    if ($includeStarted == 1 && $line !~ m/^#/ && $line !~ m/^using\s/ && $line !~ m/;$/)
                    {
                        last LOOP;
                    }
                }
                else
                {

                    # also check if the requested pattern is found.
                    if ($line =~ m/$pattern/)
                    {
                        my $i = 1;
                        my $discard = 0;
                        for (;$i<=$nrOfCaptures;$i++)
                        {
                            if (defined($$i))
                            {
                                if ($$i =~ /return|delete/)
                                {
                                    $discard = 1;
                                    last;
                                }
                                push(@{$self->{m_captures}},$$i);
                            }
                        }
                        if (!$discard)
                        {
                            $found = 1; 
                            last LOOP;
                        }
                    }            
                }
            }
            close(SF);  
        }
        return $found;
    }
    
    #----------------------------------------------------------------
    # This method finds the full pat of the include file name. It does
    # this using below sequence,
    #   
    #   *) If the file exists as such it is alredy in the full path
    #      just return the same.
    #
    #   *) Append the editing C++ file's folder and check if that file
    #      exists. If so that is the path.
    #
    #   *) Get the paths in the INCLUDE variable. Append the file with 
    #      each. And one that exists is the full path name.
    #
    # Parameters:
    #   $self       - the oject's instance.
    #   $fileName   - the file name whose full path has to be found.
    #   $sourceFolder - the folder where the current C++ source is 
    #                   being edited.
    #
    # Return Value:
    #   string - the ful path of the given file name.
    # 
    sub findFilePathName
    {
        my ($self,$fileName,$sourceFolder) = @_;
        my $fullPath = undef;
        
        #check if the file is alredy with path.
        if (-e $fileName)
        {
            $fullPath = $fileName;
        }

        # next prepend the editing file's folder and check if that
        # path exists.
        if (!defined($fullPath))
        {
            my $temp = $sourceFolder . "\\" . $fileName;
            if (-e $temp)
            {
                $fullPath = $temp;
            }
        }

        # if not yet, loop through the INCLUDE paths and check.
        if (!defined($fullPath))
        {
            my $VAR = $ENV{'INCLUDE'};

            if (defined($VAR))
            {
                @includes = split(';',$VAR);

                for (@includes)
                {
                    Logger->logInfo("INCLUDE = $_",__LINE__,__FILE__);
                    my $temp = $_ . "\\" . $fileName;
                    if (-e $temp)
                    {
                        $fullPath = $temp;
                        last;
                    }
                }
            }
        }

        # log if you could not found the path name for this file.
        if (!defined($fullPath))
        {
            Logger->logWarning("Could not define fullpath for include file $fileName",__LINE__,__FILE__);
        }
        else
        {
            #Logger->logInfo("Include file $fileName found in path '$fullPath'",__LINE__,__FILE__);
        }
        return $fullPath;
    }
}
1;
