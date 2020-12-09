program reader
    use iso_fortran_env, ONLY: DP=> REAL64
    implicit none
    integer :: ik, nbnd, ispin, npol, ngw, igwx
    logical :: gamma_only
    complex(dp), allocatable :: evc(:)
    complex(dp) :: res
    real(dp) :: scalef
    real(dp) :: xk(3), b1(3), b2(3), b3(3)
    integer :: ibnd
    integer :: dummy_int
    real(dp) :: dummy_real
    integer :: i
    character(*), parameter :: path = "data/Si/"

    open (unit = 1, file = path//"wfc1.dat", form = 'unformatted', status = 'old')
    read(1) ik, ispin, gamma_only, scalef
    read(1) ngw, igwx, npol, nbnd
    read(1) xk
    read(1) b1, b2, b3
    read(1) dummy_int

    res = cmplx(0, 0)
    allocate (evc(igwx))
    read(1) evc(1:igwx)
    do i = 1, igwx
        res = res + evc(i) * conjg(evc(i))
    end do

    print *, "This is normalization condition about wfc1.dat"
    print *, "nbnd = 1", res

    res = cmplx(0, 0)
    read(1) evc(1:igwx)
    do i = 1, igwx
        res = res + evc(i) * conjg(evc(i))
    end do

    print *, "nbnd = 2", res

    close(1)
            
end program reader
