LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY testBenchMux IS
END testBenchMux;
 
ARCHITECTURE behavior OF testBenchMux IS 
 
    COMPONENT mux
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         S : IN  std_logic;
         Z : OUT  std_logic
        );
    END COMPONENT; 

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal S : std_logic := '0';

 	--Outputs
   signal Z : std_logic;
	signal error : std_logic;
	signal Z_beh : std_logic;
	signal Z_struct : std_logic;
 
BEGIN
 
	behavioral : entity Work.Multiplexer(beh)
		port map (
			 A => A,
          B => B,
          S => S,
          Z => Z_beh
		);	 
		
	structural : entity Work.Multiplexer(struct)
		port map (
			 A => A,
          B => B,
          S => S,
          Z => Z_struct
		);			
		
	error <= Z_beh xor Z_struct;											 
	
	A <= not A after 10 ns;
	B <= not B after 40 ns;
	S <= not S after 80 ns;

END;