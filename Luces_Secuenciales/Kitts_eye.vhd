LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

Entity Kitts_eye is
    port(
        CLK,RST : in  std_logic;
        S       : in std_logic_vector(3 downto 0);
        KE      : out std_logic_vector(7 downto 0));
End Kitts_eye;

Architecture Behavioral of Kitts_eye is
    signal Qp,Qn : Unsigned(3 downto 0);
    signal H     : std_logic;
    component  Time_b
    port(
    CLK,RST : in  std_logic;                    -- Relog y Reset maestro
    S       : in  std_logic_vector(3 downto 0); -- Seleccionador de base de tiempo
    H       : out std_logic);                   -- Salida de señal
    end component;
Begin

    Time_Base: Time_b PORT MAP (CLK,RST,S,H);

    Combinational: Process(QP)
    begin
        case Qp is
            when"0000" => 
                KE <= "10000000";
                Qn <= "0001";
            when"0001" => 
                KE <= "01000000";
                Qn <= "0010";
            when"0010" => 
                KE <= "00100000";
                Qn <= "0011";
            when"0011" => 
                KE <= "00010000";
                Qn <= "0100";
            when"0100" => 
                KE <= "00001000";
                Qn <= "0101";
            when "0101" =>
                KE <= "00000100";
                Qn <= "0110";
            when "0110" =>
                KE <= "00000010";
                Qn <= "0111";
            when "0111" =>
                KE <= "00000001";
                Qn <= "1000";
            when "1000" =>
                KE <= "00000010";
                Qn <= "1001";
            when "1001" => 
                KE <= "00000100";
                Qn <= "1010";
            when "1010" =>
                KE <= "00001000";
                Qn <= "1011";
            when "1011" => 
                KE <= "00010000";
                Qn <= "1100";
            when "1100" => 
                KE <= "00100000";
                Qn <= "1101";
            when others => 
                KE <= "01000000";
                Qn <= "0000";
        end case;
    end process Combinational;

    Secuential: Process(CLK,RST,H)
    begin
        if(RST ='0') then
            Qp <= (others => '0');
        elsif(H'event and H ='1') then
            Qp <= Qn;
        end if;
    end process Secuential;
End Behavioral;

