Library IEEE;
use IEEE.std_logic_1164.all;

entity testing_bench_Adder_module_wFlags is
End testing_bench_Adder_module_wFlags;

Architecture simulation of testing_bench_Adder_module_wFlags is
    component adder_module_wFlags is
       generic(
            n : integer := 8
        );
        port(
            A, B : in  std_logic_vector(n-1 downto 0); -- Sumandos
            Ci   : in  std_logic;                      -- Acarreo de entrada
            S    : out std_logic_vector(n-1 downto 0); -- Suma
            Co   : out std_logic;                      -- Acarreo de salida
            V    : out std_logic;                      -- Bandera del Sobreflujo
            Z    : out std_logic;                      -- Bandera del Cero
            Sn    : out std_logic                      -- Bandera del Signo
        );
    End component;
    signal A,B,S : std_logic_vector(7 downto 0);
    signal Ci,Co,V,Z,Sn : std_logic;
    begin
        SIMBLK: adder_module_wFlags PORT MAP (A,B,Ci,S,Co,V,z,Sn);
        process
        begin
            -- Bloque 1;
            Ci <= '0';
            A <= "00001100";
            B <= "00001100";
            
            wait for 20 ns;
            Ci <= '0';
            A <= "00001100";
            B <= "10001100";
            
            wait for 20 ns;
            Ci <= '0';
            A <= "00001100";
            B <= "11111111";
            
            wait for 20 ns;
            Ci <= '1';
            A <= "00001100";
            B <= "11111111";
        
            wait for 20 ns;
    end Process;
end simulation;

