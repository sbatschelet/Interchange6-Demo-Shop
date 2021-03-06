use strict;
use warnings;
use ExtUtils::MakeMaker;

# Normalize version strings like 6.30_02 to 6.3002,
# so that we can do numerical comparisons on it.
my $eumm_version = $ExtUtils::MakeMaker::VERSION;
$eumm_version =~ s/_//;

WriteMakefile(
    NAME                => 'DanceShop',
    AUTHOR              => q{Stefan Hornburg (Racke) <racke@linuxia.de>},
    VERSION_FROM        => 'lib/DanceShop.pm',
    ABSTRACT            => 'Interchange6 Open Source Shop Machine Demo Shop',
    ($eumm_version >= 6.47
      ? ('LICENSE'=> 'perl')
      : ()),
    MIN_PERL_VERSION    => '5.014000',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'YAML'       => 0,
        'Dancer'     => 1.3124,
        'Dancer::Plugin::Interchange6' => 0.031,
        'Template::Flute' => '0.0121',
        'Dancer::Template::TemplateFlute' => 0.0113,
        'Moo'        => 1.004006,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'DanceShop-*' },
);
