-- Banco de Pruebas de Sumador de N bits
-- Autor Gustavo David Mendoza Pinto
-- Circuitos Lógicos
-- Feb 12 2018

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity Sumador_nbits_testing_bench is
    generic(n: integer :=4);
End Sumador_nbits_testing_bench;

Architecture behavioral of Sumador_nbits_testing_bench is
    signal A,B : std_logic_vector(n-1 downto 0);
    signal Cin : std_logic;
    signal S   : std_logic_vector(n-1 downto 0);
    signal Cout: std_logic;
 
    Component Sumador_nbits
    generic(n : integer :=4);
    port(
    A,B : in  std_logic_vector(n-1 downto 0);
    Cin : in  std_logic;
    S   : out std_logic_vector(n-1 downto 0);
    Cout: out std_logic
    );
    end Component;
begin
    Block_01 : Sumador_nbits Port MAP (A,B,Cin,S,Cout);
    process
    begin
        A <= "0101";
        B <= "1101";
        Cin <= '1';
        wait for 20 ns;

        A <= "1101";
        B <= "0111";
        Cin <= '0';
        wait for 20 ns;

        A <= "0111";
        B <= "1100";
        Cin <= '0';
        wait for 20 ns;

        A <= "0100";
        B <= "1000";
        Cin <= '1';
        wait for 20 ns;

        A <= "0101";
        B <= "1101";
        Cin <= '0';
        wait;
    end Process;
End Behavioral;




