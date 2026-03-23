with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

with Ada.Numerics; use Ada.Numerics;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

procedure Calc is
   Choice : Integer;
   
   procedure Menu_Selection
     (Selection : out Integer)
   is
   begin
      Put_Line("=== HUVUDMENY ===");
      Put_Line("1. Beräkna hypotenusa");
      Put_Line("2. Beräkna triangelvinklar");
      Put_Line("3. Beräkna N-fakultet");
      Put_Line("4. Avsluta programmet");
      
      loop
	 Put("Val: ");
	 Get(Selection);
	 Skip_Line;
	 
	 exit when Selection >= 1 and Selection <= 4;
	   
	 Put_Line("Felaktigt val!");
      end loop;
   end Menu_Selection;
   
   
   
   
   
   function Calculate_Hypothenuse
     (A, B: Integer)
     return Float
   is
      AF: Float := Float(A);
      BF: Float := Float(B);
   begin
      return Sqrt(AF*AF + BF*BF);
   end Calculate_Hypothenuse;
   
   
   
   
   procedure Hypothenuse_Program is
      A: Integer;
      B: Integer;
      
      H: Float;
   begin
      Put("Mata in kateternas längder: ");
      Get(A);
      Get(B);
      Skip_Line;
      
      H := Calculate_Hypothenuse(A, B);
      Put("Hypotenusan är ");
      Put(H, Fore => 0, Aft => 2, Exp => 0);
      New_Line(2);
      
   end Hypothenuse_Program;
   
   
   
begin
   Put_Line("Välkommen till kalkylatorn");
   
   loop 
      Menu_Selection(Choice);
      -- garanterat att choice ligger mellan 1 - 4
      
      if Choice = 1 then
	 Hypothenuse_Program;
      elsif Choice = 2 then
	 Put_Line("triangelvinklar");
      elsif Choice = 3 then
	 Put_Line("Factorial");
      elsif Choice = 4 then
	 Put("Ha en bra dag!");
	 exit;
      end if;
      
   end loop;
   
end Calc;
