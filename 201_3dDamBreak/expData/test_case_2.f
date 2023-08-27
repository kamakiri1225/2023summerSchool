C                     *******************
                       PROGRAM GEOMETRIE
C                     *******************
C-----------------------------------------------------------------------
C
C R. Issa          
C +33(0)1-30-87-84-28  
C LNHE - 2005
C
C FONCTION : Definit la geometrie initiale du systeme
C FUNCTION : Defines the initial system geometry
C
C PROGRAMMES APPELANT : -
C CALLED BY            
C
C PROGRAMMES APPELES  : -
C CALLED PROGRAMS       
C                       
C----------------------------------------------------------------------
C                         MAIN VARIABLES
C .________________.___._______________________________________________
C !           !      !                                                !
C !   NAME    !UNITY !               MEANING                          !
C !___________!______!________________________________________________!
C !           !      !                                                !
C ! DR        !  M   ! INITIAL INTERPARTICLE SPACING                  !
C ! KPAR      !  -   ! PARTICLE  TYPE                                 !
C ! 1 --> FLUID, 2 --> WALL, 3 --> FICTITIOUS                         !
C ! NPMAX     !  -   ! MAXIMUM PARTICLE NUMBER                        !
C ! NPARB     !  -   ! NUMBER OF EDGE PARTICLES                       !
C ! NPARF     !  -   ! NUMBER OF FLUID PARTICLES                      !
C ! NPART     !  -   ! TOTAL PARTICLE NUMBER                          !
C ! X, Z, Y   !  M   ! PARTICLE POSITION                              !
C !___________!______!________________________________________________!
C
C Variables
C==========
C
      IMPLICIT NONE
C
C Variables
C==========
C
      INTEGER NPMAX , NPARF , NPARB, NPART
      INTEGER I     , K     , J    , L
C
      PARAMETER (NPMAX=500000)
C
      DOUBLE PRECISION DR  , XMIN , XMAX
      DOUBLE PRECISION ZMIN, ZMAX
      DOUBLE PRECISION YMIN, YMAX
C
      LOGICAL FLAG
C
      INTEGER KPAR   (NPMAX)
C
      DOUBLE PRECISION X(NPMAX), Z(NPMAX)
      DOUBLE PRECISION Y(NPMAX)
C
C Placement des particules
C=========================
C Particles placing
C==================
C
      DR=55.D0/30.D0
C
C Particules fluides
C-------------------
C Fluid particles
C----------------
C
      K=0
      DO L=1,54
       DO I=1,67
        DO J=1,30
          K=K+1
          X      (K)=DBLE(I)*DR
          Z      (K)=DBLE(J)*DR
          Y      (K)=DBLE(L)*DR
          KPAR   (K)=1
        ENDDO
       ENDDO
      ENDDO
C
      NPARF=K
C
C Particules de bord
C-------------------
C Wall particles
C---------------
C
C Paroi inferieure
C.................
C Bottom wall
C............
C
      DO J=1,62
       DO I=1,183
        K=K+1
        X      (K)=(I-4)*DR
        Y      (K)=(J-4)*DR
        Z      (K)=0.
        KPAR   (K)=2
       ENDDO
      ENDDO
C
C Parois laterales xz
C....................
C xz walls
C.........
C
      DO I=1,183
       DO J=1,55
        K=K+1
        X      (K)=(I-4)*DR
        Z      (K)=J*DR
        Y      (K)=0.
        KPAR   (K)=2
       ENDDO
      ENDDO
C
      DO I=1,183
       DO J=1,55
        K=K+1
        X      (K)=(I-4)*DR
        Z      (K)=J*DR
        Y      (K)=100.8333
        KPAR   (K)=2
       ENDDO
      ENDDO
C
C Parois laterales yz
C....................
C yz walls
C.........
C
      DO I=1,55
       DO J=1,54
        K=K+1
        X      (K)=0.
        Z      (K)=I*DR
        Y      (K)=J*DR
        KPAR   (K)=2
       ENDDO
      ENDDO
C
      DO I=1,55
       DO J=1,54
        K=K+1
        X      (K)=322.666
        Z      (K)=I*DR
        Y      (K)=J*DR
        KPAR   (K)=2
       ENDDO
      ENDDO
C
C Parois laterales xz de l obstacle
C..................................
C Box xz walls
C.............
C
      DO I=1,10
       DO J=1,9
        K=K+1
        X      (K)=239.55+(I-1)*DR
        Z      (K)=J*DR
        Y      (K)=29.5
        KPAR   (K)=2
       ENDDO
      ENDDO
C      
      DO I=1,10
       DO J=1,9
        K=K+1
        X      (K)=239.55+(I-1)*DR
        Z      (K)=J*DR
        Y      (K)=29.5+40.3
        KPAR   (K)=2
       ENDDO
      ENDDO      
      
C Parois laterales zy de l obstacle
C..................................
C Box zy walls
C.............
C
      DO I=1,21
       DO J=1,9
        K=K+1
        X      (K)=239.55
        Z      (K)=J*DR
        Y      (K)=29.5+(I*DR)
        KPAR   (K)=2
       ENDDO
      ENDDO
C      
      DO I=1,21
       DO J=1,9
        K=K+1
        X      (K)=256.05
        Z      (K)=J*DR
        Y      (K)=29.5+(I*DR)
        KPAR   (K)=2
       ENDDO
      ENDDO
C
C Paroi superieure de l obstacle
C...............................
C Box top wall
C.............
C      
      DO I=1,21
       DO J=1,8
        K=K+1
        X      (K)=239.55+(J*DR)
        Z      (K)=9*DR
        Y      (K)=29.5+(I*DR)
        KPAR   (K)=2
       ENDDO
      ENDDO
