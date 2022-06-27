using LIBSVMdata
using Test

@testset "LIBSVMdata.jl" begin
    test_datasets = Dict(
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
            "leukemia",
            "leukemia.t",
        ],
        "multiclass" => [
            "dna.scale",
            "iris.scale",
            "mnist",
            "protein",
        ],
        "regression" => [
            "abalone",
            "bodyfat",
            "housing",
            "pyrim",
        ],
        "multilabel" => [
            "bibtex",
            "scene_train",
            "scene_test",
        ]
    )
    for (dataset_type, datasets) in test_datasets
        @testset "$dataset_type" begin
            for dataset in datasets
                @testset "$dataset" begin
                    A, y = load_dataset(dataset, verbose=false)
                    @test size(A)[1] == size(y)[1]
                end
            end
        end
    end
end