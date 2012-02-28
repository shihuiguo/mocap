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
global rou sigma omega lambda kneeAmp kneeOff;

lambda=3;
rou=pi/6;
sigma=1;
%sigma=-1;
omega=1;
kneeAmp=0.5;
kneeOff=pi/8;


