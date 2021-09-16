String getTimeSplited(String time) 
{

  if (time[time.length - 2] == 'P')
    time = time.split('PM')[0];
  else
    time = time.split('AM')[0];
  print('time2 $time');
  return time;
}