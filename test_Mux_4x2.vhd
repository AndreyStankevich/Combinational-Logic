LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY testBenchMux4 IS
END testBenchMux4;
 
ARCHITECTURE behavior OF testBenchMux4 IS 
 
    COMPONENT mux4
    PORT(
         A2 : IN  std_logic;
         B2 : IN  std_logic;
         S : IN  std_logic;
         A1 : IN  std_logic;
         B1 : IN  std_logic;
         Z1 : OUT  std_logic;
         Z2 : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal A2 : std_logic := '0';
   signal B2 : std_logic := '0';
   signal S : std_logic := '0';
   signal A1 : std_logic := '0';
   signal B1 : std_logic := '0';

 	--Outputs
	signal Z2_beh : std_logic;
	signal Z1_struct : std_logic;
	signal Z1_beh : std_logic;
	signal Z2_struct : std_logic;
	signal error : std_logic;
	
BEGIN

   behavioral : entity Work.Mux_4x2(beh) 
	    PORT MAP (
          A2 => A2,
          B2 => B2,
          S => S,
          A1 => A1,
          B1 => B1,
          Z2 => Z2_beh,
          Z1 => Z1_beh
        );
    structural : entity Work.Mux_4x2(struct) 
       PORT MAP (
          A2 => A2,
          B2 => B2,
          S => S,
          A1 => A1,
          B1 => B1,
          Z2 => Z2_struct,
          Z1 => Z1_struct
        );
 
   error <= (Z2_beh xor Z2_struct) or (Z1_beh xor Z1_struct);

   A2 <= not A2 after 64 ns;
	B2 <= not B2 after 32 ns;
	A1 <= not A1 after 16 ns;
	B1 <= not B1 after 8 ns;
	S <= not S after 4 ns;
	
END;
