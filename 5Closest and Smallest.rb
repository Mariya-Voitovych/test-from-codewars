def closest(strng)
  if strng == ""
    return []
  end 
  numbers = strng.split
  weigth = weigth(numbers)
  distances = find_dist(weigth)
  if find_min(distances).length == 1
    return form_answer(find_min(distances), numbers).sort_by{|array| array[0]}
  elsif smallest_weigth(find_min(distances), numbers).length == 1
    return form_answer(smallest_weigth(find_min(distances), numbers), numbers)
  else
    return form_answer(smallest_index(smallest_weigth(find_min(distances), numbers)),numbers) 
  end  
end

def weigth(numbers)
  weigth = []
  for i in 0..(numbers.length-1)
    sum = 0
    numbers[i].chars.each{|number| sum = sum + number.to_i}
    weigth.push(sum) 
  end 
  weigth 
end  

def find_dist(array)
  dist = {}
  for i in 0..(array.length-1)
    for j in i+1..(array.length-1)
      dist[[i,j]] = (array[i]-array[j]).abs
    end  
  end 
  dist 
end  

def find_min(hash)
  min = hash.values.min
  hash.select{|key, value| value == min }
end  

def form_answer(hash, numbers)
  answer = []
  for i in 0..1
    answer.push([weigth(numbers)[hash.keys.first[i]], hash.keys.first[i], numbers[hash.keys.first[i]].to_i])
  end
  answer.sort_by{|array| array[0]}
end  

def smallest_weigth(hash, numbers)
  weigths = []
  hash.keys.each{|key| weigths.push(weigth(numbers)[key[0]]+weigth(numbers)[key[1]])}
  hash.select{|key, value| weigth(numbers)[key[0]]+weigth(numbers)[key[1]] == weigths.min}
end  

def smallest_index(hash)
  index = []
  hash.keys.each{|key| index.push(key[0])}
  hash.select{|key, value| key[0] == index.min}
end 
