`timescale 1ns / 1ps

module main(
    input wire clk,
    input wire rst,
    input wire en,
    input wire write_en,
    input wire read_en,
    input wire [7:0] data_in,
    output reg [7:0] data_out,
    output wire full_flag,
    output wire empty_flag
    );
    parameter depth = 16;
    localparam Addr_Width = $clog2(depth);
    reg [7:0] mem [0:7];
    
    reg [Addr_Width-1:0] write_ptr;
    reg [Addr_Width-1:0] read_ptr;
    
    reg [Addr_Width:0] count;
    
    assign full_flag = (count==depth);
    assign empty_flag = (count==0);
    
    always @(posedge clk) begin
    if(rst) begin
        write_ptr <= 0;
        read_ptr <= 0;
        count  <= 0;
        data_out   <= 0;
    end
    else begin
    if (write_en & !full_flag) begin
        mem[write_ptr] <= data_in;
        write_ptr <= write_ptr + 1'b1;
    end
    if (read_en && !empty_flag) begin
                data_out <= mem[read_ptr];
                read_ptr <= read_ptr + 1'b1;
            end 
    case ({write_en && !full_flag, read_en && !empty_flag})

                2'b10: count <= count + 1'b1;
                2'b01: count <= count - 1'b1;
                2'b11: count <= count;
                default: count <= count;
    endcase
    end
    end 
endmodule
