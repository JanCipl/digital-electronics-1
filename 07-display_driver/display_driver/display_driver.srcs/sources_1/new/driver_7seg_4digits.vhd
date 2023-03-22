----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2023 11:09:59 AM
-- Design Name: 
-- Module Name: driver_7seg_4digits - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity driver_7seg_4digits is
 Port (clk     : in    std_logic;
    rst     : in    std_logic;
    data0   : in    std_logic_vector(3 downto 0);
    data1   : in    std_logic_vector(3 downto 0);
    data2   : in    std_logic_vector(3 downto 0);
    data3   : in    std_logic_vector(3 downto 0);
    dp_vect : in    std_logic_vector(3 downto 0);
    dp      : out   std_logic;
    seg     : out   std_logic_vector(6 downto 0);
    dig     : out   std_logic_vector(3 downto 0) );
end driver_7seg_4digits;

architecture Behavioral of driver_7seg_4digits is
-- Internal clock enable
  signal sig_en_4ms : std_logic;

  -- Internal 2-bit counter for multiplexing 4 digits
  signal sig_cnt_2bit : std_logic_vector(1 downto 0);

  -- Internal 4-bit value for 7-segment decoder
  signal sig_hex : std_logic_vector(3 downto 0);

begin
clk_en0 : entity work.clock_enable
    generic map (
      -- FOR SIMULATION, KEEP THIS VALUE TO 4
      -- FOR IMPLEMENTATION, CHANGE THIS VALUE TO 400,000
      -- 4      @ 4 ns
      -- 400000 @ 4 ms
      g_MAX => 400000
    )
    port map (
      clk => clk,
      rst => rst,
      ce  => sig_en_4ms
    );

  --------------------------------------------------------
  -- Instance (copy) of cnt_up_down entity performs
  -- a 2-bit down counter
  --------------------------------------------------------
  bin_cnt0 : entity work.cnt_up_down
    generic map (
      g_CNT_WIDTH =>2-- WRITE YOUR CODE HERE
    )
    port map (
      en => sig_en_4ms,
      rst => rst,
      clk => clk,
      cnt_up => '0',
      cnt => sig_cnt_2bit
    );

  --------------------------------------------------------
  -- Instance (copy) of hex_7seg entity performs
  -- a 7-segment display decoder
  --------------------------------------------------------
  hex2seg : entity work.hex_7seg
    port map (
      blank => rst,
      hex   => sig_hex,
      seg   => seg
    );

  --------------------------------------------------------
  -- p_mux:
  -- A sequential process that implements a multiplexer for
  -- selecting data for a single digit, a decimal point,
  -- and switches the common anodes of each display.
  --------------------------------------------------------
  p_mux : process (clk) is
  begin

    if (rising_edge(clk)) then
      if (rst = '1') then
        sig_hex <= data0;
        dp      <= dp_vect(0);
        dig     <= "1110";
      else

        case sig_cnt_2bit is

          when "11" =>
            sig_hex <= data3;
            dp      <= dp_vect(3);
            dig     <= "0111";

          when "10" =>
             sig_hex <= data2;
            dp      <= dp_vect(2);
            dig     <= "1011";

          when "01" =>
            sig_hex <= data1;
            dp      <= dp_vect(1);
            dig     <= "1101";

          when others =>
             sig_hex <= data0;
            dp      <= dp_vect(0);
            dig     <= "1110";

        end case;

      end if;
    end if;

  end process p_mux;

end Behavioral;
