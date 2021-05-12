set ORIG;
set DEST;

param supply {ORIG} >= 0;
param demand {DEST} >= 0;
param capacity {DEST} >= 0;
param dist {ORIG,DEST} >= 0;
var hektol {ORIG,DEST} >= 0;

param dist_gas_cost;

check: sum {i in ORIG} supply[i] >= sum {j in DEST} demand[j];
check {i in DEST}: demand[i] <= capacity[i];

minimize Total_cost: sum {i in ORIG, j in DEST} dist[i,j] * hektol[i,j] * dist_gas_cost;

s.t. Supply {i in ORIG}: sum {j in DEST} hektol[i, j] <= supply[i];
s.t. Demand {j in DEST}: sum {i in ORIG} hektol[i,j] = demand[j];
s.t. TruckCapacity {i in ORIG, j in DEST}: hektol[i,j] <= 10;