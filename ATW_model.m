% ATW model from Linwenqiang 20221021
function [sol,x,t,Lx,Ly]=ATW_model(dx,Lx,Ly,s0,r0,ko,kw,amp,tau0)  
% ---   input   ---------------------------------------
% ---dx: is the horizontal grid (unit: m)
% ---Lx: is the cross-shore width of continental shelf (unit: m)
% ---Ly: is the alongshore length of continental shelf (unit: m)
% ---s0: is the slope the shelf (s=dh/dx) 
% ---r0: is the bottom friction coefficient (unite: m s-1)
% ---ko:  is the wavenumber of the open-ocean forcing
% ---kw:  is the wavenumber of the alongshore wind stress
% ---tau0: constant wind stress  (tau0 = 0, only consider the penetration of open-ocean signals)
% ---amp: is the amplitude of the open-ocean forcing (m)
% ---   output   --------------------------------------
% ---sol: result
% ---x = 0:dx:Lx;
% ---t = 0:dx:Ly
% --- for example---------------------

dy = dx;  
x  = 0:dx:Lx;
t  = 0:dy:Ly;

m = 0;
sol = pdepe(m,@pdebetapde,@pdebetaic,@pdebetabc,x,t);

% figure
% 
%     [X,Y] = meshgrid(x,t);
%         contourf(X,Y,sol(:,:,4),30,'linestyle','none')
%         set(gca,'ydir','reverse')
%         yh=ylabel('Alongshore Distance (km)');
%         set(gca,'tickdir','out','fontsize',10,'linewidth',1)
%         xlabel('Crossshore Distance (km)')
%         colormap jet
%         caxis([-0.24 0.24])
%         set(gca,'tickdir','out','fontsize',10,'linewidth',1)
% --------------------------------------------------------------
function [c,f,s] = pdebetapde(x,t,u,DuDx)
global s0
global r0

f0 = 10^(-4);        % the Coriolis parameter 
c = [f0*s0./r0];
f = ones(1,1).*DuDx;
s = ones(1,1).*0;

% --------------------------------------------------------------
function u0 = pdebetaic(x)
u0 = ones(1,1)*0; 
% --------------------------------------------------------------
function [pl,ql,pr,qr] = pdebetabc(xl,ul,xr,ur,t)
global r0
global ko
global amp
global tau0
global kw
N =1;
g = 9.8;   % gravitational acceleration
f0 = 10^(-4);        % the Coriolis parameter 

pl = tau0*sin(2*pi*kw*t)*f0/g/r0;
ql = ones(N,1).*1;
pr = ur-amp*sin(2*pi*ko*t);
qr = ones(N,1).*0;

