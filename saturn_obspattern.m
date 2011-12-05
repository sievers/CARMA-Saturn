theta=[0 2*pi*(0:5)/6 0 pi];
r=[0 ones(1,6) 2 2 ]*31/2;
tobs=[ones(1,7) 1.5 1.5];
clf;plot(r.*cos(theta),r.*sin(theta),'*');
fac=4;
rr=[-511:512]/fac;
rmat=repmat(rr.^2,[numel(rr) 1]);rmat=rmat+rmat';
sigma=31/sqrt(8*log(2));
pb=exp(-0.5*rmat/sigma^2);
%pb2=fftshift(pb.^2);
pb2=pb.^2;
wt=0*pb;
for j=1:numel(r),
  wt=wt+tobs(j)*circshift(pb2,round(fac*[r(j)*cos(theta(j)) r(j)*sin(theta(j))]));
end
clf;imagesc(rr,rr,wt');hold on;axis([-50 50 -50 50]);

ring_radii=[92 117.6 122.2 136.8]*1e3;
saturn_radius=120660/2;
d_saturn=1433449370-150e6;
th=2*pi*(0:100)/100;
r_saturn=saturn_radius/d_saturn*180/pi*3600;
h=plot(cos(th)*r_saturn,sin(th)*r_saturn,'k');

r_ring=ring_radii/d_saturn*180/pi*3600;

inc=17*pi/180;
clear hh;
for j=1:numel(r_ring),
  hh(j)=plot(r_ring(j)*cos(th),r_ring(j)*sin(th)*sin(inc),'k');
end

beam=[5.93 4.72]/2;
hfe=fill(-40+beam(1)*cos(th),40+beam(2)*sin(th),[1 1 1]);


beam=[2.84 2.49]/2;
hf3=fill(-30+beam(1)*cos(th),40+beam(2)*sin(th),[1 1 1]);


