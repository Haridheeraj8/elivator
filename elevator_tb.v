module elevator_tb;
  reg clk = 0;
  reg reset = 1;
  reg [3:0] floor_request;
  wire [1:0] current_floor;
  wire door_open;
  wire [1:0] direction;

  elevator_controller uut (
    .clk(clk),
    .reset(reset),
    .floor_request(floor_request),
    .current_floor(current_floor),
    .door_open(door_open),
    .direction(direction)
  );

  always #5 clk = ~clk;

  initial begin
    $dumpfile("elevator.vcd");
    $dumpvars(0, elevator_tb);

    #10 reset = 0;
    #10 floor_request = 4'b0100; // request floor 2
    #20 floor_request = 4'b0000;
    #50 floor_request = 4'b0001; // request floor 0
    #20 floor_request = 4'b0000;
    #100 $finish;
  end
endmodule
