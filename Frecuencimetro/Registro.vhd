-- Registro Interno
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity Registro is
    Port(RST,CLK : in std_logic;
         L       : in std_logic;
         N       : in std_logic_vector(15 downto 0);
         Q       : out std_logic_vector(15 downto 0));
End Registro;

Architecture Interna of Registro is
    Signal Qp,Qn : std_logic_vector(15 downto 0);
Begin

    Combinational: Process(Qp,L,N)
    begin
        if(L = '0') then
            Qn <= Qp;
        else
            Qn <= N;
        end if;
        Q <= Qp;
    end Process Combinational;

    Sequential: Process(RST,CLK)
    begin
        if(RST = '0') then
            Qp <= (others => '0');
        elsif(CLK'event and CLK = '1') then
            Qp <= Qn;
        end if;
    end Process Sequential;

End Interna;
