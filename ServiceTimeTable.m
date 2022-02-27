function [serviceTime1, serviceTime2, STlowerBoundRange1, STupperBoundRange1, STlowerBoundRange2, STupperBoundRange2] = ServiceTimeTable(generatorType)  
    
 switch(generatorType) %switch case
        
      case 1  %the first option in the "types of random generator" menu
               
              numberofST1 = 5;
              numberofST2 = 5;
    
              ST1LowerBound = 2;
              ST1UpperBound = 6;
    
              ST2LowerBound = 3;
              ST2UpperBound = 7;
              
              a = 1;
              c = 1;
              mST1 = 7;
              
              serviceTime1(1) = ceil(rand(1,1))*ST1LowerBound;
              
              for i = 2:numberofST1
                  serviceTime1(i) = mod((a*serviceTime1(i-1)+c),mST1);
              end

              mST2 = 8;
              
              serviceTime2(1) = ceil(rand(1,1))*ST2LowerBound;
              
              for i = 2:numberofST2
                  serviceTime2(i) = mod((a*serviceTime2(i-1)+c),mST2);
              end
              
                                
          
      case 2  %the second option in the "types of random generator" menu
          
              serviceTimeSeed = rand(1000,1);
              lambda = 1;
    
              serviceTime1 = ceil((-1/lambda)*log(abs(1-serviceTimeSeed)));
              serviceTime1 = unique(serviceTime1)+1;
              
    
              serviceTime2 = ceil((-1/lambda)*log(abs(1-serviceTimeSeed)));
              serviceTime2 = unique(serviceTime2)+2;
          
            
      case 3  %the third option in the "types of random generator" menu
          
              ST1LowerBoundRVU = 1;
              ST1UpperBoundRVU = 6;
    
              ST2LowerBoundRVU = 2;
              ST2UpperBoundRVU = 7;
              
              serviceTimeSeed = rand(1000,1); %random seed values
              
              serviceTime1 = ceil(ST1LowerBoundRVU + (ST1UpperBoundRVU-ST1LowerBoundRVU).*serviceTimeSeed);
              serviceTime1 = unique(serviceTime1);
                

              serviceTime2 = ceil(ST2LowerBoundRVU + (ST2UpperBoundRVU-ST2LowerBoundRVU).*serviceTimeSeed);
              serviceTime2 = unique(serviceTime2);
                     
      case 4  %the fourth option in the "types of random generator" menu
          
              ST1LowerBoundRand = 1;
              ST1UpperBoundRand = 6;
    
              ST2LowerBoundRand = 2;
              ST2UpperBoundRand = 7;
              
              ST1Range = ST1UpperBoundRand-ST1LowerBoundRand; 
              serviceTime1 = ceil((rand(1,1000)*ST1Range)+ST1LowerBoundRand);
              serviceTime1 = unique(serviceTime1);

              ST2Range = ST2UpperBoundRand-ST2LowerBoundRand; 
              serviceTime2 = ceil((rand(1,1000)*ST2Range)+ST2LowerBoundRand);
              serviceTime2 = unique(serviceTime2);

          
      end
     
      
%Service Time Table for Counter 1 

printf('\n');
disp('Service Time Table for Counter 1');
printf('\n');

serviceTimeProbability1=[0.20 0.25 0.20 0.25 0.10]; 

serviceTimeCDF1(1) = serviceTimeProbability1(1);

for i=2:5
    serviceTimeCDF1(i) = serviceTimeCDF1(i-1) + serviceTimeProbability1(i);
end

STlowerBoundRange1(1) = 1;

for i=2:5
    STlowerBoundRange1(i) = (serviceTimeCDF1(i-1)*100) + 1;
end    

for i=1:5
    STupperBoundRange1(i) = (serviceTimeCDF1(i)*100);
end
    
disp('------------------------------------------------------------------------');
disp(sprintf('|%10s |%5s |%5s |%20s %2s','Service Time for Counter 1','Probability','CDF','Random Number Range','|'));
disp('------------------------------------------------------------------------');

for i=1:5
fprintf('| %-26.0f| %-11.2f| %-5.2f| %-8.0f - %9.0f |\n', [serviceTime1(i), serviceTimeProbability1(i), serviceTimeCDF1(i), STlowerBoundRange1(i), STupperBoundRange1(i)]); 
end

disp('------------------------------------------------------------------------');


%Service Time Table for Counter 2 

printf('\n');
disp('Service Time Table for Counter 2');
printf('\n');

serviceTimeProbability2=[0.25 0.30 0.15 0.20 0.10]; 

serviceTimeCDF2(1) = serviceTimeProbability2(1);

for i=2:5
    serviceTimeCDF2(i) = serviceTimeCDF2(i-1) + serviceTimeProbability2(i);
end

STlowerBoundRange2(1) = 1;

for i=2:5
    STlowerBoundRange2(i) = (serviceTimeCDF2(i-1)*100) + 1;
end    

for i=1:5
    STupperBoundRange2(i) = (serviceTimeCDF2(i)*100);
end
    
disp('------------------------------------------------------------------------');
disp(sprintf('|%10s |%5s |%5s |%20s %2s','Service Time for Counter 2','Probability','CDF','Random Number Range','|'));
disp('------------------------------------------------------------------------');

for i=1:5
fprintf('| %-26.0f| %-11.2f| %-5.2f| %-8.0f - %9.0f |\n', [serviceTime2(i), serviceTimeProbability2(i), serviceTimeCDF2(i), STlowerBoundRange2(i), STupperBoundRange2(i)]); 
end

disp('------------------------------------------------------------------------');
