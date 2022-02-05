def mantExp(a_number, digits_number)
  i = 0
  a_number = a_number.to_f
  while a_number.to_i.to_s.length < digits_number
    a_number = a_number*10
    i-=1
  end
  
  while a_number.to_i.to_s.length > digits_number
    a_number = a_number/10
    i+=1
  end
  "#{a_number.to_i}P#{i}"
end
