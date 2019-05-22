%crank mechanism animation
%21.02.2019

%contants definition
a = 0.3;
b = 1;
c = 0.05;

%animation length 
alpha = 0:pi/100:4*pi;

beta = pi - asin((a*sin(alpha)*c)/b);
d = a*cos(alpha) - b*cos(beta);

figure;
hold on;

% plot([x0 x1], [y0 y1], 'color')
p1 = plot([0 a*cos(alpha(45))], [0 a*sin(alpha(45))], 'k'); % crank
p2 = plot([a*cos(alpha(45)) d(45)], [a*sin(alpha(45)) c], 'r'); %link b
%p3 = plot([0 d(45)], [0 0], 'g'); %distance d

%piston body animation
p4 = plot([d(45) d(45)], [(c -0.1), (c + 0.1)], 'b');
p5 = plot([d(45) d(45)+0.2], [(c -0.1), (c - 0.1)], 'b');
p6 = plot([d(45) d(45)+0.2], [(c +0.1), (c + 0.1)], 'b');
p7 = plot([d(45)+ 0.2 d(45)+ 0.2], [(c -0.1), (c + 0.1)], 'b');
p8 = plot([(d(45)+ 0.17) (d(45)+ 0.17)], [(c -0.1), (c + 0.1)], 'b');

%figure set up - limits, axis scale
hold off;
axis([-0.5 1.5 -0.5 0.5]);
axis equal;
axis("manual");

%updating plots
for c1 = 1:length(alpha)
  % set command updates plots
  % set(item, data to update, values to update with, second item to update, values to update with)
  
  %crank mechanism animation
  set(p1, 'XData', [0 a*cos(alpha(c1))], 'YData', [0 a*sin(alpha(c1))]);
  set(p2, 'XData', [a*cos(alpha(c1)) d(c1)], 'YData', [a*sin(alpha(c1)) c]);
  %set(p3, 'XData', [0 d(c1)]);
  
  %piston body animation
  set(p4, 'XData', [d(c1) d(c1)], 'YData', [(c -0.1), (c + 0.1)]);
  set(p5, 'XData', [d(c1) d(c1) + 0.2], 'YData', [(c -0.1), (c - 0.1)]);
  set(p6, 'XData', [d(c1) d(c1) + 0.2], 'YData', [(c +0.1), (c + 0.1)]);
  set(p7, 'XData', [(d(c1)+ 0.2) (d(c1)+ 0.2)], 'YData', [(c -0.1), (c + 0.1)]);
  set(p8, 'XData', [(d(c1)+ 0.17) (d(c1)+ 0.17)], 'YData', [(c -0.1), (c + 0.1)]);
  pause(0.05);
endfor
