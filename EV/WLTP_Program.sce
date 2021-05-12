clear()
clc()
//Decode ole file, extract and open Excel stream
[fd,SST,Sheetnames,Sheetpos] = xls_open('WLTP-DHC-12-07e.xls');

//Read second data sheet
[Value,TextInd] = xls_read(fd,Sheetpos(2));

//close the spreadsheet stream
mclose(fd);

//load WLTP time and speed values in structure
WLTC.time = Value(8:1808,3);
WLTC.values = Value(8:1808,5);

//plot WLTP speed profile
plot(WLTC.time,WLTC.values)
xgrid()
xlabel("Time [s]")
ylabel("Vehicle speed [kph]")
title("PupilFirst x Mankame Automotive")
