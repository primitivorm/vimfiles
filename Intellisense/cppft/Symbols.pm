#-----------------------------------------------------------------------------
# C++ Plugin for Vim Intellisense.                                               
# Author    : Madhan Ganesh                                                   
# Dated     : August 21st 2004                                                
# Version   : cppft 1.0                                                       
#                                                                          
# You can modify the source, provided you leave this header information.
#-----------------------------------------------------------------------------

use Logger;

#-----------------------------------------------------------------------------
# This package defines some symbols which are required accross modules.
#
package Symbols;
{
    $HELPER_FILE     = "VimHelper.txt";
    $TAGS_FILE       = "InsenVimAllTags.tags";
    $SESSION_FILE    = "VimInsenCppFt.ses";
    $PARAM_FILE      = "VimHelperParam.txt";
    $EDIT_FILE       = "viminsrc.tmp";
}
1;
