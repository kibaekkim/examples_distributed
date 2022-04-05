using MPI

MPI.Init()
comm = MPI.COMM_WORLD
comm_rank = MPI.Comm_rank(comm)

a = rand(1000000)

sum_of_a = 0.0
if comm_rank == 0
	sum_of_a = @time MPI.Allreduce(a, MPI.SUM, comm)
else
	sum_of_a = MPI.Allreduce(a, MPI.SUM, comm)
end

MPI.Finalize()

