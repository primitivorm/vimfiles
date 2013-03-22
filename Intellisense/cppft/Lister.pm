#-----------------------------------------------------------------------------
# C++ Plugin for Vim Intellisense.                                               
# Author    : Madhan Ganesh                                                   
# Dated     : August 21st 2004                                                
# Version   : cppft 1.0                                                       
#                                                                          
# You can modify the source, provided you leave this header information.
#-----------------------------------------------------------------------------

use Logger;

package Lister;
{
    sub new
    {
        my $class = shift;
        $self= {};
        bless $self,$class;
        return $self;
    }

    sub listMethods
    {
    }
}
1;
