#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Document::TriPart::Cabinet' );
}

diag( "Testing Document::TriPart::Cabinet $Document::TriPart::Cabinet::VERSION, Perl $], $^X" );
