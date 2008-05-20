package Net::Akamai::RequestData::Types;

use Moose;
use MooseX::Types;
use SOAP::Lite;

subtype 'Net::Akamai::RequestData::Types::PurgeOptions'
	=> as 'Object'
	=> where { $_->isa('SOAP::Data') };

subtype 'Net::Akamai::RequestData::Types::PurgeOptionsArrayRef'
	=> as 'ArrayRef[Net::Akamai::RequestData::Types::PurgeOptions]';

coerce 'Net::Akamai::RequestData::Types::PurgeOptionsArrayRef'
	=> from 'ArrayRef[Str]'
	=> via { [map {SOAP::Data->type('string')->value("$_")} @$_] };

enum 'Net::Akamai::RequestData::Types::PurgeAction' => qw(invalidate remove);

enum 'Net::Akamai::RequestData::Types::PurgeType' => qw(cpcode arl);

=head1 AUTHOR

John Goulah  <jgoulah@cpan.org>

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
