-- aleny404: Arbetat enskilt
with Ada.Text_IO; use Ada.Text_IO;

procedure Uppgift is
   
   type Inner_Matrix_Type is
     array (-20 .. -18, Character range 'w' .. 'z') of Character;
   
   type Middle_Type is
      record
	 H: Inner_Matrix_Type;
	 G: Inner_Matrix_Type;
      end record;
   
   type T_Type is array (Boolean'Range) of Middle_Type; 
   
   procedure Get (Item : out Inner_Matrix_Type) is
      
      C : Character;
      
   begin
      for X in Item'Range(1) loop
	 for Y in reverse Item'Range(2) loop
	    Get(Item(X, Y));
	    
	    if not (X = Item'Last(1) and Y = Item'First(2)) then
	       Get(C);
	    end if;
	 end loop;
      end loop;
   end Get;
   
   procedure Put (Item : in Inner_Matrix_Type) is
      
   begin
      for X in reverse Item'Range(1) loop
	 for Y in Item'Range(2) loop
	    Put(Item(X, Y));
	    
	    -- if not (X = First and Y = Last)
	    
	    if not (X = Item'First(1) and Y = Item'Last(2)) then
	       Put(' ');
	    end if;
	 end loop;
      end loop;
   end Put;
   
   procedure Get (Item : out Middle_Type) is
      
      C : Character;
      
   begin
      Get(Item.H);
      Get(C);
      Get(Item.G);
   end Get;
   
   procedure Put (Item : in Middle_Type) is
      
   begin
      Put(Item.H);
      Put(' ');
      Put(Item.G);
   end Put;
   
   procedure Get (Item : out T_Type) is
      
      C : Character;
      
   begin
      for I in Item'Range loop
	 Get(Item(I));
	 
	 if I /= Item'Last then
	    Get(C);
	 end if;
      end loop;
   end Get;
   
   procedure Put (Item : in T_Type) is
      
   begin
      for I in Item'Range loop
	 Put(Item(I));
	 
	 if I /= Item'Last then
	    Put(' ');
	 end if;
      end loop;
   end Put;
   
   
   T: T_Type;
   
begin
   Put("Mata in datamängd: ");
   Get(T);
   
   Put("Inmatad datamängd: ");
   Put(T);
end Uppgift;
