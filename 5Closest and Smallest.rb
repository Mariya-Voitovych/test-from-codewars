def closest(strng)
  if strng.empty?
    return []
  end 
  numbers = strng.split
  weigth = weigth(numbers)
  distances = find_dist(weigth)
  min_distance = find_min(distances)
  if find_min(distances).length == 1
    return form_answer(min_distance, numbers)
  elsif smallest_weigth(min_distance, weigth).length == 1
    return form_answer(smallest_weigth(min_distance, weigth), numbers)
  else
    form_answer(smallest_index(smallest_weigth(min_distance, weigth)),numbers) 
  end  
end

def weigth(numbers)
  weigth = []
  for i in 0..numbers.length-1
    sum = 0
    numbers[i].chars.each{ |number| sum = sum + number.to_i }
    weigth.push(sum) 
  end 
  weigth 
end  

def find_dist(array)
  dist = {}
  for i in 0..array.length-1
    for j in i+1..array.length-1
      dist[[i,j]] = (array[i]-array[j]).abs
    end  
  end 
  dist 
end  

def find_min(hash)
  min = hash.values.min
  hash.select{ |key, value| value == min }
end  

def form_answer(hash, numbers)
  answer = []
  for i in 0..1
    index = hash.keys.first[i]
    answer.push([weigth(numbers)[index], index, numbers[index].to_i])
  end
  answer.sort_by{ |arr| arr[0] }
end  

def smallest_weigth(hash, weigth)
  weigths = []
  hash.keys.each{ |key| weigths.push(weigth[key[0]] + weigth[key[1]]) }
  hash.select{ |key, value| weigth[key[0]] + weigth[key[1]] == weigths.min }
end  

def smallest_index(hash)
  index = []
  hash.keys.each{ |key| index.push(key[0]) }
  hash.select{ |key, value| key[0] == index.min }
end 
