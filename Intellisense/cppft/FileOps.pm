#-----------------------------------------------------------------------------
# C++ Plugin for Vim Intellisense.                                               
# Author    : Madhan Ganesh                                                   
# Dated     : March 21st 2004                                                
# Version   : cppft 1.0                                                       
#                                                                          
# You can modify the source, provided you leave this header information.
#-----------------------------------------------------------------------------

use Logger;
 
#-----------------------------------------------------------------------------
# This class encapsuates File Operations common to all modules here.  This 
# allowed for easier porting to cygwin
#
package FileOps;
{
    #------------------------------------------------------------------------
    # This method reads a line of text from the given file handle.  It strips
    # <CR> and <CR/LF> and then returns the string, done for cygwin and NT
    # compatability
    #
    sub readFileAndStrip
    {
        my ($FILE) = @_;
        my $tmp = <$FILE>;
        chomp($tmp);
        $tmp =~ s/\r$//;
        return $tmp;
    }
}
1;
