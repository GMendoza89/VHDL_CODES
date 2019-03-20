LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity FSM_PWM is
    port(RST,CLK : in  std_logic;
         C       : in  std_logic;
         EOC     : in  std_logic;
         STC     : out std_logic;
         P       : out std_logic);
End FSM_PWM;

Architecture Behavioral of FSM_PWM is
    signal Qn, Qp : std_logic;
Begin
    Combinational: Process(Qp,C,EOC)
    begin
        if(Qp = '0') then
            if( C = '1' ) then
                Qn <= '1';
            else
                Qn <= Qp;
            end if;
            STC <= '1';
            P   <= '0';
        else
            if(EOC = '1') then
                Qn <= '0';
            else
                Qn <= Qp;
            end if;
            STC <= '0';
            P <= '1';
        end if;
    end Process Combinational;
    Sequential: Process(RST,CLK)
    begin
        if(RST = '0') then
            Qp <= '0';
        elsif(CLK'event and CLK = '1') then
            Qp <= Qn;
        end if;
    end Process Sequential;
End Behavioral;
