#-----------------------------------------------------------------------------
# C++ Plugin for Vim Intellisense.                                               
# Author    : Madhan Ganesh                                                   
# Dated     : August 21st 2004                                                
# Version   : cppft 1.0                                                       
#                                                                          
# You can modify the source, provided you leave this header information.
#-----------------------------------------------------------------------------

use Logger;
use FileOps;
use TempDir;
use Symbols;

#-----------------------------------------------------------------------------
# This class encapsuates VimHelperParam input file
#
package VimHelperParam;
{
    #-------------------------------------------------------------------------
    # This method acts as constructor for the class.
    # This method reads the VimHelperParam.txt to read various parameters 
    # written by the insenvim.exe. The file is created in the %TEMP% folder.
    #
    # Note:
    # =====
    # The format of the VimHeperParam.txt is,
    # 
    #       C:\DOCUME~1\ADMINI~1.PEA\LOCALS~1\Tempviminsrc.tmp 
    #       t.
    #       35:5
    #       2004-Aug-22-19-59-03
    #       E:\temp\Test.cpp
    #       VI1
    # 
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

        my $tempFolder = new TempDir();
        
        $self->{m_paramFileName} = $tempFolder->getTempDir() . 
                                                     "/" . $Symbols::PARAM_FILE;

        open(PARAMFILE,$self->{m_paramFileName}) ||
            Logger->logCritical("Unable to open ($self->{m_paramFileName})",
                                __LINE__,__FILE__);

        $self->{m_srcFileName}  = FileOps::readFileAndStrip(*PARAMFILE);
        $self->{m_dottedExpr}   = FileOps::readFileAndStrip(*PARAMFILE);
        $self->{m_rowcol}       = FileOps::readFileAndStrip(*PARAMFILE);
        $self->{m_sessionID}    = FileOps::readFileAndStrip(*PARAMFILE);
        $self->{m_cppFileName}  = FileOps::readFileAndStrip(*PARAMFILE);

        close(PARAMFILE);

        $self->{m_cppFileName} =~ m/^(.*\\)\w+\.(cpp|h)/;
        $self->{m_currentFolder} = $1;

        die "paramFileName not read from $Symbols::PARAM_FILE\n" 
                                    if (!defined($self->{m_paramFileName}));
        die "srcFile name not read from $Symbols::PARAM_FILE\n" 
                                    if (!defined($self->{m_srcFileName}));
        die "dottedExpr not read from $Symbols::PARAM_FILE\n" 
                                    if (!defined($self->{m_dottedExpr}));
        die "rowcol not read from $Symbols::PARAM_FILE\n" 
                                    if (!defined($self->{m_rowcol}));
        die "sessionID not read from $Symbols::PARAM_FILE\n" 
                                    if (!defined($self->{m_sessionID}));
        die "cppFileName not read from $Symbols::PARAM_FILE\n" 
                                    if (!defined($self->{m_cppFileName}));
        die "currentFolder failed to convert from ($self->{m_cppFileName})\n" 
                                    if (!defined($self->{m_currentFolder}));
        bless $self,$class;
        return $self;
    }

    sub dumpMembers
    {
        my ($self) = shift;
        print "------------------------------------------------------------\n";
        print "VimHelperParam::m_paramFileName = $self->{m_paramFileName}\n";
        print "VimHelperParam::m_srcFileName   = $self->{m_srcFileName}\n";
        print "VimHelperParam::m_cppFileName   = $self->{m_cppFileName}\n";
        print "VimHelperParam::m_currentFolder = $self->{m_currentFolder}\n";
        print "VimHelperParam::m_dottedExpr    = $self->{m_dottedExpr}\n";
        print "VimHelperParam::m_rowcol        = $self->{m_rowcol}\n";
        print "VimHelperParam::m_sessionID     = $self->{m_sessionID}\n";
        print "------------------------------------------------------------\n";
    }

    sub getSrcFileName
    {
        my ($self) = shift;
        die "must call new() first" unless (defined($self->{m_srcFileName}));
        return $self->{m_srcFileName};
    }

    sub getDottedExpr
    {
        my ($self) = shift;
        die "must call new() first" unless (defined($self->{m_dottedExpr}));
        return $self->{m_dottedExpr};
    }

    sub getRowCol
    {
        my ($self) = shift;
        die "must call new() first" unless (defined($self->{m_rowcol}));
        return $self->{m_rowcol};
    }

    sub getSessionID
    {
        my ($self) = shift;
        die "must call new() first" unless (defined($self->{m_sessionID}));
        return $self->{m_sessionID};
    }

    sub getCppFileName
    {
        my ($self) = shift;
        die "must call new() first" unless (defined($self->{m_cppFileName}));
        return $self->{m_cppFileName};
    }

    sub getCurrentFolder
    {
        my ($self) = shift;
        die "must call new() first" unless (defined($self->{m_currentFolder}));
        return $self->{m_currentFolder};
    }
}
1;
