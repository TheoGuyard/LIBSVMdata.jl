using LIBSVMdata
using LIBSVM
using Printf
using Statistics
using Test

@testset "LIBSVMdata.jl" begin
    datasets = get_datasets()
    datasets_type = ["regression", "binary"]
    for dataset_type in datasets_type
        @testset "$dataset_type" begin
            filtered_datasets = Dict(
                name => dataset for (name, dataset) in datasets 
                if dataset[:type] == dataset_type
            )
            for dataset in keys(filtered_datasets)
                println("Testing $dataset...")
                @testset "$dataset" begin
                    A, y = load_dataset(dataset, verbose=false)
                    @test size(A)[1] == size(y)[1]
                    A, y = load_dataset(dataset, verbose=false, dense=true, normalize=true, replace=true)
                    @test size(A)[1] == size(y)[1]
                end
            end
        end
    end
end