function [x, fval]=solvconstraint()


% Input two cycles, and return the amplitude of the knee

% Optimization objective is to minimize the head motion

% Initial guess
x0=[];

[x, fval]=fmincon(@optfun,x0);
