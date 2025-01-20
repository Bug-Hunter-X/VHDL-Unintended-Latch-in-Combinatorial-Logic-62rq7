```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity my_entity is
    port (
        clk : in std_logic;
        rst : in std_logic;
        data_in : in std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behavioral of my_entity is
begin
    process (clk, rst) begin
        if rst = '1' then
            data_out <= "00000000";
        elsif rising_edge(clk) then
            data_out <= data_in; -- Correctly updates on clock edge
        end if;
    end process;
    -- Alternatively for a purely combinatorial approach
    -- data_out <= data_in;

end architecture;
```