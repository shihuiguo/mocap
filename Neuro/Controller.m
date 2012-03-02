% Script file: 
%       Controller.m
%
% Purpose:
%       Controller for the motion synthesis, These four controllers are in charge of producing the torque at each DOF
%
% Revisions:
%       Date          Programmer      Description
%
%       2011.08.02    S. GUO	   Original code
%
function dy=Controller(t,y)

global lambda rou sigma omega;
%{
R=zeros(2,2);

R(1,1)=cos(angle); R(1,2)=-sin(angle);
R(2,1)=sin(angle); R(2,2)=cos(angle);
%}
dy=zeros(2,1);

% The q/dq, offset, amplication
y(1)=y(1);
y(2)=y(2)*3;

temp=-lambda*((y(1)^2+y(2)^2)/rou^2-sigma);

dy(1)=temp*y(1)-omega*y(2);
dy(2)=omega*y(1)+temp*y(2);
