reader: ./src/reader.f90
	gfortran ./src/reader.f90 -o reader

self_overlap: ./src/self_overlap.f90
	gfortran ./src/self_overlap.f90 -o self_overlap

orthogonal_overlap: ./src/orthogonal_overlap.f90
	gfortran ./src/orthogonal_overlap.f90 -o orthogonal_overlap
