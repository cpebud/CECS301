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


module display_controller( D7, D6, D5, D4, D3, D2, D1, D0, clk, reset, an, seg );

    input  [3:0] D7,
                 D6,
                 D5,
                 D4,
                 D3,
                 D2,
                 D1,
                 D0;
    input        clk,
                 reset;
                 
    output [7:0] an;
    output [6:0] seg; //g f e d c b a
    
    wire         clk_pix;
    wire   [2:0] seg_sel;
    wire   [3:0] hex;
    
    clk_pixel CP0 ( .clk_in(clk), .reset(reset), .clk_out(clk_pix) );
    
    pixel_controller PC0 ( .clk(clk_pix), .reset(reset), .an(an), .seg_sel(seg_sel) );
    
    ad_mux AM0 ( .D7(D7), .D6(D6), .D5(D5), .D4(D4), .D3(D3), .D2(D2), .D1(D1), .D0(D0), .sel(seg_sel), .Y(hex) );
    
    hexto7 HSD0 ( .X(hex), .Z(seg) );
    
endmodule
