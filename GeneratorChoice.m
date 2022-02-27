function GeneratorChoice(generatorType,customerNum,maxCustomerNum)
    
    disp('--------------- Random Numbers ---------------') 
    printf('\n')

    switch(generatorType) %switch case
        
      case 1                                      %the first option in the "types of random generator" menu
          [ITRandNum, STRandNum, TempRandNum] = LinearCongruential(customerNum);         %to call the function which generates random number using linear congruential generator
            
      case 2                                      %the second option in the "types of random generator" menu
          [ITRandNum, STRandNum, TempRandNum] = RandomVariateExponential(customerNum);  %to call the function which generates random number using random variate exponential
            
      case 3                                      %the third option in the "types of random generator" menu
          [ITRandNum, STRandNum, TempRandNum] = RandomVariateUniform(customerNum);      %to call the function which generates random number using random variate uniform
            
      case 4                                      %the fourth option in the "types of random generator" menu
          [ITRandNum, STRandNum, TempRandNum] = RandFunction(customerNum);              %to call the function which generates random number using rand function
            
      end
     
      
      [IAT, IATlowerBoundRange, IATupperBoundRange] = InterArrivalTimeTable(generatorType);
      [serviceTime1, serviceTime2, STlowerBoundRange1, STupperBoundRange1, STlowerBoundRange2, STupperBoundRange2] = ServiceTimeTable(generatorType);
      
      QueueSimulator(customerNum,maxCustomerNum,ITRandNum,IAT,IATlowerBoundRange,IATupperBoundRange,TempRandNum,STRandNum,serviceTime1,serviceTime2,STlowerBoundRange1,STupperBoundRange1, STlowerBoundRange2, STupperBoundRange2);
      
