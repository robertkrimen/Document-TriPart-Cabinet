package Document::TriPart::Cabinet;

use warnings;
use strict;

=head1 NAME

Document::TriPart::Cabinet -

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

=cut

use Moose;

use Document::TriPart::Cabinet::Document;
use Document::TriPart::Cabinet::UUID;

use Carp::Clan;
use Path::Abstract;
use DateTimeX::Easy;
use File::Temp;
use Path::Class;

has storage => qw/is ro required 1/;
has document_class => qw/is rw required 1/, default => 'Document::TriPart::Cabinet::Document';

sub create {
    my $self = shift;
    return $self->inflate_document( uuid => Document::TriPart::Cabinet::UUID->make, @_ );
}

sub inflate_document {
    my $self = shift;
    return $self->document_class->new( cabinet => $self, @_ );
}

sub load {
    my $self = shift;
    my $uuid = shift;

    $uuid = Document::TriPart::Cabinet::UUID->normalize( $uuid );
    my $document = $self->inflate_document( uuid => $uuid );
    $document->load();
    return $document;
}

sub edit {
    my $self = shift;
    my $uuid = shift;

    $uuid = Document::TriPart::Cabinet::UUID->normalize( $uuid );
    my $document = $self->load( $uuid );
    $document->edit();
    return $document;
}

=head1 AUTHOR

Robert Krimen, C<< <rkrimen at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-document-tripart-cabinet at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Document-TriPart-Cabinet>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Document::TriPart::Cabinet


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Document-TriPart-Cabinet>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Document-TriPart-Cabinet>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Document-TriPart-Cabinet>

=item * Search CPAN

L<http://search.cpan.org/dist/Document-TriPart-Cabinet/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2009 Robert Krimen, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of Document::TriPart::Cabinet
