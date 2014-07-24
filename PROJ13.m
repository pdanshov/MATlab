E=100;
Rload=0:12.5:500;
Rint1=50; Rint2=75; Rint3=100;
I1=E./(Rint1+Rload); I2=E./(Rint2+Rload); I3=E./(Rint3+Rload);
P1=I1.^2.*Rload; P2=I2.^2.*Rload; P3=I3.^2.*Rload;
%Low=find(Y == min(Y))
%Low = Low(1);
%Find Maximums & store in variables
HRint1=find(P1==max(P1)); HRint2=find(P2==max(P2)); HRint3=find(P3==max(P3));
HRint1=HRint1(1); HRint2=HRint2(1); HRint3=HRint3(1);%Display only one point in case of multiples
Xmax1=Rload(HRint1); Xmax2=Rload(HRint2); Xmax3=Rload(HRint3); Ymax1=P1(HRint1); Ymax2=P2(HRint2); Ymax3=P3(HRint3);
%figure;
%get(gca,'ColorOrder') %Get default line color order
%set(get(get(PmaxLines,'Annotation'),'LegendInformation'),'IconDisplayStyle','off'); % Exclude line from legend

%Set grid scale [xmin xmax ymin ymax]
axis([0 500 0 60])
hold all;
%Plot lines and points at maximums
plot(Rload,P1,'-*r')
Max1=plot(Xmax1,Ymax1,':^g','LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor',[.7 .7 .7],'MarkerSize',7);
plot(Rload,P2,'-.ob');
Max2=plot(Xmax2,Ymax2,':og','LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor',[.7 .7 .7],'MarkerSize',7);
plot(Rload,P3,':p', 'Color',[0 0.5 0]);
Max3=plot(Xmax3,Ymax3,':vg','LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor',[.7 .7 .7],'MarkerSize',7);
%Draw lines to maximums from x axis
P1max=line([Xmax1 Xmax1],[0 Ymax1],'LineStyle',':','Color','r','LineWidth',1);
P2max=line([Xmax2 Xmax2],[0 Ymax2],'LineStyle',':','Color','b','LineWidth',1);
P3max=line([Xmax3 Xmax3],[0 Ymax3],'LineStyle',':','Color',[0 0.5 0],'LineWidth',1);
%Display maximum values  at corresponding points
text(Rload(HRint1)-30,P1(HRint1)+4,sprintf('%dW',round(P1(HRint1))),'Color',[1 0 0],'BackgroundColor',[.9 1 .9]);
text(Rload(HRint2)-10,P2(HRint2)+3,sprintf('%dW',round(P2(HRint2))),'Color',[0 0 1],'BackgroundColor',[.9 1 .9]);
text(Rload(HRint3)+10,P3(HRint3)-5,sprintf('%dW',round(P3(HRint3))),'Color',[0 0.5 0],'BackgroundColor',[.9 1 .9]);
%Exclude lines from legend
PmaxLines=[P1max P2max P3max];
hA = get(PmaxLines,'Annotation');
hLL = get([hA{:}],'LegendInformation');
set([hLL{:}],{'IconDisplayStyle'},{'off','off','off'}');
%Exclude maximum point markers from legend
PmaxMarkers=[Max1 Max2 Max3];
hAb = get(PmaxMarkers,'Annotation');
hLLb = get([hAb{:}],'LegendInformation');
set([hLLb{:}],{'IconDisplayStyle'},{'off','off','off'}');
%Display legend and other graph information
legend('50 \Omega Int.','75 \Omega Int.','100 \Omega Int.',[330 250 0 0]);
%set(legend,'Position',[.1 .2 .1 .2]) % [x y eidth height] Can set location with 'Location','BestOutside'
xlabel({'Rload','( \Omega )'});
ylabel({'Pload','( W )'});
title('PROJ13 MAXIMUM POWER TRANSFER (trial & error)');
grid on;
set(gca,'GridLineStyle','-');
%Set grid lines to gray
set(gca,'Xcolor',[0.8 0.8 0.8]);
set(gca,'Ycolor',[0.8 0.8 0.8]);
%Set graph ticks back to black
Caxes = copyobj(gca,gcf);
set(Caxes, 'color', 'none', 'xcolor', 'k', 'xgrid', 'off', 'ycolor','k', 'ygrid','off');
%(legend, 'Color', 'none'); %Make legend box background transparent

%{
% Create the plot
a = gca;
h= plot(rand(1, 100));
% Query properties
xtick = get(a,'XTick');
ytick = get(a,'YTick');
xlim = get(a,'XLim');
ylim = get(a,'YLim');
% Copy the existing axis along with children
set(gca,'TickLength',[1e-100 1])
c_axes = copyobj(a,gcf);
% Remove copy of objects
delete(get(c_axes,'Children'))
% Set color XColor to red and only show the grid
set(c_axes, 'Color', 'none', 'XColor', 'r', 'XGrid', 'on', 
'YColor','k', 'YGrid','off','XTickLabel',[],'YTickLabel',[],
'XTick',xtick,'YTick',ytick,'XLim',xlim,'YLim',ylim);
%}