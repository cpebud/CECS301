`timescale 1ns / 1ps

/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:     display_controller.v
 * Project:       Lab_Assignment_4
 * Designer:      Garrett Cross (Anton Massey)
 * Email:         garrett.cross@student.csulb.edu
 * Rev. No.:      Version 1.0
 * Rev. Date:     10/5/18
 *
 * Purpose:       
 * 
 * Dependencies:  
 *         
 * Notes:         
 *
 ****************************************************************************/

module display_controller( dig3, dig2, dig1, dig0, clk, rst, an, seg );
    
    input        clk, rst;
    input [3:0]  dig3, dig2, dig1, dig0;
    
    output [7:0] an;
    output [6:0] seg;
    
    reg    [3:0] seq3 = 4'hA,
                 seq2 = 4'hB,
                 seq1 = 4'hC,
                 seq0 = 4'hD;
    
    wire         clk_pixel;
    wire [2:0]   seg_sel;
    wire [3:0]   hex;
    
    clk_pixel           CP0( .clk_in(clk), .reset(rst), .clk_out(clk_pixel) );
    
    pixel_controller    PC0( .clk(clk_pixel), .reset(rst), .an(an), .seg_sel(seg_sel) );
    
    ad_mux              AM0( .D7(seq3), .D6(seq2), .D5(seq1), .D4(seq0), .D3(dig3), .D2(dig2), 
                             .D1(dig1), .D0(dig0), .sel(seg_sel), .Y(hex) );
    
    hexto7              HT70( .X(hex), .Z(seg) );
    
endmodule
