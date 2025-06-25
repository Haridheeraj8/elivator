module elevator_controller (
    input clk,
    input reset,
    input [3:0] floor_request, // 4 floors: bits 0 to 3
    output reg [1:0] current_floor,
    output reg door_open,
    output reg [1:0] direction // 00: idle, 01: up, 10: down
);

reg [1:0] next_floor;
reg [3:0] requests;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_floor <= 2'd0;
        door_open <= 0;
        direction <= 2'b00;
        requests <= 4'b0000;
    end else begin
        requests <= requests | floor_request;

        case (current_floor)
            2'd0: begin
                if (requests[1]) begin current_floor <= 2'd1; direction <= 2'b01; end
                else if (requests[2]) begin current_floor <= 2'd2; direction <= 2'b01; end
                else if (requests[3]) begin current_floor <= 2'd3; direction <= 2'b01; end
                else direction <= 2'b00;
            end
            2'd1: begin
                if (requests[0]) begin current_floor <= 2'd0; direction <= 2'b10; end
                else if (requests[2]) begin current_floor <= 2'd2; direction <= 2'b01; end
                else if (requests[3]) begin current_floor <= 2'd3; direction <= 2'b01; end
                else direction <= 2'b00;
            end
            2'd2: begin
                if (requests[3]) begin current_floor <= 2'd3; direction <= 2'b01; end
                else if (requests[1]) begin current_floor <= 2'd1; direction <= 2'b10; end
                else if (requests[0]) begin current_floor <= 2'd0; direction <= 2'b10; end
                else direction <= 2'b00;
            end
            2'd3: begin
                if (requests[2]) begin current_floor <= 2'd2; direction <= 2'b10; end
                else if (requests[1]) begin current_floor <= 2'd1; direction <= 2'b10; end
                else if (requests[0]) begin current_floor <= 2'd0; direction <= 2'b10; end
                else direction <= 2'b00;
            end
        endcase

        if (requests[current_floor]) begin
            door_open <= 1;
            requests[current_floor] <= 0;
        end else begin
            door_open <= 0;
        end
    end
end

endmodule
