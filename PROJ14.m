close all
figure
axis off
%axis([0 40 0 40])
hold on
%Fill area in white from origin counterclockwise
fill([-1 40 40 -1 -1],[-1 -1 40 40 -1],'w');
%Make border around filled area counterclockwise
%plot([-1 20 20 -1 -1],[-1 -1 20 20 -1],'k','Linewidth',3)

text(7.6,38,'\circ Conversion Tables','color','r','FontSize',18)
a = 5; a1 = a+3;
b = 15; b1 = b+3;
c = 22;
d = 30;
y = 35.5;

text(a,y,'\it C\circ to'); text(a1+.2,y,'\it F\circ');
text(b,y,'\it F\circ to'); text(b1+.2,y,'\it C\circ');
for C = 0:5:100;
    y = y-1.7;
    F = ((9/5)*C)+32;
    text(a,y,sprintf('%dC=%dF',C,F));
end
y = 35.5;
for F = 32:4:112;
    y = y-1.7;
    C = round((5/9)*(F-32));
    text(b,y,sprintf('%dF=%dC',F,C));
end
y = 35.5;
for F = 116:4:196;
    y = y-1.7;
    C = round((5/9)*(F-32));
    text(c,y,sprintf('%dF=%dC',F,C));
end
y = 35.5;
for F = 200:4:212;
    y = y-1.7;
    C = round((5/9)*(F-32));
    text(d,y,sprintf('%dF=%dC',F,C));
end