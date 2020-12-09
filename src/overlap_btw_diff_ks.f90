program reader
    use iso_fortran_env, ONLY: DP=> REAL64
    implicit none
    integer :: ik, nbnd, ispin, npol, ngw, igwx1, igwx2
    logical :: gamma_only
    complex(dp), allocatable :: evc1(:)
    complex(dp), allocatable :: evc2(:)
    complex(dp) :: res
    real(dp) :: scalef
    real(dp) :: xk(3), b1(3), b2(3), b3(3)
    integer :: ibnd
    integer :: dummy_int
    real(dp) :: dummy_real
    integer :: i
    character(*), parameter :: path = "data/Si/"

    open (unit = 1, file = path//"wfc1.dat", form = 'unformatted', status = 'old')
    open (unit = 2, file = path//"wfc2.dat", form = 'unformatted', status = 'old')
    read(1) ik, ispin, gamma_only, scalef
    read(1) ngw, igwx1, npol, nbnd
    read(1) xk
    read(1) b1, b2, b3
    read(1) dummy_int
    read(2) ik, ispin, gamma_only, scalef
    read(2) ngw, igwx2, npol, nbnd
    read(2) xk
    read(2) b1, b2, b3
    read(2) dummy_int

    allocate (evc1(igwx1))
    allocate (evc2(igwx2))
    read(1) evc1(1:igwx1)
    read(1) evc2(1:igwx2)

    res = cmplx(0, 0)
    do i = 1, igwx1 
        res = res + evc1(i) * conjg(evc2(i))
    end do

    print *, "The overlap btw k index 1 and 2 ", res

    close(1)
            
end program reader
