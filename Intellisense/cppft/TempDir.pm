#-----------------------------------------------------------------------------
# C++ Plugin for Vim Intellisense.                                               
# Author    : Madhan Ganesh                                                   
# Dated     : August 21st 2004                                                
# Version   : cppft 1.0                                                       
#                                                                          
# You can modify the source, provided you leave this header information.
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# This class encapsuates the location of the TEMP directory, this enables easier
# maintenance
#
package TempDir;
{
    #-------------------------------------------------------------------------
    # This method acts as constructor for the class.  Made this an object 
    # instead of a singleton so it is easier to understand when it is
    # configured.  this allows for easier testing.
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

        $self->{m_tempFolder} = $ENV{'TEMP'};

        if (not defined($self->{m_tempFolder}))
        {
            $self->{m_tempFolder} = "/tmp";
        }

        mkdir $self->{m_tempFolder};

        die "\n\n\nFATAL: Failed to find a suitable TEMP directory\n\n\n" 
                                               unless(-e $self->{m_tempFolder});

        $self->{m_logFileName} = $self->{m_tempFolder} . "/insen_cppft.log";

        bless $self,$class;
        return $self;
    }

    sub getTempDir
    {
        my $self = shift;
        return $self->{m_tempFolder};
    }

    sub getLogFName
    {
        my $self = shift;
        return $self->{m_logFileName};
    }
}
1;
