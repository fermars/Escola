-- /^(?<=\[keys\]\r\n)(?:(?!^\[).)*(?=\r\n)/ms
-- /^[^;\s][^;\r\n]*/gm
ini = {}
ini.parser = function(path)
  local file = io.open(path)
  local parse = {}
  local section
  for line in file:lines() do
    if #line:match '^[;#]?' == 0 then
      local match = {line:match '^%[(%w+)%]$'}
      if #match > 0 then
        section = match[1]
        parse[section] = {}
      else
        local key, value = line:match '^(%w+)=(.*)$'
        if key and value then
          value = value:gsub('\\\\', '\\'):gsub('(\\*)(")()', function(bslash, quote)
            print(...)
            if #bslash % 2 == 0 then
          end);
          -- if value:match '^"' then
          --   local str = {}
          --   for i, e in value:gmatch '[^"]+' do
          --     table.insert(str, e)
          --   end
          --   print(value:match '^"[]"')
          -- end
          (parse[section] or parse)[key] = value
        end
      end
    end
  end
  -- '^([;#]?)%[(%w+)%]$'
  -- '^([;#]?)(%w+)=(.*)$'
  return parse
end

-- print(('Oe'):match '^;')

parse = ini.parser('../build/config.ini')
for i, e in next, parse do
  if type(e) == 'table' then
    print(i)
    for i2, e2 in next, e do
      print('', i2 .. ': ' .. e2)
    end
  else
    print(i .. ': ' .. e)
  end
end
