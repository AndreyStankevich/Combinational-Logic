library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sum2 is
    Port ( A0 : in  STD_LOGIC;
           B0 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;
           B1 : in  STD_LOGIC;
           C0 : in  STD_LOGIC;
           S0 : out  STD_LOGIC;
           S1 : out  STD_LOGIC;
           C2 : out  STD_LOGIC);
end sum2;

architecture struct of sum2 is

    component sum1
	     port(
		      A, B, P0 : in std_logic;
				S, P : out std_logic
            );
	 end component;

signal C1 : std_logic;	 
begin
    SUM_1 : sum1 port map (A0, B0, C0, S0, C1);
	 SUM_2 : sum1 port map (A1, B1, C1, S1, C2);
end struct;

architecture beh of sum2 is
signal C1, buf_C2 : std_logic;
begin
    C1 <= (A0 and B0) or (A0 and C0) or (B0 and C0);
    C2 <= (A1 and B1) or (A1 and C1) or (B1 and C1);
	 buf_C2 <= (A1 and B1) or (A1 and C1) or (B1 and C1);
	 
	 S0 <= ((not C1) and (A0 or B0 or C0)) or (A0 and B0 and C0);
	 S1 <= ((not buf_C2) and (A1 or B1 or C1)) or (A1 and B1 and C1);
end beh;