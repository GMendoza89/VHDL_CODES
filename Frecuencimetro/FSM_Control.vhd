LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity FSM_Control is
    port(CLK,RST : in  std_logic;
         EOC     : in  std_logic;
         STC     : out std_logic;
         L       : out std_logic;
         C       : out std_logic;
         H       : out std_logic);
End FSM_Control;

Architecture Behavioral of FSM_Control is
    signal Qp, Qn : std_logic_vector(1 downto 0);
Begin
    Combinational: Process(Qp,EOC)
    begin
        case Qp is 
            when "00" =>
                H <= '0';
                C <= '0';
                L <= '0';
                STC <= '0';
                Qn <= "01";
            when "01" => 
                H <= '0';
                C <= '0';
                L <= '0';
                STC <= '1';
                Qn <= "10";
            when "10" =>
                H <= '1';
                C <= '1';
                L <= '0';
                STC <= '0';
                if(EOC = '1') then
                    Qn <= "11";
                else 
                    Qn <= Qp;
                end if;
            when others =>
                H <= '0';
                C <= '1';
                L <= '1';
                STC <= '0';
                Qn <= "00";
        end case;
    end Process Combinational;

    Sequential: Process (CLK,RST)
    begin
        if(RST = '0') then
            Qp <= (others => '0');
        elsif(CLK'event and clk = '1') then
            Qp <= Qn;
        end if;
    end Process Sequential;
End Behavioral;



