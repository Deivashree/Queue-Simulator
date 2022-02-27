function [ITRandNum, STRandNum, TempRandNum] = RandFunction(customerNum)
        
    amountOfRandNum = customerNum;
    
    %Inter-arrival Time
    interarrivalRange = 100;
    ITRandNum = ceil(rand(1,amountOfRandNum-1)*interarrivalRange); %to get random numbers for inter-arrival time     
    
    disp('Random number for interval-arrival time: ')
    printf('%d\t', ITRandNum) %to print the random numbers
    printf('\n\n')
    
    
    %Service Time
    serviceRange = 100;
    STRandNum = ceil(rand(1,amountOfRandNum)*serviceRange); %to get random numbers for service time
    
    disp('Random number for service time: ')
    printf('%d\t', STRandNum) %to print the random numbers
    printf('\n\n')
 
    
    %Temperature Values
    lowerBoundTemp = 36.1;
    upperBoundTemp = 38.3; 
    
    temperatureRange = upperBoundTemp-lowerBoundTemp; 
    TempRandNum = (rand(1,amountOfRandNum)*temperatureRange)+lowerBoundTemp;
    
    disp('Random number for temperature: ')
    printf('%.1f\t', TempRandNum) %print temperature with 1 decimal place
    printf('\n\n')
    
    end 
    
