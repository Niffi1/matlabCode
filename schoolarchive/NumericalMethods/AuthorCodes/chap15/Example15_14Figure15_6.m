% Example 15.14 --  Figure 15.6 : adaptive integration resulting in 
% a nonuniform mesh
close all
clear all

[Q,mesh,fevals] = quads(1.5,4,.005);
[Q,fevals]
plotq(mesh)
xlabel('x')
ylabel('f')
%gtext('mesh points marked by + ')