C
      NPARB=K-NPARF
C
C Particules fictives
C--------------------
C Mirror particles
C-----------------
C
C Paroi inferieure
C.................
C Bottom wall
C............
C
       DO L=1,3
        DO J=1,62
         DO I=1,183
          K=K+1
          X      (K)=(I-4)*DR
          Y      (K)=(J-4)*DR
          Z      (K)=-L*DR
          KPAR   (K)=3
         ENDDO
        ENDDO
       ENDDO
C
C Parois laterales xz
C....................
C xz walls
C.........
C
      DO L=1,3
       DO I=1,183
        DO J=1,55
         K=K+1
         X      (K)=(I-4)*DR
         Z      (K)=J*DR
         Y      (K)=-L*DR
         KPAR   (K)=3
        ENDDO
       ENDDO
      ENDDO
C
      DO L=1,3
       DO I=1,183
        DO J=1,55
         K=K+1
         X      (K)=(I-4)*DR
         Z      (K)=J*DR
         Y      (K)=100.8333+(L*DR)
         KPAR   (K)=3
        ENDDO
       ENDDO
      ENDDO
C
C Parois laterales yz
C....................
C yz walls
C.........
C
      DO L=1,3
       DO I=1,55
        DO J=1,54
         K=K+1
         X      (K)=-L*DR
         Z      (K)=I*DR
         Y      (K)=J*DR
         KPAR   (K)=3
        ENDDO
       ENDDO
      ENDDO
C
      DO L=1,3
       DO I=1,55
        DO J=1,54
         K=K+1
         X      (K)=322.666+(L*DR)
         Z      (K)=I*DR
         Y      (K)=J*DR
         KPAR   (K)=3
        ENDDO
       ENDDO
      ENDDO
C
C Parois laterales xz de l obstacle
C..................................
C Box xz walls
C.............
C
      DO L=1,21
       DO I=1,8
        DO J=1,8
         K=K+1
         X      (K)=239.55+I*DR
         Z      (K)=J*DR
         Y      (K)=29.5+(L*DR)
         KPAR   (K)=3
        ENDDO
       ENDDO
      ENDDO
C
      NPART = K
C
      PRINT*,''
      PRINT*,NPARF            ,' fluid particles'
      PRINT*,NPARB            ,' wall particles'
      PRINT*,NPART-NPARF-NPARB,' fictitious particles'
      PRINT*,NPART            ,' particles'
      PRINT*,''
C
C Verification de non-coincidence des particules
C-----------------------------------------------
C Checking for particle non-coincidence
C--------------------------------------
C
      FLAG=.TRUE.
      DO 150 I=1,NPART-1
        DO 151 J=I+1,NPART
          IF (ABS(X(I)-X(J)).LT.DR/10.D0.AND.
     .        ABS(Z(I)-Z(J)).LT.DR/10.D0.AND.
     .        ABS(Y(I)-Y(J)).LT.DR/10.D0) THEN
            PRINT*,'Watch out : particles too close at ',
     .      X(I),Z(I),Y(I)
            PRINT*,'            lebel ',I,' et ',J
            FLAG=.FALSE.
          ENDIF
 151    CONTINUE
 150  CONTINUE
      IF (FLAG) PRINT*,'Distances OK'
      PRINT*,''
C
C Recherche des limites
C----------------------
C Search for boundaries
C----------------------
C
      XMIN =  1.D16
      XMAX = -1.D16
      ZMIN =  1.D16
      ZMAX = -1.D16
      YMIN =  1.D16
      YMAX = -1.D16
      DO 160 I=1,NPART
        IF (X(I).LT.XMIN) XMIN=X(I)
        IF (X(I).GT.XMAX) XMAX=X(I)
        IF (Z(I).LT.ZMIN) ZMIN=Z(I)
        IF (Z(I).GT.ZMAX) ZMAX=Z(I)
        IF (Y(I).LT.YMIN) YMIN=Y(I)
        IF (Y(I).GT.YMAX) YMAX=Y(I)        
 160  CONTINUE
      PRINT*,'XMIN = ',XMIN
      PRINT*,'XMAX = ',XMAX
      PRINT*,'ZMIN = ',ZMIN
      PRINT*,'ZMAX = ',ZMAX
      PRINT*,'YMIN = ',YMIN
      PRINT*,'YMAX = ',YMAX      
      PRINT*,''
C
C Ecriture du fichier d'initialisation
C-------------------------------------
C Initializing file writing
C--------------------------
C
      OPEN (102,FILE='dam_breaking.init')
C
      WRITE (102,901) NPARF
      WRITE (102,901) NPARB
      WRITE (102,901) NPART
      WRITE (102,902) DR
C
      DO 104 I=1,NPART
        WRITE (102,900) I, X      (I), Z     (I), Y   (I),
     .           KPAR   (I)
 104  CONTINUE
C
      CLOSE (102)
C
C Fichiers de visualisation
C..........................
C Visualizing files
C..................

      OPEN (101,FILE='barrage.init_global')
C
      DO 961 I=1,NPART
        WRITE (101,957) X(I), Z(I), Y(I), KPAR(I)
 961  CONTINUE
C
      CLOSE (101)
C      
 955  FORMAT ('''',A9,'''')
 956  FORMAT (A)
 957  FORMAT (3F12.4,1X,I1)
 900  FORMAT(I6,3(D16.8),1(I1))
 901  FORMAT(I6)
 902  FORMAT(D16.8)
C
C
      END
