% Calculate SIFT descriptors for every action class in KTH dataset

total=100;
for i=1:total
    SIFT(i,'clap');
    fprintf("Class1 SIFT Done");
end

for i=1:total
    SIFT(i,'running');
    fprintf("Class2 SIFT Done");
end

for i=1:total
    SIFT(i,'boxing');
    fprintf("Class3 SIFT Done");
end

for i=1:total
    SIFT(i,'waving');
    fprintf("Class4 SIFT Done");
end

for i=1:total
    SIFT(i,'walking');
    fprintf("Class5 SIFT Done");
end

for i=1:total
    SIFT(i,'jogging');
    fprintf("Class6 SIFT Done");
end