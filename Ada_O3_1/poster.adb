-- aleny404: Samarbetat med alboz164, Albin Ozel, samma program

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Poster is
   -- DS1
   type DS1_Type is
      record
	 W: Character;
	 P: String(1 .. 4);
      end record;
   
   procedure Get(DS1: out DS1_Type) is
      C: Character;
   begin   
      Get(DS1.W);
      Get(C);
      Get(DS1.P);
   end Get;
   
   procedure Put(DS1: in DS1_Type) is
   begin
      Put(DS1.W);
      Put(" ");
      Put(DS1.P);
   end Put;
   
   -- DS2
   type SZ_Type is
      record
	 S: Float;
	 Z: String(1 .. 4);
      end record;
   
   type DS2_Type is
      record
	 D: SZ_Type;
	 U: SZ_Type;
      end record;
   
   procedure Get(DS2: out DS2_Type) is
      C: Character;
   begin
      Get(DS2.D.S);
      Get(C);
      Get(DS2.D.Z);
      Get(C);
      Get(DS2.U.S);
      Get(C);
      Get(DS2.U.Z);
   end Get;
   
   procedure Put(DS2: in DS2_Type) is
   begin
      Put(DS2.D.S, Fore => 0, Aft => 3, Exp => 0);
      Put(" ");
      Put(DS2.D.Z);
      Put(" ");
      Put(DS2.U.S, Fore => 0, Aft => 3, Exp => 0);
      Put(" ");
      Put(DS2.U.Z);
   end Put;
   
   -- DS3
   type JB_Type is
      record
	 Y: Character;
	 Q: Character;
      end record;
   
   type O_Type is
      record
	 T: Boolean;
	 L: Character;
      end record;
      
   type DS3_Type is
      record
	 J: JB_Type;
	 B: JB_Type;
	 O: O_Type;
      end record;
   
   procedure Get(B: out Boolean) is 
      C: Character;
   begin
      Get(C);
      
      if C = 'T' then
	 B := True;
      else 
	 B := False;
      end if;
   end Get;
   
   procedure Put(B: in Boolean) is
   begin
      if B = True then
	 Put("True");
      else
	 Put("False");
      end if;
   end Put;
   
   procedure Get(DS3: out DS3_Type) is
      C: Character;
   begin
      Get(DS3.J.Y);
      Get(C);
      Get(DS3.J.Q);
      Get(C);
      Get(DS3.B.Y);
      Get(C);
      Get(DS3.B.Q);
      Get(C);
      Get(DS3.O.T);
      Get(C);
      Get(DS3.O.L);
   end Get;
   
   procedure Put(DS3: in DS3_Type) is
   begin
      Put(DS3.J.Y);
      Put(" ");
      Put(DS3.J.Q);
      Put(" ");
      Put(DS3.B.Y);
      Put(" ");
      Put(DS3.B.Q);
      Put(" ");
      Put(DS3.O.T);
      Put(" ");
      Put(DS3.O.L);
   end Put;
   
   DS1: DS1_Type;
   DS2: DS2_Type;
   DS3: DS3_Type;
begin
   Put_Line("För DS1:");
   Put("Mata in datamängd: ");
   Get(DS1);
   Skip_Line;
   Put("Inmatad datamängd: ");
   Put(DS1);
   New_Line(2);
   
   Put_Line("För DS2:");
   Put("Mata in datamängd: ");
   Get(DS2);
   Skip_Line;
   Put("Inmatad datamängd: ");
   Put(DS2);
   New_Line(2);
   
   Put_Line("För DS3:");
   Put("Mata in datamängd: ");
   Get(DS3);
   Skip_Line;
   Put("Inmatad datamängd: ");
   Put(DS3);
   New_Line;
end Poster;
