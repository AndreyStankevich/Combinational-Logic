--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:38:29 09/21/2019
-- Design Name:   
-- Module Name:   C:/Users/DELL-PC/Desktop/OneDrive/POCP/POCP_2/testBenchMux.vhd
-- Project Name:  POCP_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testBenchMux IS
END testBenchMux;
 
ARCHITECTURE behavior OF testBenchMux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
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
	
	A <= not A after 16 ns;
	B <= not B after 8 ns;
	S <= not S after 4 ns;

END;