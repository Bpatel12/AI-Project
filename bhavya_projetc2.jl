using Pkg



Pkg.add("Word2Vec")
Pkg.add("Gadfly")

using Word2Vec, Gadfly

word2vec("Downloads/text8", "text8-vec.txt",verbose=true)

model = wordvectors("text8-vec.txt")

cosine_similar_words(model, "wood")

word2clusters("Downloads/text8", "text8-class.txt",500)

cluster = wordclusters("text8-class.txt")

clusters(cluster)

get_cluster(cluster,"ice")

get_words(cluster,81)



function similar_print(word,size)
    print(cosine_similar_words(model,word,size))
end

similar_print("air",10)

function closeness(w1,w2)
    return similarity(model,w1,w2)
end

closeness("wind","temperature")

closeness("cycle","bike")

function chart_similarity(word,model)
    idxs, dists = cosine(model,word)
    vocab = vocabulary(model)
    plot(x=vocab[idxs],y=dists)
end

chart_similarity("sea",model)

y = get_vector(model,"divorce")

?analogy_words

analogy_words(model, ["man", "woman","king"], ["queen","child"], 10)

chart_similarity("river",model)

y = get_vector(model,"death")


