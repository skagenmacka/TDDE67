-- aleny404: Arbetat enskilt

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Uppgift2 is
   
   -- deluppg. 1
   function "*"(Left: in Integer; Right: in String) return Float is
      Left_Float: Float := Float(Left);
      Right_Float: Float := Float'Value(Right);
   begin
      return Left_Float * Right_Float;
   end "*";
   
   -- deluppg. 2
   function Deluppgift2(C: in Character) return Integer is
      S: Integer;
   begin
      S := Character'Pos(C) - Character'Pos('0');
      return S * S; 
   end Deluppgift2;
   
   -- deluppg. 3
   procedure Deluppgift3(F: out Float; C: out Character; Res: out Float) is
      CF : Float;
   begin
      Put("Mata in ett flyttal: ");
      Get(F);
      Put("Mata in ett tecken: ");
      Get(C);
      CF := Float(Character'Pos(C) - Character'Pos('0'));
      
      Res := F - CF;
   end Deluppgift3;
   
   -- deluppg. 1
   I_1: Integer;
   S_1: String(1 .. 3);
   Res_1: Float;
   
   -- deluppg. 2
   C_2: Character;
   Area_2: Integer; 
   
   -- deluppg. 3
   F_3 : Float;
   C_3 : Character;
   Res_3 : Float;
   
begin
   -- deluppg. 1
   Put("Mata in ett heltal: ");
   Get(I_1);
   Put("Mata in en sträng: ");
   Get(S_1);
   
   Res_1 := I_1 * S_1;
   Put("Den beräknade produkten av ");
   Put(I_1, Width => 0);
   Put(" och ");
   Put(S_1);
   Put(" blir ");
   Put(Res_1, Fore => 0, Aft => 1, Exp => 0);
   
   New_Line(2);
   
   -- deluppg. 2
   Put("Mata in längden: ");
   Get(C_2);
   Area_2 := Deluppgift2(C_2);
   Put("Den beräknade arean blev: ");
   Put(Area_2, Width => 0);
   
   New_Line(2);
   
   -- delupp. 3
   Deluppgift3(F_3, C_3, Res_3);
   Put("Du matade in flyttalet: ");
   Put(F_3, Fore => 0, Aft => 1, Exp => 0);
   Put(" och tecknet: ");
   Put(C_3);
   Put(" och differensen blev ");
   Put(Res_3, Fore => 2, Aft => 5, Exp => 3);
end Uppgift2;
