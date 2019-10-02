LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testBenchTask_3_11 IS
END testBenchTask_3_11;
 
ARCHITECTURE behavior OF testBenchTask_3_11 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT task_3_11
    PORT(
         X : IN  std_logic;
         Y : IN  std_logic;
         Z : IN  std_logic;
         F : OUT  std_logic;
         G : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal X : std_logic := '0';
   signal Y : std_logic := '0';
   signal Z : std_logic := '0';

 	--Outputs
	signal F_beh : std_logic;
	signal F_struct : std_logic;
	signal G_beh : std_logic;
	signal G_struct : std_logic;
	signal error : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   behavioral : entity Work.task_3_11(beh) PORT MAP (
          X => X,
          Y => Y,
          Z => Z,
          F => F_beh,
          G => G_beh
        );
	structural : entity Work.task_3_11(struct) PORT MAP (
          X => X,
          Y => Y,
          Z => Z,
          F => F_struct,
          G => G_struct
        );
		  
   error <= (F_beh xor F_struct) or (G_beh xor G_struct);
											 
	X <= not X after 20 ns;
	Y <= not Y after 40 ns;
	Z <= not Z after 80 ns;

END;