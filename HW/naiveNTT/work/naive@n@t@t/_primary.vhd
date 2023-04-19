library verilog;
use verilog.vl_types.all;
entity naiveNTT is
    port(
        data_in         : in     vl_logic_vector(63 downto 0);
        omega           : in     vl_logic_vector(7 downto 0);
        \mod\           : in     vl_logic_vector(7 downto 0);
        o0              : out    vl_logic_vector(7 downto 0);
        o1              : out    vl_logic_vector(7 downto 0);
        o2              : out    vl_logic_vector(7 downto 0);
        o3              : out    vl_logic_vector(7 downto 0);
        o4              : out    vl_logic_vector(7 downto 0);
        o5              : out    vl_logic_vector(7 downto 0);
        o6              : out    vl_logic_vector(7 downto 0);
        o7              : out    vl_logic_vector(7 downto 0)
    );
end naiveNTT;
