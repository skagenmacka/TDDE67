-- aleny404: Arbetat enskilt

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Uppgift is
   type K_Type is array (34 .. 35, -90 .. -88) of Float;
   type EY_Type is array (-4 .. -3) of Character;
   
   type T_Type is
      record
	 E: EY_Type;
	 Y: EY_Type;
      end record;
   
   type KT_Type is
      record
	 K: K_Type;
	 T: T_Type;
      end record;
   
   type Data_Type is array (53 .. 54) of KT_Type;
   
   
   procedure Get(K : out K_Type) is
      
   begin
      for I in reverse K'Range(2) loop
	 for J in K'Range(1) loop
	    Get(K(J, I));
	 end loop;
      end loop;
   end Get;
   
   procedure Put(K : in K_Type) is
      
   begin
      for I in K'Range(2) loop
	 for J in reverse K'Range(1) loop
	    Put(K(J, I), Fore => 0, Aft => 1, Exp => 0);
	    
	    if not (I = K'Last(2) and J = K'First(1)) then
	       Put(' ');
	    end if;
	 end loop;
      end loop;
   end Put;
   
   
   
   procedure Get(EY: out EY_Type) is
      C: Character;
   begin
      for I in reverse EY'Range loop
	 Get(EY(I));
	 
	 if I /= EY'First then
	    Get(C);
	 end if;
      end loop;
   end Get;
   
   procedure Put(EY: in EY_Type) is 
      
   begin
      for I in reverse EY'Range loop
	 Put(EY(I));
	 
	 if I /= EY'First then
	    Put(' ');
	 end if;
      end loop;
   end;
   
   
   
   procedure Get(T: out T_Type) is
      C: Character;
   begin
      Get(T.E);
      Get(C);
      Get(T.Y);
   end Get;
   
   
   procedure Put(T: in T_Type) is
      
   begin
      Put(T.E);
      Put(' ');
      Put(T.Y);
   end Put;
   
   
   
   procedure Get(KT: out KT_Type) is
      C: Character;
   begin
      Get(KT.K);
      Get(C);
      Get(KT.T);
   end Get;
   
   procedure Put(KT: in KT_Type) is
      
   begin
      Put(KT.K);
      Put(' ');
      Put(KT.T);
   end Put;
      
   
   procedure Get(Data: out Data_Type) is
      
   begin
      for I in reverse Data'Range loop
	 Get(Data(I));
      end loop;
   end Get;
   
   procedure Put(Data: in Data_Type) is
      
   begin
      for I in Data'Range loop
	 Put(Data(I));
	 
	 if I /= Data'Last then
	    Put(' ');
	 end if;
      end loop;
   end;
   
   Data: Data_Type;
begin
   Ada.Text_IO.Put("Mata in datamängd: ");
   Get(Data);
   Skip_Line;
   
   Ada.Text_IO.Put("Inmatad datamängd: ");
   Put(Data);
   
end Uppgift;
