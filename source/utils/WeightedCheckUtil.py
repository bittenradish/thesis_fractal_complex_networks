from enum import Enum

class GraphWeighting(str, Enum):
    WEIGHTED = "Weighted"
    UNWEIGHTED = "Unweighted"
    BOTH = "Both"
    UNKNOWN = "Unknown"

def is_weighted(entity)-> GraphWeighting:
    unweighted = "Unweighted" in entity["tags"]
    weighted = "Weighted" in entity["tags"]
    if weighted == unweighted and weighted == True:
        return GraphWeighting.BOTH
    elif unweighted == True and weighted == False:
        return GraphWeighting.UNWEIGHTED
    elif unweighted == False and weighted == True:
        return GraphWeighting.WEIGHTED
    else:
        return GraphWeighting.UNKNOWN