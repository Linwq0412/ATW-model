# Arrested topographic waves model
# Introduction
This set of Matlab mfiles can be used to calculate the solutions from modified arrested topographic wave (ATW) model, considering the open-ocean forcing and alongshore wind stress.
# Calculation
The script ATW_model.m is the main function.  
The script atw_case1.m is an simple case to do the calculation.
# Beginning of user-modifiable section
%  i.e., parameters that can be set for a given calculation  
dx: is the horizontal grid (unit: m);  dx = 2000  
Lx: is the cross-shore width of continental shelf (unit: m);  Lx = 200e3  
Ly: is the alongshore length of continental shelf (unit: m);  Ly = 6000e3  
s0: is the slope of the shelf (s=dh/dx);  s0 = 0.001  
r0: is the bottom friction coefficient (unit: m s-1);  r0 = 5x10^-4  
ko:  is the wavenumber of the open-ocean forcing;  ko = 1/6000e3  
amp: is the amplitude of the open-ocean forcing (unit:m);  amp = -0.24  
% ---amp = 0, the model is forced by the alongshore wind stress  
---kw:  is the wavenumber of the alongshore wind stress; kw = 1/1500e3  
---tau0: the constant kinematic wind stress  (tau/density; unit:m2 s-2);  tau0 = -0.1x10^(-3)  
% ---tau0 = 0, the model is forced by the open-ocean forcing
