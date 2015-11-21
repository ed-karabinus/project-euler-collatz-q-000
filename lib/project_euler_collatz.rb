def even_next(n)
  n / 2
end

def odd_next(n)
  3 * n + 1
end

def next_value(n)
  if n % 2 == 0
    even_next(n)
  else
    odd_next(n)
  end
end

def collatz(n)
  collatz_array = [n]
  until collatz_array[-1] == 1
    collatz_array << next_value(n)
    n = next_value(n)
  end
  collatz_array
end

def collatz_length(n)
  if n == 1
    1
  elsif n % 2 == 0
    collatz_length(n / 2) + 1
  else
    collatz_length(3 * n + 1) + 1
  end
end

def longest_collatz(number = 1000000)
  index = 1
  maximum_length = 0
  maximum_index = 0
  lengths = Array.new(number)
  until index > number
    if index % 2 == 0
      lengths[index - 1] = lengths[index / 2 - 1] + 1
    else
      lengths[index - 1] = collatz_length(index)
    end
    if lengths[index - 1] > maximum_length
      maximum_length = lengths[index - 1]
      maximum_index = index
    end
    index += 1
  end
  maximum_index
end