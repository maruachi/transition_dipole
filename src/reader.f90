program reader
    use iso_fortran_env, ONLY: DP=> REAL64
    implicit none
    integer :: ik, nbnd, ispin, npol, ngw, igwx
    logical :: gamma_only
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
    read(1) ngw, igwx, npol, nbnd
    read(1) xk
    read(1) b1, b2, b3
    print *, 'ik, ispin, gamma_only, scalef'
    write(*,*) ik, ispin, gamma_only, scalef
    print *, 'xk'
    write(*,*) xk
    print *, 'ngw, igwx, npol, nbnd'
    write(*,*) ngw, igwx, npol, nbnd
    print *, 'b1'
    write(*,*) b1
    print *, 'b2'
    write(*,*) b2
    print *, 'b3'
    write(*,*) b3
    read(2) ik, ispin, gamma_only, scalef
    read(2) ngw, igwx, npol, nbnd
    read(2) xk
    read(2) b1, b2, b3
    print *, 'ik, ispin, gamma_only, scalef'
    write(*,*) ik, ispin, gamma_only, scalef
    print *, 'xk'
    write(*,*) xk
    print *, 'ngw, igwx, npol, nbnd'
    write(*,*) ngw, igwx, npol, nbnd
    print *, 'b1'
    write(*,*) b1
    print *, 'b2'
    write(*,*) b2
    print *, 'b3'
    write(*,*) b3

    close(1)
            
end program reader
