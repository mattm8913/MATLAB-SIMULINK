%% ES201 HW#7
%
% Matt McVay, 134506, 10/20/10

%% Part Number 1
x=rand()*100;
z=round(x);
a=input('Make a guess: ');
y=1;
while(a~=z)
    if(y>8)
        fprintf('Ha, you are not so good at this, are you?\n')
    end
    if((a-x<5)&&(a-x>-5))
        fprintf('Hot guess\n')
    elseif((a-x<10)&&(a-x>-10))
        fprintf('You are warm\n')
    else
        fprintf('cold\n')
    end
    fprintf('total number of guesses = %d\n',y)
     a=input('try again: '); 
     y=y+1;
     if(a==x)
         break
     end
     if(a>100)
         fprintf('Giving up, huh?\n')
         break
     end
end
fprintf('The number was %d\n',z)
fprintf('You took %d guesses\n',y)
why
%% Part Number 2a
a=rand()*255; %generates a random number between 0 and 255
x=round(a);   %turns that number into an integer
y=1;
while(x~=201)     %repeat until the number is 201
    a=rand()*255; %generates a random number between 0 and 255
    x=round(a);   %turns that number into an integer
    y=y+1;        %counts the number of tries
end
fprintf('It took %d tries\n',y) %prints the number of tries
%% Part 2b
for i=1:1:10        %iterates ten times
a=(rand()*20)-10;   %generates a random number between -10 and 10
x=round(a);          %turns that number into an integer
if(x>0)
    fprintf('%d is a positive random number\n',x) %prints positive numbers
end
end
%% Part 3
[a,b,c] = trig(45)
[x,y,z] = trig(90)
[i,j,k] = trig(-90)
for i=1:10
[a,b,c]=trig(i);
fprintf('Trig: cos(%d)=%f  sin(%d)=%f  tan(%d)=%f\n',i,a,i,b,i,c);
end
%% Part 4
[x]=div(2,3)
[y]=div(3,2)
[z]=div(5,5)
[a]=div(4,5)
[b]=div(5,4)








     