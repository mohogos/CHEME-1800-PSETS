
"""
    read_compounds_file(path::String) -> Dict{String, MyChemicalCompoundModel}

TODO: Describe what this function is doing, the args and the what is contained in the data that is returned.
"""
function read_compounds_file(path::String; delim=',')::Dict{String, MyChemicalCompoundModel}
    
    # check: is path legit?
    # in production we would check this path, assume ok for now

    # initialize -
    compounds = Dict{String, MyChemicalCompoundModel}()
    counter = 0; # zero-based index
    data = Dict{String,Array{Float64,1}}()
    header = Array{String,1}()

    # use example pattern from: https://varnerlab.github.io/CHEME-1800-Computing-Book/unit-1-basics/data-file-io.html#program-read-a-csv-file-refactored
    open(path, "r") do io # open a stream to the file
        for line in eachline(io) # read each line from the stream
            
            fields = split(line, delim);
            if (counter == 0)
                
                name = string(fields[1]);
                compound = string(fields[1]);

                model = build(MyChemicalCompoundModel, name, compound);
                # package the header -
                for value in fields
                    push!(header, value)
                end

                # update the counter -
                counter = counter + 1
            else

                # package -
                tmp = Array{Float64,1}()
                keyfield = fields[keyindex]
                for (i,value) in enumerate(fields)
                    if (i != keyindex)
                        push!(tmp, parse(Float64,value))
                    end
                end
                data[keyfield] = tmp;
            end
            # TODO: Implement the logid to process the records in the Test.data file
            # line is a line from the file  

            # A couple of things to think about: 
            # a) ignore the comments, check out the contains function: https://docs.julialang.org/en/v1/base/strings/#Base.contains
            # b) ignore the header data
            # c) records are comma delimited. Check out the split functions: https://docs.julialang.org/en/v1/base/strings/#Base.split
            # d) from the data in each reacord, we need to build a MyChemicalCompoundModel object. Each compound object should be stored in the compound dict with the name as the key
            
        end
    end

    # return -
    return compounds;
end