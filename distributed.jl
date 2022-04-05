using Distributed, ClusterManagers

addprocs(
	SlurmManager(64), 
	N=2, 
	partition="bdwall", 
	t="00:5:00", 
	ntasks_per_node=32
)

as = []
for i in workers()
	a = @spawnat i rand(1000000)
	push!(as, a)
end
sum_of_a = @time sum(fetch(as[i]) for i in 1:length(as))

for i in workers()
	rmprocs(i)
end	

