%Faizan Mir
%HW5Q7

close all clear all clc  
  
s = tf('s'); 
  G = 1/(s*(s^2 + 2*s + 4)); 
  K_I = 1; 
  K_D = 1; 
  K_P = 1; 
  
D_c = K_P + K_I/s + K_D*s; 
  %Characterisic Eqn  
  %1+ K_I( 1/(s^4+2s^3+4s^2+K_D s^2+K_P s) ) = 0 
  figure;  
  subplot(2,2,1); 
  rlocus(1/(s^4+2*s^3+4*s^2+K_D*s^2+K_P*s)); 
  title('K_I = 1'); 
hold on; sgrid(0.59,1.8); ylim([-5 5]); 
%1+K_P  s/(s^4+2s^3+4s^2+K_D s^2+K_I) )=0 
subplot(2,2,2); 
rlocus(s/(s^4+2*s^3+4*s^2+K_D*s^2+K_I)); 
title('K_P = 1'); 
hold on; sgrid(0.59,1.8); ylim([-5 5]); 
%1+K_D  s^2/(s^4+2s^3+4s^2+K_P s+K_I )=0 
subplot(2,2,3); 
rlocus(s^2/(s^4+2*s^3+4*s^2+K_P*s+K_I)); 
title('K_D = 1'); 
hold on; 
sgrid(0.59,1.8); 
ylim([-5 5]); 
 % Final Pole/Zero Location 
  subplot(2,2,4); 
  pzmap(feedback(D_c*G,1)); 
  hold on; sgrid(0.59,1.8); 
  ylim([-5 5]);

T = zpk(feedback(D_c*G,1)); 
  
figure; 
step(feedback(G,1)); 
hold on; step(T); 
xlim([0 5]) 
%---------------------------------------------- 
%Tuning 
% 1, 10, 1 
%K_I can be small as we have type 2 system and we dont need to worry e_ss K_I = 1; 
%Seems to hurt dynamics when increased --> Leads to instability with 
plant pole on origin K_D = 10.5; K_P = 1.5; 
  
D_c = K_P + K_I/s + K_D*s;  
  %Characterisic Eqn  
  %1+ K_I( 1/(s^4+2s^3+4s^2+K_D s^2+K_P s) ) = 0 
  figure;  
  subplot(2,2,1); 
  rlocus(1/(s^4+2*s^3+4*s^2+K_D*s^2+K_P*s)); 
  hold on; 
sgrid(0.59,1.8); 
ylim([-5 5]); 
title(append('K_I = ', num2str(K_I))) 
%1+K_P  s/(s^4+2s^3+4s^2+K_D s^2+K_I) )=0 
subplot(2,2,2); 
rlocus(s/(s^4+2*s^3+4*s^2+K_D*s^2+K_I)); 
hold on; 
sgrid(0.59,1.8); 
ylim([-5 5]); 
title(append('K_P = ', num2str(K_P))) 
%1+K_D  s^2/(s^4+2s^3+4s^2+K_P s+K_I )=0 
subplot(2,2,3); 
rlocus(s^2/(s^4+2*s^3+4*s^2+K_P*s+K_I)); 
hold on; 
sgrid(0.59,1.8);
ylim([-5 5]); 
title(append('K_D = ', num2str(K_D))) 
  %Final Pole/Zero Location 
  subplot(2,2,4); 
  pzmap(feedback(D_c*G,1)); 
  hold on; 
  sgrid(0.59,1.8); 
  ylim([-5 5]); 
  T = zpk(feedback(D_c*G,1)) 
  figure; step(T); xlim([0 5]); hold on; plot([0 5],[1.1 1.1],'r-')
