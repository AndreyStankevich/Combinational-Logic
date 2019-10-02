--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:32:01 09/24/2019
-- Design Name:   
-- Module Name:   E:/POCP_2/test_halfsum.vhd
-- Project Name:  POCP_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: halfsum
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
 
ENTITY test_halfsum IS
END test_halfsum;
 
ARCHITECTURE behavior OF test_halfsum IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT halfsum
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         S : OUT  std_logic;
         P : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal S_beh : std_logic;
   signal P_beh : std_logic;
   signal S_struct : std_logic;
   signal P_struct : std_logic;	
	signal error : std_logic;
 
BEGIN
   behavioral : entity Work.halfsum(beh) 
	    PORT MAP (
			 A => A,
			 B => B,
			 S => S_beh,
			 P => P_beh
        );
		  
   structural : entity Work.halfsum(struct) 
	    PORT MAP (
          A => A,
			 B => B,
			 S => S_struct,
			 P => P_struct
        );
		  
   error <= (S_beh xor S_struct) or (P_beh xor P_struct);

   A <= not A after 20 ns;
   B <= not	B after 40 ns;
END;
