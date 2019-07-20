--##########################################################################################
--##########################################################################################
--####################### Lua CheatSheet by Shubham Dwivedi ################################
--##########################################################################################
--##########################################################################################

-- This is a line comment 
--[[
    This is a block Comment 
    Everything here is included 
    in the comment. 
  ]]

--[[######## Identifiers #######
1. Cannot start with numbers and underscore followed by uppercase 
2. Use camelCase  
 ]]


--############ Types in Lua ########## 
--1. Numbers: (IEEE 754 standard) 
local a = 10 
print(type(a)) --gives "number"


--2. Strings: (Strings are immutable values, when modifying a new string is always created)
print(type("Hello")) --gives "string"
local b = type(a)
print(type(b)) --gives "string"

--3. Boolean: (nil and false is considered false everything else is true)
print(type(true)) --gives "boolean"

--4. nil: (nil is a non-value representing the absence of a useful value) 
print(type(nil)) --gives "nil"

--5. Functions: (a function can be assigned to a variable)
print(type(type)) --gives "function"
--here type() is a build-in function in lua that gives the type of a variable 

--6. Table: (table in lua is an associative array)


--########### More on Strings ############
-- can use either single ('ahdfsdf') or double("dgslge") quotes 
-- the other type of quote can be used within the string 
print('She said "fuck me in my moist pussy" pointing to my throbbing cock')

-- Escape Sequences 
--1. \a - bell 
--2. \b - back spance 
--3. \f - from feed 
--4. \n - newline 
--5. \r - carriage return 
--6. \t - horizontal tab
--7. \v - vertical tab 
--8. \\ - backslash 
--9. \" - double quote 
--10. \' - single quote 

-- Long Strings 
longString = [[This is a very 
long string that goes on and on]] 
print(longString) -- prints above string including the new line 

anotherString = [===[This is another 
long string that has 
some double brackets [[]] in it]===]
print(anotherString)

print("This is a string\nthat goes on also")

--NOTE: There are automatic COERCIONS between numbers and strings 


--########### Tables ###############

--Tables are associative arrays: 
    --Can be indexed with numbers(like arrays/lists) or strings(like object/dicts)
        --Can also be indexed with any other values of the language except nil. 

--Tables are the main data structures of the lua language. 
    --The only primitive data structure 

--Tables are dynamically allocated 
--Tables are created by a constructor expression 

a = {} -- creates a table and puts a reference in "a"  
a["earth"] = "imageEarth.jpg" --puts the filename of an image into "a" at key "earth"

print(a["earth"]) --prints "imageEarth.jpg"

a[10] = "imageMars.jpg"
print(a[10]) --prints "imageMars.jpg"

print("The earth image is " .. a["earth"])

-- using the alternate syntax for a["earth"]
print("The earth image is also " .. a.earth)

-- assigning functions to variables (be careful)
printFunction = print 
printFunction("This is a string")
a["printIt"] = print 
a.printIt("Printing using an index into a table reference")

-- #### Table Constructors 

-- The simplest constructor 
a = {} -- an empty table 
print(a[1]) --prints nil 

-- table indexed by integers 
b = {"Earth", "Mars", "Saturn", "Jupiter"}
print(b[1]) --prints "Earth"
--NOTE: lua indexes start with 1 instead of 0. 

-- table with string indices 
c = {x="Earth", y="Mars", z=10} 
print(c.x) --prints "Earth"
print(c["x"]) --prints "Earth"
print(c.z) --prints 10 

-- nesting tables within tables 
d = {x="Piano", y={"Trumpet", z="Violin"}}
print(d.x) --prints "Piano"
print(d.y[1]) --prints "Trumpet"
print(d.y.z) --prints "Violin"


--############## Expressions and Statements #############

-- Expressions are numeric, relational or string 
-- Each has a set of operators that are used in their creation 

--1. Arithmetic expressions operators 
-- addition(+)
-- subtraction(-)
-- multiplicaiton(*)
-- division(/)
-- Exponentiation(^)
-- Modulo(%)
-- Unary Negation(-variable)

--2. Relational operators 
-- Less than (<)
-- Greater than (>)
-- Less than or equal (<=)
-- Greater than or equal (>=)
-- Equal (==)
-- Not Equal (~=)

--3. Logical Operators 
-- and 
-- or 
-- not 

-- ### Precedence Rules: 
-- Arithmetic, relational, and logical operaotrs 
    -- follow the standard precendence rules 

-- Assignment 
-- The equal (=) sign is assingment
    -- Assigns a value to a memory location 
        -- variableName = value
        -- left-hand side is a reference to a memory location 
        -- right-hand side evaluates to the value (can be a function reference)

-- String Concatenation 
a = "this is a " .. "string concatenation"
print(a)

