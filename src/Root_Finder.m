function [Roots] = Root_Finder(Matrix)

% This function translates the numerical values to their main name .

[R,C] = size(Matrix) ;
Roots = cell(R,8);

for i = 1 : R
    for j = 1 : Matrix(i,1)
        for k = 3 : C
            if Matrix(i,k) == j
                switch k
                    case 1
                        
                    case 2
                        
                    case 3
                        Roots{i,j} = {'Federal-gov'} ;
                    case 4
                        Roots{i,j} = {'Local-gov'} ;
                    case 5
                        Roots{i,j} = {'Private'} ;
                    case 6
                        Roots{i,j} = {'Self-emp-inc'} ;
                    case 7
                        Roots{i,j} = {'Self-emp-not-inc'} ;
                    case 8
                        Roots{i,j} = {'State-gov'} ;
                    case 9
                        Roots{i,j} = {'Without-pay'} ;
                    case 10
                        Roots{i,j} = {'10th'} ;
                    case 11
                        Roots{i,j} = {'11th'} ;
                    case 12
                        Roots{i,j} = {'12th'} ;
                    case 13
                        Roots{i,j} = {'1st-4th'} ;
                    case 14
                        Roots{i,j} = {'5th-6th'} ;
                    case 15
                        Roots{i,j} = {'7th-8th'} ;
                    case 16
                        Roots{i,j} = {'9th'} ;
                    case 17
                        Roots{i,j} = {'Assoc-acdm'} ;
                    case 18
                        Roots{i,j} = {'Assoc-voc'} ;
                    case 19
                        Roots{i,j} = {'Bachelors'} ;
                    case 20
                        Roots{i,j} = {'Doctorate'} ;
                    case 21
                        Roots{i,j} = {'HS-grad'} ;
                    case 22
                        Roots{i,j} = {'Masters'} ;
                    case 23
                        Roots{i,j} = {'Preschool'} ;
                    case 24
                        Roots{i,j} = {'Prof-school'} ;
                    case 25
                        Roots{i,j} = {'Some-college'} ;
                    case 26
                        Roots{i,j} = {'Divorced'} ;
                    case 27
                        Roots{i,j} = {'Married-AF-spouse'} ;
                    case 28
                        Roots{i,j} = {'Married-civ-spouse'} ;
                    case 29
                        Roots{i,j} = {'Married-spouse-absent'} ;
                    case 30
                        Roots{i,j} = {'Never-married'} ;
                    case 31
                        Roots{i,j} = {'Separated'} ;
                    case 32
                        Roots{i,j} = {'Widowed'} ;
                    case 33
                        Roots{i,j} = {'Adm-clerical'} ;
                    case 34
                        Roots{i,j} = {'Armed-Forces'} ;
                    case 35
                        Roots{i,j} = {'Craft-repair'} ;
                    case 36
                        Roots{i,j} = {'Exec-managerial'} ;
                    case 37
                        Roots{i,j} = {'Farming-fishing'} ;
                    case 38
                        Roots{i,j} = {'Handlers-cleaners'} ;
                    case 39
                        Roots{i,j} = {'Machine-op-inspct'} ;
                    case 40
                        Roots{i,j} = {'Other-service'} ;
                    case 41
                        Roots{i,j} = {'Priv-house-serv'} ;
                    case 42
                        Roots{i,j} = {'Prof-specialty'} ;
                    case 43
                        Roots{i,j} = {'Protective-serv'} ;
                    case 44
                        Roots{i,j} = {'Sales'} ;
                    case 45
                        Roots{i,j} = {'Tech-support'} ;
                    case 46
                        Roots{i,j} = {'Transport-moving'} ;
                    case 47
                        Roots{i,j} = {'Husband'} ;
                    case 48
                        Roots{i,j} = {'Not-in-family'} ;
                    case 49
                        Roots{i,j} = {'Other-relative'} ;
                    case 50
                        Roots{i,j} = {'Own-child'} ;
                    case 51
                        Roots{i,j} = {'Unmarried'} ;
                    case 52
                        Roots{i,j} = {'Wife'} ;
                    case 53
                        Roots{i,j} = {'Amer-Indian-Eskimo'} ;
                    case 54
                        Roots{i,j} = {'Asian-Pac-Islander'} ;
                    case 55
                        Roots{i,j} = {'Black'} ;
                    case 56
                        Roots{i,j} = {'Other'} ;
                    case 57
                        Roots{i,j} = {'White'} ;
                    case 58
                        Roots{i,j} = {'Female'} ;
                    case 59
                        Roots{i,j} = {'Male'} ;
                    case 60
                        Roots{i,j} = {'Cambodia'} ;
                    case 61
                        Roots{i,j} = {'Canada'} ;
                    case 62
                        Roots{i,j} = {'China'} ;
                    case 63
                        Roots{i,j} = {'Columbia'} ;
                    case 64
                        Roots{i,j} = {'Cuba'} ;
                    case 65
                        Roots{i,j} = {'Dominican-Republic'} ;
                    case 66
                        Roots{i,j} = {'Ecuador'} ;
                    case 67
                        Roots{i,j} = {'El-Salvador'} ;
                    case 68
                        Roots{i,j} = {'England'} ;
                    case 69
                        Roots{i,j} = {'France'} ;
                    case 70
                        Roots{i,j} = {'Germany'} ;
                    case 71
                        Roots{i,j} = {'Greece'} ;
                    case 72
                        Roots{i,j} = {'Guatemala'} ;
                    case 73
                        Roots{i,j} = {'Haiti'} ;
                    case 74
                        Roots{i,j} = {'Honduras'} ;
                    case 75
                        Roots{i,j} = {'Hong'} ;
                    case 76
                        Roots{i,j} = {'Hungary'} ;
                    case 77
                        Roots{i,j} = {'India'} ;
                    case 78
                        Roots{i,j} = {'Iran'} ;
                    case 79
                        Roots{i,j} = {'Ireland'} ;
                    case 80
                        Roots{i,j} = {'Italy'} ;
                    case 81
                        Roots{i,j} = {'Jamaica'} ;
                    case 82
                        Roots{i,j} = {'Japan'} ;
                    case 83
                        Roots{i,j} = {'Laos'} ;
                    case 84
                        Roots{i,j} = {'Mexico'} ;
                    case 85
                        Roots{i,j} = {'Nicaragua'} ;
                    case 86
                        Roots{i,j} = {'Outlying-US(Guam-USVI-etc)'} ;
                    case 87
                        Roots{i,j} = {'Peru'} ;
                    case 88
                        Roots{i,j} = {'Philippines'} ;
                    case 89
                        Roots{i,j} = {'Poland'} ;
                    case 90
                        Roots{i,j} = {'Portugal'} ;
                    case 91
                        Roots{i,j} = {'Puerto-Rico'} ;
                    case 92
                        Roots{i,j} = {'Scotland'} ;
                    case 93
                        Roots{i,j} = {'South'} ;
                    case 94
                        Roots{i,j} = {'Taiwan'} ;
                    case 95
                        Roots{i,j} = {'Thailand'} ;
                    case 96
                        Roots{i,j} = {'Trinadad&Tobago'} ;
                    case 97
                        Roots{i,j} = {'United-States'} ;
                    case 98
                        Roots{i,j} = {'Vietnam'} ;
                    case 99
                        Roots{i,j} = {'Yugoslavia'} ;
                end
            end
        end
    end
end

end