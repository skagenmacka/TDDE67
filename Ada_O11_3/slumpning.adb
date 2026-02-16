-- aleny404: Arbetat enskilt

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

-- with Ada.Numerics; use Ada.Numerics;
with Ada.Numerics.Discrete_Random;

Procedure Slumpning is
   Number_Of_Integers : Integer;
   Number_Of_Characters : Integer;
   
   subtype Dice is Integer range 1 .. 6;
   subtype Character_Entries is Character range 'A' .. 'Z';
   
   package Dice_Random is new Ada.Numerics.Discrete_Random(Dice);
   package Character_Random is
      new Ada.Numerics.Discrete_Random(Character_Entries);
   
   Random_Dice : Dice;
   Dice_Gen : Dice_Random.Generator;
   
   Random_Character : Character_Entries;
   Character_Gen : Character_Random.Generator;
begin
   Put("Mata in antalet heltal som ska slumpas: ");
   Get(Number_Of_Integers);
   
   Put(Number_Of_Integers, Width => 0);
   if Number_Of_Integers = 1 then
      Put(" slumpat heltal: ");
   else
      Put(" slumpade heltal: ");
   end if;
   
   for I in 1 .. Number_Of_Integers loop
      Random_Dice := Dice_Random.Random(Dice_Gen);
      Put(Random_Dice, Width => 0);
      Put(" ");
   end loop;
   New_Line;
   
   -- skapar slumpmässigt tal mellan 1 - 6
   Number_Of_Characters := Dice_Random.Random(Dice_Gen);
   Put(Number_Of_Characters, Width => 0);
   if Number_Of_Characters = 1 then
      Put(" slumpat tecken: ");
   else 
      Put(" slumpade tecken: ");
   end if;
   
   -- loopar N antal ggr
   for I in 1 .. Number_Of_Characters loop
      Random_Character := Character_Random.Random(Character_Gen);
      Put(Random_Character);
      Put(" ");
   end loop;
   New_Line;
   
   
   
   
end Slumpning;
