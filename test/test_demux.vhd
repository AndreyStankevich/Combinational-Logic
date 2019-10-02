LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_demux IS
END test_demux;
 
ARCHITECTURE behavior OF test_demux IS 
 
    COMPONENT demux14
    PORT(
         X : IN  std_logic;
         S1 : IN  std_logic;
         S2 : IN  std_logic;
         Z1 : OUT  std_logic;
         Z2 : OUT  std_logic;
         Z3 : OUT  std_logic;
         Z4 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic := '0';
   signal S1 : std_logic := '0';
   signal S2 : std_logic := '0';

 	--Outputs
   signal Z1_beh : std_logic;
	signal Z2_beh : std_logic;
	signal Z3_beh : std_logic;
	signal Z4_beh : std_logic;
	
	signal Z1_struct : std_logic;
	signal Z2_struct : std_logic;
	signal Z3_struct : std_logic;
	signal Z4_struct : std_logic;
	
	signal error : std_logic;
BEGIN

   behavioral : entity Work.demux14(beh)
	port map (
	   X => X,
		S1 => S1,
		S2 => S2,
		Z1 => Z1_beh,
		Z2 => Z2_beh,
		Z3 => Z3_beh,
		Z4 => Z4_beh
		);
	
	structural : entity Work.demux14(struct)
	port map (
		X => X,
		S1 => S1,
		S2 => S2,
		Z1 => Z1_struct,
		Z2 => Z2_struct,
		Z3 => Z3_struct,
		Z4 => Z4_struct
		);
	
	X <= not X after 10 ns;
	S1 <= not S1 after 20 ns;
	S2 <= not S2 after 40 ns;
	
	error <= (Z1_beh xor Z1_struct) or (Z2_beh xor Z2_struct) or (Z3_beh xor Z3_struct) or (Z4_beh xor Z4_struct);

END;
