# we do this for cygwin perl, it assumes getmethodlist.pl is executing from
# the VIM_INTELLISENSE structure
use Env qw(VIM_INTELLISENSE);
use lib "$VIM_INTELLISENSE/cppft";

use VimHelper;
use Lister;
use MemberLister;
use Logger;

print "getmethodlist.pl: executing ... \n";
Logger->logInfo("Inside CPP Plugin");
my $vh = new VimHelper();
$vh->listMethods();

if (-r $vh->getReturnFileName())
{
    print "getmethodlist.pl: Generated Successfully " .
          "(" . $vh->getReturnFileName() . ")\n";
}
else
{
    print "getmethodlist.pl: Failed to generated " .
          "(" . $vh->getReturnFileName() . ")\n";
}
