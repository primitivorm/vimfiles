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

package MemberLister; our @ISA = qw(Lister);
{
    my ($STATIC_ACCESS)     = 1;
    my ($METHOD)            = 2;
    my ($ACCESS_PRIVATE)    = 4;
    my ($ACCESS_PROTECTED)  = 8;
    my ($ACCESS_PUBLIC)     = 16;
    my ($ICON_CLASS)        = 128;
#    #define ICON_PACKAGE			32
#    #define ICON_INTERFACE		64
#    #define ICON_CLASS			128
#    #define TYPED_TEXT			255 
#    #define NAMESPACE			60
#    #define EVENT				61
#    #define PROPERTY_PUBLIC		63
#    #define PROPERTY_PROTECTED	64
#    #define ENUM_PROTECTED		65
#    #define ENUM_PRIVATE			66
#    #define DELEGATE			67
#    #define TYPE				68
#    #define ENUM_PUBLIC			70
#    #define TEMPLATE			71
#    #define FILE			72
#    #define HEADERFILE		73
#    #define MACRO			74
#    #define ENUM_CONSTANTS	75

    sub new
    {
        my ($class,$typeName,$onlyStatic) = @_;
        my $self = $class->SUPER::new();
        $self->{m_typeName} = $typeName;
        $self->{m_onlyStatic} = $onlyStatic;
        bless $self,$class;
        return $self;
    }

    sub listMethods
    {
        my ($self,$fh) = @_;
        my $allTagsFileName = VimHelper::getAllTagsFile();
        my $typeName = $self->{m_typeName};
        my $onlyStatic = $self->{m_onlyStatic};
        my %methodsAdded = ();
        my $parents = undef;

        my $iconNr = 0;

        if (-e $allTagsFileName)
        {
            Logger->logInfo("Processing $allTagsFileName",__LINE__,__FILE__);

            my $typeStarted = 0;
            open(CT,$allTagsFileName);
            while ($line = <CT>)
            {
                # chomp removes eol based on os, so hit <CR> as well for when
                # we are running cygwin
                chomp($line); $line =~ s/0xd$//g;

                if ($line =~ m/!_/) 
                {
                    next;
                }

                # get the parents of the type if it is inherited.
                if (!$typeStarted and !defined($parents))
                {
                    # remove the namespace prepended to the typename.
                    # TODO scope (removing namespace means type from
                    # another namespace can conflict).
                    my $temp = $typeName;
                    $temp =~ s/([\w_]+::)*//g;
                    if ($line =~ m/^$temp\t.+\tinherits:(.*)/)
                    {
                        if (defined($1))
                        {
                           $parents = $1;
                        }
                    }
                }

                # onlyStatic should containd static in $line. if so list the member. Or it can be types inside the class.
                if (!($onlyStatic xor ($line =~ m/\sstatic\s/ 
                                  or $line =~ m/\skind:(enum|enumerator|class|struct|union|typedef)\s/)))
				{
                    if ($line =~ m/^(.+?)\t.*\skind:(\w+).*\s(class|struct|union|enum):([<>_\w]+::)*($typeName(\b|\s|$).*)/)
                    {
                        $typeStarted = 1;
                        my $memberName = $1;
                        my $memberKind = $2;
                        my $typeEndMarker = $5;

                        # only in case of 'enumerator' allow a end marker like Class::
                        if ($typeEndMarker =~ m/$typeName:/ && $line !~ m/kind:enumerator/)
                        {
                            next;
                        }

                        # if itr constructor or destructor better skip.
                        if ($memberName =~ m/^~?$typeName\b/) 
                        {
                            next;
                        }

                        # add the icon based on the member kind.
						$iconNr = 62 if $memberKind eq "enumerator";
                        $iconNr = 70 if $memberKind eq "enum";
                        $iconNr = $ICON_CLASS if $memberKind eq "class";
                        $iconNr = $ICON_CLASS if $memberKind eq "typedef";
                        $iconNr = 69 if $memberKind eq "struct";
                        $iconNr = 61 if $memberKind eq "union";
                        
                        $iconNr |= $STATIC_ACCESS  if ($line =~ m/\sstatic\s/);
                        $iconNr |= $METHOD if $memberKind eq "prototype" || $memberKind eq "function";
					    $iconNr |= $ACCESS_PRIVATE if ($line =~ m/\saccess:private/);
    					$iconNr |= $ACCESS_PROTECTED if ($line =~ m/\saccess:protected/);
					    $iconNr |= $ACCESS_PUBLIC if ($line =~ m/\saccess:public/);
                        
                        # if the member is not alredy added in to the file then add it.
                        my $add_to_file = 1;
                        if (!exists($methodsAdded{$memberName}))
						{									
                            if (defined($ENV{INSENVIM_CPPFT_SHOW_PUBLIC_ONLY}))
                            {
                                if (($iconNr & $ACCESS_PUBLIC) != $ACCESS_PUBLIC)
                                {
                                    $add_to_file = 0;
                                }
                            }

                            if ($add_to_file)
                            {
                                print $fh "$iconNr:$memberName\n";
                                $iconNr = 0;
                            }
							$methodsAdded{$memberName} = $memberName;
						}
                    }
                    elsif ($typeStarted)
                    {
                        if ($line !~ m/kind:local/ and $line !~ m/kind:prototype/)
                        {
                            last;
                        }
                    }
                }
            }
            close(CT);
        }
        else
        {
            Logger->logError(
                "Unable to Process ($allTagsFileName), does not exist",
                __LINE__,__FILE__);
        }

        # if there are any parent for this class. call the member lister to list 
        # the parents members too. this is recursive call.
        if (defined($parents))
        {
            @parentTypes = split(",",$parents);
            for (@parentTypes)
            {
                my $lister = new MemberLister($_,$onlyStatic);
                $lister->listMethods($fh);
            }
        }
    }
}
1;
