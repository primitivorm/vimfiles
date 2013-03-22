#-----------------------------------------------------------------------------
# C++ Plugin for Vim Intellisense.                                               
# Author    : Madhan Ganesh                                                   
# Dated     : August 21st 2004                                                
# Version   : cppft 1.0                                                       
#                                                                          
# You can modify the source, provided you leave this header information.
#-----------------------------------------------------------------------------

use Logger;
use Lister;
use ListerFactory;
use IncludeLister;
use VimHelperParam;
use FileOps;
use Symbols;

require Config;
 
#-----------------------------------------------------------------------------
# This class is called from cppft.dll The methods are invoked for 
# listing member variables, tooltip and ctrl space.
#
# This class acts as main method for C++ insen plugin. It reads the param 
# file, instantiates appropriate lister and inokes the list method on it.
package VimHelper;
{
    #-------------------------------------------------------------------------
    # This method acts as constructor for the class.
    # 
    # Parameters:
    #   param1  
    #       name of the class being created.
    #
    # Return Value:
    #   Reference of the 'bless'ed object.
    # 
    sub new
    {
        my ($class) = @_;
        my $self = {
            m_paramFile => undef,
            m_returnFileName => undef,
            m_tagsFileName => undef,
        };
        bless $self,$class;
        return $self;
    }

    #------------------------------------------------------------------------
    # This method reads the VimHelperParam.txt to read various parameters 
    # written by the insenvim.exe. The file is created in the %TEMP% folder.
    #
    # Note:
    # =====
    # The format of the VimHelperParam.txt is,
    # 
    #       C:\DOCUME~1\ADMINI~1.PEA\LOCALS~1\Tempviminsrc.tmp 
    #       t.
    #       35:5
    #       2004-Aug-22-19-59-03
    #       E:\temp\Test.cpp
    #       VI1
    # 
    sub readParams
    {
        # Get the %TEMP% folder.
        my $self = shift;

        my $tempFolder = new TempDir();
        
        $self->{m_paramFile} = new VimHelperParam();

        $self->{m_returnFileName} = $tempFolder->getTempDir() .  "/" 
                                    . $Symbols::HELPER_FILE;

        $self->{m_tagsFileName} = $tempFolder->getTempDir() . "/" 
                                    . $Symbols::TAGS_FILE;
	
	
        # remove if the files exists already.
        VimHelper::removeFileIfExists($self->{m_returnFileName}); 
        VimHelper::removeFileIfExists($self->{m_tagsFileName}); 

        Logger::removeLogFile

        VimHelper::rm($self->{m_paramFile}->getSrcFileName());
        VimHelper::rm($self->{m_paramFile}->getRowCol());
        VimHelper::rm($self->{m_paramFile}->getSessionID());
        VimHelper::rm($self->{m_paramFile}->getCppFileName());

        $self->setCurrentSessionID();

        # log the information of parameters read.
        Logger->logInfoHash($self);
        Logger->logInfoHash($self->{m_paramFile});
    }
    
    #-------------------------------------------------------------------------
    #
    sub listMethods
    {
        my ($self) = @_;
        $self->readParams();

        my $dottedExpr = $self->{m_paramFile}->getDottedExpr();
        my $returnFileName = $self->{m_returnFileName};
        my $lister = undef;
        
        # get the dotted expression.
        my $dotted = VimHelper::getDotted($dottedExpr);
        if ($dotted =~ m/(::|->|\.|\()$/)
        {
            Logger->logInfo("dotted = $dotted",__LINE__,__FILE__);

            # create an instance of IFQ and initialize with the 
            # current source file.
            my $ifq = IncludeFileQueue->getIFQueue();
            $ifq->addSearchFile($self->{m_paramFile}->getSrcFileName());

            # make a lister for the dotted expression.
            $lister = ListerFactory::getLister(
                                    $dotted,
                                    $ifq,
                                    $self->{m_paramFile}->getCurrentFolder());
            
        }
        else
        {
            if ($dottedExpr =~ m/^#include\s+<$/)
            {
                $lister = new IncludeLister(undef,undef,undef);
            }
        }

        # if the lister id defined list the text.
        if (defined($lister))
        {
            # create "VimHelper.txt"
            open(RF,">$returnFileName");
            $lister->listMethods(*RF);
            close(RF);
        }

        # if the return file is empty better remove the file.
        my $retFileSize = -s $self->{m_returnFileName};
        if ($retFileSize == 0)
        {
            unlink $self->{m_returnFileName};
        }
    }

    # static utility methods
    sub removeFileIfExists
    {
        if (-e $_[0])
        {
            unlink $_[0];
        }
    }

    sub rmspace
    {
        $_[0] =~ s/(^\s*(?=.)|(?<=.)\s*$)//g;
    }

    sub rm
    {
	    rmspace(chomp($_[0]));
    }    

    sub getDotted
    {
        my ($dotted) = @_;     
        
        # remove the angle brakets in ase of templates. eg 
        # remove <int,int> from map<int,int>::
        $dotted =~ s/(<.+>)::$/::/g;

        my $str = reverse($dotted);
        my $len = length($str);
        my $x=1;
        my $intemplateangle = 0;
        for (;$x<$len;$x++)
        {
            my $c = substr($str,$x,1);
            if ($c eq ")" || $c eq "]" || $c eq "(" || $c eq "<" || 
                $c eq "," || $c eq "!" || $c eq "=" || $c eq "&" || $c eq " ")
            {
                last;       
            }    
        }
        my $ret = substr($dotted,$len-$x);
        VimHelper::rmspace($ret);
        return $ret;
    }

    # static variable to hold current session id.
    my $sm_currentSessionID = undef;
    my $sm_currentFolder = undef;

    # method to set the session id. 
    sub setCurrentSessionID
    {
        my $self = shift;
        $sm_currentSessionID = $self->{m_paramFile}->getSessionID() . 
                                "#" . $self->{m_paramFile}->getCppFileName();
        $sm_currentFolder = $self->{m_paramFile}->getCurrentFolder();
    }

    sub getAllTagsFile
    {
        my $forceCreate = 0;

        my $temp = new TempDir();
        my ($sessionIDFile, $allTagsFile);

        $sessionIDFile = $temp->getTempDir() . "/" . $Symbols::SESSION_FILE;
        $allTagsFile = $temp->getTempDir() . "/" . $Symbols::TAGS_FILE;

        my $isSessionChanged = 1;

        if (defined($_[0]))
        {
            $forceCreate = $_[0];
        }
        
        # check if the sessioid is changed.
        if (-e $sessionIDFile)
        {
            open(SF,$sessionIDFile);
            my $prevSessionID = FileOps::readFileAndStrip(*SF);
            rm($prevSessionID);
            close(SF);
            if ($prevSessionID eq $sm_currentSessionID)
            {
                $isSessionChanged = 0;
            }
        }

        # if the session is changed create update the session id.
        if ($isSessionChanged == 1)
        {
            if (-e $sessionIDFile)
            {
                unlink $sessionIDFile;
            }
            open(SF1,">$sessionIDFile");
            print SF1 "$sm_currentSessionID\n";
            close(SF1);
        }

        # check if the alltags file exists.
        if (!-e $allTagsFile)
        {
            $isSessionChanged = 1;
        }
         
        # if force create is switched on just create tag file again.
        if ($forceCreate)
        {
            $isSessionChanged = 1;
        }

        if ($isSessionChanged == 1)
        {
            my $ifq = IncludeFileQueue->getIFQueue();
            my $pr = new PatternReader;
            
            $ifq->begin();
            $pr->searchPattern($ifq,"",0,$sm_currentFolder);
            $ifq->begin();
            my $files = "";
            my $hf = $ifq->getNextSearchFile();
            while (defined($hf))
            {
                my $temp = $pr->findFilePathName($hf,$sm_currentFolder);
                if (defined($temp) and $temp ne "")
                {
                    $files = $files . " \"$temp\"";
                }
                $hf = $ifq->getNextSearchFile();
            }   

            my $ctags = '';

            # we can not use win32 version of ctags under cygwin due to
            # possible path differences (i.e. /cygdrive/c/...)
            if ($Config::Config{'osname'} ne "MSWin32")
            {
                my $USR_CTAGS = "/usr/bin/ctags";
                my $BIN_CTAGS = "/bin/ctags";

                if (-x $USR_CTAGS)
                {
                    $ctags = $USR_CTAGS;
                }
                elsif (-x $BIN_CTAGS)
                {
                    $ctags = $BIN_CTAGS;
                }
                else
                {
                    # hope it is in our path. didn't do this first because
                    # I am concerned the native win32 version may be in the
                    # path prior to the cygwin version.  of course on unix
                    # this won't be a problem:)
                    $ctags = "ctags";
                }
            }
            else
            {
                $ctags = "../ctags.exe"; # for test suite
                if (!-e $ctags)
                {
                    $ctags = "$ENV{VIM_INTELLISENSE}\\cppft\\ctags.exe";
                    if (!-e $ctags)
                    {
                        Logger->logCritical("Ctage file '$ctags' is not found",
                                            __LINE__,__FILE__);
                    }
                }

                # need to quote spaces, must be done after existence check
                # other wise the quotes confuse -e and it fails
                $ctags = "\"" . $ctags . "\"";
            }

            $ctags_sys = "$ctags -f $allTagsFile --fields=+aiKmnsSz " .
                         "--language-force=C++ --C++-kinds=+cefgmnpsut-dlux " .
                         "-u $files";

            Logger->logInfo("$ctags_sys",__LINE__,__FILE__);

            if (system($ctags_sys))
            {
                Logger->logCritical("Failed to generate tags file [$files]",
                                    __LINE__,__FILE__);
            }
            # prinf some information.
            Logger->logInfo("All tags generated for file [$files]",
                            __LINE__,__FILE__);
        }

        return $allTagsFile;
    }

    sub getReturnFileName
    {
        my $self= shift;
        return $self->{m_returnFileName};
    }
}
1;
