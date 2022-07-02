function [sys,x0,STR,TS]=Manim(t,x,u,flag,ts);

%   Ned Gulley, 6-21-93
%   Copyright (c) 1990-1998 by The MathWorks, Inc. All Rights Reserved.
%   $Revision: 5.6 $
%	animation for Vibration Absorber Lab, ES301
%
%	modified, Jenelle Piepmeier & Ed Zivi, October 2000
persistent MotorAnim
persistent motorwidth motorheight  absorberwidth absorberheight hmotor habsorber

if(flag==2)
   if (1) %any(get(0,'Children')==MotorAnim),
      if (findobj('type','figure','name','Vibration Absorber')) %strcmp(get(MotorAnim,'Name'),'Vibration Absorber Animation'),
         % if(t==0)  [-.25,2.5,-1.1,1.1];end;
         % if(t==0) axis([-1.2 1.2 -1.2 1.2]); end;
         % set(0,'currentfigure',MotorAnim);
         % hndl=get(gca,'UserData');
        
         motorpos    = u(1)*100;
         absorberpos = u(2)*100;
         t0 = clock;
		     t2 = clock;
   		while etime(clock,t0)<.01
   		end
		   %t0=clock;
         
         
         
         
         ymotor = [motorpos+motorheight,motorpos+motorheight,motorpos-motorheight,motorpos-motorheight];
         xmotor=[-motorwidth-1,motorwidth-1,motorwidth-1,-motorwidth-1];
         set(hmotor,'Xdata',xmotor,'Ydata',ymotor,'edgecolor','k','facecolor','y');
         
         yabsorber = [absorberpos+absorberheight,absorberpos+absorberheight,absorberpos-absorberheight,absorberpos-absorberheight];
         xabsorber=[-absorberwidth+1,absorberwidth+1,absorberwidth+1,-absorberwidth+1];
         set(habsorber,'Xdata',xabsorber,'Ydata',yabsorber,'edgecolor','k','facecolor','r');
         % set(ht,'string','ES301 - Vibration Absorber Lab','visible','on','fontsize',12,'fontweight','bold')
         
         drawnow   % redraws each mass in new position
         
         
         % set(hndl,'MarkerSize',5);
         % set(hndl,'XData',xt,'YData',yt);
         % drawnow;
         
      end
   end
   sys=[];
   
elseif flag==0,
   % Initialize the figure for use with this simulation
   % animinit('Vibration Absorber Animation');
   % [fflag MotorAnim] = figflag('Vibration Absorber Animation');
   figure;
   set(gcf,'Name','Vibration Absorber');
   set(gcf,'Position',[120,120,350,270]);
   set(gca,'visible','off','xlim',[-3,3],'ylim',[-3,3])
   ht = get(gca,'title');
   set(ht,'string','ES301 - Vibration Absorber','visible','on','fontsize',12,'fontweight','bold')
   set(ht,'position',[ 0 3 0 ]);

   % set(gca,'ygrid','on');
   % set(gca,'xgrid','on');
   
   hold on;

   motorwidth     = 0.4;
   motorheight    = 0.4;
  
   absorberwidth  = 0.2;
   absorberheight = 0.2;
   
   motorpos       = 0.0;
   absorberpos    = 0.0;
   
   % create motor1 (damped) object
   ymotor = [motorpos+motorheight,motorpos+motorheight,motorpos-motorheight,motorpos-motorheight];
   xmotor = [-motorwidth-1,motorwidth-1,motorwidth-1,-motorwidth-1];
   hmotor = patch(xmotor,ymotor,'y');
   set(hmotor,'erasemode','xor');
   text(-2.5, 0.2,'damped')
   text(-2.5,-0.2,'motor')
   
   % create absorber object
   yabsorber = [absorberpos+absorberheight,absorberpos+absorberheight,absorberpos-absorberheight,absorberpos-absorberheight];
   xabsorber=[-absorberwidth+1,absorberwidth+1,absorberwidth+1,-absorberwidth+1];
   habsorber = patch(xabsorber,yabsorber,'r');
   set(habsorber,'erasemode','xor');
   text(1.5,0.2,'absorber')
   text(1.5,-0.2,'mass')
   % etime(clock,t2)
   
   sys = [0 0 0 2 0 0 1];
   x0  = [];
   STR = [];
   TS  = [0.05, 0];

end

