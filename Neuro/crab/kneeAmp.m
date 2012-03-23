% This script solves the amplitude for the knee joint, given the amplitude of the hip

options = optimset('Display','iter');

% pass in a cycle for testing, you need to figure out how to find a cycle
cycle = chout();

[x, fval]=fminbnd(@(x)optfun(x, s, cycle), 0, 1, options)
