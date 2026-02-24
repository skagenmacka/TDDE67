-- aleny404: Samarbetat med alboz165, Albin Ozel, johsa420, Johanna Sandén, samma program

with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Exceptions; use Ada.Exceptions;

procedure Test_Exceptions is
   
   -- get safe för integer
   procedure Get_Safe (Value : out Integer;
			 Min : in Integer;
			 Max : in Integer) is
      
   begin
      loop
	 begin
	    Put("Mata in värde (");
	    Put(Min, Width => 0);
	    Put(" - ");
	    Put(Max, Width => 0);
	    Put("): ");
	    
	    Get(Value);
	    
	    if Value < Min then
	       Put("För litet värde. ");
	    elsif Value > Max then
	       Put("För stort värde. ");
	    else
	       -- ok!
	       exit;
	    end if;
	    
	 exception
	    when Data_Error => 
	       Put("Fel datatyp. ");
	       Skip_Line;
	 end;
	 
	 
      end loop;
   end Get_Safe;
   
   -- get safe för strängar
   Length_Error : exception;
   
   procedure Skip_White_Lines is
      C: Character;
      Eol: Boolean;
   begin
      loop
	 Look_Ahead(C, Eol);
	 
	 if C = ' ' then
	    Get(C);
	 elsif Eol then
	    Skip_Line;
	 else
	    exit;
	 end if;
      end loop;
   end Skip_White_Lines;
   
   procedure Get_Correct_String (S: out String) is
      C: Character;
      Eol: Boolean := False; 
   begin
      -- tar bort alla new line + blankslag
      Skip_White_Lines;
      
      for I in S'Range loop
	 Look_Ahead(C, Eol);
	 
	 if Eol then
	    raise Length_Error;
	 end if;
	    
	 Get(S(I));
      end loop;
   end Get_Correct_String;
   
   
   -- datum hantering
   Format_Error : exception;
   Year_Error : exception;
   Month_Error : exception;
   Day_Error : exception;
   
   type Date_Type is 
      record
	 Year: Integer;
	 Month: Integer;
	 Day: Integer;
      end record;
   
   procedure Put(Item : in Date_Type) is
   begin
      Put(Item.Year, Width => 0);
      Put("-");
      
      if Item.Month < 10 then
	 Put('0');
      end if;
      Put(Item.Month, Width => 0);
      
      Put("-");
      
      if Item.Day < 10 then
	 Put('0');
      end if;
      Put(Item.Day, Width => 0);
   end Put;
   
   procedure Get(Item : out Date_Type) is
      Date_Str: String(1 .. 10);

      Year_Int: Integer;
      Month_Int: Integer;
      Day_Int: Integer;
      
      procedure Format_Str (Str : in String;
			    Int : out Integer) is
	 
      begin
	 begin
	    Int := Integer'Value(Str);
	 exception
	    when others =>
	       raise Format_Error;
	 end;
      end;
      
      procedure Validate_Date (Year : in Integer;
			       Month : in Integer;
			       Day : in Integer) is
	 
	 Leap_Year : Boolean :=
	   (Year mod 4 = 0 and Year mod 100 /= 0) or
	   (Year mod 400 = 0);
	 
	 Days : array (1 .. 12) of Integer :=
	   (31, (if Leap_Year then 29 else 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
      begin
	 if Year < 1532 or Year > 9000 then
	    raise Year_Error;
	 end if;
	 
	 if Month < 1 or Month > 12 then
	    raise Month_Error;
	 end if;
	 
	 if Day < 1 or Day > Days(Month) then
	    raise Day_Error;
	 end if;
	 
      end Validate_Date;
      
      C: Character;
      Eol: Boolean;
   begin
      -- tar bort alla mellanslag + newlines
      Skip_White_Lines;
      
      for I in Date_Str'Range loop
	Look_Ahead(C, Eol);
	
	-- om vi påträffar Eol innan slutet
	-- så är det något formateringsfel (för kort datum)
	if Eol then
	   raise Format_Error;
	end if;
	
	Get(Date_Str(I));
      end loop;
      
      -- vi har nu exakt 10 tecken i strängen Date_Str
      
      -- kollar om talen är korrekta
      Format_Str(Date_Str(1 .. 4), Year_Int);
      
      if Date_Str(5) /= '-' then
	 raise Format_Error;
      end if;
      
      Format_Str(Date_Str(6 .. 7), Month_Int);
      
      if Date_Str(8) /= '-' then
	 raise Format_Error;
      end if;
      
      Format_Str(Date_Str(9 .. 10), Day_Int);
      
      -- allt ok, validerar datumet
      Validate_Date(Year_Int, Month_Int, Day_Int);
      
      Item.Year := Year_Int;
      Item.Month := Month_Int;
      Item.Day := Day_Int;
   end Get;
   
   
   
   ----------------------------------------------------------------------
   -- Underprogram för att skriva ut meny och hantera menyval          --
   --                                                                  --
   -- Underprogrammet skriver ut de menyval som finns tillgängliga.    --
   -- Användaren får mata in menyval tills denne matat in ett          --
   -- korrekt menyval.                                                 --
   ----------------------------------------------------------------------
   function Menu_Selection return Integer is
      
      N : Integer;
      
   begin
      Put_Line("1. Felkontrollerad heltalsinläsning");
      Put_Line("2. Längdkontrollerad stränginläsning");
      Put_Line("3. Felkontrollerad datuminläsning");
      Put_Line("4. Avsluta programmet");
      
      loop
	 Put("Mata in N: ");
	 Get(N);
	 Skip_Line;
	 exit when N in 1 .. 4;	 
	 Put_Line("Felaktigt N, mata in igen!");
      end loop;
      
      return N;
   end Menu_Selection;
   
   ----------------------------------------------------------------------
   -- Underprogram för menyval 1: "felhantering av heltalsinmatning"   --
   --                                                                  --
   -- Underprogrammet låter användaren mata in ett intervall angivet   --
   -- med två heltal Min och Max. Get_Safe anropas                     --
   -- sedan med detta intervall och sköter felhanteringen av           --
   -- heltalsinläsningen där användaren får mata in värden tills       --
   -- korrekt värde matas in.                                          --
   ----------------------------------------------------------------------
   procedure Upg1 is
      
      Value, Min, Max : Integer;
      
   begin      
      Put("Mata in Min och Max: ");
      Get(Min);
      Get(Max);
      
      Get_Safe(Value, Min, Max);
      Skip_Line;
      
      Put("Du matade in heltalet ");
      Put(Value, Width => 0);
      Put_Line(".");      
   end Upg1;
   
   ----------------------------------------------------------------------
   -- Underprogram för menyval 2: "felhantering av stränginmatning"    --
   --                                                                  --
   -- Underprogrammet skapar en sträng som är lika lång som parametern --
   -- Length. Underprogrammet skickar denna sträng till                --
   -- Get_Correct_String där felhanteringen av stränginmatningen sker. --
   -- Om användaren matar in en för kort sträng kommer                 --
   -- Get_Correct_String kasta/resa undantag vilket inte ska           --
   -- fångas här utan i huvudprogrammet.                               --
   ----------------------------------------------------------------------
   procedure Upg2(Length : in Integer) is
      
      S : String(1 .. Length);
      
   begin      
      Put("Mata in en sträng med exakt ");
      Put(Length, Width => 0);
      Put(" tecken: ");
      
      Get_Correct_String(S);
      Skip_Line;
      
      Put_Line("Du matade in strängen " & S & ".");      
   end Upg2;
   
   ----------------------------------------------------------------------
   -- Underprogram för menyval 3: "felhantering av datuminmatning"     --
   --                                                                  --
   -- Underprogrammet anropar Get som i sin tur kommer läsa in och     -- 
   -- kontrollera ett datums format och rimlighet. Om datumet är       --
   -- felaktigt kommer Get kasta/resa undantag vilket detta            --
   -- underprogram ska fånga, skriva ut felmeddelande för och sedan    --
   -- anropa Get igen.                                                 --
   ----------------------------------------------------------------------
   procedure Upg3 is
      
      Date : Date_Type;
      
   begin      
      
      loop
	 Put("Mata in ett datum: ");
	 
	 begin
	    Get(Date);
	    Skip_Line;
	    
	    exit;
	 exception
	    when Format_Error =>
	       Put("Felaktigt format! ");
	    when Year_Error =>
	       Put("Felaktigt år! ");
	    when Month_Error =>
	       Put("Felaktig månad! ");
	    when Day_Error =>
	       Put("Felaktig dag! ");
	 end;
	 
      end loop;
      
      Put("Du matade in ");
      Put(Date);
      New_Line;      
   end Upg3;
   
   ----------------------------------------------------------------------
   -- Huvudprogram                                                     --
   --                                                                  --
   -- Huvudprogrammet skriver ut och låter användaren välja val i en   --
   -- meny via underprogrammet Menu_Selection. Beroende på vilket      --
   -- menyval användaren valt kommer olika underprogram anropas.       --
   -- Observera att för menyval 2 kommer användaren få mata in längden -- 
   -- av en sträng vilket skickas vidare till underporgrammet Upg2 där --
   -- strängen i sig skapas.                                           --
   ----------------------------------------------------------------------
   Choice, Length : Integer;
   
begin 
   loop
      Choice := Menu_Selection;
      
      if Choice = 1 then
	 Upg1;
	 
      elsif Choice = 2 then
	 Put("Mata in en stränglängd: ");
	 Get(Length);
	 Skip_Line;
	 
	 begin
	    Upg2(Length);
	 exception
	    when Length_Error =>
	       Put("För få inmatade tecken");
	       exit;
	 end;
	 
      elsif Choice = 3 then
	 Upg3;
	 
      else
	 Put_Line("Programmet avslutas.");
	 exit;
      end if;      
   end loop;
end Test_Exceptions;
