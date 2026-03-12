module internet_valve(
    input [15:0] sw,     
    input btnL, btnU,    //mux 
    input btnD, btnR,    //demux
    input btnC,          //enable
    output [15:0] led    
);

    wire mux_sel   = {btnU, btnL}; 
    wire demux_sel = {btnR, btnD}; 

// condition ? true : false
    wire mux_out;
    assign mux_out = (mux_sel == 2'b00) ? sw[3:0]   : // CEO
                     (mux_sel == 2'b01) ? sw[7:4]   : // You
                     (mux_sel == 2'b10) ? sw[11:8]  : // Fred
                                          sw[15:12];  // Jill default

    //library
    assign led[3:0]   = (btnC && demux_sel == 2'b00) ? mux_out : 4'b0000;
    //fire dep
    assign led[7:4]   = (btnC && demux_sel == 2'b01) ? mux_out : 4'b0000;
    //school
    assign led[11:8]  = (btnC && demux_sel == 2'b10) ? mux_out : 4'b0000;
    //rib shack
    assign led[15:12] = (btnC && demux_sel == 2'b11) ? mux_out : 4'b0000;

endmodule
