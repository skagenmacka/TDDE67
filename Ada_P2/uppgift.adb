-- aleny404: Arbetat enskilt

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Uppgift is
   
   function Deluppgift_1 (C: in Character) return Float is
      C_F: Float := Float(Character'Pos(C) - Character'Pos('0'));
   begin
      return Float'Floor(32.7 + C_F);
   end Deluppgift_1;
   
   -- deluppg. 2
   function "-" (S: in String; C: in Character) return Integer is
      S_F: Float := Float'Value(S);
      C_F: Float := Float(Character'Pos(C) - Character'Pos('0'));
   begin
      return Integer(Float'Ceiling(S_F - C_F));
   end "-";
   
   procedure Deluppgift_3 (I: out Integer; C: out Character; F: out Float) is
      I_F: Float;
      C_F: Float;
   begin
      Put("Mata in ett heltal: ");
      Get(I);
      Skip_Line;
      I_F := Float(I);
      
      Put("Mata in ett tecken: ");
      Get(C);
      Skip_Line;
      C_F := Float(Character'Pos(C) - Character'Pos('0'));
      
      F := Float'Ceiling(I_F / C_F);
   end Deluppgift_3;
   
   -- deluppg. 1
   C_1: Character;
   F_1: Float;
   
   -- deluppg. 2
   S_2: String(1 .. 3);
   C_2: Character;
   
   -- deluppg. 3
   I_3: Integer;
   C_3: Character;
   Res_3: Float;
   
begin
   -- deluppg. 1
   Put("Mata in ett tecken: ");
   Get(C_1);
   Skip_Line;
   
   F_1 := Deluppgift_1(C_1);
   
   Put("summan av ");
   Put(C_1);
   Put(" och 32.7 blir ");
   Put(F_1, Fore => 0, Aft => 1, Exp => 0);
   
   New_Line(2);
   
   -- deluppg. 2
   Put("Mata in en sträng: ");
   Get(S_2);
   Skip_Line;
   
   Put("Mata in ett tecken: ");
   Get(C_2);
   Skip_Line;
   
   Put("Den beräknade differensen mellan ");
   Put(S_2);
   Put(" och ");
   Put(C_2);
   Put(" blir ");
   Put(S_2 - C_2, Width => 0);
   
   New_Line(2);
   
   -- deluppg. 3
   Deluppgift_3(I_3, C_3, Res_3);
   Put("Du matade in heltalet: ");
   Put(I_3, Width => 0);
   Put(" och tecknet: ");
   Put(C_3);
   Put(" och kvoten blev ");
   Put(Res_3, Fore => 2, Aft => 5, Exp => 3);
end Uppgift;
