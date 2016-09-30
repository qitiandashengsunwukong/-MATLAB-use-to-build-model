%绘制case002 的基站三维散点图
clc;
clear;
load case002.mat;
figure ()
stem3(jz(:,1),jz(:,2),jz(:,3),'ko');
xlabel('x');ylabel('y');zlabel('z');

%计算坐标值
v=3e8;      %速度
%假设已知观测点，计算时间

t_cut=0.24
% for i=1:4
%     r2=(v*(t(1,i)-t_cut*t(1,i)))^2-(jz(i,1)^2+jz(i,2)^2+jz(i,3)^2);
%     b(i,1)=r2;
%     Q(i,:)=[-2*jz(i,1) -2*jz(i,2) -2*jz(i,3) 1];
% end
% cta(:,1)=inv(Q)*b(:,1);
for i=1:1200
    for j=1:4
        r2=(v*(t(i,j)-t_cut*t(i,j)))^2-(jz(j,1)^2+jz(j,2)^2+jz(j,3)^2);
        b(j,i)=r2;
        Q(j,:)=[-2*jz(j,1) -2*jz(j,2) -2*jz(j,3) 1];
    end
    cta1(:,i)=inv(Q)*b(:,i);
end
figure ()
scatter(cta1(1,:),cta1(2,:),'b*')
hold on
scatter(jz(:,1),jz(:,2),'ro')
