////DEKKER'S ALGORITHM////
clear;
clc;
funcprot(0)

disp("Dekkers Algorithm by Nikita Rath (18BLC1131)");

//INSTRUCTIONS TO PROCEED :
printf("  1) Process 1 enters \n");
printf("  2) Process 2 enters \n");
printf("  3) Both process enters \n");
printf("  4) Exit \n");
printf("\n Enter time in CS for Process 1, 2 and limit of CS :")

//INITIALIZING THE VALUES
c1=1,c2=1,turn=1;   
count0=0,count1=0,count=0;
i=0;
//Deafult values
limit=10;   //Limit of CS
a=1,b=1;    //Time taken in CS by both process

//FUNCTION TO IDENTIFY WHICH PROCESS ENTERS NOW
function [] = P(a,b,limit)
while (i<limit)
    printf("\n") 
    x = input("SELECT THE OPTION : ")

    //PROCESS 1 ENTERS
    if x==1 then
        c1=0;
           while c2==0
               if turn==2 then
                   c1=1;
                   while turn==2 //do nothing
                   end 
                   c1=0;
               end
           end
           //critical section
           count0=count0+a;
           i=i+a;
           // yield
           c1=1;
           turn=2;
           //remainder section
           if (count0>limit) | (i>limit) then
               printf("END\n");
               return
           else
               printf("Process P1 Enters the Critical section");
               printf("\nTime of P1 in Critical Section :%d\n",count0);
               printf("\nIt is the turn process P2\n");
           end
    end

    //PROCESS 2 ENTERS
    if x==2 then
           c2=0;
           while c1==0
               if turn==1
                   c2=1;
                   while turn==1 //do nothing
                   end 
                   c2=0;
               end
           end
           //critical section
           count1=count1+b;
           i=i+b;
           // yield
           c2=1;
           turn=1;
           //remainder section
           if (count1>limit) | (i>limit) then
               printf("END\n");
               return
           else
               printf("Process P2 Enters the Critical section");
               printf("\nTime of P2 in Critical Section :%d\n",count1);
               printf("\nIt is the turn process P1\n");
           end
    end
    
    //BOTH PROCESS ENTER AT SAME TIME
    if x==3 then
        printf("\nBoth process cant enter at same time in Critical Section\n");
        if i>limit then
               printf("END\n");
               return
        end
    end
    
    //OTHER CONDITIONS
    if x==4 then
        printf("\nEND\n");
        return
    end
end
endfunction
