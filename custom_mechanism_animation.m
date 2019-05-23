%crank mechanism animation
%21.02.2019

%contants definition
a = 0.3;
b = 1;
c = 0.05;

%animation length 
%alpha = 0:pi/100:4*pi;
alpha = 0:pi/180:4*pi;
%beta = pi - asin((a*sin(alpha)*c)/b);
%d = a*cos(alpha) - b*cos(beta);
%konc = a*sin(alpha);
%disp(konc(30));

start_pos = 90; %arm starting position in deg

figure;
hold on;

% plot([x0 x1], [y0 y1], 'color')
%p1 = plot([0 a*cos(alpha(45))], [0 a*sin(alpha(45))], 'k'); % crank
%p2 = plot([a*cos(alpha(45)) d(45)], [a*sin(alpha(45)) c], 'r'); %link b
%p3 = plot([0 d(45)], [0 0], 'g'); %distance d


r = plot([0 a*cos(alpha(start))], [0 a*sin(alpha(start))]);
spring = plot([a a*cos(alpha(start))], [0 a*sin(alpha(start))]);

%figure set up - limits, axis scale
hold off;
axis([-0.5 1.5 -0.5 0.5]);
axis equal;
axis("manual");

%updating plots
for c1 = (start-1):length(alpha)
  % set command updates plots
  % set(item, data to update, values to update with, second item to update, values to update with)
  
  %crank mechanism animation
  %set(r, 'XData', [0 a*cos(alpha(c1))], 'YData', [0 a*sin(alpha(c1))]);
  %set(spring, 'XData', [a a*cos(alpha(c1))], 'YData', [0 a*sin(alpha(c1))]);
  x = a*cos(alpha(c1));
  y = a*sin(alpha(c1));
  scatter(x,y);
  pause(0.05);
  drawnow
endfor
