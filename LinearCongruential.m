function [ITRandNum, STRandNum, TempRandNum] = LinearCongruential(customerNum) 
    
     % formula for linear congruential generator
     % X(i)=(a*X(i-1)+c) mod m
   
     amountofRandNum = customerNum;
     a = 5;
     c = 5;
     m = 100;
     upperBound = 100;
     
     %Inter-arrival Time 
     
     ITRandNum(1) = rand(1,1)*upperBound; %seed

     for i = 2:amountofRandNum-1
        ITRandNum(i) = (mod(a*ITRandNum(i-1)+c,m)+ 1); %lcg formula to get random numbers for inter-arrival time     
     end
     
     disp('Random number for inter-arrival time: ')
     printf('%d\t', ITRandNum) %to print the random numbers inter-arrival time
     printf('\n\n')
        
        
     %Service Time

     STRandNum(1) = rand(1,1)*upperBound; %seed

     for i = 2:amountofRandNum
        STRandNum(i) = (mod(a*STRandNum(i-1)+c,m) + 1); %lcg formula to get random numbers for service time     
     end
     
     disp('Random number for service time: ')
     printf('%d\t', STRandNum) %to print the random numbers service time
     printf('\n\n')
     
       
     %Temperature Values
        
     lowerBoundTemp = 36.1;
     upperBoundTemp = 38.3; 
     temperatureRange = upperBoundTemp-lowerBoundTemp;
     
     TempRandNum(1) = rand(1,1)*temperatureRange + lowerBoundTemp; %random seed value
     
     aTemp = 2; %a from formula
     cTemp = 4; %c from formula
     mTemp = 2.2; %m from formula
     
     for i = 2:amountofRandNum
        x = aTemp*TempRandNum(i-1)+cTemp; %lcg formula
        TempRandNum(i) = (mod(x,mTemp)) + lowerBoundTemp; %temperature random number
     end
     
     disp('Random number for temperature: ')
     printf('%.1f\t', TempRandNum) %to print the random numbers of temperature
     printf('\n\n')
     
     end
      
    