-- Length of String and Table(with integer indices):
    -- The length of operator is hash(#)
a = "this is a string " .. "concatenation"
print(a)
b = #a 
print("The string length is " .. b) --prints "The string length is 30"

-- Length of a table with integer indices 
b = { "Earth", "Mars", "Saturn", "Jupiter"}
print(#b) --prints "4" 


-- ########### Global Variables ###########

-- Variables that are not declared as local in a block 
    --[[
        Declarations of variables is not required in lua. 
        This means that misspelling etc. can cause errors in the program. 
        The misspelling will be taken as a proper identifier with a value of nil. 
    ]]

-- ### Local Variables 
-- Created using the "local" statement. 
-- Scope is limited to the block in which they are declared 

-- ## Block Scope: 
    -- Body of a control structure. 
    -- Body of a function. 
    -- Body of the chunk (the file).
    -- do end block 

-- Local scope overrides global scope. IMPORTANT 



-- ########################################################
-- ################ Basic Control Structures ##############
-- ########################################################

-- ########### The While and Repeat loops ##########

-- While loop tests its condition at its start and may never execute its body: 

--[[ syntax for while loop: 
while conditionTestingLoopVariable do 
    body of the loop 
    change the loop variable
end 
]]

local i = 1 
local a = { "Oak", "Pine", "Cherry", "Fir" }
while a[i] do 
    print (a[i])
    i = i + 1
end 
-- prints Oak Pine Cherry Fir then stops. 


-- Repeat loop always executes once and tests its loop condition at its end (like a do-while loop)

--[[ syntax for repeat loop: 
repeat 
    body of the loop 
    change the loop variable 
until conditionTestingLoopVariable 
]]

local i = 1 
local a = { "Oak", "Pine", "Cherry", "Fir" }
repeat 
    print(a[i])
    i = i + 1 
until a[i]
-- prints Oak then stops ?????

-- ######### The For Loop #############

-- ### Numeric For loop - usually uses integers as the loop variables 

--[[ syntax: 
for var = exp1, exp2, exp3 do 
    body of the loop that does something
end 

--exp1 is used to initialize the loop variable
    --which is local to that for loop block 
--exp2 is used to test against the value of the loop variable
--exp3 tells how much to step the loop variable after each loop 
]]

local a = { "Oak", "Pine", "Cherry", "Fir" }
for i = 1, 4, 2 do 
    print(a[i])
end 
-- prints Oak Cherry then stops 

-- ### Generic For loop - use iterators to traverse a data structure 

--the function "pairs()" below returns the index and value of each element of a table in order: 
local tableDays = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
for k,v in pairs(tableDays) do print(k,v) end
-- prints: 
-- 1       Sunday
-- 2       Monday
-- 3       Tuesday
-- 4       Wednesday
-- 5       Thursday
-- 6       Friday
-- 7       Saturday 


--############ Conditionals if then elseif else end #############

--Examples 

local number1 = 57 
local number2 = 43 
local number3 = number1 + number2 

if number1 > number2 then 
    print("number1 is greater")
end 


if number1 < number2 then 
    print("number2 is greater")
else 
    print("number1 is greater")
end 


if number3 < number1 then 
    print("number1 is greater than number3")
elseif number3 < number2 then 
    print("number2 is greater than number3")
else 
    print("number3 is greater than both the other numbers")
end 


-- ########## Using break and return and goto ###########

-- ### the "break" statement is used exclusively to break out of a loop 

-- ### the "return" statement is used to return from a function 
    -- it is not required if the function returns naturally 
    -- it does not require a return value
    
-- ### the "goto" statement jumps execution to a label

goto myLabel 
-- some code here 
print("This should NOT be printed")
::myLabel:: 
-- some code here
print("This should be printed")

-- Misuse of "goto" causes spaghetti code. Avoid using it. 

-- ########## Using do end to delimit blocks ###########
a = 5
do 
    local a = 9 
    print("local a  : " .. a) -- prints 9 
end 
print("global a : " .. a) -- prints 5 



-- #####################################################
-- #################### Functions ######################
-- #####################################################

--[[ syntax:
function name(parameter list)
    code goes here 
    ... 
    return optional 
end 
]]

--NOTE: parameters work as local variables (With function block scope)

function sum(a, b)
    local c = a + b 
    return c 
end 

d = sum(2, 7)
print(d) -- prints 9 

print(sum(2, 3)) -- prints 5


-- ### Variadic Functions -- recieves a variable number of arguments 

local a = 7 b = 8 c = 9 c = 5 

function add(...)
    local sum = 0
    for i,v in ipairs{...} do 
        sum = sum + v 
    end 
    return sum 
end 

print(add(a, b)) -- prints 15

print(add(a, b, c, d)) -- prints 29


--[[ NOTE: pairs() and ipairs() are slightly different.
pairs() returns key-value pairs and is mostly used for associative tables.
    key order is unspecified.

ipairs() returns index-value pairs and is mostly used for numeric tables.
    Non numeric keys in an array are ignored, while the index order is deterministic (in numeric order).
]]
-- Example: 
u = {} 
u[1] = "a"
u[3] = "b"
u[2] = "c"
u[4] = "d"
u["hello"] = "world"
for key,value in ipairs(u) do print(key,value) end
-- prints: 
-- 1   a
-- 2   c
-- 3   b
-- 4   d
for key,value in pairs(u) do print(key,value) end
-- prints: 
-- 1   a
-- 3   b
-- 2   c
-- 4   d
-- hello   world


-- ### Returning multiple results 

-- Functions in lua can return multiple results 
--[[syntax: 
function multipleResults (list of parameters)
    code goes here 
    ... 
    return variable1, variable2, variable3 
end 
]]

-- The returned results are adjusted to match the call 

local i = 5
local j = 4 
local k = 8 
function example1(a, b, c)
    local var1 = a + 5 
    local var2 = b + 1 
    local var3 = c + 10 
    return var1, var2, var3 
end 

local result1 = example1(i, j, k)
print("result1 is " .. result1) -- prints 10 

local result2, result3, result4 = example1(i, j, k)
print("result2 is " .. result2) -- 10 
print("result3 is " .. result3) -- 5
print("result4 is " .. result4) -- 18 

result1, result2, result3, result4 = 21,22, example1(i, j, k)
print("* result1 is " .. result1) -- 21
print("* result2 is " .. result2) -- 22 
print("* result3 is " .. result3) -- 10
print("* result4 is " .. result4) -- 5 
result1, result2, result3, result4 = example1(i, j, k), 21,22
print("- result1 is " .. result1) -- 10 
print("- result2 is " .. result2) -- 21
print("- result3 is " .. result3) -- 22
print(result4) -- nil 
--Note nil cannot be concatenated with string using ..



-- ########### Named Arguments #############

-- Arguments are passed in Lua by position 
    -- first argument goes to first parameter etc. 

-- Arguments can be given names by instead passing a table
    -- the table will have name value pairs 
    -- thus arguments being in a table can have associated bames 

local arguments = {
    planets = { "Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Ur Anus", "Neptune" }, -- dont forget the trailing comma 
    stars = {"Sun", "Rigel", "Altair" }
}   

local celestialType = "planets" 

function printCelestialType(argTable, printType)
    local theType = nil 
    if printType == "planets" then 
        theType = "planets"
    else 
        theType = "stars"
    end 

    tableToPrint = argTable[theType]
    for index, value in pairs(tableToPrint) do 
        print(value)
    end 
end 

printCelestialType(arguments, celestialType)


-- ######### Closures ###########

-- A function enclosed within another function
    -- has access to all of the local variables of the enclosing function. 

-- Closure definition: A closure is a function plus all that it needs to access non-local variables correctly. 

-- Do Exercise on Closures here 


-- ########## Tail Calls ###########

-- A tail call happens when a function makes a function call in its return 
    -- No other work must be required after the function returns
        -- return theFunction(x, y, z) would be a proper tail call 
        -- return theFunction(x, y, z) + 1 would NOT be a proper tail call

-- This can be used for recursion when function calls itself in its return 
-- It can be used to return the result of another function. 

--Example: 
function test1 (x, y, z) -- add three number with three parameters
    return x + y + z 
end 

print(test1(5, 4, 3)) -- prints 12

function f1(x) -- add three numbers with one parameter per call, curried 
    return function (y)
        return function (z)
            return x + y + z 
        end 
    end 
end 

f2 = f1(5)
f3 = f2(4)
print(f3(3)) -- prints 12

--#########################################################
--#########################################################




--#########################################################
--############# Data Structures Using Tables ##############
--#########################################################

-- ### Tables in Lua

-- Tables are associative arrays:
    -- Basically Hash Tables (like dictionaries in python or object in javascript)
    -- Name value pairs
-- Tables are the ONLY actual data structure in Lua.
-- All other structures are made using them. 

--############################
--######### Arrays ###########

-- Arrays are sequential tables 
    -- without nils at intermediate locations 

-- Arrays are made up indexing tables by integers 

-- Customarily Arrays in Lua start at 1 (NOT 0)
    -- but you can start them at any integer index 

-- The length hash (#) works with arrays 

array1 = {};
for i=1, 10 do 
    array1[i] = "value" .. i 
end 

for i=1, 10 do 
    print(array1[i])
end 

print("\n\n\n")

-- using a constructor to initialize an array: 
array2 = { "value1", "value2", "value3", "value4", }
for i=1, #array2 do 
    print(array2[i])
end 


--######## Multi-Dimensional Arrays #######

-- Multi-dimensional arrays are created with tables. 
-- Basically they are arrays of arrays.

array1 = {}

for i=1, 4 do 
    array1[i] = {}
    for j=1,4 do
        array1[i][j] = "value" .. i .. " " .. j 
    end 
end 

for i=1, 4 do 
    for j=1, 4 do 
        print(array1[i][j])
    end 
end 


--######## Linked Lists ###########

-- Linked Lists are created with Tables 
-- Each element is an array with field next and value

function addToHead (linkedList, itemValue)
    if linkedLIst == nil then
        local temp = {next="endOfListFlag", value=itemValue}
        return temp
    else 
        local temp = linkedList
        linkedList = {next=temp, value=itemValue}
        return linkedList
    end 
end 

local linkedList = nil 
linkedList = addToHead(linkedList, "first element on list")
linkedList = addToHead(linkedList, "second element on list")
linkedList = addToHead(linkedList, "third element on list")
linkedList = addToHead(linkedList, "fourth element on list")

local root = linkedList
local done = false; 
while not done do 
    print(linkedList.value)
    if(linkedList.next == "endOfListFlag") then 
        done = true 
    end 
    linkedList = linkedList.next 
end 


--######## Stacks ###########

-- Note: stack is LIFO (last in first out)

local stack = nil 
stack = {next=stack, value="first element on stack"}
stack = {next=stack, value="second element on stack"}
stack = {next=stack, value="third element on stack"}
stack = {next=stack, value="fourth element on stack"}

root = stack 
while stack do 
    print(stack.value)
    stack = stack.next 
end 


-- ######## Queues ######3

-- queues are FIFO (First in First out)

-- do Queues example here later 


-- ######### String Buffer ########### IMP 

-- Reading in long strings one line at a time from a file:
    -- Do NOT use .. operator 
        -- as a new string is created during each operation 
    -- Instead read the lines into a Table
        -- Then use table.concat( tablename, ", ", start_index, end_index ) 

-- NOTE DO TABLE CONCAT EXAMPLE HERE ????

print("\n\n")

-- ######### Tables as Objects ############

-- ### Objects vs Values 
-- Object types in Lua have references rather than values
    -- Object types in Lua: functions, tables (also thread like structures and userdata)

-- The differences are shown in following: 
    -- the Table data structure requires both memory and code to access its elements 

-- constructor expression 
planets = { "Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"}

a = planets -- passes a reference to the table data structure 

print(a[1]) -- uses the styntax for accessing the data structure 

a[1] = "Pluto" -- since a refers to same memory location to which planets refer to 

print(a[1]) -- prints "Pluto"
print(planets[1]) -- also prints "Pluto"

b = 5 -- initialize a memory location

c = b -- moves the data (value) to a new memory location 

print(c) -- print the content of a memory location

c = c + 1 -- since c stores value (not memory location) , b's value will not be affected 
print(c) -- prints 6
print(b) -- still prints 5



--#######################################################
--############# Errors and Error Handling ###############
--#######################################################

-- We must handle errors in appropriate ways: 
    -- Stop the program when there is a major error 
    -- Handle errors when possible 


-- ###### Stop the program on major errors #######

-- Errors can be thrown using the error() function 
-- This immediately stops the programm with an error 

-- A second parameter can be put on the error function 
    -- It gives the level for the error 
    -- Allowing the error to be passed to the calling code 
        -- Calling code must then handle the error 
        -- Present code is level 1
        -- The calling code is level 2 
        -- error('invalid input is not a number', 2)

local a = "this is a string"
a = 2 -- comment this line to cause below error 
if type(a) ~= 'number' then 
    error('invalid input not a number')
end 

-- The assert() function can test a condition and throw an error
    -- when the condition returns false or nil 

-- The message of the assert is shown as the error message 
-- This immediately stops the program with an error 

local a = "this is a string"
a = 2 -- comment this line to cause below error 
assert(type(a) == 'number', "this is not a number")


-- ######## Catch and Handle errors when appropriate ########

-- To catch an error the pcall() function is used 
    -- pcall calls its first argument in protected mode 
    -- if there is no errors pcall returns true
    -- if there are errors pcall returns false 

-- To use pcall encapsulate the code 
-- Encapsulate the code in an anonymous function 
    -- Becomes the parameter for pcall 

-- pcall() expects to recieve two return results 
    -- A Boolean that tells whether the function ran succesffullly 
    -- A msg giving the error if it did not run successfully 

local ok, message = pcall(function () 
    local a = 50
    local theType = type(a)
    assert(theType == 'number', 'this is not a number') -- fails the program immediately

    local a1 = "this is a string"
    if type(a1) ~= 'number' then 
        error('invalid input not a number') -- fails the program immediateyly
    end 
    assert(type(a) == "number", "the input is not a number")
end)

if ok then 
    print("Successful continue on with code here")
else 
    print("Error " .. message)
end 


--##### Give a stack trace with the error message ###########

-- To get a stack trace use the xpcall function 
    -- allows a second parameter that is an error handler 
    -- In the error handler call debug.traceback(err)

variable1 = 50 
variable2 = "this is a string" 
function someFunction() 
    local a = variable1 
    local theType = type(a)
    assert(theType == "number", "this is not a number") --fails the program immediately 

    local a1 = variable2 
    if type(a1) ~= 'number' then 
        error('invalid input not a number') --fails the programm immediatlry 
    end 
    assert(type(a) == "number", "the input is not a number")
end 

function errorHandler(err)
    return debug.traceback(err)
end 

local ok, message = xpcall(someFunction, errorHandler)

if ok then 
    print("Successful continue on with code here")
else 
    print("Error" .. message)
end 


--################################################
--################# Iterators ####################
--################################################

-- An iterator iterates over elements of a collection 
    -- Can be represented as a function 
    -- Each call to the function returns the next element in the collection 

-- An iterator can keep state 
    -- What element is the next element to return 
    -- or what was the last element returned 

-- Example of a Table List Iterator: 

function iterator(theList)
    local i = 0 -- is in the Closure of returned iter function
    return (function () i=i+1; return theList[i] end)
end 

local planets = {"Earth", "Mars", "Saturn", "Venus"}
iter = iterator(planets) -- get a reference to the function 
while true do 
    local theItem = iter() -- use the function 
    if theItem == nil then break end 
    print(theItem)
end 


-- ??????????????????????????
--############# The Generic For Loop ###############
print("\n")
-- And example of a for loop using an iterator 
local planets = {"Earth", "Mars", "Saturn", "Venus"}
for item in iterator(planets) do 
    print(item)
end 

-- The generic for loop allows: 
    -- the var-list to be a list of one or more variables names 
        -- separated by commas 
    -- the exp-list to be a list of one or more expressions
        -- separated by commas (usually this has one element)

-- SYNTAX of generic for-loop 
--[[
for <var-list> in <exp-list>
    <body>
end 
]]

print("\n")
--######### Stateless vs StateFul iterators ##########

-- Stateful iterators have been given as example in prior code segements 

-- Stateless iterators must: 
    -- Pass the state out to the calling code in the return statement 
        -- Usually the return statement passes multiple values 
    -- Pass the state in from the calling method in the function arguments 

-- Examples of this are ipairs() and pairs()

    -- ipairs() iterates over the protion of a table withoud holes 
    -- pairs() iterates over the entire table (in any order)

local orchestra = {"violin", "trumpet", "clarinet", "tuba", "guitar", "flute"}
for i, instrument in ipairs(orchestra) do 
    print("Instrument" .. i .. " " .. instrument)
end 
-- prints: 
-- Instrument1 violin
-- Instrument2 trumpet
-- Instrument3 clarinet
-- Instrument4 tuba
-- Instrument5 guitar
-- Instrument6 flute
print("\n")

orchestra = {[1] = 'violin', [2] = 'trumpet', [6] = 'clarinet', [18] = 'tuba', [20] = 'guitar', [3] = 'flute'}
for i, instrument in pairs(orchestra) do 
    print ("Instrument" .. i .. " " .. instrument)
end 
-- prints: 
-- Instrument1 violin
-- Instrument2 trumpet
-- Instrument3 flute
-- Instrument20 guitar
-- Instrument6 clarinet
-- Instrument18 tuba

--Behind the covers something like the following is doing the iteratio
function iter (a, i)
    i = i + 1
    local v = a[i]
    if v then
      return i, v
    end
end
  
function ipairs (a)
    return iter, a, 0
end

-- ???????????????????????? DO IT LATER 
--#########################################################
--##################### Coroutines ########################
--#########################################################

-- A coroutine is similar to a thread in that: 
    -- It has its own stack 
    -- It is a line of execution 
    -- It has its own local variables 
    -- It has its own istruction pointer 

-- A coroutine shares global variables 

-- A set of coroutines in a program are collaborative: 
    -- Only one is running at time 
    -- It suspends execution only when it explicitly requests to be suspended 


-- Producer Consumer Example: 

--- producer consumer using coroutine resume/yield to synchonize
--- and pass data between the producer and consumer

function receive()
    local status, value = coroutine.resume(producer) -- starts when other function yields
    return value
  end
  
  function send(x)
    coroutine.yield(x) -- yields and send value to resume
  end
  
  producer = coroutine.create( -- create the producer that runs the anonymous function code
    function ()
      while true do
        local x = io.read('*L')
        if x == nil then os.exit(true, true) end  -- kills the program when true
        send(x)  -- calls the send function which does a yield sending data
      end
    end)
  
  function consumer()
    while true do
      local x = receive()
      io.write("input was -- ", x, "\n")
    end
  end
  
  io.input("C:\\lua Programming\\producerFile.txt")
  consumer()

print("\n")

-- ?????????????????????????????
--#######################################################
--############# Metatables and Metamethods ##############
--#######################################################

-- Metatables are similar to operator overloading in C++

-- Metatables can be assignes to Tables 
    -- Using setmetatable(theTable, theMetatable)
    -- There is also a getmetatable(theTable) which gives the metatable reference 

-- Metatables contain function definitions wheich are called metamethods
    -- Metamethods can be uswed to manipulate tables 

local mt = {}
Set = {}

function Set.new (l) -- 2nd version 
    local set = {}
    setmetatable(set, mt)
    for _, v in ipairs(l) do set[v] = true end 
    return set 
end 

function Set.union (a, b) 
    local res = Set.new{}
    for k in pairs(a) do res[k] = true end 
    for k in pairs(b) do res[k] = true end 
    return res 
end 

function Set.intersection (a,b)
    local res = Set.new{}
    for k in pairs(a) do
        res[k] = b[k]
    end
    return res
end

function Set.tostring (set)
    local l = {}
    for e in pairs(set) do
        l[#l + 1] = e
    end
    return "{" .. table.concat(l, ", ") .. "}"
end

function Set.print (s)
    print(Set.tostring(s))
end
  

local s1 = Set.new{10, 20, 30, 50}
local s2 = Set.new{30, 1}

print(getmetatable(s1)) -- prints table: 00c48c68 (address) 
print(getmetatable(s2)) -- prints table: 00c48c68

mt.__add = Set.union  -- metamethod for + operator 
mt.__mul = Set.intersection -- metamethod for - operator 
-- mt.__tostring = Set.tostring  -- metametod for string coercion 

s3 = s1 + s2 -- uses __add metamethod 

Set.print(s3) -- prints: {1, 20, 30, 10, 50}

Set.print((s1 + s2) * s1) -- prints: {20, 50, 30, 10}

print((s1 + s2)* s1) -- prints: {20, 50, 30, 10} uses __tostring metamethod 
-- prints table: 00da8c90 (address) if __tostring metamethod not defined 

-- MetaMethods can be defined for: 

--##### Arithmetic Metamethods 
-- Addition (+) __add
-- Subtraction (-) __sub
-- Multipication (*) __mul
-- Division (/) __div
-- Modulo (%) __mod
-- Exponentiation (^) __exp
-- Negation (unary -) _unm
-- Concatenation (..) __concat

--##### Relational Metamethods 
-- Equal (==) __eq
-- Less Than (<) __lt
-- Less Than or equal (<=) __le
-- For the other operators the operands are reversed
-- For example greater than (a>b) is the same as (b<a)
-- For a ~= b the expression not(a == b) is used


print("\n")
--##### Library and Table Access Metamethods 

-- The metatable __toString method: 

    -- It is common for libraries to define metatable and metamethods 
        -- The print command looks for the __tostring metamethod


-- The __index and __newindex metamethods:

    -- When an access to an index in a table returns a nil 
    -- The interpreter looks for an __index metamethod 
        -- if found the metamethod returns the result rather than nil 
        -- __index can be set to a function , or a table 
            -- if set to a table a lookup is done in the table for the key passed in
            -- if set to a function the function is called with the table and key as parameters 
        -- To access a table without invoking __index User rawget(t,i)

    -- __newindex is used for table updates 
        -- if the index is absent then the __newindex function is called if it exists 
        -- rawset(t,i) is used to bypass the check 
        -- if a table is assigned to __newindex then the assignment is made in this table ???????????



--################################################################
--#################### Modules and Packages ######################
--################################################################

-- Modules are intended to:
    -- Allow groups to share code 
    -- Prevent collisions between the indentifiers in different Modules 

-- Lua has Policies for modules and packages 
    -- The attempts is to define these using standard Lua structures 
        -- Tables 
        -- Functions 
        -- Metatables
        -- Environments 


--############# Using Modules ################

-- A module is some code that can be loaded through the "require" statement 
    -- Can be a combination of Lua and C code 
    -- The "require" statement returns a table 
    -- The table acts as a namespace 
    -- The table contains constants, functions, etc. 
    -- The standard libraries are modules 

-- Example: using the math library 
local match = require "math"
local table1 = {}
for i = 1, 10 do 
    table1[i] = math.random(1,200)
    print(table1[i])
end 


-- ##### How are modules loaded: 

-- On the first require statement for a module: 
    -- Lua searches for the Lua file with the module name
    -- if it finds a LUa file it call "loadfile" which gives a loader for the file 
    -- if it cannot find a Lua file it looks for a C library with the name 
    -- if a C file is found it calls package.loadlib which gives a loader for the file 
    -- Require now calls the laoder to laod the module 
    -- Require returns the return value from the loader and puts it into the package.loaded table 
    -- Upon subsequent calls to require the package.loaded file has the reference to the module 

-- Path Searching: 
    -- Lua uses a set of templates to search for modules rather than a set of paths 
        -- Each template is a path with optional question marks (?)
        -- The templates in a path are separated by semicolons 
        -- The question marks are replaces by the module name given to require 

    -- The path for finding Lua files comes from variable package.path 
        -- Package.path is loaded when Lua starts up from LUA_PATH 
            -- LUA_PATH is in th environment variables of the operating system 
            -- If this cannot be found Lua uses a default path 
    
    -- The path for finding C files comes from variable package.cpath 
        -- pacakge.cpath comes from environment variable LUA_CPATH 



--################# Creating Modules #####################

-- Modules can be created as tables containing functions etc. 

--*********** newModule.lua **********
newModule = {}

local masterTable = {}
local i = 1 
function newModule.addString(inputVariable)
    if type(inputVariable) ~= "string" then 
        print("Error - input is not a string")
    else 
        masterTable[i] = inputVariable
        i = i + 1 
    end 
end 

function newModule.printStrings() 
    for j = 1, i-1 do 
        print(masterTable[j])
    end
end 

return newModule -- Should match the name of lua file 
--***********************************

-- Loading and runnig the new module: 
local testModule = require "newModule"

testModule.addString("This is the first string")
testModule.printStrings() -- prints "This is the first string"

testModule.addString("Second string")
testModule.printStrings()
-- prints: 
-- "This is the first string"
-- "Second string"


-- ######### Organizing modules into packages ##########

-- Lua allows modules to be organized into packages 
    -- This is similar to the packages of Java (which i hate btw)
    -- Folders are created with Lua files in them 
    -- The dot notation specifies the package hierarchy 
    -- It also specifies the folder hierarchy 


-- Example:
--**************** modules/newModule.lua********************* 
newModule = {}

local masterTable = {}
local i = 1 
function newModule.addString(inputVariable)
    if type(inputVariable) ~= "string" then 
        pring("Error - input is not a string")
    else 
        masterTable[i] = inputVariable
        i = i + 1 
    end 
end 

function newModule.printStrings() 
    for j = 1, i-1 do 
        print(masterTable[j])
    end 
end 
return newModule -- filename should be same (convention) but not necessarily 
--NOTE: lOVE2D causes error if module file name does not matches the returned table 
--**************************************


-- Using Lua modules and packages 
local testModule = require "newModule" 
local anotherModule = require "modules.newModule" -- from inside modules subfolder 

testModule.addString("This is the first string")
testModule.printStrings() -- prints: "This is the first string"

anotherModule.addString("This is the first string from the modules package")
anotherModule.printStrings()
-- prints: 
-- This is the first string from the modules package



--###############################################################
--################## Metatables through Examples ################
--###############################################################

--1. Giving default values for tables 
--2. Checking every read and write to a table with a proxy 
--3. Making a table read only 
--4. Memorizing results for reuse through memorization 

--??????????????????????????????
--??????????? TO-DO ????????????
--??????????????????????????????


-- ????????????????????????????????????
--###############################################################
--######################### Environments ########################
--###############################################################

-- Global variables are kept in the Global Environment table 
    -- The Global Envrionment is stored in variable _G 

--Examples of using _G

value = _G[varname] -- get the value of a global variable 
_G[varname] = value -- set the value of a global variable 
varname = value -- much easier way to set the value 


-- ###### Declaring Global Variables ######
    -- They do not need to be declared, declared when used 
    -- Can cause errors (a Typo will cause a global variable)

-- Setting a metatable on _G to give errors when gloabls are nil

setmetatable(_G, {
    __newindex = function (t, n, v)
        local w = debug.getinfo(2, "S").what 
        if w~= "main" and w ~= "C" then 
            error("attempt to write to undeclared variable " .. n, 2)
        end 
        rawset(t, n, v)
    end, 
    __index = function(_, n)
        error("attempt to read undeclared variable " .. n, 2)
    end 
})

w = 9 -- comment this to cause an error 
print(w)

-- The problem with the above is that a new variable that is initialize to nil cannot be set
    -- Without using rawset(table, key, value)

-- This metatable also effects the entire program including standard libraries


-- ######### Relationship b/w global variables and environments ##########

-- Free Names 
    -- Free names (Free Variables) are identifiers that are not withing a context of: 
        -- A local variable name
        -- A for loop control variable
        -- A function parameter 
    -- In other words they are what we have been calling Global Variables 

-- _ENV and _G 
    -- _ENV is a local variable associated with a chunk (a lua file)
    -- _ENV is initialized with a reference to the global table _G as the chunk is loaded 
    
    -- Each free variable in a chunk is referenced as _ENV.variableName 
        -- Since _ENV is a reference to _G any free variable goes into _ENV and _G
    
    -- Therefore you can use _ENV within a file to limit the functions and globals that are seen 
    -- Function names are just global identifiers for function references 
    -- Note that if _ENV is set to nil then references to existing free variables are lost


-- ################## The _ENV table and the _G table #######################

-- _ENV is associated with a chunk (a lua file)
-- _G is associated with the global environment of the PROGRAM 
    -- _G is built as the program is loaded 
-- _ENV in Lua 5.2 can be overridden by a local _ENV 

a = 1
b = 2 

local _ENV = { print = print, _G = _G}

c = 5
d = 7 

print(_G.a) -- prints nil 
print(_ENV.c) -- prints 5 




--############################################################
--################ Object Oriented Programmming ##############
--############################################################

-- Tables can be used to create classes in Lua 

    -- They can have name value pairs which act like variables in a class
    -- They can reference functions by named indices which act like methods 
    -- They can reference themselves using the identifier "self" (a new concept)

    
-- #### The Concept of "self"
--[[
Self refers to the present object (Tables are objects in Lua).

When the colon (:) operator is used to call a function in the object/table 
self is passed into the function (now referred to as a method) as a hidden variable  

Internally in the function self can now be used to refer to an instance of a table. 

This allow the functions to operate on different instances of table giving the ability 
to have object oriented programming (OOP). 

Internally the functions will use self to refer to their variables and functions. 

function Account:deposit(v)
    self.balance = self.balance + v -- refers to a balance value within this table instance 
end 
]]


-- ######### Classes ############

-- Classes can be created using tables as described above 
    -- They will have name value pairs, name function pairs, and use self 

Account = {balance=0}

function Account:new (theObject)
    theObject = theObject or {}
    setmetatable(theObject, self) -- ??????????????????
    self.__index = self -- ?????????????????????
    return theObject 
end 

function Account:deposit (theDeposit)
    self.balance = self.balance + theDeposit 
end 

function Account:withdraw(withdrawal)
    if withdrawal > self.balance then 
        error("Insufficient funds")
    end 
    self.balance = self.balance - withdrawal 
end 

function Account: print() 
    print("Account Balance is " .. self.balance)
end 

local newAccount = Account:new()
newAccount:deposit(100.00)
newAccount:print() -- prints Account Balance is 100.00

local myAccount = {}
Account:new(myAccount)
myAccount:deposit(50.00)
myAccount:withdraw(25.00)
myAccount:print() -- using the : passes in self as hidden parameter 
-- myAccount.print() -- this will not work because self is not present 

--NOTE: using (:) to call method passes "self" as hidden parameter. 


-- ########### Inheritance ############

-- A new table can be built that inherits from the Account table 
-- The new table will have the same __index function in its metatable 
-- So it will inherit the functions and variables of Account 

-- local account = require "objectOriented.classAccount"
SpecialAccount = Account:new() 

function SpecialAccount:withdraw(v)
    if v - self.balance >= self:getLimit() then 
        error "insufficient funds" --brackets optional ??
    end 
    self.balance = self.balance - v 
end 

function SpecialAccount:getLimit() 
    return self.limit or 0 
end 

newerAccount = SpecialAccount:new{limit=1000.00} -- same as: SpecialAccount:new({limit=1000.0})

newerAccount:deposit(100.00)

newerAccount:withdraw(200.00)

newerAccount:print() -- prints: Account Balance is -100.00

local limit = newerAccount:getLimit() 
print("Account limit is " .. limit) -- prints: Account limit is 1000.0 



--###############################################################
--##################### Lua Standard Library ####################
--###############################################################


--############ Base Libraray ############

-- The base library is used without a library name modifier 
-- It contains a set of commonly used functions 

-- Examples ??????????


--############ I/O Library #############

--###### The Simple I/O Model 
    -- Commonly uses stdin(input) and stdout(output)
        -- This can be changed using io.input(filename) and io.output(filename)


-- Writing to stdout or a file 

io.write("this is an output string to the console\n")

-- Note the file should already exist. This will not create new file
io.output("D:\\lua programming\\myOutputFile.txt") -- for windows 
io.write("this is an output string to a file\n")
io.write("this is an second output string in that file")
io.flush() 
io.close() 

stdoutFile = io.stdout -- reset to stdout 
io.output(stdoutFile)

io.write("This is another output string to the console")


-- Reading from stdin or a file 

-- The io.read command takes one argument 
    -- they control what to read 
    -- "*a" - read the whole file
    -- "*l" - read the next line does not return the newline
    -- "*L" - read the next line returns the newline also
    -- "*n" - read a number
    -- num - read a string with up to num characters

-- Following is and example of reading: 
    -- First from stdin with a prompt 
    -- Then from a file after switching to a file 
    -- Then back to stdin in with a prompt after switching back to stdin 

print("Enter you First Name:")
local firstName = io.read('*l')

-- File should already exist 
io.input("D:\\lua programming\\myInputFile.txt")
local theString = io.read('*L')
io.write(theString)
theString = io.read('*l')
io.write(theString)

stdinFile = io.stdin --reset to stdout 
io.input(stdinFile)

print('\n\nEnter your Last Name:')
local lastName = io.read('*L')
io.write("Thanks for the input " .. firstName .. " " .. lastName)


--###### The Complete I/O Model 

-- based on file handles 
    -- an open file with a current position 
        -- Open a file using the io.open function 
        -- plus a mode 'r' or 'w' or 'a' 
            -- read , write , append 
        -- returns a new handle for the file 
        -- In case of error returns nil 

-- ## Input 
local file = assert(io.open(filename, "r"))
local text = file:read("*a") -- read the entire file 
file:close() 

-- -- ## Output 
local file = assert(io.open(filename, "w"))
file:write("something")
file:flush() 
file:close() 

-- ## Example of Reading a file: 
local BUFSIZE = 2^5 
local filePath = "D:\\lua Programming\\wordcount.txt"
local file = io.input(filePath)
local cc, lc, wc = 0, 0, 0 -- character line and word counts
for lines, rest in io.lines(arg[1], BUFSIZE, "*L") do 
    if rest then lines = lines .. rest end 
    cc = cc + #lines 

    -- count words
    local _, t = string.gsub(lines, "%S+", "")
    wc = wc + t 

    -- count newlines 
    _, t = string.gsub(lines, "\n", "\n")
    lc = lc + t 

end 
file:close() 
print(lc, wc, cc)



--#################### Table Library ##########################

-- Inserts an element into the table at index 
table.insert(table, index, element)

-- Insert and element at the end if index is not given 
table.insert(table, element)

-- Removes the element at index from the table , then returns the element 
table.remove(table, index)

-- Sorts the table by in order by index 
table.sort(theTable)

-- For strings concatenates the table entries, returns a string 
table.concat(theTable)



--########################## String Library ###########################

-- Some of the commonly used string functions: 

string.len(s) -- returns the length of a string 

string.rep(s, n) -- returns a string repeated n times 

string.lower(s) -- returns the string in lower case 

string.upper(s) -- return the string in upper case

-- returns a protion of the string from index i to j
string.sub(s, i, j)

-- returns the numeric representation of the ith character of the string 
string.byte(s, i)

-- returns the numeric representation of the ith to jth characters 
string.byte(s, i, j) 

-- returns the character representation of the number in ASCII 
string.char(number)



-- ############################ Pattern Matching ########################

-- Lua does not implement full Regular Expressions 
    -- It implements a smallar subset 


-- searches for a pattern inside a given string
string.find(originalString, pattern)
-- returns the starting index and ending index of the matched portion

-- searches for a pattern inside a given string
string.match(originalString, pattern)
-- returns the portion of a string that matches a pattern

-- substitutes a replacement string for a matching string
string.gsub(originalString, pattern, replacementString, numberOfSubstitutions)
-- returns a new string with the replacements and the total number of replacements made

-- iterates over all occurrences of a pattern in a string
string.gmatch(originalString, pattern)
-- returns the iterator, can be used with the generic for loop


-- Example using string.match 
local theString = "This is the test string that will be used to work with patterns in lua. This should be interesting"

print(string.match(theString, "t[%a%s]+g"))
-- returns: "the test string"

-- The pattern was "t[%a%s]+g"
    -- Starts with character t 
    -- has one or more letter or whitespace 
    -- ends with character g 

-- Example using string.gsub

local newString = string.gsub(theString,"[tT][eshia]+[st]","zonk")
print(newString)
-- returns: "zonk is the zonk string zonk will be used to work with patterns in Lua. zonk should be interesting"

-- The pattern was [tT][eshia]+[st]
    -- The starting character is t or T
    -- One or more letters or spaces follow
    -- The ending character is s or t
    -- Replace all words matching the pattern with the word "zonk"
   
   
-- Example using string.gmatch
    
for word in string.gmatch(theString,"[tT][eshia]+[st]") do
    print(word)
end
-- retruns: "This" "test" "that" "This"

    -- The pattern was [tT][eshia]+[st]
    -- The starting character is t or T
    -- One or more letters or spaces follow
    -- The ending character is s or t



-- ### Capture 

-- Parentheses are used for capture in patterns 

-- Example of capture in a pattern using gmatch 

theString = "This is the test string that will be used to work with patterns in Lua.  This should be interesting"

-- work with capture
print("\n\n")
for word in string.gmatch(theString,"[tT]([eshia]+)[st]") do
   print(word)
end
-- returns: "hi" "es" "ha" "hi"

-- Captures only the letters between the start and end letters




--############################# Operating System (OS) Library ###############################

os.time()
-- returns the current date and time as a number in seconds

os.time(table)
-- returns the date number represented by the table 
    -- i.e.  os.time{year=2001, month=9, day=5, hour=14, min=7, sec=54} 

os.date(format, time) 
-- can format the date as a string or put it into a table 

-- Example: 

print(os.time{year=2001, month=9, day=5, hour=14, min=7, sec=54})
print(os.time({year=2001, month=9, day=5, hour=14, min=7, sec=54}))

local theTime = os.time({year=2001, month=9, day=5, hour=14, min=7, sec=54})

print(os.date("%B %w, %Y ",theTime))




--#############################################################################
--############################# Extra Topics ##################################
--#############################################################################


--######################## Compilation #######################

-- Lua precompiles code when it is run
-- Precompiled code can also be distributed
    -- Precompiling is done using luac
    -- These are called binary chunks


--#################### Garbage Collection #####################

-- Lua uses garbage collection.
-- It uses a mark and sweep garbage collector
-- The collector as of version 5.0 runs interleaved with the interpreter


-- #### Mark and Sweep

-- Mark and sweep performs garbage collection is three stages: mark, cleaning, and sweep

-- 1. Mark - all reachable objects are marked as alive

-- 2. Cleaning - Looks at all objects with a finalizer looking for non-marked objects.
    -- These are put into a separate list to be handled.
    -- It also looks at all weak tables and eliminates any entries that are not marked. 
    -- Weak tables are discussed below

-- 3. Sweep - all objects are sweeped and those not marked are collected.
    -- Lua also calls the finalizers of any objects put in the finalizer list


--############## Weak Tables ##################

-- Tables can have entries that are used by multiple other objects
    -- They can have objects as keys or values

-- The objects referencing the table eventually get garbage collected
    -- How to garbage collect the entry once it is no longer referenced


-- The __mode metamethod is used to declare that the keys or the values or both are weak

setmetatable(results, {__mode = "k"}) -- make the values weak
setmetatable(results, {__mode = "v"}) -- make the keys weak
setmetatable(results, {__mode = "kv"}) -- make both weak

-- If the values or keys are weak once all references to them are gone in the code
-- The garbage collector will not mark them as having references during mark
-- They will then be collected during cleaning



-- ######### Finalizers ###########

-- Tables to be destroyed can have entries in multiple places
    -- In this case a finalizer can be provided on the table by implementing the __gc metamethod


-- #############################################################################################################
-- #############################################################################################################
-- #############################################################################################################
-- #############################################################################################################
