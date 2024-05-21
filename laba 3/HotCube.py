from fenics import *

T = 10.0            # final time
num_steps = 100     # number of time steps
dt = T / num_steps # time step size
alpha = 1          # parameter alpha
beta = 1.0         # parameter beta

# Create mesh and define function space
# nx = ny = 8
mesh = UnitCubeMesh(16, 16, 16)
V = FunctionSpace(mesh, 'P', 1)

# Define boundary condition
u_D = Expression('1*sin(t) + 20', degree=2, alpha=alpha, beta=beta, t=0)

def boundary(x, on_boundary):
    # return on_boundary and (x[0] > 2) and (x[0] < 5) and (x[1] > 2) and (x[1] < 5) and (x[2] > 2) and (x[2] < 5)
    return on_boundary and (x[0] > 0.3) and (x[0] < 0.7) and (x[1] > 0.4) and (x[1] < 0.6)

bc = DirichletBC(V, u_D, boundary)

# Define initial value
u_n = interpolate(u_D, V)
#u_n = project(u_D, V)

# Define variational problem
u = TrialFunction(V)
v = TestFunction(V)
f = Constant(0)

F = u*v*dx + dt*dot(grad(u), grad(v))*dx - (u_n + dt*f)*v*dx
a, L = lhs(F), rhs(F)
# a = div(grad(u)) * dt
# L = 1 * du

res_file = File('HotCube/solution.pvd')

# Time-stepping
u = Function(V)
t = 0
for n in range(num_steps):

    # Update current time
    t += dt
    u_D.t = t

    # Compute solution
    solve(a == L, u, bc)

    # Save solution to VTK
    res_file << u

    # Update previous solution
    u_n.assign(u)
