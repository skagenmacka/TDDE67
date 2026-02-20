-- aleny404: Samarbetat med alboz164, Albin Ozel, samma program

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Array_Uppgift is
   type DS1_Type is array (Integer range 31 .. 35) of Float;
   
   procedure Get(DS1 : out DS1_Type) is
   begin
      for I in reverse DS1'Range loop
	 Get(DS1(I));
      end loop;
   end Get;
   
   procedure Put(DS1 : in DS1_Type) is
   begin
      for I in reverse DS1'Range loop
	 Put(DS1(I), Fore => 0, Aft => 3, Exp => 0);
	 
	 if I /= DS1'First then
	    Put(" ");
	 end if;
      end loop;
   end Put;
   
   type DS2_Sub_Type is array (Character range '5' .. '9') of String(1 .. 5);
   type DS2_Type is array (Boolean'Range) of DS2_Sub_Type;
   
   procedure Get(DS2 : out DS2_Type) is
      C: Character;
   begin
      for I in DS2'Range loop
	 for J in reverse DS2(I)'Range loop
	    Get(DS2(I)(J));
	    
	    if J /= DS2(I)'First or I /= DS2'Last then
	       Get(C);
	    end if;
	 end loop;
      end loop;
   end;
   
   procedure Put(DS2 : in DS2_Type) is
   begin
      for I in DS2'Range loop
	 for J in reverse DS2(I)'Range loop
	    Put(DS2(I)(J));
	    
	    if J /= DS2(I)'First or I /= DS2'Last then
	       Put(" ");
	    end if;
	 end loop;
      end loop;
   end;
   
   type DS3_Type is array
     (Character range '4' .. '8', Integer range 73 .. 74) of Integer;
   
   procedure Get(DS3 : out DS3_Type) is
   begin
      for I in DS3'Range(2) loop
	 for J in DS3'Range(1) loop
	    Get(DS3(J, I));
	 end loop;
      end loop;
   end Get;
   
   procedure Put(DS3 : in DS3_Type) is
   begin
      for I in DS3'Range(2) loop
	 for J in DS3'Range(1) loop
	    Put(DS3(J, I), Width => 0);
	    
	    if I /= DS3'Last(2) or J /= DS3'Last(1) then
	       Put(" ");
	    end if;
	 end loop;
      end loop;
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
   New_Line(2);
end Array_Uppgift;
