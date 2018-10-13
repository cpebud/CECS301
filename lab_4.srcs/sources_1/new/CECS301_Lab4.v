`timescale 1ns / 1ps

/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:     Fname.v
 * Project:       Lab_Assignment_?
 * Designer:      Your Name
 * Email:         Your Email
 * Rev. No.:      Version 1.0
 * Rev. Date:     Current Rev. Date
 *
 * Purpose:       
 * 
 * Dependencies:  
 *         
 * Notes:         
 *
 ****************************************************************************/


module CECS301_Lab4( clk, reset, addr_step, wr_pulse, D_in, Dig, Seg );

    input         clk, 
                  reset,
                  addr_step,
                  wr_pulse;
    input  [15:0] D_in;
    
    output [7:0]  Dig;
    output [6:0]  Seg;
    
    reg           en = 1'b1;
    reg    [7:0]  pix_gnd = 8'h00;
    
    wire          clk_500Hz,
                  addr_db,
                  we_db;
    wire   [7:0]  addr;
    wire   [15:0] d_out;
    
    
    clk_div CD0 ( .clk_in(clk), .reset(reset), .clk_out(clk_500Hz) );
        
    oneshot_pulse OSP0 ( .D_in(addr_step), .clk(clk_500Hz), .reset(reset), .D_out(addr_db) ),
                  OSP1 ( .D_in(wr_pulse), .clk(clk_500Hz), .reset(reset), .D_out(we_db) );
    
    addr_seqr AS0 ( .clk(addr_db), .reset(reset), .addr(addr) );
        
    display_controller DC0 ( .D7(pix_gnd[7:4]), .D6(pix_gnd[3:0]), .D5(addr[7:4]), .D4(addr[3:0]), .D3(d_out[15:12]), .D2(d_out[11:8]), .D1(d_out[7:4]), .D0(d_out[3:0]), .clk(clk), .reset(reset), .an(Dig), .seg(Seg) );
    
    ram1 R0 ( .clk(clk), .en(en), .we(wr_pulse), .addr(addr), .D_in(D_in), .D_out(d_out) );
    
endmodule
