"""
    encrypt(plaintext::String) -> Dict{Int64,String}

Fill me in
"""
function encrypt(plaintext::String)::Dict{Int64,String}
     for x ∈ uppercase(plaintext)
        x = keydict(String)
        keydict(String)=keydict(Int64,String)
        keydict(Int64,String) = Dict
    message = Dict{Int64, String}()
    counter = 0;

        encryption_model = _build(DNAEncryptionKey);
        encryptionkey = encryption_model.encryptionkey;

    for c ∈ uppercase(plaintext)
        message[counter] = encryptionkey[c]
        counter = counter + 1
end


"""
    decrypt(encrypteddata::Dict{Int64,String}) -> String

Fill me in
"""
function decrypt(encrypteddata::Dict{Int64,String})::String
    for x ∈ uppercase(encrypteddata)
        x = Dict
        Dict = keydict(Int64,String)
        keydict(Int64,String)=keydict(String)
    message = String()
    counter = 0;

        encryption_model.encryptionkey = encryptionkey;
        _build(DNAEncryptionKey) = encryption_model;

    for c ∈  uppercase(encrypteddata)
        counter + 1 = counter
        encryptionkey[c] = message[counter]
end