function[t,L,e,a,Lstop,centerX_first,centerY_first,first_position]=...
    ExperimentalSession(theta,cycle)

clc
nextflag=1

try

    % Open up a window on the screen and clear it.
    whichScreen = max(Screen('Screens'));
    PsychImaging('PrepareConfiguration');
    PsychImaging('AddTask', 'General', 'UseVirtualFramebuffer');
    
    while nextflag==1
        nextflag=0

        [theWindow,theRect] = PsychImaging('OpenWindow', whichScreen, 0);

        % Wait for a click and hide the cursor
        Screen(theWindow,'TextSize',24);
%         Screen(theWindow,'DrawText','Drag mouse (i.e. hold button down) to draw',50,50,255);
        large_radius=theRect(RectBottom)*.8/2;    
        dif=(theRect(RectRight)-large_radius*2)/2;
        radius=20;
        centerX0 = theRect(RectRight)/2;
        centerY0 = theRect(RectBottom)/2;

        %Get random number to start (from 1 to 8)
        k_vect=[0 0];
        while all(diff(k_vect))==0
            k_vect=randi(8,cycle,1)
        end
        
        first_position=k_vect(1);

        %Preallocate
        t=zeros(1,numel(cycle));
        L=zeros(1,numel(cycle));
        e=zeros(1,numel(cycle));
        a=zeros(1,numel(cycle));
        Lstop=zeros(1,numel(cycle));

    for i=1:cycle      
        k=k_vect(i);
        % Move the cursor to the center of the screen
        theX = theRect(RectRight)/2;
        theY = theRect(RectBottom)/2;

        SetMouse(theX,theY,whichScreen);

        %draw the circle contours
        for j=0
            drawcircle(radius,j,theWindow,theRect,dif,large_radius)
        end

        %fill the specified circle
        [centerX,centerY]=fillcircle(radius,k,theWindow,theRect,dif,large_radius);

        if i==1
            centerX_first=centerX;
            centerY_first=centerY;
        end

        Screen('Flip', theWindow);

        while (1)
            [x,y,buttons] = GetMouse(theWindow);
            if buttons(1)
              break;
            end
        end
%         Screen(theWindow,'DrawText','Release button to finish',50,50,255);
        timeflag=0;
        HideCursor;
        tic
        time1=GetSecs
        % Loop and track the mouse, drawing the contour
        [theX,theY] = GetMouse(theWindow);
        thePoints = [theX theY];
        Screen(theWindow,'DrawLine',255,theX,theY,theX,theY);
%         Screen('DrawArc', theWindow,255,[0+dif theRect(RectBottom)*0.1 theRect(RectBottom)*0.8+dif theRect(RectBottom)*0.9],0,360)
        for j=0
            drawcircle(radius,j,theWindow,theRect,dif,large_radius)
        end
        
        [centerX,centerY]=fillcircle(radius,k,theWindow,theRect,dif,large_radius);
        
        % Set the 'dontclear' flag of Flip to 1 to prevent erasing the
        % frame-buffer:
        Screen('Flip', theWindow, 0, 1);
        while (1) && nextflag==0
            [x,y,buttons] = GetMouse(theWindow);	

            x1=x-theRect(RectRight)/2';
            y1=y-theRect(RectBottom)/2;

            x2=x1*cosd(theta)-y1*sind(theta);
            y2=x1*sind(theta)+y1*cosd(theta);

            x=x2+theRect(RectRight)/2;
            y=y2+theRect(RectBottom)/2;

            if ~buttons(1)
                break;
            end
            if (x ~= theX || y ~= theY)
                thePoints = [thePoints ; x y]; %#ok<AGROW>
                [numPoints, ~]=size(thePoints);
                % Only draw the most recent line segment: This is possible,
                % because...
                Screen(theWindow,'DrawLine',128,thePoints(numPoints-1,1),thePoints(numPoints-1,2),thePoints(numPoints,1),thePoints(numPoints,2));
                % ...we ask Flip to not clear the framebuffer after flipping:
                Screen('Flip', theWindow, 0, 1);
                theX = x; theY = y;
                time2=GetSecs-time1
                if timeflag==0 && time2>0.65
                    timeflag=1
                    stopX=theX;
                    stopY=theY;
                end
                if time2>20
                    nextflag=1
                    continue
                end
            end
        end
        t(i)=toc; %store time
        L(i)=arclength_custom(thePoints(:,1),thePoints(:,2)); %length
        e(i)=(L(i)-large_radius)/large_radius*100;
        Lstop(i)=arclength_custom([centerX0 stopX],[centerY0 stopY]); %length
        %Area
        x=[centerX0 thePoints(:,1)' centerX];
        y=[centerY0 thePoints(:,2)' centerY];
        w=convexHull(delaunayTriangulation(x',y'));
        a(i)=polyarea(x(w),y(w));
        ShowCursor;
        % update k
%         k=k+1;         
    end
    end
    % Close up
    Screen(theWindow,'DrawText','Click mouse to finish',50,50,255);
    ShowCursor;
    Screen(theWindow,'Close');
catch
    Screen('CloseAll')
    ShowCursor;
    psychrethrow(psychlasterror);
end %try..catch..
