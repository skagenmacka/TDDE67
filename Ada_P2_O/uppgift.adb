-- aleny404: Arbetat enskilt

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

with Ada.Numerics; use Ada.Numerics;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

procedure Uppgift is
   -- deluuppgift 1
   function "/"
      (F: Float; C: Character)
      return Integer
   is
      C_Int: Integer;
      C_Float: Float;
      
      Res: Float;
   begin
      -- konverterar C till sin unika kod och drar bort
      -- koden för noll, så att t.ex '0' = 0, '1' = 1, osv...
      C_Int := Character'Pos(C) - Character'Pos('0');
      -- konverterar sedan till flyttal
      C_Float := Float(C_Int);
      
      Res := F / C_Float;
      
      return Integer(Float'Rounding(Res));
   end "/"; -- slut på deluppgift 1
   
   procedure Deluppgift_2
     (I: out Integer;
      S: out String;
      Res: out Float)
   is
      I_Float: Float;
      
      S_Int: Integer;
      S_Float: Float;
   begin
      -- tar in ett heltal
      Put("Mata in ett heltal: ");
      Get(I);
      
      -- tar in en stäng
      Put("Mata in en sträng med exakt 3 tecken: ");
      Get(S);
      
      I_Float := Float(I);
      
      S_Int := Integer'Value(S);
      S_Float := Float(S_Int);
      
      Res := I_Float * S_Float;
      
      -- printar ut vad som skrivits in samt vad resultatet
      -- blev
      Put("Du matade in heltalet: ");
      Put(I, Width => 0);
      Put(" och strängen: ");
      Put(S);
      Put(" och produkten blev ");
      Put(Res, Fore => 2, Aft => 5, Exp => 3);
   end Deluppgift_2;
   
   function Deluppgift_3
     (R: Integer)
     return Integer
   is
      R_Float: Float;
      
      Res_Float: Float;
      Res_Int: Integer;
   begin
      -- konverterar radien till ett flyttal
      -- och beräknar sedan arean till ett flyttal
      R_Float := Float(R);
      Res_Float := R_Float * R_Float * 3.14;
      
      -- konverterar den beräknade arean till ett heltal
      -- och skickar tillbaka det
      Res_Int := Integer(Res_Float);
      return Res_Int;
   end Deluppgift_3;
   
   -- deluppgift 1
   F1: Float;
   C1: Character;
   
   Res1 : Integer;
   
   -- deluppgift 2
   I2: Integer;
   S2: String(1 .. 3);
   
   Res2: Float;
   
   -- deluppgift 3
   I3: Integer;
   
   Res3: Integer;
   
begin
   -- deluppgift 1
   -- tar in flyttal
   Put("Mata in ett flyttal: ");
   Get(F1);
   
   -- tar in tecken
   Put("Mata in ett tecken: ");
   Get(C1);
   
   -- beräknar kvoten, som är avrundrat till ett integer
   Res1 := F1 / C1;
   Put("Den beräknade kvoten mellan ");
   Put(F1, Fore => 0, Aft => 0, Exp => 0);
   Put(" och ");
   Put(C1);
   Put(" blir ");
   Put(Res1, Width => 0);
   
   New_Line(2);
   
   -- deluppgift 2
   Deluppgift_2(I2, S2, Res2);
   
   New_Line(2);
   
   -- deluppgift 3
   Put("Mata in längden: ");
   Get(I3);
   
   Res3 := Deluppgift_3(I3);
   Put("Den beräknade arean blev: ");
   Put(Res3, Width => 0);
end Uppgift;
