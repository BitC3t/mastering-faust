import("stdfaust.lib");
duplicate(1, n) = n;
duplicate(N, n) = duplicate(N-1, n), n;

process = duplicate(4, 3.14);