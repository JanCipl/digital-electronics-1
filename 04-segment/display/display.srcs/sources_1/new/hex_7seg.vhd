----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/01/2023 11:18:37 AM
-- Design Name: 
-- Module Name: hex_7seg - Behavioral
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

entity hex_7seg is
    Port ( reset : in STD_LOGIC;
            hex : in STD_LOGIC_VECTOR (9 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end hex_7seg;

architecture Behavioral of hex_7seg is

begin
 --------------------------------------------------------
  -- p_7seg_decoder:
  -- A combinational process for 7-segment display (Common
  -- Anode) decoder. Any time "hex" or "blank" is changed,
  -- the process is "executed". Output pin seg(6) controls
  -- segment A, seg(5) segment B, etc.
  --     segment A
  --      | segment B
  --      |  | segment C
  --      +-+|  |   ...   segment G
  --        ||+-+          |
  --        |||            |
  -- seg = "0000001"-------+
  --
  -- Display is clear/blank if signal blank = 1.
  --------------------------------------------------------

  p_7seg_decoder : process (reset, hex) is

  begin

    if (reset = '1') then
      seg <= "1111111";     -- Blanking display
    else
       --cisla
      case hex is
          when "1111111111" =>
          seg <= "0000001"; -- 0

          when "0111111111" =>
          seg <= "1001111"; -- 1

          when "0101111111" =>
          seg <= "0010010"; -- 2
          
          when "0101011111" =>
          seg <= "0000110"; -- 3
          
          when "0101010111" =>
          seg <= "1001100"; -- 4
          
          when "0101010101" =>
          seg <= "0100100"; -- 5
          
          when "1101010101" =>
          seg <= "0100000"; -- 6
          
          when "1111010101" =>
          seg <= "0001111"; -- 7
          
          when "1111110101" =>
          seg <= "0000000"; -- 8

          when "1111111101" =>
          seg <= "0000100"; -- 9
          
          
          --pismena
          when "0111000000" =>
          seg <= "0001000"; -- A
          
          when "1101010100" =>
          seg <= "1100000"; -- b
         
          when "1101110100" =>
          seg <= "0110001"; -- C
         
          when "1101010000" =>
          seg <= "1000010"; -- d

          when "0100000000" =>
          seg <= "0110000"; -- E

          when "0101110100" =>
          seg <= "0111000"; -- F
          
          when "1111010000" =>
          seg <= "0100001"; -- G
          
          when "0101010100" =>
          seg <= "1101000"; -- H
          
          when "0101000000" =>
          seg <= "1111001"; -- I
          
          when "0111111100" =>
          seg <= "1000011"; -- J
          
          when "1101110000" =>
          seg <= "0101000"; -- K
          
          when "0111010100" =>
          seg <= "1110001"; -- L
          
          when "1111000000" =>
          seg <= "0101011"; -- M
          
          when "1101000000" =>
          seg <= "0001001"; -- N
          
          when "1111110000" =>
          seg <= "1100010"; -- O
          
          when "0111110100" =>
          seg <= "0011000"; -- P
          
          when "1111011100" =>
          seg <= "0001100"; -- Q
          
          when "0111010000" =>
          seg <= "1111010"; -- R
          
          when "0101010000" =>
          seg <= "0100101"; -- S
          
          when "1100000000" =>
          seg <= "1110000"; -- T
          
          when "0101110000" =>
          seg <= "1000001"; -- U
          
          when "0101011100" =>
          seg <= "1010101"; -- V
          
          when "0111110000" =>
          seg <= "1010100"; -- W
          
          when "1101011100" =>
          seg <= "1101011"; -- X
          
          when "1101111100" =>
          seg <= "1000100"; -- Y
          
          when "1111010100" =>
          seg <= "0010011"; -- Z
          when others =>
          seg<="1111111"; --chyba v zadani kodu
      end case;

    end if;

  end process p_7seg_decoder;

end Behavioral;
