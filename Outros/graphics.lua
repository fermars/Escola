local projects = {
  {
    name = 'Secretaria',
    status = 0,
    technology = {'SQL', 'PHP', 'JavaScript', 'HTML', 'CSS'},
    priority = 2
  },
  {
    name = 'Alunos',
    status = 0,
    technology = {'SQL', 'PHP', 'JavaScript', 'HTML', 'CSS'},
    priority = 1
  },
  {
    name = 'Professores',
    status = 0,
    technology = {'SQL', 'PHP', 'JavaScript', 'HTML', 'CSS'},
    priority = 1
  },
  {
    name = 'Alunos',
    status = 0,
    technology = {'SQL', 'PHP', 'JavaScript', 'HTML', 'CSS'},
    priority = 1
  },
  {
    name = 'Salas',
    status = 0,
    technology = {'SQL', 'PHP', 'JavaScript', 'HTML', 'CSS'},
    priority = 1
  },
  {
    name = 'Matérias',
    status = 0,
    technology = {'SQL', 'PHP', 'JavaScript', 'HTML', 'CSS'},
    priority = 1
  }
}

String = {}
String.__index = String
String.__mul = function(a, b)
  local num = type(a) == 'number' and a or (type(b) == 'number' and b or error(1))
  local str = num == a and b or a -- error(2)
  return str:rep(num):toString()
end
String.__add = function(...)
  local concat = {}
  for i, v in ipairs {...} do
    local value = v

    if type(v) == 'table' and type(v.toString) == 'function' then
      value = v:toString()
    end

    table.insert(concat, tostring(value))
  end
  return String.new(table.concat(concat))
end
for i, v in next, string do
  String[i] = function(self, ...) self.str = string[i](self.str, ...) return self end
end
String.new = function(str)
  local self = setmetatable({}, String)
  self.str = tostring(str)
  return self
end
String.toString = function(self)
  return self.str
end

(getmetatable '').__add = function(a, b) return a .. b end
(getmetatable '').__mul = function(a, b)
  local num = type(a) == 'number' and a or (type(b) == 'number' and b or error(1))
  local str = num == a and b or a -- error(2)
  return str:rep(num)
end
(getmetatable '').__div = function(a, b)
  local num = math.floor(type(a) == 'number' and a or (type(b) == 'number' and b or error(1)))
  local str = num == a and b or a -- error(2)
  local out = {}
  for i = 1, #str, num do
    table.insert(out, str:sub(i, i + num - 1))
  end
  return out
end
(getmetatable '').__unm = function(a)
  return a:reverse()
end
(getmetatable '').__shl = function(a, b)
  local num = math.floor(type(b) == 'number' and b or error())
  if num < 0 then
    num = num - 1
  end
  return a:sub(num + 1) + a:sub(1, num)
end
(getmetatable '').__shr = function(a, b)
  local num = math.floor(type(b) == 'number' and b or error())
  return a << -b
end
(getmetatable '').__mod = function(a, b)
  local num = math.floor(type(b) == 'number' and b or error())
  return num > 0 and a:sub(0, #a - num) or a:sub(-num + 1)
end
local i = String.new('Squalleze')
print('Squalleze' << 0, 'Squalleze' >> 0, '19684' % 2)
-- print((20 + i + 'Oe'):toString())

-- local file = io.open('./PROGRESS.md', 'w+')
--
-- file:write [[
-- | Name | Status | Technology | Priority |
-- | --- | --- | --- | --- |]]
--
-- for i, v in next, projects do
--   file:write('\n| ' .. table.concat({v.name, ('![' .. v.status .. '%](http://progressed.io/bar/' .. v.status .. ')'), table.concat(v.technology, '/'), ({'High', 'Medium', 'Low'})[v.priority]}, ' | ') .. ' |')
-- end
--
-- file:close()

-- local chd, chl = {}, {}
--
-- for i, v in next, percents do
--   table.insert(chd, v.value)
--   table.insert(chl, v.name)
-- end
--
-- print ('https://chart.googleapis.com/chart?cht=p&chs=250x100&chd=t:' .. (table.concat(chd, ',')) .. '&chl=' .. (table.concat(chl, '|')))
