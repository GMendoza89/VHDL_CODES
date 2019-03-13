LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity Contador is
    Port(C  : in  std_logic;
         Fx : in std_logic;
         H  : in std_logic;
         N  : out std_logic_vector(15 downto 0));
End Contador;

Architecture Behavioral of Contador is
    Signal H1,H2,H3,H4 : std_logic;
    signal D1,D2,D3,D4 : std_logic_vector(3 downto 0);
    
    Component Digito
        Port(C  : in  std_logic;
            Fx : in  std_logic;
            H  : in  std_logic;
            E  : out std_logic;
            D  : out std_logic_vector(3 downto 0));
    end Component;
Begin
    Digito_1: Digito Port Map (C,Fx,H,H1,D1);
    Digito_2: Digito Port Map (C,Fx,H1,H2,D2);
    Digito_3: Digito Port Map (C,Fx,H2,H3,D3);
    Digito_4: Digito Port Map (C,Fx,H3,H4,D4);

    N <= D4 & D3 & D2 & D1;

End Behavioral;

