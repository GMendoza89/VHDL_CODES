LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

Entity Contador_1S is
    port(RST,CLK : in  std_logic;
         STC     : in  std_logic;
         EOC     : out std_logic);
End Contador_1S;

Architecture Behavioral of Contador_1S is
    signal Qn,Qp : unsigned(25 downto 0);
Begin

    Combinational: Process(Qp,STC)
    begin
        if(Qp = "00000000000000000000000000") then
            if (STC = '1') then
                Qn <= "10111110101111000001111111";
            else
                Qn <= Qp;
            end if;
            EOC <= '1';
        else
            Qn <= Qp - 1;
            EOC <= '0';
        end if;
    end Process Combinational;
    Sequential: Process (CLK, RST)
    begin
        if (RST = '0') then
            Qp <= (others => '0');
        elsif(CLK'event and CLK ='1') then
            Qp <= Qn;
        end if;
    end Process Sequential;
End Behavioral;
