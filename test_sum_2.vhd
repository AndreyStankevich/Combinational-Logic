LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_sum_2 IS
END test_sum_2;
 
ARCHITECTURE behavior OF test_sum_2 IS 
 
    COMPONENT sum2
    PORT(
         A0 : IN  std_logic;
         B0 : IN  std_logic;
         A1 : IN  std_logic;
         B1 : IN  std_logic;
         C0 : IN  std_logic;
         S0 : OUT  std_logic;
         S1 : OUT  std_logic;
         C2 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A0 : std_logic := '0';
   signal B0 : std_logic := '0';
   signal A1 : std_logic := '0';
   signal B1 : std_logic := '0';
   signal C0 : std_logic := '0';

 	--Outputs
   signal S0_beh : std_logic;
   signal S1_beh : std_logic;
   signal C2_beh : std_logic;
	
	signal S0_struct : std_logic;
   signal S1_struct : std_logic;
   signal C2_struct : std_logic;
	
	signal error : std_logic;
 
BEGIN
   behavioral : entity Work.sum2(beh) 
	    PORT MAP (
			 A0 => A0,
			 B0 => B0,
			 A1 => A1,
			 B1 => B1,
			 C0 => C0,
			 S0 => S0_beh,
			 S1 => S1_beh,
			 C2 => C2_beh
        );
		  
   structural : entity Work.sum2(struct) 
	    PORT MAP (
          A0 => A0,
			 B0 => B0,
			 A1 => A1,
			 B1 => B1,
			 C0 => C0,
			 S0 => S0_struct,
			 S1 => S1_struct,
			 C2 => C2_struct
        );
		  
   error <= (S0_beh xor S0_struct) or (S1_beh xor S1_struct) or (C2_beh xor C2_struct);

   A0 <= not A0 after 2 ns;
   A1 <= not A1 after 4 ns;
   B0 <= not B0 after 8 ns;
   B1 <= not B1 after 16 ns;	
END;
