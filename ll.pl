use strict;
use 5.10.0;

my %libs;
while(<>){
	foreach my $lib (/\blibrary\((["\w]*)\)/)
	{
		$lib =~ s/"//g;
		$libs{$lib} = 0
	}
}

print join "\n", sort keys %libs;
say"";
