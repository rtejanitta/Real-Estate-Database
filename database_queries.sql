SELECT H.addr
FROM House H;

SELECT H.addr, L.mlsNumber
FROM House H, Listings L
WHERE H.addr = L.addr;

SELECT H.addr
FROM House H
WHERE H.bedrooms = 3 AND H.bathrooms = 2;

SELECT H.addr, Pr.price
FROM House H, Property Pr
WHERE H.addr = Pr.addr AND H.bedrooms = 3 AND H.bathrooms = 2 AND H.addr = (SELECT addr FROM Property WHERE price >= 100000 AND price <= 250000)
ORDER BY Pr.price DESC;

SELECT B.addr, Pr.price
FROM BusinessProperty B, Property Pr 
WHERE B.addr = Pr.addr AND B.p_type = "Office Space" 
ORDER BY Pr.price DESC;

SELECT Ag.agentId, Ag.a_name, Ag.phone, Ag.dateStarted, F.f_name
FROM Agent Ag, Firm F
WHERE Ag.firmId = F.id;

SELECT L.addr
FROM Listings L
WHERE L.agentId = 001;

SELECT Ag.a_name, B.b_name
FROM Agent Ag, Buyer B, Works_With W
WHERE Ag.agentId = W.agentId AND B.id = W.buyerId
ORDER BY Ag.a_name;

SELECT W.agentId, Count(W.buyerId)
FROM Works_With W
GROUP BY W.agentId;

SELECT H.addr, Pr.price
FROM Buyer B, House H, Property Pr 
WHERE H.addr = Pr.addr AND B.id = 006 AND H.bedrooms = B.bedrooms AND H.bathrooms = B.bathrooms AND B.minimumPreferredPrice <= Pr.price AND B.maximumPreferredPrice >= Pr.price
ORDER BY Pr.price DESC;