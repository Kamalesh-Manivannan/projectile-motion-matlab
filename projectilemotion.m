clear all
close all
clc

angle=45;
vel=50;
g=9.81;

theta=unitsratio('rad','deg')*angle;

u=vel*cos(theta);
v=vel*sin(theta);

time_of_flight=(2*v)/g;
t=linspace(0,time_of_flight,100);

x=u*t;
y=v*t-0.5*g*t.^2;

for i=1:length(x)
    figure(1)
    plot(x(i),y(i),'o','MarkerSize',5,'color','b');
    hold on
    pause(0.05)
    
    xlabel('Range (m)','FontSize',12,'FontWeight','bold');
    ylabel('Height (m)','FontSize',12,'FontWeight','bold');
    axis([0 500 0 100]);
    title(['Angle = ',num2str(angle),'degress']);
    
    if i==length(x)
        max_height_y=max(y);
        maxpoint_index_y=find(y==max(y));
        
        max_range_x=max(x);
        maxpoint_index_x=find(x==max(x));
        
        plot(x(maxpoint_index_y),y(maxpoint_index_y),'r','MarkerSize',15);
        plot(x(maxpoint_index_x),y(maxpoint_index_x),'r','MarkerSize',15);
        
        text(300,60,['Max Range (m) = ',num2str(max_range_x)],'EdgeColor','k');
        text(300,50,['Max Height (m) = ',num2str(max_height_y)],'EdgeColor','k');
    end
    F(i)=getframe(gcf);
end

video=VideoWriter('projectile.mp4','MPEG-4');
video.FrameRate=60;

open(video)
writeVideo(video,F);
close(video)