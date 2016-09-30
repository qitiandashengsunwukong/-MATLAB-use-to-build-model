clc;
clear;
load case010.mat;

 figure ()
 stem3(jz(:,1),jz(:,2),jz(:,3),'r*');
 xlabel('x÷·');ylabel('y÷·');zlabel('z÷·');
figure () 
stem3(jz(:,1),jz(:,2),jz(:,3),'bs');
xlabel('x');ylabel('y');zlabel('z'); 
v=3e8;
t_cut=0.018     %ŒÛ≤Ó¬ 
for i=1:length(t)
    for j=1:4
        r2=(v*(t(i,j)-t_cut*t(i,j)))^2-(jz(j,1)^2+jz(j,2)^2+jz(j,3)^2);
        b(j,i)=r2;
        Q(j,:)=[-2*jz(j,1) -2*jz(j,2) -2*jz(j,3) 1];
    end
    cta1(:,i)=inv(Q)*b(:,i); 
    d2=(v*(t(i,1)-t_cut*t(i,1)))^2;
    cta1(3,i)=real(sqrt(d2-(cta1(1,i)-jz(1,1))^2-(cta1(2,i)-jz(1,2))^2))-jz(1,3);
end
min1=min(cta1(3,:));
max1=max(cta1(3,:));
for i=1:length(t)
    cta1(3,i)=(cta1(3,i)-min1)*1/(max1-min1)+1;
end
scatter(cta1(1,:),cta1(2,:),'bs')
hold on
scatter(jz(:,1),jz(:,2),'r*')