function QueueSimulator(customerNum, maxCustomerNum, ITRandNum, IAT, IATlowerBoundRange, IATupperBoundRange,TempRandNum,STRandNum,serviceTime1,serviceTime2,STlowerBoundRange1,STupperBoundRange1, STlowerBoundRange2, STupperBoundRange2)

    %INTER-ARRIVAL TIME 
    
    
    PrintIAT = cell(1,customerNum,1); 
    PrintIAT{1,1} = '-';              
    
    PrintRandIAT = cell(1,customerNum,1);
    PrintRandIAT{1,1} = '-';
    
    PrintSTRandNum = cell(1,customerNum,1);
    PrintNumOfCustomer = cell(1,customerNum,1);
    PrintTimeEnter = cell(1,customerNum,1);
    PrintST1 = cell(1,customerNum,1);
    PrintC1STBegin = cell(1,customerNum,1);
    PrintC1STEnd = cell(1,customerNum,1);
    PrintST2 = cell(1,customerNum,1);
    PrintC2STBegin = cell(1,customerNum,1);
    PrintC2STEnd = cell(1,customerNum,1);
    PrintWaitingTime = cell(1,customerNum,1);
    PrintTimeSpent = cell(1,customerNum,1);
    
    InterArrivalTime(1) = 0;
    
    for i=1:customerNum-1    %9 times
        
        if ITRandNum(i) >= IATlowerBoundRange(1) && ITRandNum(i) < IATupperBoundRange(1) + 1
            InterArrivalTime(i+1) = IAT(1);
            
            PrintRandIAT{1,i+1} = ITRandNum(i);
            PrintIAT{1,i+1} = InterArrivalTime(i+1);
            
        elseif ITRandNum(i) >= IATlowerBoundRange(2) && ITRandNum(i) < IATupperBoundRange(2) + 1
            InterArrivalTime(i+1) = IAT(2);
            
            PrintRandIAT{1,i+1} = ITRandNum(i);
            PrintIAT{1,i+1} = InterArrivalTime(i+1);
            
        elseif ITRandNum(i) >= IATlowerBoundRange(3) && ITRandNum(i) < IATupperBoundRange(3) + 1
            InterArrivalTime(i+1) = IAT(3);
            
            PrintRandIAT{1,i+1} = ITRandNum(i);
            PrintIAT{1,i+1} = InterArrivalTime(i+1);
            
        elseif ITRandNum(i) >= IATlowerBoundRange(4) && ITRandNum(i) < IATupperBoundRange(4) + 1
            InterArrivalTime(i+1) = IAT(4);
            
            PrintRandIAT{1,i+1} = ITRandNum(i);
            PrintIAT{1,i+1} = InterArrivalTime(i+1);
            
        elseif ITRandNum(i) >= IATlowerBoundRange(5) && ITRandNum(i) < IATupperBoundRange(5) + 1
            InterArrivalTime(i+1) = IAT(5);
            
            PrintRandIAT{1,i+1} = ITRandNum(i);
            PrintIAT{1,i+1} = InterArrivalTime(i+1);
            
        end
        
    end
  

    %ARRIVAL TIME 
    
    ArrivalTime(1) = 0;
    
    for i=1:customerNum-1
        
        ArrivalTime(i+1) = InterArrivalTime(i+1) + ArrivalTime(i);
    end       
        
    %MAIN QUEUE SIMULATOR

    TempC1STEnd = 0; %variable
    TempC2STEnd = 0; %variable        
    
    C1STEnd = [0]; %array
    C2STEnd = [0]; %array
    C1STBegin = [0]; %array
    C2STBegin = [0]; %array
    TimeEnter = [0];
    
    val = 1;

    
    for i=1:customerNum          
            
                    
       if TempRandNum(i) >= 36.1 && TempRandNum(i) < 37.5 
         
           CountCustomer = 0;
          
           for j=1:length(C1STEnd)
               if TimeEnter(j) <= ArrivalTime(i) && C1STBegin(j) <= ArrivalTime(i) && C1STEnd(j) > ArrivalTime(i)
                   CountCustomer = CountCustomer + 1;
               end
           end
           
            for k=1:length(C2STEnd)  
                        if TimeEnter(k) <= ArrivalTime(i) && C2STBegin(k) <= ArrivalTime(i) && C2STEnd(k) > ArrivalTime(i)
                    CountCustomer = CountCustomer + 1;
                end
            end
           
           NumOfCustomer(i) = CountCustomer;
           
           if NumOfCustomer(i) < maxCustomerNum
               TimeEnter(i) = ArrivalTime(i);
               
               if TempC1STEnd <= ArrivalTime(i)
                   
                   if STRandNum(i) >= STlowerBoundRange1(1) && STRandNum(i) < STupperBoundRange1(1) + 1
                       ST1(i) = serviceTime1(1);
                   elseif STRandNum(i) >= STlowerBoundRange1(2) && STRandNum(i) < STupperBoundRange1(2) + 1
                       ST1(i) = serviceTime1(2);
                   elseif STRandNum(i) >= STlowerBoundRange1(3) && STRandNum(i) < STupperBoundRange1(3) + 1
                       ST1(i) = serviceTime1(3);
                   elseif STRandNum(i) >= STlowerBoundRange1(4) && STRandNum(i) < STupperBoundRange1(4) + 1
                       ST1(i) = serviceTime1(4);
                   elseif STRandNum(i) >= STlowerBoundRange1(5) && STRandNum(i) < STupperBoundRange1(5) + 1
                       ST1(i) = serviceTime1(5);
                   end
                   
                   C1STBegin(i) = ArrivalTime(i); 
                   
                   C1STEnd(i) = ArrivalTime(i) + ST1(i); 
                   
                   TempC1STEnd = C1STEnd(i);
                   
                   ST2(i) = 0;
                   C2STBegin(i) = 0;
                   C2STEnd(i) = 0;
                   
                   WaitingTime(i) = C1STBegin(i) - ArrivalTime(i);
                   PrintWaitingTime{1,i} = WaitingTime(i);
                   
                   TimeSpent(i) = C1STEnd(i) - ArrivalTime(i);
                   PrintTimeSpent{1,i} = TimeSpent(i);
               

               elseif TempC2STEnd <= ArrivalTime(i)
                   
                   if STRandNum(i) >= STlowerBoundRange2(1) && STRandNum(i) < STupperBoundRange2(1) + 1
                       ST2(i) = serviceTime2(1);
                   elseif STRandNum(i) >= STlowerBoundRange2(2) && STRandNum(i) < STupperBoundRange2(2) + 1
                       ST2(i) = serviceTime2(2);
                   elseif STRandNum(i) >= STlowerBoundRange2(3) && STRandNum(i) < STupperBoundRange2(3) + 1
                       ST2(i) = serviceTime2(3);
                   elseif STRandNum(i) >= STlowerBoundRange2(4) && STRandNum(i) < STupperBoundRange2(4) + 1
                       ST2(i) = serviceTime2(4);
                   elseif STRandNum(i) >= STlowerBoundRange2(5) && STRandNum(i) < STupperBoundRange2(5) + 1
                       ST2(i) = serviceTime2(5);
                   end
                   
                   
                   C2STBegin(i) = ArrivalTime(i);
                   
                   C2STEnd(i) = ArrivalTime(i) + ST2(i);
                   TempC2STEnd = C2STEnd(i);
                   
                   ST1(i) = 0;
                   C1STBegin(i) = 0;
                   C1STEnd(i) = 0;
    
                   WaitingTime(i) = C2STBegin(i) - ArrivalTime(i);
                   PrintWaitingTime{1,i} = WaitingTime(i);
                   
                   TimeSpent(i) = C2STEnd(i) - ArrivalTime(i);
                   PrintTimeSpent{1,i} = TimeSpent(i);
                   
               else 
                   
                   if TempC1STEnd <= TempC2STEnd
                       
                       if STRandNum(i) >= STlowerBoundRange1(1) && STRandNum(i) < STupperBoundRange1(1) + 1
                           ST1(i) = serviceTime1(1);
                       elseif STRandNum(i) >= STlowerBoundRange1(2) && STRandNum(i) < STupperBoundRange1(2) + 1
                           ST1(i) = serviceTime1(2);
                       elseif STRandNum(i) >= STlowerBoundRange1(3) && STRandNum(i) < STupperBoundRange1(3) + 1
                           ST1(i) = serviceTime1(3);
                       elseif STRandNum(i) >= STlowerBoundRange1(4) && STRandNum(i) < STupperBoundRange1(4) + 1
                           ST1(i) = serviceTime1(4);
                       elseif STRandNum(i) >= STlowerBoundRange1(5) && STRandNum(i) < STupperBoundRange1(5) + 1
                           ST1(i) = serviceTime1(5);
                       end
                   
                      
                       C1STBegin(i) = TempC1STEnd;

                       C1STEnd(i) = C1STBegin(i) + ST1(i);
                       TempC1STEnd = C1STEnd(i);
                       
                       ST2(i) = 0;
                       C2STBegin(i) = 0;
                       C2STEnd(i) = 0;
                       
                       WaitingTime(i) = C1STBegin(i) - ArrivalTime(i);
                       PrintWaitingTime{1,i} = WaitingTime(i);
                       
                       TimeSpent(i) = C1STEnd(i) - ArrivalTime(i);
                       PrintTimeSpent{1,i} = TimeSpent(i);
                       
                   else
                       
                       if STRandNum(i) >= STlowerBoundRange2(1) && STRandNum(i) < STupperBoundRange2(1) + 1
                           ST2(i) = serviceTime2(1);
                       elseif STRandNum(i) >= STlowerBoundRange2(2) && STRandNum(i) < STupperBoundRange2(2) + 1
                           ST2(i) = serviceTime2(2);
                       elseif STRandNum(i) >= STlowerBoundRange2(3) && STRandNum(i) < STupperBoundRange2(3) + 1
                           ST2(i) = serviceTime2(3);
                       elseif STRandNum(i) >= STlowerBoundRange2(4) && STRandNum(i) < STupperBoundRange2(4) + 1
                           ST2(i) = serviceTime2(4);
                       elseif STRandNum(i) >= STlowerBoundRange2(5) && STRandNum(i) < STupperBoundRange2(5) + 1
                           ST2(i) = serviceTime2(5);
                       end
                       
                      C2STBegin(i) = TempC2STEnd;  
                      
                      C2STEnd(i) = C2STBegin(i) + ST2(i); 
                      TempC2STEnd = C2STEnd(i); 
                       
                      ST1(i) = 0;
                      C1STBegin(i) = 0;
                      C1STEnd(i) = 0; 
                       
                      WaitingTime(i) = C2STBegin(i) - ArrivalTime(i);
                      PrintWaitingTime{1,i} = WaitingTime(i);
                      
                      TimeSpent(i) = C2STEnd(i) - ArrivalTime(i);
                      PrintTimeSpent{1,i} = TimeSpent(i); 
                      
                   end
               end 
               
           else            
                 if TempC1STEnd <= TempC2STEnd
                     
                    if STRandNum(i) >= STlowerBoundRange1(1) && STRandNum(i) < STupperBoundRange1(1) + 1
                        ST1(i) = serviceTime1(1);
                    elseif STRandNum(i) >= STlowerBoundRange1(2) && STRandNum(i) < STupperBoundRange1(2) + 1
                        ST1(i) = serviceTime1(2);
                    elseif STRandNum(i) >= STlowerBoundRange1(3) && STRandNum(i) < STupperBoundRange1(3) + 1
                        ST1(i) = serviceTime1(3);
                    elseif STRandNum(i) >= STlowerBoundRange1(4) && STRandNum(i) < STupperBoundRange1(4) + 1
                        ST1(i) = serviceTime1(4);
                    elseif STRandNum(i) >= STlowerBoundRange1(5) && STRandNum(i) < STupperBoundRange1(5) + 1
                        ST1(i) = serviceTime1(5);
                    end
                       
                    TimeEnter(i) = TempC1STEnd;
                    C1STBegin(i) = TempC1STEnd;

                    C1STEnd(i) = C1STBegin(i) + ST1(i);
                    TempC1STEnd = C1STEnd(i);
                    
                    ST2(i) = 0;
                    C2STBegin(i) = 0;
                    C2STEnd(i) = 0;
                    
                    WaitingTime(i) = C1STBegin(i) - ArrivalTime(i);
                    PrintWaitingTime{1,i} = WaitingTime(i);
                    
                    TimeSpent(i) = C1STEnd(i) - ArrivalTime(i);
                    PrintTimeSpent{1,i} = TimeSpent(i);
                    
                 else
                     
                    if STRandNum(i) >= STlowerBoundRange2(1) && STRandNum(i) < STupperBoundRange2(1) + 1
                        ST2(i) = serviceTime2(1);
                    elseif STRandNum(i) >= STlowerBoundRange2(2) && STRandNum(i) < STupperBoundRange2(2) + 1
                        ST2(i) = serviceTime2(2);
                    elseif STRandNum(i) >= STlowerBoundRange2(3) && STRandNum(i) < STupperBoundRange2(3) + 1
                        ST2(i) = serviceTime2(3);
                    elseif STRandNum(i) >= STlowerBoundRange2(4) && STRandNum(i) < STupperBoundRange2(4) + 1
                        ST2(i) = serviceTime2(4);
                    elseif STRandNum(i) >= STlowerBoundRange2(5) && STRandNum(i) < STupperBoundRange2(5) + 1
                        ST2(i) = serviceTime2(5);
                    end 
                    
                   TimeEnter(i) = TempC2STEnd;
                   C2STBegin(i) = TempC2STEnd; 

                   C2STEnd(i) = C2STBegin(i) + ST2(i);
                   TempC2STEnd = C2STEnd(i); 
                    
                   ST1(i) = 0;
                   C1STBegin(i) = 0;
                   C1STEnd(i) = 0; 
                    
                   WaitingTime(i) = C2STBegin(i) - ArrivalTime(i);
                   PrintWaitingTime{1,i} = WaitingTime(i);

                   TimeSpent(i) = C2STEnd(i) - ArrivalTime(i); 
                   PrintTimeSpent{1,i} = TimeSpent(i);
                 end   
         end 
         
       else
           
           STRandNum(i) = 0;
           ST1(i) = 0;
           C1STBegin(i) = 0;
           C1STEnd(i) = 0;
           ST2(i) = 0;
           C2STBegin(i) = 0;
           C2STEnd(i) = 0;
           WaitingTime(i) = 0;
           TimeSpent(i) = 0; 
           NumOfCustomer(i) = 0;
           TimeEnter(i) = 0;
           
           PrintNumOfCustomer{1,i} = '-';
           PrintTimeEnter{1,i} = '-';
           PrintST1{1,i} = '-';
           PrintC1STBegin{1,i} = '-';
           PrintC1STEnd{1,i} = '-';
           PrintST2{1,i} = '-';
           PrintC2STBegin{1,i} = '-';
           PrintC2STEnd{1,i} = '-';
           PrintWaitingTime{1,i} = '-';
           PrintTimeSpent{1,i} = '-';
           
          
       end
         
    end   
    
    
    for i=1:customerNum
    
        if TempRandNum(i) >= 36.1 && TempRandNum(i) < 37.5                          

                while ((ArrivalTime(i) >= C1STEnd(val)) && C1STEnd(val) ~= 0) || ((ArrivalTime(i) >= C2STEnd(val)) && C2STEnd(val) ~= 0)
                           
                    if (ArrivalTime(i) >= C1STEnd(val)) && C1STEnd(val) ~= 0
                        fprintf('1---Departure of customer %d at minute %d \n',[val,C1STEnd(val)]);
                        val = val + 1;
                    elseif (ArrivalTime(i) >= C2STEnd(val)) && C2STEnd(val) ~= 0
                        fprintf('2---Departure of customer %d at minute %d \n',[val,C2STEnd(val)]);
                        val = val + 1;
                    elseif C1STEnd(val) ~= 0 || C2STEnd(val) ~= 0
                        val = val + 1;
                    
                    end   
                end
               
                fprintf('Customer %d arrived at minute %d and entered the centre at minute %d \n\n',[i,ArrivalTime(i),TimeEnter(i)]);
            
        elseif TempRandNum(i) > 37.5
            fprintf('Customer %d arrived at minute %d and was not allowed to enter \n\n',[i,ArrivalTime(i)]);
        end
    end
    
    
    
          
    for i = 1:customerNum    
        if NumOfCustomer(i) ~= 0
           PrintNumOfCustomer{1,i} = NumOfCustomer(i);
        end
    
        if TimeEnter(i) ~= 0
           PrintTimeEnter{1,i} = TimeEnter(i);
        end  
    
        if STRandNum(i) == 0
           PrintSTRandNum{1,i} = '-';
        else 
           PrintSTRandNum{1,i} = STRandNum(i);
        end     

        if ST1(i) == 0 && C1STBegin(i) == 0 && C1STEnd(i) == 0
           PrintST1{1,i} = '-';
           PrintC1STBegin{1,i} = '-';
           PrintC1STEnd{1,i} = '-';
        else 
           PrintST1{1,i} = ST1(i);
           PrintC1STBegin{1,i} = C1STBegin(i);
           PrintC1STEnd{1,i} = C1STEnd(i);
        end 
       
        if ST2(i) == 0 && C2STBegin(i) == 0 && C2STEnd(i) == 0
           PrintST2{1,i} = '-';
           PrintC2STBegin{1,i} = '-';
           PrintC2STEnd{1,i} = '-';
        else 
           PrintST2{1,i} = ST2(i);
           PrintC2STBegin{1,i} = C2STBegin(i);
           PrintC2STEnd{1,i} = C2STEnd(i);
        end
          
     
    end
    
    
    
    
    printf('\n');
    disp('Queue Simulation');
    printf('\n');

    %TABLE 1               
                 
    disp('------------------------------------------------------------------------------------------------------------');
    
    disp(sprintf('| %-8s | %-11s | %-18s | %-13s | %-7s | %-10s | %-10s |','Customer','Temperature','Random number for','Inter-arrival','Arrival','No. of customers','Time entering'));
    disp(sprintf('| %-8s | %-11s | %-12s | %-13s | %-7s | %-16s | %-13s |','No.','(Celsius)','inter-arrival time','time','time','in the centre','the centre'));

    disp('------------------------------------------------------------------------------------------------------------');
    
    for i = 1:customerNum
        fprintf('| %-8d | %-11.1f ',[i, TempRandNum(i)]);
        
    if isstr(PrintRandIAT{1,i}) 
        fprintf('| %-18s ', PrintRandIAT{1,i});
      else
        fprintf('| %-18d ', PrintRandIAT{1,i}); 
    end
     
    if isstr(PrintIAT{1,i}) 
        fprintf('| %-13s ', PrintIAT{1,i});
      else
        fprintf('| %-13d ', PrintIAT{1,i}); 
    end
    
    fprintf('| %-7d ',[ArrivalTime(i)]);
    
    if isstr(PrintNumOfCustomer{1,i}) 
        fprintf('| %-16s ', PrintNumOfCustomer{1,i});
      else
        fprintf('| %-16d ', PrintNumOfCustomer{1,i}); 
    end
    
    if isstr(PrintTimeEnter{1,i}) 
        fprintf('| %-13s |', PrintTimeEnter{1,i});
      else
        fprintf('| %-13d |', PrintTimeEnter{1,i}); 
    end
    
    printf('\n');  

    end
        
    disp('------------------------------------------------------------------------------------------------------------');
    
    %TABLE 2
    
    disp('-------------------------------------------------------------------------------------------------------');

    disp(sprintf('| %-8s | %-10s | %-27s | %-27s | %-7s | %-5s |','Customer','Random','Counter 1','Counter 2','Waiting','Time'));
    disp(sprintf('| %-8s | %-10s | %-7s | %-7s | %-7s | %-7s | %-7s | %-7s | %-7s | %-5s |','No.','number for','Service','Time','Time','Service','Time','Time','time','spent'));
    disp(sprintf('| %10s %-10s | %-7s | %-7s | %-7s | %-7s | %-7s | %-7s | %9s %7s','|','service','time','service','service','time','service','service','|','|'));
    disp(sprintf('| %10s %-10s %-9s | %-7s | %-7s %-9s | %-7s | %-7s | %9s %7s','|','time','|','begins','ends','|','begins','ends','|','|'));

    disp('-------------------------------------------------------------------------------------------------------');

    for i = 1:customerNum
        fprintf('| %-8d ',[i]);
  
    
    if isstr(PrintSTRandNum{1,i}) 
        fprintf('| %-10s ', PrintSTRandNum{1,i});
      else
        fprintf('| %-10d ', PrintSTRandNum{1,i}); 
    end
    
    if isstr(PrintST1{1,i}) 
        fprintf('| %-7s ', PrintST1{1,i});
      else
        fprintf('| %-7d ', PrintST1{1,i}); 
    end
    
    if isstr(PrintC1STBegin{1,i}) 
        fprintf('| %-7s ', PrintC1STBegin{1,i});
      else
        fprintf('| %-7d ', PrintC1STBegin{1,i}); 
    end
    
    if isstr(PrintC1STEnd{1,i}) 
        fprintf('| %-7s ', PrintC1STEnd{1,i});
      else
        fprintf('| %-7d ', PrintC1STEnd{1,i}); 
    end
    
    if isstr(PrintST2{1,i}) 
        fprintf('| %-7s ', PrintST2{1,i});
      else
        fprintf('| %-7d ', PrintST2{1,i}); 
    end
    
    if isstr(PrintC2STBegin{1,i}) 
        fprintf('| %-7s ', PrintC2STBegin{1,i});
      else
        fprintf('| %-7d ', PrintC2STBegin{1,i}); 
    end
    
    if isstr(PrintC2STEnd{1,i}) 
        fprintf('| %-7s ', PrintC2STEnd{1,i});
      else
        fprintf('| %-7d ', PrintC2STEnd{1,i}); 
    end
    
    if isstr(PrintWaitingTime{1,i}) 
        fprintf('| %-7s ', PrintWaitingTime{1,i});
      else
        fprintf('| %-7d ', PrintWaitingTime{1,i}); 
    end
    
    if isstr(PrintTimeSpent{1,i}) 
        fprintf('| %-5s |', PrintTimeSpent{1,i});
      else
        fprintf('| %-5d |', PrintTimeSpent{1,i}); 
    end
    
    printf('\n');  

    end
    disp('-------------------------------------------------------------------------------------------------------');
   

    %TableCalculation(customerNum,PrintWaitingTime,PrintTimeSpent,PrintST1,PrintST2,PrintIAT,WaitingTime);
    %ExportQueueSimulator(customerNum,TempRandNum,PrintRandIAT,PrintIAT,ArrivalTime,PrintNumOfCustomer,PrintTimeEnter,PrintSTRandNum, PrintST1, PrintC1STBegin, PrintC1STEnd, PrintST2, PrintC2STBegin, PrintC2STEnd,PrintWaitingTime,PrintTimeSpent);
    %% CHANGE THE FPRINTF FROM -5.0F TO -5D 
   
    
    
    
    
    
    
    