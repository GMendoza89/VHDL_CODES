LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity Digito is
    Port(C  : in  std_logic;
         Fx : in  std_logic;
         H  : in  std_logic;
         E  : out std_logic;
         D  : out std_logic_vector(3 downto 0));
End Digito;
Architecture Behavioral of  Digito is
    signal Qp,Qn : std_logic_vector(3 downto 0);
Begin

    Combinational: Process(H,Qp)
    begin
        if (H = '0') then 
            Qn <= Qp;
        else
            case Qp is
                when "0000" => Qn <= "0001";
                when "0001" => Qn <= "0010";
                when "0010" => Qn <= "0011";
                when "0011" => Qn <= "0100";
                when "0100" => Qn <= "0101";
                when "0101" => Qn <= "0110";
                when "0110" => Qn <= "0111";
                when "0111" => Qn <= "1000";
                when "1000" => Qn <= "1001";
                when "1001" => Qn <= "0000";
                when others => Qn <= "0000";
            end case;
        end if;
        E <= H AND Qp(3) AND NOT(Qp(2)) AND NOT(Qp(1)) AND Qp(0);
        D <= Qp;
    end Process Combinational;
     Sequential: Process(C,Fx)
     begin
         if(C = '0') then
             Qp <= (others => '0');
         elsif(Fx'event and Fx='1') then
             Qp <= Qn;
         end if;
     end Process Sequential;
 End Behavioral;

