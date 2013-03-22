#-----------------------------------------------------------------------------
# C++ Plugin for Vim Intellisense.                                               
# Author    : Madhan Ganesh                                                   
# Dated     : August 21st 2004                                                
# Version   : cppft 1.0                                                       
#                                                                          
# You can modify the source, provided you leave this header information.
#-----------------------------------------------------------------------------

use Logger;
use NamespaceLister;
use IncludeFileQueue;
use PatternReader;
use TooltipLister;

package ListerFactory;
{
    sub getLister
    {
        my ($dotted,$ifq,$currentFolder) = @_;
        my $lister = undef;
        my $actorType = undef;
        my $forTooltip = undef;
        
        my $actor = undef;
        my $operator = undef;
        my $typeName = undef;
        my $onlyStatic = 0;
        
        #--------------------------------------------------
        my @tokens = split(/(\.|->|::|\()/,$dotted);

        if ($dotted =~ m/\($/)
        {
            pop(@tokens); # for (;
            $forTooltip = pop(@tokens);            
        }

        my $token = pop(@tokens);
        $dotted =   pop(@tokens) . $token;
        #--------------------------------------------------

        # if the dotted has ending with ::|.|-> get the object/type name.
        if ($dotted =~ m/(.+)(\.|::|->)/)
        {
            $actor = $1;
            $operator = $2;

            # if the token ends with . or -> the operation is on object. 
            # so find the type of the object.
            if ($dotted =~ m/(\.|->)$/)
            {
                $ifq->begin();
                my $varPattern = "([\\w_]+)(<[\\w*,&]+>)?[*&]?\\s+\\*?[&]*$actor\\s*[;=),(]";
                my $pr = new PatternReader;
                if ($pr->searchPattern($ifq,$varPattern,2,$currentFolder))
                {
                    my @captures = $pr->getCaptures();
                    if (defined($captures[0]))
                    {
                        $typeName = $captures[0];
                        if ($typeName eq "string")
                        {
                            $typeName = "basic_string";
                        }
                    }
                    Logger->logInfo("Typename obtained from PatternReader for object '$actor' is '$typeName'",__LINE__,__FILE__);
                }
                $actorType = "local";
            }
            else
            {
                # else
                # read the all tags file name to get the match for the actor
                # and get the type of actor (namespace or classname).
                my $allTagsFile = VimHelper::getAllTagsFile($retried);
                open(TF,$allTagsFile);
                my $line = undef;
                while ($line = <TF>)
                {
                    if ($line =~ m/^$actor\t.*\/\^\s*([_::\w]+)(<|&|\*|\s).*kind:(\w+)/)
                    {
                        my $cap1 = $1;
                        my $cap2 = $3;
                        $typeName = $actor;
                        $actorType = $cap2;
                        last;
                    }
                }
                close(TF);
            }

            
            
            # if the dotted ends with:: list only static members (ofcource in case
            # of MemberLister only).
            if ($dotted =~ /::$/)
            {
                $onlyStatic = 1;
            }
        }
        elsif ($dotted eq "::")
        {
            # insen has been invoked for global namespace (good luck!)
            $typeName = "::";    
            $actorType = "namespace";
        }
     
        # if the insen is invoked for tooltip create tooltip lister.
        if (defined($forTooltip))
        {
            if ($typeName eq "::")
            {
                $typeName = undef;
            }
            $lister = new TooltipLister($forTooltip,$typeName,$onlyStatic);     
        }
        
        # if it is invoked for member or namespace listing do so.
        if (!defined($lister))
        {
            if (!defined($typeName))
            {
                Logger->logCritical("Type is not found in the AllTags file",__LINE__,__FILE__);
            }
        
            if ($actorType eq "namespace")
            {
                $lister = new NamespaceLister($typeName);
            }
            else
            {
                $lister = new MemberLister($typeName,$onlyStatic);
            }
        }
           
        # log some information.
        Logger->logInfo("Actor = $actor",__LINE__,__FILE__);
        Logger->logInfo("operator = $operator",__LINE__,__FILE__);
        Logger->logInfo("typeName = $typeName",__LINE__,__FILE__);
        Logger->logInfo("onlyStatic = $onlyStatic",__LINE__,__FILE__);
        Logger->logInfo("actorType = $actorType",__LINE__,__FILE__);
        if (!defined($forTooltip))
        {
            $forTooltip = "";
        }
        Logger->logInfo("tip = $forTooltip",__LINE__,__FILE__);
        Logger->logInfo("Lister Created = $lister",__LINE__,__FILE__);
       
        return $lister;
    }
}
1;
