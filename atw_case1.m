clc;
clear

global s0
global r0
global ko
global amp
global tau0
global kw
%% beginning of user-modifiable section ------------------------
%  i.e., parameters that can be set for a given calculation ------------
dx = 2000;      % ---dx: is the horizontal grid (unit: m)
Lx = 200e3;     % ---Lx: is the cross-shore width of continental shelf (unit: m)
Ly = 6000e3;    % ---Ly: is the alongshore length of continental shelf (unit: m)
s0 = 0.001;     % ---s0: is the slope the shelf (s=dh/dx) 
r0 = 5*10^-4;   % ---r0: is the bottom friction coefficient (unit: m s-1)
ko = 1/6000e3;  % ---ko:  is the wavenumber of the open-ocean forcing
amp = -0.24;    % ---amp: is the amplitude of the open-ocean forcing (unit:m) 
% --------------amp = 0, the model is forced by the alongshore wind stress
kw = 1/1500e3;  % ---kw:  is the wavenumber of the alongshore wind stress
tau0 = -0.1*10^(-3);  %---tau0: the constant kinematic wind stress  (tau/density; unit:m2 s-2)
% --------------tau0 = 0, the model is forced by the open-ocean forcing
%%
[sol,x,t,Lx,Ly]=ATW_model(dx,Lx,Ly,s0,r0,ko,kw,amp,tau0);
%% figure
figure
    [X,Y] = meshgrid(x,t);
    contourf(X,Y,sol(:,:),30,'linestyle','none')
    set(gca,'ydir','reverse')
    yh=ylabel('Alongshore Distance (km)');
    set(gca,'tickdir','out','fontsize',10,'linewidth',1)
    xlabel('Crossshore Distance (km)')
    colormap jet
    caxis([-0.24 0.24])
    set(gca,'tickdir','out','fontsize',10,'linewidth',1)
    
    