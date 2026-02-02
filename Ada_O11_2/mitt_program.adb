with Ada.Text_IO; use Ada.Text_IO;

with Ada.Command_Line; use Ada.Command_Line;

procedure Mitt_Program is
   I: Integer;
   
   N: Integer;
begin
   I := Argument_Count;
   
   if I = 0 then
     Put_Line("Inga argument angivna.");
   elsif I /= 3 then
     Put_Line("Fel antal argument angivna.");
   else
      -- det finns exakt 3 st argument
      -- det skall nu vara säkert att ta in
      -- dessa argument som är följande: String String Integer
      declare 
	 Text_1 : constant String := Argument(1);
	 Text_2 : constant String := Argument(2);
      begin
	 N := Integer'Value(Argument(3));
	 
	 Put("Första argumentet: ");
	 Put(Text_1);
	 New_Line;
	 
	 Put("Andra argumentet så många gånger som tredje argumentet anger:");
	 New_Line;
	 
	 for J in 1 .. N loop
	    Put(Text_2);
	 end loop;
	 
	 New_Line;
      end;
      
      Put("Programmet """);
      Put(Command_Name);
      Put(""" avslutas.");
      New_Line;
   end if;
end Mitt_Program;
