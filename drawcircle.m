function[]=drawcircle(r,n,theWindow,theRect,dif,R)

switch n
    case 0
        Screen('DrawArc', theWindow,255,[theRect(RectRight)/2-r theRect(RectBottom)/2-r theRect(RectRight)/2+r theRect(RectBottom)/2+r],0,360)
    case 1
        Screen('DrawArc', theWindow,255,[theRect(RectRight)/2-r theRect(RectBottom)*0.1-r theRect(RectRight)/2+r theRect(RectBottom)*0.1+r],0,360)
    case 2
        Screen('DrawArc', theWindow,255,[theRect(RectRight)/2+R*cosd(45)-r theRect(RectBottom)/2-R*sind(45)-r theRect(RectRight)/2+R*cosd(45)+r theRect(RectBottom)/2-R*sind(45)+r],0,360)
    case 3
        Screen('DrawArc', theWindow,255,[theRect(RectBottom)*0.8+dif-r theRect(RectBottom)/2-r theRect(RectBottom)*0.8+dif+r theRect(RectBottom)/2+r],0,360)
    case 4
        Screen('DrawArc', theWindow,255,[theRect(RectRight)/2+R*cosd(45)-r theRect(RectBottom)/2+R*sind(45)-r theRect(RectRight)/2+R*cosd(45)+r theRect(RectBottom)/2+R*sind(45)+r],0,360)
    case 5
        Screen('DrawArc', theWindow,255,[theRect(RectRight)/2-r theRect(RectBottom)*0.9-r theRect(RectRight)/2+r theRect(RectBottom)*0.9+r],0,360)
    case 6
        Screen('DrawArc', theWindow,255,[theRect(RectRight)/2-R*cosd(45)-r theRect(RectBottom)/2+R*sind(45)-r theRect(RectRight)/2-R*cosd(45)+r theRect(RectBottom)/2+R*sind(45)+r],0,360)
    case 7
        Screen('DrawArc', theWindow,255,[dif-r theRect(RectBottom)/2-r dif+r theRect(RectBottom)/2+r],0,360)
    case 8
        Screen('DrawArc', theWindow,255,[theRect(RectRight)/2-R*cosd(45)-r theRect(RectBottom)/2-R*sind(45)-r theRect(RectRight)/2-R*cosd(45)+r theRect(RectBottom)/2-R*sind(45)+r],0,360)
end