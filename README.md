# LIBSVMdata.jl

[![Build Status](https://github.com/TheoGuyard/LIBSVMdata.jl/workflows/CI/badge.svg)](https://github.com//TheoGuyard/LIBSVMdata.jl/actions)
[![Coverage](https://codecov.io/gh/TheoGuyard/LIBSVMdata.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/TheoGuyard/LIBSVMdata.jl)

A simple tool to fetch [LIBSVM](http://www.csie.ntu.edu.tw/~cjlin/libsvm/) datasets to [Julia](https://julialang.org). 

**Some datasets are not covered by CI tests due to their data size. Please report any bug in the [issues](https://github.com/TheoGuyard/LIBSVMdata.jl/issues) page.**

## Usage

The design matrix `A` and the response variable `y` corresponding to a given dataset (`a1a` in this example) can be loaded as follows :
```julia
using LIBSVMdata
A, y = load_dataset("a1a", 
    dense   = false,
    replace = false, 
    verbose = true,
)
```
All the datasets are stored in the folder specified by the environnement variable `LIBSVMDATA_HOME` if it exists. Otherwise, they are stored under `$HOME/data/libsvm`.

**Arguments :**
* `dataset::String`: Name of the dataset. All the available datasets can be found using the `print_datasets()` function.
* `dense::Bool=false`: If `true`, the feature matrix `A` returned is dense. Otherwise, it is sparse.
* `replace::Bool=false`: If `true`, the dataset is re-downloaded even if it already exists in the dataset directory.
* `verbose::Bool=true`: If `true`, toggle verbosity.


## Available datasets
The available datasets can be listed using the `print_datasets()` function. This function also specifies the dataset type, the number of data points, the number of features and the number of different classes. If the dataset is a regression one, the number of classes is arbitrarily set to `Inf`.
```julia
using LIBSVMdata

print_datasets()
==================================================================================
Dataset name              | Type            | Data       | Features   | Classes   
----------------------------------------------------------------------------------
a1a                       | binary          | 1605       | 123        | 2         
a1a.t                     | binary          | 30956      | 123        | 2         
a2a                       | binary          | 2265       | 123        | 2         
a2a.t                     | binary          | 30296      | 123        | 2         
a3a                       | binary          | 3185       | 123        | 2         
a3a.t                     | binary          | 29376      | 123        | 2         
a4a                       | binary          | 4781       | 123        | 2         
a4a.t                     | binary          | 27780      | 123        | 2         
a5a                       | binary          | 6414       | 123        | 2         
a5a.t                     | binary          | 26147      | 123        | 2         
a6a                       | binary          | 11220      | 123        | 2         
a6a.t                     | binary          | 21341      | 123        | 2         
a7a                       | binary          | 16100      | 123        | 2         
a7a.t                     | binary          | 16461      | 123        | 2         
a8a                       | binary          | 22696      | 123        | 2         
a8a.t                     | binary          | 9865       | 123        | 2         
a9a                       | binary          | 32561      | 123        | 2         
a9a.t                     | binary          | 16281      | 123        | 2         
australian                | binary          | 690        | 14         | 2         
australian_scale          | binary          | 690        | 14         | 2         
avazu-app                 | binary          | 14596137   | 1000000    | 2         
avazu-app.t               | binary          | 1719304    | 1000000    | 2         
avazu-app.tr              | binary          | 12642186   | 1000000    | 2         
avazu-app.val             | binary          | 1953951    | 1000000    | 2         
avazu-site                | binary          | 25831830   | 1000000    | 2         
avazu-site.t              | binary          | 2858160    | 1000000    | 2         
avazu-site.tr             | binary          | 23567843   | 1000000    | 2         
avazu-site.val            | binary          | 2264987    | 1000000    | 2         
breast-cancer             | binary          | 683        | 10         | 2         
breast-cancer_scale       | binary          | 683        | 10         | 2         
cod-rna                   | binary          | 59535      | 8          | 2         
cod-rna.t                 | binary          | 271617     | 8          | 2         
cod-rna.r                 | binary          | 157413     | 8          | 2         
colon-cancer              | binary          | 62         | 2000       | 2         
covtype.binary            | binary          | 581012     | 54         | 2         
covtype.binary.scale      | binary          | 581012     | 54         | 2         
diabetes                  | binary          | 768        | 8          | 2         
diabetes_scale            | binary          | 768        | 8          | 2         
duke                      | binary          | 44         | 7129       | 2         
duke.tr                   | binary          | 38         | 7129       | 2         
duke.val                  | binary          | 4          | 7129       | 2         
epsilon                   | binary          | 400000     | 2000       | 2         
epsilon.t                 | binary          | 100000     | 2000       | 2         
fourclass                 | binary          | 862        | 2          | 2         
fourclass_scale           | binary          | 862        | 2          | 2         
german.number             | binary          | 1000       | 24         | 2         
german.number_scale       | binary          | 1000       | 24         | 2         
gisette_scale             | binary          | 6000       | 5000       | 2         
gisette_scale.t           | binary          | 1000       | 5000       | 2         
heart                     | binary          | 270        | 13         | 2         
heart_scale               | binary          | 270        | 13         | 2         
HIGGS                     | binary          | 11000000   | 28         | 2         
ijcnn                     | binary          | 49990      | 22         | 2         
ijcnn.t                   | binary          | 91701      | 22         | 2         
ijcnn.tr                  | binary          | 35000      | 22         | 2         
ijcnn.val                 | binary          | 14990      | 22         | 2         
ionosphere_scale          | binary          | 351        | 34         | 2         
kdda                      | binary          | 8407752    | 20216830   | 2         
kdda.t                    | binary          | 510302     | 20216830   | 2         
kddb                      | binary          | 19264097   | 29890095   | 2         
kddb.t                    | binary          | 748401     | 29890095   | 2         
kdd12                     | binary          | 149639105  | 54686452   | 2         
kdd12.tr                  | binary          | 119705032  | 54686452   | 2         
kdd12.val                 | binary          | 29934073   | 54686452   | 2         
leukemia                  | binary          | 38         | 7129       | 2         
leukemia.t                | binary          | 34         | 7129       | 2         
liver-disorders           | binary          | 145        | 5          | 2         
liver-disorders_scale     | binary          | 145        | 5          | 2         
liver-disorders.t         | binary          | 200        | 5          | 2         
madelon                   | binary          | 2000       | 500        | 2         
madelon.t                 | binary          | 600        | 500        | 2         
mushrooms                 | binary          | 8124       | 112        | 2         
news20.binary             | binary          | 19996      | 1355191    | 2         
phishing                  | binary          | 11055      | 68         | 2         
rcv1_train.binary         | binary          | 20242      | 47236      | 2         
rcv1_test.binary          | binary          | 677399     | 47236      | 2         
ream-sim                  | binary          | 72309      | 20958      | 2         
skin_nonskin              | binary          | 245057     | 3          | 2         
splice                    | binary          | 1000       | 60         | 2         
splice_scale              | binary          | 1000       | 60         | 2         
splice.t                  | binary          | 2175       | 60         | 2         
splice-site               | binary          | 50000000   | 11725480   | 2         
splice-site.t             | binary          | 4627840    | 11725480   | 2         
sonar_scale               | binary          | 208        | 60         | 2         
SUSY                      | binary          | 5000000    | 18         | 2         
svmguide1                 | binary          | 3089       | 4          | 2         
svmguide1.t               | binary          | 4000       | 4          | 2         
svmguide3                 | binary          | 1243       | 22         | 2         
svmguide3.t               | binary          | 41         | 22         | 2         
url                       | binary          | 2396130    | 3231961    | 2         
url_normalized            | binary          | 2396130    | 3231961    | 2         
w1a                       | binary          | 2477       | 300        | 2         
w1a.t                     | binary          | 47272      | 300        | 2         
w2a                       | binary          | 3470       | 300        | 2         
w2a.t                     | binary          | 46279      | 300        | 2         
w3a                       | binary          | 4912       | 300        | 2         
w3a.t                     | binary          | 44837      | 300        | 2         
w4a                       | binary          | 7366       | 300        | 2         
w4a.t                     | binary          | 42383      | 300        | 2         
w5a                       | binary          | 9888       | 300        | 2         
w5a.t                     | binary          | 39861      | 300        | 2         
w6a                       | binary          | 17188      | 300        | 2         
w6a.t                     | binary          | 32561      | 300        | 2         
w7a                       | binary          | 24692      | 300        | 2         
w7a.t                     | binary          | 25057      | 300        | 2         
w8a                       | binary          | 49749      | 300        | 2         
w8a.t                     | binary          | 14951      | 300        | 2         
webspam-trigram           | binary          | 350000     | 16609143   | 2         
webspam-unigram           | binary          | 350000     | 16609143   | 2         
aloi                      | multiclass      | 108000     | 128        | 1000      
aloi.scale                | multiclass      | 108000     | 128        | 1000      
cifar10                   | multiclass      | 50000      | 3072       | 10        
cifar10.t                 | multiclass      | 50000      | 3072       | 10        
connect-4                 | multiclass      | 67557      | 126        | 3         
covtype                   | multiclass      | 581012     | 54         | 7         
covtype.scale01           | multiclass      | 581012     | 54         | 7         
covtype.scale             | multiclass      | 581012     | 54         | 7         
dna.scale                 | multiclass      | 2000       | 180        | 3         
dna.scale.t               | multiclass      | 1186       | 180        | 3         
dna.scale.tr              | multiclass      | 1400       | 180        | 3         
dna.scale.val             | multiclass      | 600        | 180        | 3         
glass.scale               | multiclass      | 214        | 9          | 6         
iris.scale                | multiclass      | 150        | 4          | 3         
letter.scale              | multiclass      | 15000      | 16         | 26        
letter.scale.t            | multiclass      | 5000       | 16         | 26        
letter.scale.tr           | multiclass      | 10500      | 16         | 26        
letter.scale.val          | multiclass      | 4500       | 16         | 26        
mnist                     | multiclass      | 60000      | 780        | 10        
mnist.t                   | multiclass      | 10000      | 778        | 10        
mnist.scale               | multiclass      | 60000      | 780        | 10        
mnist.scale.t             | multiclass      | 10000      | 778        | 10        
mnist8m                   | multiclass      | 8100000    | 784        | 10        
mnist8m.scale             | multiclass      | 8100000    | 784        | 10        
news20                    | multiclass      | 15935      | 62061      | 20        
news20.t                  | multiclass      | 3993       | 62060      | 20        
news20.scale              | multiclass      | 15935      | 62061      | 20        
news20.t.scale            | multiclass      | 3993       | 62060      | 20        
pendigits                 | multiclass      | 7494       | 16         | 10        
pendigits.t               | multiclass      | 3498       | 16         | 10        
poker                     | multiclass      | 25010      | 10         | 10        
poker.t                   | multiclass      | 1000000    | 10         | 10        
protein                   | multiclass      | 17766      | 357        | 3         
protein.t                 | multiclass      | 6621       | 357        | 3         
protein.tr                | multiclass      | 14895      | 357        | 3         
protein.val               | multiclass      | 2871       | 357        | 3         
rcv1_tain.multiclass      | multiclass      | 15564      | 47236      | 53        
rcv1_test.multiclass      | multiclass      | 518571     | 47236      | 53        
satimage.scale            | multiclass      | 4435       | 36         | 6         
satimage.scale.t          | multiclass      | 2000       | 36         | 6         
satimage.scale.tr         | multiclass      | 3104       | 36         | 6         
satimage.scale.val        | multiclass      | 1331       | 36         | 6         
sector                    | multiclass      | 6412       | 55197      | 105       
sector.t                  | multiclass      | 3207       | 55197      | 105       
sector.scale              | multiclass      | 6412       | 55197      | 105       
sector.scale.t            | multiclass      | 3207       | 55197      | 105       
segment.scale             | multiclass      | 2310       | 19         | 7         
Sensorless                | multiclass      | 58509      | 48         | 11        
Sensorless.scale          | multiclass      | 58509      | 48         | 11        
Sensorless.scale.tr       | multiclass      | 10000      | 48         | 11        
shuttle.scale             | multiclass      | 43500      | 9          | 7         
shuttle.scale.t           | multiclass      | 14500      | 9          | 7         
shuttle.scale.tr          | multiclass      | 30450      | 9          | 7         
shuttle.scale.val         | multiclass      | 13050      | 9          | 7         
smallNORB                 | multiclass      | 24300      | 18432      | 5         
smallNORB.t               | multiclass      | 24300      | 18432      | 5         
smallNORB-32x32           | multiclass      | 24300      | 2048       | 5         
smallNORB-32x32.t         | multiclass      | 24300      | 2048       | 5         
SVHN                      | multiclass      | 73257      | 3072       | 10        
SVHN.t                    | multiclass      | 26032      | 3072       | 10        
SVHN.extra                | multiclass      | 531131     | 3072       | 10        
SVHN.scale                | multiclass      | 73257      | 3072       | 10        
SVHN.scale.t              | multiclass      | 26032      | 3072       | 10        
SVHN.scale.extra          | multiclass      | 531131     | 3072       | 10        
svmguide2                 | multiclass      | 391        | 20         | 3         
svmguide4                 | multiclass      | 300        | 10         | 6         
svmguide4.t               | multiclass      | 312        | 10         | 6         
usps                      | multiclass      | 7291       | 256        | 10        
usps.t                    | multiclass      | 2007       | 256        | 10        
acoustic                  | multiclass      | 78823      | 50         | 3         
acoustic.t                | multiclass      | 19705      | 50         | 3         
acoustic_scale            | multiclass      | 78823      | 50         | 3         
acoustic_scale.t          | multiclass      | 19705      | 50         | 3         
combined                  | multiclass      | 78823      | 100        | 3         
combined.t                | multiclass      | 19705      | 100        | 3         
combined_scale            | multiclass      | 78823      | 100        | 3         
combined_scale.t          | multiclass      | 19705      | 100        | 3         
vehicle.scale             | multiclass      | 846        | 18         | 4         
vowel                     | multiclass      | 528        | 10         | 11        
vowel.t                   | multiclass      | 426        | 10         | 11        
vowel.scale               | multiclass      | 528        | 10         | 11        
vowel.scale.t             | multiclass      | 426        | 10         | 11        
wine.scale                | multiclass      | 178        | 13         | 3         
abalone                   | regression      | 4177       | 8          | Inf       
abalone_scale             | regression      | 4177       | 8          | Inf       
bodyfat                   | regression      | 252        | 14         | Inf       
bodyfat_scale             | regression      | 252        | 14         | Inf       
cadata                    | regression      | 20640      | 8          | Inf       
cpusmall                  | regression      | 8192       | 12         | Inf       
cpusmall_scale            | regression      | 8192       | 12         | Inf       
E2006-log1p.train         | regression      | 16087      | 4272227    | Inf       
E2006-log1p.test          | regression      | 3308       | 4272227    | Inf       
E2006.train               | regression      | 16087      | 150360     | Inf       
E2006.test                | regression      | 3308       | 150360     | Inf       
eunite2001                | regression      | 336        | 16         | Inf       
eunite2001.t              | regression      | 31         | 16         | Inf       
housing                   | regression      | 506        | 13         | Inf       
housing_scale             | regression      | 506        | 13         | Inf       
mg                        | regression      | 1385       | 6          | Inf       
mg_scale                  | regression      | 1385       | 6          | Inf       
mgp                       | regression      | 392        | 7          | Inf       
mgp_scale                 | regression      | 392        | 7          | Inf       
pyrim                     | regression      | 74         | 27         | Inf       
space_ga                  | regression      | 3107       | 6          | Inf       
space_ga_scale            | regression      | 3107       | 6          | Inf       
triazines                 | regression      | 186        | 60         | Inf       
triazines_scale           | regression      | 186        | 60         | Inf       
YearPredictionMSD         | regression      | 463715     | 90         | Inf       
YearPredictionMSD.t       | regression      | 51630      | 90         | Inf       
bibtex                    | multilabel      | 7395       | 1836       | 159       
BlogCatalog_deepwalk      | multilabel      | 10312      | 128        | 39        
BlogCatalog_line          | multilabel      | 10312      | 128        | 39        
BlogCatalog_node2vec      | multilabel      | 10312      | 128        | 39        
delicious                 | multilabel      | 16105      | 500        | 983       
eurlex_tfidf_train        | multilabel      | 15449      | 186104     | 3956      
eurlex_tfidf_test         | multilabel      | 3865       | 186104     | 3956      
flickr_deepwalk           | multilabel      | 80513      | 128        | 195       
flickr_line               | multilabel      | 80513      | 128        | 195       
flickr_node2vec           | multilabel      | 80513      | 128        | 195       
exp1-train                | multilabel      | 30993      | 120        | 101       
exp1-test                 | multilabel      | 12914      | 120        | 101       
ppi_deepwalk              | multilabel      | 56944      | 128        | 121       
ppi_line                  | multilabel      | 56944      | 128        | 121       
ppi_node2vec              | multilabel      | 56944      | 128        | 121       
rcv1subset_topics_train_1 | multilabel      | 3000       | 47236      | 101       
rcv1subset_topics_train_2 | multilabel      | 3000       | 47236      | 101       
rcv1subset_topics_train_3 | multilabel      | 3000       | 47236      | 101       
rcv1subset_topics_train_4 | multilabel      | 3000       | 47236      | 101       
rcv1subset_topics_train_5 | multilabel      | 3000       | 47236      | 101       
rcv1subset_topics_test_1  | multilabel      | 3000       | 47236      | 101       
rcv1subset_topics_test_2  | multilabel      | 3000       | 47236      | 101       
rcv1subset_topics_test_3  | multilabel      | 3000       | 47236      | 101       
rcv1subset_topics_test_4  | multilabel      | 3000       | 47236      | 101       
rcv1subset_topics_test_5  | multilabel      | 3000       | 47236      | 101       
rcv1_topics_train         | multilabel      | 23149      | 47236      | 101       
rcv1_topics_test_0        | multilabel      | 199328     | 47236      | 101       
rcv1_topics_test_1        | multilabel      | 199339     | 47236      | 101       
rcv1_topics_test_2        | multilabel      | 199576     | 47236      | 101       
rcv1_topics_test_3        | multilabel      | 183022     | 47236      | 101       
rcv1_topics_combined_test | multilabel      | 781265     | 47236      | 101       
rcv1_industries_train     | multilabel      | 23149      | 47236      | 313       
rcv1_industries_test_0    | multilabel      | 23149      | 781265     | 313       
rcv1_industries_test_1    | multilabel      | 23149      | 781265     | 313       
rcv1_industries_test_2    | multilabel      | 23149      | 781265     | 313       
rcv1_industries_test_3    | multilabel      | 23149      | 781265     | 313       
rcv1_regions_train        | multilabel      | 23149      | 47236      | 228       
rcv1_regions_test_0       | multilabel      | 23149      | 781265     | 228       
rcv1_regions_test_1       | multilabel      | 23149      | 781265     | 228       
rcv1_regions_test_2       | multilabel      | 23149      | 781265     | 228       
rcv1_regions_test_3       | multilabel      | 23149      | 781265     | 228       
scene_train               | multilabel      | 1211       | 294        | 6         
scene_test                | multilabel      | 1196       | 294        | 6         
tmc2007_train             | multilabel      | 21519      | 30438      | 22        
tmc2007_test              | multilabel      | 7077       | 30438      | 22        
wiki10_31k_tfidf_train    | multilabel      | 14146      | 104374     | 30938     
wiki10_31k_tfidf_test     | multilabel      | 6616       | 104374     | 30938     
yeast_train               | multilabel      | 1500       | 103        | 14        
yeast_test                | multilabel      | 917        | 103        | 14        
youtube_deepwalk          | multilabel      | 1138499    | 128        | 46        
youtube_line              | multilabel      | 1138499    | 128        | 46        
youtube_node2vec          | multilabel      | 1138499    | 128        | 46        
==================================================================================
```

## Credits

The structure of this package is inspired from [libsvmdata](https://github.com/mathurinm/libsvmdata).
