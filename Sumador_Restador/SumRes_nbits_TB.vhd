LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

Entity SumRes_nbits_TB is
    generic(n : integer := 4);
End SumRes_nbits_TB;
Architecture Simulation of SumRes_nbits_TB is
    signal A,B,S      : std_logic_vector(n-1 downto 0);
    signal Cin,Cout,X :std_logic;
    Component SumRes_nbits
    generic(n : integer := 4);
    Port(
        A,B : in  std_logic_vector(n-1 downto 0);  -- Operandos
        Cin : in  std_logic;                       -- Acarreo de entrada
        X   : in  std_logic;                       -- Selector
        S   : out std_logic_vector(n-1 downto 0);  -- Salida
        Cout: out std_logic);                      -- Acarreo de salida
    end Component; 
Begin
    SIMBLK0: SumRes_nbits Port Map (A,B,Cin,X,S,Cout);
    Process
    begin
        -- Primer Periodo de Prueva
        -- Suma sin acarreo
        A <= "1011";
        B <= "0011";
        Cin <='0';
        X <= '0';
        wait for 20 ns;
        -- Resta sin acarreo
        A <= "1011";
        B <= "0011";
        Cin <='0';
        X <= '1';
        wait for 20 ns;
        -- Suma con acarreo
        A <= "1011";
        B <= "0011";
        Cin <='1';
        X <= '0';
        wait for 20 ns;
        -- Resta con acarreo
        A <= "1011";
        B <= "0011";
        Cin <='1';
        X <= '1';
        wait for 20 ns;
        -- Segundo Periodo de Prueva
        -- Suma sin acarreo
        A <= "0011";
        B <= "0011";
        Cin <='0';
        X <= '0';
        wait for 20 ns;
        -- Resta sin acarreo
        A <= "0011";
        B <= "0011";
        Cin <='0';
        X <= '1';
        wait for 20 ns;
        -- Suma con acarreo
        A <= "0011";
        B <= "0011";
        Cin <='1';
        X <= '0';
        wait for 20 ns;
        -- Resta con acarreo
        A <= "0011";
        B <= "0011";
        Cin <='1';
        X <= '1';
        wait for 20 ns;
        -- Tercer Periodo de Prueva
        -- Suma sin acarreo
        A <= "0011";
        B <= "1010";
        Cin <='0';
        X <= '0';
        wait for 20 ns;
        -- Resta sin acarreo
        A <= "0011";
        B <= "1010";
        Cin <='0';
        X <= '1';
        wait for 20 ns;
        -- Suma con acarreo
        A <= "0011";
        B <= "1010";
        Cin <='1';
        X <= '0';
        wait for 20 ns;
        -- Resta con acarreo
        A <= "0011";
        B <= "1010";
        Cin <='1';
        X <= '1';
        wait;
    end Process;
End Simulation;

