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

package TooltipLister; our @ISA = qw(Lister);
{
    sub new
    {
        my ($class,$functionName,$scope,$onlyStatic) = @_;
        my $self = $class->SUPER::new();
        $self->{m_functionName} = $functionName;
        $self->{m_scope} = $scope;
        $self->{m_onlyStatic} = $onlyStatic;
        bless $self,$class;
        return $self;
    }

    sub listMethods
    {
        my ($self,$fh) = @_;
        my $allTagsFileName = VimHelper::getAllTagsFile();
        my $functionName = $self->{m_functionName};
        my $scope = $self->{m_scope};
        my $onlyStatic = $self->{m_onlyStatic};
        my %sigadded = ();
        my $signatureCapturedPos = 2;

        # MC_Release_Application	MERGECOM.H	/^EXP_PRE extern MC_STATUS EXP_FUNC MC_Release_Application$/;"	kind:prototype	line:686	signature:(int* ApplicationID)
        # MC_Read_Message	MERGECOM.H	/^EXP_PRE extern MC_STATUS EXP_FUNC MC_Read_Message   (int            AssociationID,$/;"	kind:prototype	line:655	signature:(int AssociationID, int Timeout, int* MessageID, char** ServiceName, MC_COMMAND* Command)
        
        # create the search string based on the scope of the member.
        my $search = "^". $functionName . "[AW]?\\t.+\\/\\^\\s*(.*?)[(\$].+signature:(.*)";
        if (defined($scope))
        {
            $search = "^". $functionName . "[AW]?\\t.+\\/\\^\\s*(.*?)[(\$].*(class|struct|union|enum|namespace):([_\\w]+::)*$scope\\s.*signature:(.*)";     
            $signatureCapturedPos = 4;
        }
            
        if (-e $allTagsFileName)
        {
            my $typeStarted = 0;
            open(CT,$allTagsFileName);
            while ($line = <CT>)
            {
                chomp($line);

                # skip if this is a comment.
                if ($line =~ m/!_/) 
                {
                    next;
                }
                
                # search for the method and get the tool tip.
                if ($line =~ m/$search/)
				{
                    my $signature = $$signatureCapturedPos;
                 
                    if (!exists($sigadded{$signature}))
                    {
                        print $fh "$1$signature\n";
                        $sigadded{$signature} = $signature;
                    }
				}
            }
            close($allTagsFileName);
        }    
        else
        {
            Logger->logError("Could not open '$allTagsFileName'",__LINE__,__FILE__);
        }

        # log some information.
        Logger->logInfo("FunctionName = $functionName",__LINE__,__FILE__);
        Logger->logInfo("Scope = $scope",__LINE__,__FILE__);
        Logger->logInfo("TipSearch = $search",__LINE__,__FILE__);
    }
}
1;
