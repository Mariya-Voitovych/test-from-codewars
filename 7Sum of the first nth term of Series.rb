def series_sum(n)
  sum = 0.00
  i = 1
  while i < n+1
    sum = sum + 1/(1+3*(i-1)).to_f
    i = i + 1
  end  
  '%.2f' % sum
end