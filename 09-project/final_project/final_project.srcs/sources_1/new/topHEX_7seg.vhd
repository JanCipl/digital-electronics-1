----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2023 11:32:30 AM
-- Design Name: 
-- Module Name: topHEX_7seg - Behavioral
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

entity topHEX_7seg is
  Port ( 
    SW   : in    std_logic_vector(9 downto 0);
    CA   : out   std_logic;
    CB   : out   std_logic;
    CC   : out   std_logic;
    CD   : out   std_logic;
    CE   : out   std_logic;
    CF   : out   std_logic;
    CG   : out   std_logic;
    AN   : out   std_logic_vector(7 downto 0);
    BTNC : in    std_logic
  );
end topHEX_7seg;

architecture Behavioral of topHEX_7seg is

begin
 hex2seg : entity work.hex_7seg
      port map(
          reset  => BTNC,
          hex    => SW,
          seg(6) => CA,
          seg(5) => CB,
          seg(4) => CC,
          seg(3) => CD,
          seg(2) => CE,
          seg(1) => CF,
          seg(0) => CG
      );
      
       AN <= b"1111_1110";
end Behavioral;
