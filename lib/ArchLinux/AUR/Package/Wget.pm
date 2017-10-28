use v6;
unit module ArchLinux::AUR::Package::Wget;

constant $base-url = 'https://aur.archlinux.org/cgit/aur.git/snapshot';

sub wgetpkg(*@pkg --> Nil) is export
{
    await @pkg.hyper.map({ start run-wgetpkg($_) });
}

sub run-wgetpkg(Str:D $pkg --> Nil)
{
    my Str:D $url = get-url($pkg);
    run qqw<wget $url>;
}

sub get-url(Str:D $pkg --> Str:D)
{
    my Str:D $url = $base-url ~ '/' ~ $pkg.trim ~ '.tar.gz';
}

# vim: set filetype=perl6 foldmethod=marker foldlevel=0:
