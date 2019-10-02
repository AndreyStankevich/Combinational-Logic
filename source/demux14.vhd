library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux14 is
    Port ( X : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           S2 : in  STD_LOGIC;
           Z1 : out  STD_LOGIC;
           Z2 : out  STD_LOGIC;
           Z3 : out  STD_LOGIC;
           Z4 : out  STD_LOGIC);
end demux14;

architecture struct of demux14 is

   component inv
        port(
            A : in std_logic;
				nA : out std_logic
				);
    end component;
	 
	 component and3
	     port(
		      A, B, C: in std_logic;
				Z : out std_logic
	         );
    end component;

signal nS1, nS2 : std_logic;
begin
    INV_1 : inv port map (S1, nS1);
	 INV_2 : inv port map (S2, nS2);
	 AND_1 : and3 port map (X, S1, S2, Z1);
	 AND_2 : and3 port map (X, nS1, S2, Z2);
	 AND_3 : and3 port map (X, S1, nS2, Z3);
	 AND_4 : and3 port map (X, nS1, nS2, Z4);
	 
end struct;

architecture beh of demux14 is
begin
    Z1 <= S2 and S1 and X;
	 Z2 <= S2 and not S1 and X;
	 Z3 <= not S2 and S1 and X;
	 Z4 <= not S2 and not S1 and X;
end beh;



