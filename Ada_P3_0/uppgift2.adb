-- aleny404: Arbetat enskilt

with Ada.Text_IO; use Ada.Text_IO;

procedure Uppgift2 is
   
   type Inner_Type is array (Character range 'a' .. 'd') of String(1 .. 2);
   
   type Middle_Type is array
     (34 .. 35, Character range '3' .. '6') of Inner_Type;
   
   type Outer_Type is
      record
	 W: Middle_Type;
	 K: Middle_Type;
      end record;
   
   
   procedure Get (Item : out Inner_Type) is
      C : Character;
      
   begin
      for I in Item'Range loop
	 Get(Item(I));
	 
	 if I /= Item'Last then
	    Get(C);
	 end if;
      end loop;
   end Get;
   
   procedure Put(Item : in Inner_Type) is
      
   begin
      for I in Item'Range loop
	 Put(Item(I));
	 
	 if I /= Item'Last then
	    Put(" ");
	 end if;
      end loop;
   end Put;
   
   
   procedure Get (Item : out Middle_Type) is
      C : Character;
      
   begin
      for Y in reverse Item'Range(2) loop
	 for X in reverse Item'Range(1) loop
	    Get(Item(X, Y));
	    
	    if X /= Item'First(1) or Y /= Item'First(2) then
	       Get(C);
	    end if;
	 end loop;
      end loop;
   end Get;
   
   procedure Put (Item : in Middle_Type) is
      
   begin
      for Y in reverse Item'Range(2) loop
	 for X in reverse Item'Range(1) loop
	    Put(Item(X, Y));
	    
	    if X /= Item'First(1) or Y /= Item'First(2) then
	       Put(" ");
	    end if;
	 end loop;
      end loop;
   end Put;
     
   
   procedure Get (Item : out Outer_Type) is
      C : Character;
      
   begin
      Get(Item.W);
      Get(C);
      Get(Item.K);
   end Get;
   
   procedure Put(Item : in Outer_Type) is
      
   begin
      Put(Item.W);
      Put(' ');
      Put(Item.K);
   end Put;
   
   
   T : Outer_Type;
begin
   Put("Mata in datamängd: ");
   Get(T);
   Skip_Line;
   
   Put("Inmatad datamängd: ");
   Put(T);
end Uppgift2;
