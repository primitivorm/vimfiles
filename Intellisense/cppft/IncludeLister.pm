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
use File::Find;
use File::Copy;
use Symbols;

package IncludeLister; our @ISA = qw(Lister);
{
    sub new
    {
        my ($class,$prefix,$sourceFolder,$onlyfromSF) = @_;
        my $self = $class->SUPER::new();
        $self->{m_prefix} = $prefix;
        $self->{m_sourceFolder} = $sourceFolder;
        $self->{m_onlyfromSF} = $onlyfromSF;
        bless $self,$class;
        return $self;
    }

    my $path = undef;
    my $prefix = undef;
    my $refhandle = undef;
    my %included = ();
    sub ptr
    {
        if ($File::Find::name gt $path)
        {
            my $pos = length($path);
            my $result = substr($File::Find::name,$pos + 1);
            my $iconNr = 72;
            my $ret = undef;

            if (defined($result) and $result ne "" and !-d $File::Find::name)
            {
                if ($result =~ m/\.(h|H)$/ or $result !~ m/\./)
                {
                    if (defined($prefix))
                    {
                        if ($result =~ m/^$prefix/)
                        {
                            $ret = $result;
                        }
                    }
                    else
                    {
                        $ret = $result;
                    }
                }
                if (defined($ret))
                {
                    if (!exists($included{$ret}))
                    {
                        print $refhandle "$iconNr:$ret\n";
                        $included{$ret} = $ret;
                    }
                }
            }
        }
    }
    
    sub listMethods
    {
        my ($self,$fh) = @_;
        $prefix = $self->{m_prefix};
        my $sourceFolder = $self->{m_sourceFolder};
        my $onlyfromSF = $self->{m_onlyfromSF};
        $refhandle = $fh;

        my $vimHelperFile = $tempfolder->getTempDir() . "/" . 
                            $Symbols::HELPER_FILE;
        my $cacheFile = $vimHelperFile . "_CACHE";

        print $vimHelperFile . "\n";
        print $cacheFile . "\n";

        if (!-e $cacheFile)
        {
            my $VAR = $ENV{'INCLUDE'};
            my @includes = split(';',$VAR);
            for (@includes)
            {
                Logger->logInfo("INCLUDE = $_",__LINE__,__FILE__);
                $path = $_;
                File::Find::find(\&ptr,$path);
            }
            
            copy($vimHelperFile,$cacheFile);
        }
        else
        {
            copy($cacheFile,$vimHelperFile);
        }
    }
}
1;
