-- aleny404: Arbetat enskilt

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Test is
   
   type CS_Type is 
      record
	 C: Character;
	 S: String(1 .. 2);
      end record;
	 
   type Inner_Type is array (Integer range -81 .. -79) of CS_Type;
   type T_Type is array (Boolean'Range, Integer range 27 .. 29) of Inner_Type;
   
   -- CS_Type
   procedure Get(CS : out CS_Type) is
      C: Character;
   begin
      Get(CS.C);
      Get(C);
      Get(CS.S);
   end Get;
   
   procedure Put(CS : in CS_Type) is
      
   begin
      Put(CS.C);
      Put(" ");
      Put(CS.S);
   end Put;
   
   -- Inner_Type
   
   procedure Get(Inner : out Inner_Type) is
      C: Character;
   begin
      for I in Inner'Range loop
	 Get(Inner(I));
	     
	 if I /= Inner'Last then
	    Get(C);
	 end if;
      end loop;
   end Get;
   
   procedure Put(Inner : in Inner_Type) is
      
   begin
      for I in reverse Inner'Range loop
	 Put(Inner(I));
	 
	 if I /= Inner'First then
	    Put(" ");
	 end if;
      end loop;
   end Put;
   
   -- T_Type
   
   procedure Get(T: out T_Type) is
      C: Character;
      Eol: Boolean;
   begin
      -- loopar över kolumner
      for I in reverse T'Range(1) loop
	 for J in T'Range(2) loop
	    Get(T(I, J));
	    
	    Look_Ahead(C, Eol);
	    if not Eol then
	       Get(C);
	    end if;
	 end loop;
      end loop;
   end Get;
   
   procedure Put(T: in T_Type) is
      
   begin
      -- loopar över kolumner
      for I in T'Range(1) loop
	 for J in reverse T'Range(2) loop
	    Put(T(I, J));
	    
	    if not (I = T'Last(1) and J = T'First(2)) then
	       Put(" ");
	    end if;
	 end loop;
      end loop;
   end Put;
   
   T: T_Type;
   
begin
   Put("Mata in datamängd: ");
   Get(T);
   Skip_Line;
   
   Put("Inmatad datamängd: ");
   Put(T);
end Test;
