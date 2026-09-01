`timescale 1ns / 1ps

module main_tb();

    reg clk;
    reg rst;
    reg en;
    reg write_en;
    reg read_en;
    reg [7:0] data_in;

    wire [7:0] data_out;
    wire full_flag;
    wire empty_flag;

    main uut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .write_en(write_en),
        .read_en(read_en),
        .data_in(data_in),
        .data_out(data_out),
        .full_flag(full_flag),
        .empty_flag(empty_flag)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        rst = 1;
        en = 0;
        write_en = 0;
        read_en = 0;
        data_in = 8'h00;

        #10;
        rst = 0;

        #5; data_in = 8'h10; write_en = 1; read_en = 0;
        #10; data_in = 8'h20;
        #10; data_in = 8'h30;
        #10; data_in = 8'h40;
        #10; data_in = 8'h50;

        #5; write_en = 0;
        #5; read_en = 1;
        #10;
        #10;
        #10;
        #10;
        #10;
        #5; read_en = 0;
        #10; data_in = 8'hAA; write_en = 1;
        #10; data_in = 8'hBB;
        #10; data_in = 8'hCC;
        #10; data_in = 8'hDD;
        #5; write_en = 0;
        #5; read_en = 1;
        #10;
        #10;
        #10;
        #10;

        #5; read_en = 0;
        #10; data_in = 8'h01; write_en = 1;
        #10; data_in = 8'h02;
        #10; data_in = 8'h03;
        #10; data_in = 8'h04;
        #10; data_in = 8'h05;
        #10; data_in = 8'h06;
        #10; data_in = 8'h07;
        #10; data_in = 8'h08;

        #5; write_en = 0;
        #5; read_en = 1;
        #10;
        #10;
        #10;
        #10;
        #10;
        #10;
        #10;
        #10;

        #5; read_en = 0;

        #10;

        $finish;

    end

endmodule