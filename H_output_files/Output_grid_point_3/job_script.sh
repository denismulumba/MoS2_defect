#!/bin/bash
cd Output_grid_point_3
mpirun -n 48 /bsuhome/denismulumba/q-e/bin/pw.x < INPUT > OUTPUT 2>&1