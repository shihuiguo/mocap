% Script file: 
%       ControlParam.m
%
% Purpose:
%       Control Parameters for the motion synthesis
%
% Revisions:
%       Date          Programmer      Description
%
%       2011.08.02    S. GUO	   Original code
% 
% variables:
%	rou	----	radius
%	sigma	----	bifurcation
%	omega	----	frequency
%	lambda	----	rate of convergence
global rou sigma omega lambda kneeAmp kneeOff offset;

rou = zeros(1, 78);
rou(1, 19) = 15 ;
rou(1, 28) = 15 ;
rou(1, 22) = 15;
rou(1, 31) = 15;



offset = zeros(1, 78);
offset(1, 19) = 15 ;
offset(1, 28) = 15 ;
offset(1, 22) = -45;
offset(1, 31) = -45;


omega = zeros(1, 78);
omega(1, 19) = 1 ;
omega(1, 28) = 1 ;
omega(1, 22) = 2 ;
omega(1, 31) = 2 ;


lambda=3;
sigma=1;
%sigma=-1;
%omega=1;
kneeAmp=0.5;
kneeOff=pi/8;


