function[centerX,centerY]=fillcircle(r,k,theWindow,theRect,dif,R)

n=mod(k,8);
if n==0
    n=8;
end

switch n
    case 0
        Screen('FillArc', theWindow,255,[theRect(RectRight)/2-r theRect(RectBottom)/2-r theRect(RectRight)/2+r theRect(RectBottom)/2+r],0,360)
        centerX=theRect(RectRight)/2;
        centerY=theRect(RectBottom)/2;
    case 1
        Screen('FillArc', theWindow,255,[theRect(RectRight)/2-r theRect(RectBottom)*0.1-r theRect(RectRight)/2+r theRect(RectBottom)*0.1+r],0,360)
        centerX=theRect(RectRight)/2;
        centerY=theRect(RectBottom)*0.1;
    case 2
        Screen('FillArc', theWindow,255,[theRect(RectRight)/2+R*cosd(45)-r theRect(RectBottom)/2-R*sind(45)-r theRect(RectRight)/2+R*cosd(45)+r theRect(RectBottom)/2-R*sind(45)+r],0,360)
        centerX=theRect(RectRight)/2+R*cosd(45);
        centerY=theRect(RectBottom)/2-R*sind(45);
    case 3
        Screen('FillArc', theWindow,255,[theRect(RectBottom)*0.8+dif-r theRect(RectBottom)/2-r theRect(RectBottom)*0.8+dif+r theRect(RectBottom)/2+r],0,360)
       centerX=theRect(RectBottom)*0.8+dif;
        centerY=theRect(RectBottom)/2;
    case 4
        Screen('FillArc', theWindow,255,[theRect(RectRight)/2+R*cosd(45)-r theRect(RectBottom)/2+R*sind(45)-r theRect(RectRight)/2+R*cosd(45)+r theRect(RectBottom)/2+R*sind(45)+r],0,360)
        centerX=theRect(RectRight)/2+R*cosd(45);
        centerY=theRect(RectBottom)/2+R*sind(45);
    case 5
        Screen('FillArc', theWindow,255,[theRect(RectRight)/2-r theRect(RectBottom)*0.9-r theRect(RectRight)/2+r theRect(RectBottom)*0.9+r],0,360)
        centerX=theRect(RectRight)/2;
        centerY=theRect(RectBottom)*0.9;
    case 6
        Screen('FillArc', theWindow,255,[theRect(RectRight)/2-R*cosd(45)-r theRect(RectBottom)/2+R*sind(45)-r theRect(RectRight)/2-R*cosd(45)+r theRect(RectBottom)/2+R*sind(45)+r],0,360)
        centerX=theRect(RectRight)/2-R*cosd(45);
        centerY=theRect(RectBottom)/2+R*sind(45);
    case 7
        Screen('FillArc', theWindow,255,[dif-r theRect(RectBottom)/2-r dif+r theRect(RectBottom)/2+r],0,360)
        centerX=dif;
        centerY=theRect(RectBottom)/2;
    case 8
        Screen('FillArc', theWindow,255,[theRect(RectRight)/2-R*cosd(45)-r theRect(RectBottom)/2-R*sind(45)-r theRect(RectRight)/2-R*cosd(45)+r theRect(RectBottom)/2-R*sind(45)+r],0,360)
        centerX=theRect(RectRight)/2-R*cosd(45);
        centerY=theRect(RectBottom)/2-R*sind(45);
end