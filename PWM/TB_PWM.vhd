LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity TB_PWM is
End TB_PWM;

Architecture Simulation of TB_PWM is
    component PWM
    port(RST,CLK : in std_logic;
         Sel : in std_logic_vector(3 downto 0);
         P,Po   : out std_logic);
    end component;
    signal RST,P, Po :std_logic;
    signal CLK : std_logic:='0';
    signal Sel : std_logic_vector(3 downto 0);
Begin

    Simulation_BLK: PWM Port Map (RST,CLK,Sel,P,Po);

    CLK <= NOT(CLK) after 10 ns;
    RST <= '0', '1' after 20 ns;
    SEL <= "0000","0001" after 1 ms, "0010" after 2 ms,"0011" after 3 ms,"0100" after 4 ms,"0101" after 5 ms,"0110" after 6 ms,"0111" after 7 ms,"1000" after 8 ms,"1001" after 9 ms,"1010" after 10 ms;
end Simulation;


