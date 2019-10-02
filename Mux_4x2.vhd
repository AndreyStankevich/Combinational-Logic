----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:07:37 09/19/2019 
-- Design Name: 
-- Module Name:    Mux_4x2 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_4x2 is
    Port ( A1 : in  STD_LOGIC;
           B1 : in  STD_LOGIC;
           A2 : in  STD_LOGIC;
           B2 : in  STD_LOGIC;
           S : in  STD_LOGIC;
           Z1 : out  STD_LOGIC;
           Z2 : out  STD_LOGIC);
end Mux_4x2;

architecture struct of Mux_4x2 is
    
	 component Multiplexer
	     port(
		      A, B, S : in std_logic;
				Z : out std_logic
				);
	 end component; 			

begin
    U1 : Multiplexer port map (A1, B1, S, Z1);
	 U2 : Multiplexer port map (A2, B2, S, Z2);
end struct;

architecture beh of Mux_4x2 is		
begin
    Z1 <= A1 when S = '0' else B1;
	 Z2 <= A2 when S = '0' else B2;
end beh;



