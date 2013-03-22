#-----------------------------------------------------------------------------
# C++ Plugin for Vim Intellisense.                                               
# Author    : Madhan Ganesh                                                   
# Dated     : August 21st 2004                                                
# Version   : cppft 1.0                                                       
#                                                                          
# You can modify the source, provided you leave this header information.
#-----------------------------------------------------------------------------

use Logger;
use VimHelper;
use Lister;

package NamespaceLister; 
use vars qw(@ISA);
@ISA = qw(Lister);
{
    sub new
    {
        my ($class,$namespace) = @_;
        my $self = $class->SUPER::new();
        $self->{m_namespace} = $namespace;
        bless $self,$class;
        return $self;
    }

    sub listMethods
    {
        my ($self,$fh) = @_;
        my $allTagsFileName = VimHelper::getAllTagsFile(0);
        my $namespaceName = $self->{m_namespace};
        my %typesAdded = ();
        
        if (-e $allTagsFileName)
        {
            open(TF,$allTagsFileName);
            # strcpy	STRING.H	/^_CRTIMP char *  __cdecl strcpy(char *, const char *);$/;"	kind:prototype	line:96	signature:(char *, const char *)
            my $search = "(^[\\w]+)\\t.*\\skind:(\\w+).*\\snamespace:(\\w+::)*$namespaceName(\\s|\$)";
            if ($namespaceName eq "::")
            {
                $search = "(^[\\w]+)\\t.*\\skind:(\\w+).*";
            }
            my $line = "";
            my $count = 0;
            while ($line = <TF>)
            {
                # ignore the comment lines.
                if ($line =~ m/^!_/)
                {
                    next;
                }
    
                chomp($line);

                # check for the pattern namespace:$namespaceName and if exists
                # get the details and print in the return file.
                if ($line =~ m/$search/)
                {
                    if ($namespaceName eq "::")
                    {
                        if ($line =~ m/(class|struct|enum|union|namespace):/ and $2 !~ m/(class|namespace|struct|union|enum|function|prototype)/ and $1 =~ m/^__/)
                        {
                            next;
                        }
                    }
                    if (!exists($typesAdded{$1}))
                    {
                        my $iconNr = "69";
                        $iconNr = "128" if ($2 eq "class");
                        $iconNr = "60" if ($2 eq "namespace");
                        $iconNr = "69" if ($2 eq "struct");
                        $iconNr = "61" if ($2 eq "union");
                        $iconNr = "70" if ($2 eq "enum");
                        $iconNr = "18" if ($2 eq "function");
                        $iconNr = "18" if ($2 eq "prototype");
                        print $fh "$iconNr:$1\n";
                        $typesAdded{$1} = $1;
                        $count++;
                        if ($count > 200)
                        {
                            last;
                        }
                    }
                }

            }
            close(TF);
        }
        else
        {
            Logger->logError("'$allTagsFileName' does not exists",__LINE__,__FILE__);
        }
    }
}
1;
