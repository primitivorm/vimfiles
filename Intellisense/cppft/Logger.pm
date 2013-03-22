#-----------------------------------------------------------------------------
# C++ Plugin for Vim Intellisense.                                               
# Author    : Madhan Ganesh                                                   
# Dated     : August 21st 2004                                                
# Version   : cppft 1.0                                                       
#                                                                          
# You can modify the source, provided you leave this header information.
#-----------------------------------------------------------------------------

use TempDir;

#-----------------------------------------------------------------------------
# This class is designed to abstract the logging functionality for the insen 
# package. 
package Logger;
{
    sub removeLogFile
    {
        my ($tempDir) = new TempDir();
        unlink ($tempDir->getLogFName());
    }

    sub logInfo
    {
        if (defined($ENV{'INSENVIM_CPPFT_INFO_LOG'}))
        {
            my ($self,$msg,$line,$file) = @_;

            my ($tempDir) = new TempDir();
            open(LOGFILE,">>" . $tempDir->getLogFName());

            my $nmsg = "INFO : $msg [$file($line)]\n";
            print LOGFILE $nmsg;
            close(LOGFILE);
        }
    }

    sub logInfoHash
    {
        if (defined($ENV{'INSENVIM_CPPFT_INFO_LOG'}))
        {
            my ($self,$hashRef) = @_;

            my ($tempDir) = new TempDir();
            open(LOGFILE,">>" . $tempDir->getLogFName());

            for $key (keys %$hashRef)
            {
                my $keyVal = $$hashRef{$key};
                if (!defined($keyVal))
                {
                    $keyVal = "";
                }
                print LOGFILE "$key = $keyVal\n";
            }
            close(LOGFILE);
        }
    }

    sub logWarning
    {
        my ($self,$msg,$line,$file) = @_;

        my ($tempDir) = new TempDir();
        open(LOGFILE,">>" . $tempDir->getLogFName());

        my $nmsg = "Warn : $msg [$file($line)]\n";
        print LOGFILE $nmsg;
        close(LOGFILE);
    }

    sub logError
    {
        my ($self,$msg,$line,$file) = @_;

        my ($tempDir) = new TempDir();
        open(LOGFILE,">>" . $tempDir->getLogFName());

        my $nmsg = "Error : $msg [$file($line)]\n";
        print LOGFILE $nmsg;
        close(LOGFILE);
    }

    sub logCritical
    {
        my ($self,$msg,$line,$file) = @_;

        my ($tempDir) = new TempDir();
        open(LOGFILE,">>" . $tempDir->getLogFName());

        my $nmsg = "Error : $msg [$file($line)]\n";
        print LOGFILE $nmsg;
        close(LOGFILE);
        die $nmsg;
    }
}
1;
