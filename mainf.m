function[]=mainf(name,text,theta,cycles)

ext='.txt';

filename=horzcat(name,ext);

fid = fopen(filename,'a');

d=char(datestr(datetime('now'),'yyyy mmm dd HH:MM:SS'));

fprintf(fid,'---------------New Session------------------\n\n',text);
fprintf(fid,'%s \n\n',d);
fprintf(fid,'%s \n\n',text);

Screen('Preference', 'SkipSyncTests', 1)

[t,L,e,a,Lstop,centerX_first,centerY_first,first_position]=...
        ExperimentalSession(theta,cycles)

fprintf(fid,'\Angle: \n\n',text);
fprintf(fid,'%g°\n',theta);
    
fprintf(fid,'\nTime (s): \n\n',text);
fprintf(fid,'%g s\n',t);

fprintf(fid,'\nLength: \n\n',text);
fprintf(fid,'%g \n',L);

fprintf(fid,'\nBlock duration: %g s \n\n', sum(t));

fprintf(fid,'Directional Error (%%): \n\n',text);
fprintf(fid,'%g \n',e);

fprintf(fid,'\nArea: \n\n',text);
fprintf(fid,'%g \n',a);

fprintf(fid,'\nLength at 650 ms: \n\n',text);
fprintf(fid,'%g \n',Lstop);

fprintf(fid,'\nFirst circle:%g in positions x=%g and y=%g \n\n', ...
    first_position, centerX_first, centerY_first);

fprintf(fid,'\n\n',text);

fclose(fid);

%Show results
format compact
clc

fprintf('Angle: \n\n');
disp(theta)

fprintf('\nTime (s): \n\n');
disp(t)

fprintf('\nLength: \n\n');
disp(L)

fprintf('\nBlock duration: %g seconds \n\n', sum(t));

fprintf('Directional Error: (%%): \n\n');
disp(e)

fprintf('\nArea: \n\n');
disp(a)

fprintf('\nLength at 650 ms: \n\n');
disp(Lstop)

fprintf('\nFirst circle: %g in positions x=%g and y=%g \n\n', ...
    first_position, centerX_first, centerY_first);