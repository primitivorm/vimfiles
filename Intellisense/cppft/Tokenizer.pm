#-----------------------------------------------------------------------------
# C++ Plugin for Vim Intellisense.                                               
# Author    : Madhan Ganesh                                                   
# Dated     : August 21st 2004                                                
# Version   : cppft 1.0                                                       
#                                                                          
# You can modify the source, provided you leave this header information.
#-----------------------------------------------------------------------------

use strict;
use Symbols;

#-----------------------------------------------------------------------------
# 
#
package Tokenizer;
{
    sub getDotted
    {
        my ($dotted) = @_;
        my $str = reverse($dotted);
        my $len = length($str);
        my $x=1;
        for (;$x<$len;$x++)
        {
            $c = substr($str,$x,1);
            if ($c eq ")" || $c eq "]" || $c eq "(" || $c eq "<" || $c eq "," || $c eq "<" || $c eq "!" || $c eq "=")
            {
                last;       
            }    
        }
        my $ret = substr($m_dotted_expr,$len-$x);
        Symbols::rmspace($ret);
        return $ret;
    }
}
1;
