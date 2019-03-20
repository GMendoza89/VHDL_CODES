LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

Entity Contador_1KHz is
    port(RST,CLK : in  std_logic;
         C       : out std_logic);
End Contador_1KHz;

Architecture Behavioral of Contador_1KHz is
    signal Qn,Qp : unsigned(15 downto 0);
Begin

    Combinational: Process(Qp)
    begin
        if(Qp = "0000000000000000") then
            C <= '1';
            Qn <= "1100001101001111";
        else
            Qn <= Qp - 1;
            C <= '0';
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
