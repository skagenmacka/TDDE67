-- aleny404: Arbetat enskilt

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

with Ada.Numerics; use Ada.Numerics;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

procedure Program is
   C: Integer;
   
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
   
   
   procedure Calculate_Angles
      (Hc, Sa: Float;
	 Va, Vb, Vc: out Float)
   is
     Sh: Float;
   begin 
      -- beräkna horisontell katet
      Sh := Sqrt(Hc*Hc - Sa*Sa);
      
      -- beräknar graderna i radianer
      -- konverterar till grader
      Va := Arctan(Sa / Sh) / Pi * 180.0;
      Vb := Arctan(Sh / Sa) / Pi * 180.0;
      Vc := 90.0;
   end Calculate_Angles;
     
     
   
   procedure Angle_Program is
      -- hypotenusans längd
      Hc: Float;
      -- vertikala katetens längd
      Sa: Float;
      
      -- graderna
      Va, Vb, Vc: Float;
   begin
      Put("Mata in hypotenusans längd: ");
      Get(Hc);
      Put("Mata in vertikala katetens längd: ");
      Get(Sa);
      Skip_Line;
      
      Calculate_Angles(Hc, Sa, Va, Vb, Vc);
      
      Put("Va: ");
      Put(Va, Fore => 0, Aft => 1, Exp => 0);
      Put(" grader");
      New_Line;
      
      Put("Vb: ");
      Put(Vb, Fore => 0, Aft => 1, Exp => 0);
      Put(" grader");
      New_Line;
      
      Put("Vc: ");
      Put(Vc, Fore => 0, Aft => 1, Exp => 0);
      Put(" grader");
      New_Line(2); -- avslutar med dubbel new line
      
   end Angle_Program;
   
   
   function Calculate_Factorial
     (N: Integer)
     return Integer
   is 
      Res: Integer := 1;
   begin
      for I in 1 .. N loop
	 Res := Res * I;
      end loop;
      
      return Res;
   end Calculate_Factorial;
   
   procedure Factorial_Program is
      N: Integer;
      
      Res: Integer;
   begin
      Put("Mata in N: ");
      Get(N);
      Skip_Line;
      
      Res := Calculate_Factorial(N);
      
      Put(N, Width => 0);
      Put("-fakultet = ");
      Put(Res, Width => 0);
      New_Line(2);
      
   end Factorial_Program;
   
   
begin
   Put_Line("Välkommen till miniräknaren!");
   loop
      Menu_Selection(C);
      
      if C = 1 then
	 Hypothenuse_Program;
      elsif C = 2 then
	 Angle_Program;
      elsif C = 3 then
	 Factorial_Program;
      elsif C = 4 then
	 Put("Ha en bra dag!");
	 exit;
      end if;
   end loop;
end Program;
