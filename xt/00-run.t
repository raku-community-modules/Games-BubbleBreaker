use v6;
use Test;

plan 3;

my $time = BEGIN now;
%*ENV<BUBBLEBREAKER_TEST> = 1;

ok 'bin/bubble-breaker.raku'.IO.e, 'bin/bubble-breaker.raku exists';

my $proc = run 'bin/bubble-breaker.raku', :out, :err;

my $stdout = $proc.out.slurp-rest;
my $stderr = $proc.err.slurp-rest;
ok !$stderr, "bubble-breaker ran {now - $time} seconds";

diag "STDERR = $stderr" if $stderr;

pass 'Are we still alive? Checking for segfaults';
