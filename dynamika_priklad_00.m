clear
%definovani symbolickych promennych
pkg load symbolic
syms F N Nx Ny Nz

%zvolene hodnoty
f=0.12; %koeficient tøeni [-]
xa=0; %[m]
xb=0.07; %[m]%[m]%[m]
xc=0; %[m]
ya=0.04; %[m]
yb=0; %[m]
yc=0; %[m]
za=0.05; %[m]
zb=0.08; %[m]
zc=0.07; %[m]
m=0.2; % hmotnost bodu D [kg]
lo=0.022; % delka pruziny ve volnem stavu [m]
k=4.03; % tuhost pružiny [4,03 N/m]
vo=0.25; % pocatecni rychlost[m/s]
g = 9.80665;

L=sqrt((xb-xa)^2+(yb-ya)^2+(zb-za)^2);
_u = 0:0.01:L;
disp("________________LOOP________________");
%for u = _u
u = L/2;  
v=vo*(1-(u/L));
xd=xa+u*((xb-xa)/L);
yd=ya+u*((yb-ya)/L);
zd=za+u*((zb-za)/L);

d=sqrt((xc-xd)^2+(yc-yd)^2+(zc-zd)^2)-lo;
a=vo-(vo-u)/L;

ux=((xb-xa)/L);
uy=((yb-ya)/L);
uz=((zb-za)/L);

px=((xc-xd)/(lo+d));
py=((yc-yd)/(lo+d));
pz=((zc-zd)/(lo+d));


N=(sqrt(Nx^2+Ny^2+Nz^2));

%pohybove rovnice
X=F*ux+k*d*px+Nx-f*N*ux-m*a*ux==0;
Y=F*uy+k*d*py+Ny-f*N*uy-m*a*uy==0;
Z=-m*g+F*uz+k*d*pz+Nz-f*N*uz-m*a*uz==0;

%reseni rovnic
%eqns = [X,Y,Z,d,N];
%vars = [F N Nx Ny Nz];
%[vyF, vyN, vyNx, vyNy, vyNz] = solve(eqns, 'vars');
%[C0 C1 C2 C3] = solve(X,Y,Z, N);
[F Nx Ny Nz] = solve(X,Y,Z, N);
%disp(solve(X,Y,Z, N));
