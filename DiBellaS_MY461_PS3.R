library(igraph)
library(igraphdata)
library(intergraph)
library(scales)
library(ergm)

data("faux.dixon.high")
detach(package:ergm) ## the statnet and igraph packages don't always play well together, so we need to "detach" the statnet packages
require(igraph)
dixon<-asIgraph(faux.dixon.high)

summary(dixon)
graph.density(dixon)
plot(dixon,vertex.label=NA,edge.arrow.size=0.25,vertex.size=3,edge.width=0.5)

table(V(dixon)$race)

vertex_attr(dixon)
?vertex.attributes      

deg <- degree(dixon)
summary(deg)
i_deg <- degree(dixon,mode="in")
summary(i_deg)
hist(i_deg,breaks=20)

dlayout <- layout.fruchterman.reingold(dixon)
library(scales)
## plotting in-degree, with vertices showing grade
plot(dixon,vertex.color=V(dixon)$grade,vertex.size=rescale(i_deg,c(1,8)),edge.arrow.size=0.1,edge.width=0.5,vertex.label=NA,layout=dlayout)
legend("topright",legend=7:12,pch=19,col=categorical_pal(8)[c(7,8,1,2,3,4)]) # A legend to help make sense of the colouring; take my word for it that these are the right colours for each grade! 

pr <- page.rank(dixon)$vector
plot(dixon,vertex.color=V(dixon)$grade,vertex.size=rescale(pr,c(1,8)),edge.arrow.size=.1,edge.width=0.5,vertex.label=NA,layout=dlayout)
legend("topright",legend=7:12,pch=19,col=categorical_pal(8)[c(7,8,1,2,3,4)])
colors()
