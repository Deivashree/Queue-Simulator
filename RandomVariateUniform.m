function [ITRandNum, STRandNum, TempRandNum] = RandomVariateUniform(customerNum)
        
    % formula for linear congruential generator
    % X(i)= a + (b-a)*R(i) 
    
    lowerBound = 1;
    upperBound = 100; 
    amountofRandNum = customerNum;

    %Inter-arrival Time 
    
    ITRandSeedValues = rand(amountofRandNum-1,1); %random seed value
    ITRandNum = lowerBound + (upperBound-lowerBound).*ITRandSeedValues; %to get random numbers for inter-arrival time     
    
    disp('Random number for inter-arrival time: ')
    printf('%d\t', ITRandNum) %to print the random numbers
    printf('\n\n')
    
    
    %Service Time
    
    STRandSeedValues = rand(amountofRandNum,1); %random seed value
    STRandNum = lowerBound + (upperBound-lowerBound).*STRandSeedValues; %to get random numbers for service time
    
    disp('Random number for service time: ')
    printf('%d\t', STRandNum) %to print the random numbers
    printf('\n\n')
    
    
    %Temperature Values
    
    lowerBoundTemp = 36.1;
    upperBoundTemp = 38.3; 
    
    TempRandSeedValues = rand(amountofRandNum,1); %random seed value
    TempRandNum = lowerBoundTemp + (upperBoundTemp-lowerBoundTemp).*TempRandSeedValues; %to get random numbers for temperature values
    
    disp('Random number for temperature: ')
    printf('%.1f\t', TempRandNum) %to print the random numbers
    printf('\n\n')
   
    end  