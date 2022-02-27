%make the table 
%call a function to display the simulation table

%the range 1-5
%IAT= inter arrival time
function [IAT, IATlowerBoundRange, IATupperBoundRange] = InterArrivalTimeTable(generatorType)
    
    switch(generatorType) %switch case
        
      case 1                                     
         a = 1;
         c = 1;
         m = 6;
         
         IATRandNum(1) = ceil(rand(1,1));
         for i = 2:5
             IATRandNum(i) = mod((IATRandNum(i-1)*a+c),m); %lcg formula to get random numbers for inter-arrival time 
         end  
      case 2           
     
          IATRandSeed = rand(1000,1);
          lambda = 1;
    
          IATRandNum = ceil((-1/lambda)*log(abs(1-IATRandSeed)));
          IATRandNum = unique(IATRandNum);   
        
          
      case 3                                    
        SeedValues = rand(100,1); %random seed value
        ITRandNum = ceil(0 + (5-0).*SeedValues); %to get random numbers for inter-arrival time      
        IATRandNum = unique(ITRandNum);   
        
      case 4                                      
          ITTimeNum = ceil(rand(1,100)*5);   
          IATRandNum = unique(ITTimeNum);
      end
    
    
IAT = IATRandNum;
IATprobability = [0.30,0.20,0.10,0.25,0.15];

IATcdf(1)= IATprobability(1);

for i = 2:5
    IATcdf(i)= IATcdf(i-1) + IATprobability(i);
end


IATlowerBoundRange(1) = 1;

for i = 2:5
    IATlowerBoundRange(i) = (IATcdf(i-1)*100)+1;
   
end

for i = 1:5
    IATupperBoundRange(i) = (IATcdf(i)*100);
end


printf('\n');
disp('Inter-arrival Time Table'); 
printf('\n');


disp('-----------------------------------------------------------------');
disp(sprintf('| %10s | %5s | %4s | %15s |','Inter-Arrival Time','Probability','CDF','Random Number Range'));

disp('-----------------------------------------------------------------');
for i = 1:5 
    fprintf('| %-18.0f | %-11.2f | %-4.2f | %-7.0f - %9.0f |\n',[IAT(i), IATprobability(i), IATcdf(i), IATlowerBoundRange(i), IATupperBoundRange(i)]);
end

disp('-----------------------------------------------------------------');



    