Library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY FSM_W is
    port(
        CLK,RST : in  std_logic;
        T,B     : in  std_logic;
        M       : out std_logic);
END FSM_W;

Architecture Behavioral of FSM_W is 
signal Qp,Qn : std_logic;
BEGIN

    Combinational: Process(T,B,Qp)
    begin
        if(Qp = '0') then
            if(T = '0' and B = '0') then
                Qn <= '1';
            else
                Qn <= Qp;
            end if;
            M <='0';
        else
            if(T = '1' and B = '1') then
                Qn <= '0';
            else
                Qn <= Qp;
            end if;
            M <='1';
        end if;
    end Process Combinational;

--    Secuential: Process (RST,CLK)
--    begin
--        if(RST = '1') then 
--            Qp <= '0';
--        elsif(CLK 'event and CLK = '1') then 
--            Qp <= Qn;
--        end if;
--    end Process Secuential;
    Qp <= '0' when RST = '0' else Qn when rising_edge(CLK);

END Behavioral;

