`timescale 1ns / 1ps

/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:     ram1.v
 * Project:       Lab_Assignment_4
 * Designer:      Garrett Cross
 * Email:         garrett.cross@student.csulb.edu
 * Rev. No.:      Version 1.0
 * Rev. Date:     10/10/18
 *
 * Purpose:       
 * 
 * Dependencies:  
 *         
 * Notes:         
 *
 ****************************************************************************/


module ram1( clk, en, we, addr, D_in, D_out );

    input         clk, en, we;
    input  [7:0]  addr;
    input  [15:0] D_in;
    output [15:0] D_out;
    
    ram_256x16 ram1( .clka(clk), 
                     .ena(en), 
                     .wea(we), 
                     .addra(addr),
                     .dina(D_in), 
                     .douta(D_out));
  
endmodule
