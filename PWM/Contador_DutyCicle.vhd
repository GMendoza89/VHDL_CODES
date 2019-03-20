LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

Entity Contador_DutyCicle is
    port(RST,CLK : in  std_logic;
         STC     : in  std_logic;
         K       : in  std_logic_vector(15 downto 0);
         EOC     : out std_logic);
End Contador_DutyCicle;

Architecture Behavioral of Contador_DutyCicle is
    signal Qp,Qn : unsigned(15 downto 0);

Begin
    Combinational: Process(Qp,STC,K)
    begin
        if(Qp = "0000000000000000") then
            if(STC = '1') then
                Qn <= unsigned(K);
            else
                Qn <= Qp;
            end if;
            EOC <= '1';
        else
            Qn <= Qp - 1;
            EOC <= '0';
        end if;
    end Process Combinational;
    Sequential: Process(RST,CLK)
    begin
        if (RST = '0') then
            Qp <= "0000000000000000";
        elsif(CLK'event and CLK = '1') then
            Qp <= Qn;
        end if;
    end Process Sequential;
End Behavioral;

