.data
    a: .word 5      # Définir la valeur de a
    b: .word 3      # Définir la valeur de b
    result: .word 0 # Variable pour stocker le résultat

.text
    main:
        # Somme (a + b)
        lw $t0, a      # Charger la valeur de a dans $t0
        lw $t1, b      # Charger la valeur de b dans $t1
        add $t2, $t0, $t1  # Additionner $t0 et $t1, stocker le résultat dans $t2

        # Afficher le résultat de la somme
        li $v0, 10     # Appel système pour terminer le programme
        syscall

        # Soustraction (a - b)
        lw $t0, a      # Charger la valeur de a dans $t0
        lw $t1, b      # Charger la valeur de b dans $t1
        sub $t2, $t0, $t1  # Soustraire $t1 de $t0, stocker le résultat dans $t2

        # Afficher le résultat de la soustraction
        li $v0, 10     # Appel système pour terminer le programme
        syscall

        # Multiplication (a * b)
        lw $t0, a      # Charger la valeur de a dans $t0
        lw $t1, b      # Charger la valeur de b dans $t1
        mul $t2, $t0, $t1  # Multiplier $t0 et $t1, stocker le résultat dans $t2

        # Afficher le résultat de la multiplication
        li $v0, 10     # Appel système pour terminer le programme
        syscall

        # Division (a / b)
        lw $t0, a      # Charger la valeur de a dans $t0
        lw $t1, b      # Charger la valeur de b dans $t1
        bnez $t1, not_zero  # Vérifier que b n'est pas égal à zéro
        j end_program      # Si b est égal à zéro, terminer le programme

    not_zero:
        div $t0, $t1   # Diviser $t0 par $t1
        mflo $t2       # Obtenir le quotient, stocker le résultat dans $t2

        # Afficher le résultat de la division
        li $v0, 10     # Appel système pour terminer le programme
        syscall

    end_program:
        # Fin du programme
