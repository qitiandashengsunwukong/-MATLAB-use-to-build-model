 %绘制sample case002 的基站三维散点图
clc;
clear;
load sample_case002.mat;
%load sample_case002.mat;
% figure ()
% stem3(jz(:,1),jz(:,2),jz(:,3),'ko');
% xlabel('x');ylabel('y');zlabel('z');
% figure ()
% stem3(jz(:,1),jz(:,2),jz(:,3),'r*');
% xlabel('x');ylabel('y');zlabel('z');
figure () 
stem3(jz(:,1),jz(:,2),jz(:,3),'bs');
xlabel('x');ylabel('y');zlabel('z'); 
%计算坐标值
v=3e8;      %速度
%假设已知观测点，计算时间
% for i=1:length(t)
%     for j=1:length(jz)
%         t_cal(i,j)=sqrt((gcd(i,1)-jz(j,1))^2+(gcd(i,2)-jz(j,2))^2+(gcd(i,3)-jz(j,3))^2)/v;
%         t_cal 为实际时间   t为测得时间    
%
%         erroabs(i,j)=t(i,j)-t_cal(i,j);             %注意测得时间-实际时间=4.5397e-007
%         erro(i,j)=(t(i,j)-t_cal(i,j))/t(i,j);  %注意测得时间>实际时间 超41.70%  误差率
%     end
% end
% t_cutabs=mean(mean(erroabs)')  真实时间
% t_cut=mean(mean(erro)')    误差率
% for i=1:4
%     r2=(v*(t(1,i)-t_cut*t(1,i)))^2-(jz(i,1)^2+jz(i,2)^2+jz(i,3)^2);
%     b(i,1)=r2;
%     Q(i,:)=[-2*jz(i,1) -2*jz(i,2) -2*jz(i,3) 1];
% end
% cta(:,1)=inv(Q)*b(:,1);
t_cut=0.24     %误差率
for i=1:length(t)
    for j=1:4
        r2=(v*(t(i,j)-t_cut*t(i,j)))^2-(jz(j,1)^2+jz(j,2)^2+jz(j,3)^2);
        b(j,i)=r2;
        Q(j,:)=[-2*jz(j,1) -2*jz(j,2) -2*jz(j,3) 1];
    end
    cta1(:,i)=inv(Q)*b(:,i);    %ctal为输出坐标
    %计算z坐标
    d2=(v*(t(i,1)-t_cut*t(i,1)))^2;
    cta1(3,i)=real(sqrt(d2-(cta1(1,i)-jz(1,1))^2-(cta1(2,i)-jz(1,2))^2))-jz(1,3);
end
min1=min(cta1(3,:));
max1=max(cta1(3,:));
for i=1:length(t)
    cta1(3,i)=(cta1(3,i)-min1)*1/(max1-min1)+1;
end
scatter(cta1(1,:),cta1(2,:),'b*')
hold on
scatter(jz(:,1),jz(:,2),'ro')
% figure ()
% scatter(cta1(1,:),cta1(2,:),'bs')
% hold on
% scatter(jz(:,1),jz(:,2),'r*')
%cta=inv(Q'*Q)*Q'*b;  等价
% 以下为误差分析
% for i=1:length(t)
%     x(i)=(cta1(1,i)-gcd(i,1))/max(gcd(i,1),cta1(1,i));
%     y(i)=(cta1(2,i)-gcd(i,2))/max(gcd(i,2),cta1(2,i));
%  	x1(i)=cta1(1,i)-gcd(i,1);
%     y1(i)=cta1(2,i)-gcd(i,2);
% end
% figure ()
% scatter(x,y,'b*')
% figure ()
% scatter(x1,y1,'b*')
%计算均方根误差
















