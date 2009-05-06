use inc::Module::Install;

name     'Document-TriPart-Cabinet';
all_from 'lib/Document/TriPart/Cabinet.pm';
author   'Robert Krimen <rkrimen@cpan.org>';
license  'perl';

build_requires 'Test::More';

auto_install;

WriteAll;

