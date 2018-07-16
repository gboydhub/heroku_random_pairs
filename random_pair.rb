def random_pair(name_array)
  
  unless name_array.is_a?(Array); return false; end
  unless name_array[0].is_a?(String); return false; end

  # Initialize nil array structure
  namelist = Array.new(0){Array.new(0)}
  firstnames = Array.new(0)
  lastnames = Array.new(0)

  # Split input array into first and last names
  name_array.each do |v|
    name = v.split(' ')
    firstnames << name[0]
    if name.length > 1; lastnames << name[1]; end
  end

  # Randomize names
  firstnames = firstnames.shuffle
  lastnames = lastnames.shuffle
  

  firstnames.reject! {|i| i.nil? || i == ''}
  lastnames.reject! {|i| i.nil? || i == ''}

  if firstnames.length == 1 && lastnames.length == 0
    return [firstnames]
  end
  # Generate split namelist
  lastnames.each_with_index do |v, i|
    namelist << [firstnames[i], v]
  end

  easter_egg = firstnames.index("Teecee")
  if easter_egg
    firstnames[easter_egg] = "Teecee <3"
  end

  ln_counter = lastnames.length
  while ln_counter < firstnames.length do
    if ln_counter+1 < firstnames.length
      namelist << [firstnames[ln_counter], firstnames[ln_counter+1]]
      ln_counter += 2
    else
      namelist.last << firstnames.last
      ln_counter += 1
    end
    p ln_counter
  end

  namelist
end