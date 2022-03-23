%Faizan Mir
%Error tracking wrt Reference input
%HW4

%% R to Y (Tracking) 
G = tf([1],[5 6 1]);       % Plant 
kP =19; kI = 0.5; kD = 4/19; s= tf('s'); 
D_P = kP; % P controller 
D_PD = kP + kD*s; % PD controller 
D_PID = kP + kI/s + kD*s; % PID controller 
t = linspace(0,200,1000); 
  
T_P = D_P*G/(1 + D_P*G); 
T_PD = D_PD*G/(1 + D_PD*G); 
T_PID = D_PID*G/(1 + D_PID*G); 
  
[y1_s,t] = step(T_P,t); e1_s = 1-y1_s; 
[y2_s,t] = step(T_PD,t); e2_s = 1-y2_s; 
[y3_s,t] = step(T_PID,t); e3_s = 1-y3_s; 
  
%Ploting for unit-step response 
figure 
subplot(1,3,1); 
plot(t,e1_s) 
hold on 
xlabel('Time(sec)'); 
ylabel('e(t)= r(t)-y(t)'); 
title('Error to unit-step for P');
axis([0 80 -0.1 0.1]); 
grid on
subplot(1,3,2); 
plot(t,e2_s) 
hold on  
xlabel('Time(sec)'); 
title('Error to unit-step for PD'); 
axis([0 80 -0.1 0.1]); 
grid on
subplot(1,3,3); 
plot(t,e3_s) 
hold on 
xlabel('Time(sec)'); title('Error unit-step for PID'); 
axis([0 100 -0.1 0.1]); 
grid on
  
% Unit-ramp response 
ramp = t; 
[y1_r,t] = lsim(T_P,ramp,t); e1_r = ramp-y1_r; 
%% W to Y (Disturbance) 
G = tf([1],[5 6 1]);       % Plant 
kP =19; kI = 0.5; kD = 4/19; s= tf('s'); 
D_P = kP; % P controller 
D_PD = kP + kD*s; % PD controller 
D_PID = kP + kI/s + kD*s; % PID controller 
t = linspace(0,200,1000); 
  
Tw_P = G/(1 + D_P*G); 
Tw_PD = G/(1 + D_PD*G); 
Tw_PID = G/(1 + D_PID*G); 
  
[y4_s,t] = step(Tw_P,t); e4_s = -y4_s; 
[y5_s,t] = step(Tw_PD,t); e5_s = -y5_s; 
[y6_s,t] = step(Tw_PID,t); e6_s = -y6_s; 
 
%Ploting for unit-step response 
figure 
subplot(1,3,1); 
plot(t,e4_s) 
hold on 
xlabel('Time(sec)');
ylabel('e(t)=-y(t)'); 
title('Error to unit-step for P'); 
axis([0 80 -0.1 0.1]); 
grid on
subplot(1,3,2); plot(t,e5_s) 
hold on  
xlabel('Time(sec)'); title('Error to unit-step for PD'); 
axis([0 80 -0.1 0.1]); 
grid on
subplot(1,3,3); 
plot(t,e6_s) 
hold on 
xlabel('Time(sec)'); 
title('Error to unit-step for PID'); 
axis([0 100 -0.1 0.1]); 
grid on
  
ramp = t; 
[y4_r,t] = lsim(Tw_P,ramp,t); e4_r = -y4_r; 
[y5_r,t] = lsim(Tw_PD,ramp,t); e5_r = -y5_r; 

[y2_r,t] = lsim(T_PD,ramp,t); e2_r = ramp-y2_r; 
[y3_r,t] = lsim(T_PID,ramp,t); e3_r = ramp-y3_r; 
 
%Ploting for unit-ramp response 
figure 
subplot(1,3,1); plot(t,e1_r) 
hold on 
xlabel('Time(sec)'); 
ylabel('e(t)= r(t)-y(t)'); 
title('Error to ramp-step for P'); 
axis([0 200 0 10]); 
grid on
subplot(1,3,2); 
plot(t,e2_r) 
hold on  
xlabel('Time(sec)'); 
title('Error to ramp-step for PD'); 
axis([0 200 0 10]); 
grid on
subplot(1,3,3);
plot(t,e3_r) 
hold on 
xlabel('Time(sec)'); 
title('Error to ramp-step for PID'); 
axis([0 200 0 2.1]); 
grid on


%% W to Y (Disturbance) 
G = tf([1],[5 6 1]);       % Plant 
kP =19; kI = 0.5; kD = 4/19; s= tf('s'); 
D_P = kP; % P controller 
D_PD = kP + kD*s; % PD controller 
D_PID = kP + kI/s + kD*s; % PID controller 
t = linspace(0,200,1000); 
  
Tw_P = G/(1 + D_P*G); 
Tw_PD = G/(1 + D_PD*G); 
Tw_PID = G/(1 + D_PID*G); 
  
[y4_s,t] = step(Tw_P,t); e4_s = -y4_s; 
[y5_s,t] = step(Tw_PD,t); e5_s = -y5_s; 
[y6_s,t] = step(Tw_PID,t); e6_s = -y6_s; 
 
%Ploting for unit-step response 
figure 
subplot(1,3,1); 
plot(t,e4_s) 
hold on 
xlabel('Time(sec)'); 
ylabel('e(t)=-y(t)'); 
title('Error to unit-step for P'); 
axis([0 80 -0.1 0.1]); 
grid on
subplot(1,3,2); 
plot(t,e5_s) 
hold on  
xlabel('Time(sec)'); 
title('Error to unit-step for PD'); 
axis([0 80 -0.1 0.1]);
grid on
subplot(1,3,3); 
plot(t,e6_s) 
hold on 
xlabel('Time(sec)'); 
title('Error to unit-step for PID');
axis([0 100 -0.1 0.1]); 
grid on
  
ramp = t; 
[y4_r,t] = lsim(Tw_P,ramp,t); e4_r = -y4_r; 
[y5_r,t] = lsim(Tw_PD,ramp,t); e5_r = -y5_r;

[y6_r,t] = lsim(Tw_PID,ramp,t); e6_r = -y6_r; 
%Ploting for unit-ramp response 
figure 
subplot(1,3,1); 
plot(t,e4_r) 
hold on 
xlabel('Time(sec)'); 
ylabel('e(t)=-y(t)'); 
title('Error to ramp-step for P'); axis([0 200 -10 0]); 
grid on
subplot(1,3,2); 
plot(t,e5_r) 
hold on  
xlabel('Time(sec)');
title('Error to ramp-step for PD'); 
axis([0 200 -10 0]); 
grid on
subplot(1,3,3); 
plot(t,e6_r) 
hold on 
xlabel('Time(sec)'); title('Error to ramp-step for PID'); 
axis([0 200 -2.2 0]); 
grid on