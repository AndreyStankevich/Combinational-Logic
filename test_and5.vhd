LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_and5 IS
END test_and5;
 
ARCHITECTURE behavior OF test_and5 IS 
 
    COMPONENT and5
    PORT(
         A : IN  std_logic_vector(4 downto 0);
         Z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal Z_beh : std_logic;
	signal Z_struct : std_logic;
	signal error : std_logic;
	
BEGIN

   behavioral : entity Work.and5(beh) 
	    PORT MAP (
			 A(0) => A(0),
			 A(1) => A(1),
			 A(2) => A(2),
			 A(3) => A(3),
			 A(4) => A(4),
			 Z => Z_beh
        );
		  
   structural : entity Work.and5(struct) 
	    PORT MAP (
          A(0) => A(0),
			 A(1) => A(1),
			 A(2) => A(2),
			 A(3) => A(3),
			 A(4) => A(4),
			 Z => Z_struct
        );

   error <= Z_beh xor Z_struct;

   A(0) <= not A(0) after 10 ns;
	A(1) <= not A(1) after 20 ns;
	A(2) <= not A(2) after 40 ns;
	A(3) <= not A(3) after 80 ns;
	A(4) <= not A(4) after 160 ns;
END;
