using LIBSVMdata
using OrderedCollections
using Test

@testset "LIBSVMdata.jl" begin
    all_datasets = get_datasets()
    @testset "selected dataset" begin
        selected_datasets = Dict(
            "binary" => [
                "a1a",
                "a1a.t",
                "a2a",
                "a2a.t",
                "a3a",
                "a3a.t",
                "breast-cancer",
                "colon-cancer",
                "diabetes",
                "heart",
            ],
            "multiclass" => [
                "dna.scale",
                "iris.scale",
            ],
            "regression" => [
                "abalone",
                "bodyfat",
                "housing",
                "pyrim",
            ],
            "multilabel" => [
                "scene_train",
                "scene_test",
            ]
        )
        for (dataset_type, datasets) in selected_datasets
            @testset "$dataset_type" begin
                for dataset in datasets
                    @testset "$dataset" begin
                        A, y = load_dataset(dataset, verbose=false)
                        @test size(A)[1] == all_datasets[dataset][:dims][1]
                        @test size(A)[2] == all_datasets[dataset][:dims][2]
                        @test size(y)[1] == all_datasets[dataset][:dims][1]
                        A, y = load_dataset(dataset, verbose=false, dense=true)
                        @test size(A)[1] == all_datasets[dataset][:dims][1]
                        @test size(A)[2] == all_datasets[dataset][:dims][2]
                        @test size(y)[1] == all_datasets[dataset][:dims][1]
                    end
                end
            end
        end
    end
    @testset "download utilities" begin
        download_dataset = "colon-cancer"
        A, y = load_dataset(download_dataset, replace=true, verbose=false)
        @test size(A)[1] == all_datasets[download_dataset][:dims][1]
        @test size(A)[2] == all_datasets[download_dataset][:dims][2]
        @test size(y)[1] == all_datasets[download_dataset][:dims][1]
    end
    @testset "print utilities" begin
        datasets = get_datasets()
        @test isa(datasets, OrderedCollections.OrderedDict)
        print_datasets()
        @test true
    end
    @testset "errors" begin
        @test_throws ArgumentError load_dataset("aaa", verbose=false)
    end
end