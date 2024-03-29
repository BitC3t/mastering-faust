import("stdfaust.lib");
process = nentry("0/1/2", 0, 0, 2, 1) : select3(os.osc(0), os.osc(1), os.osc(2));
