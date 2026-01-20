with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Momstabell is
   First_Price: Float;
   Last_Price: Float;
   Inc: Float;
   VAT: Float;
   
   Index: Float;
   Index_VAT: Float;
   Index_Total: Float;
begin
   loop 
      Put("Första pris: ");
      Get(First_Price);
      
      exit when First_Price >= 0.0;
      
      Put_Line("Felaktigt värde!");
   end loop;
   
   loop
      Put("Sista pris: ");
      Get(Last_Price);
      
      exit when Last_Price >= First_Price;
      
      Put_Line("Felaktigt värde!");
   end loop;
   
   loop
      Put("Steg: ");
      Get(Inc);
      
      exit when Inc > 0.0;
      
      Put_Line("Felaktigt värde!");
   end loop;
   
   Put("Momsprocent: ");
   Get(VAT);
   
   VAT := VAT / 100.0;
   
   New_Line;
   Put_Line("============ Momstabell ============");
   Put_Line("Pris utan moms  Moms   Pris med moms");
   
   Index := First_Price;
   while Index <= Last_Price loop
      Index_VAT := Index * VAT;
      Index_Total := Index + Index_VAT;
      
      Put(Index, Fore => 6, Aft => 2, Exp => 0);
      Put(Index_Vat, Fore => 8, Aft => 2, Exp => 0);
      Put(Index_Total, Fore => 9, Aft => 2, Exp => 0);
      New_Line;
      
      Index := Index + Inc;
   end loop;
end Momstabell;
