.data
    prompt: .asciiz "Entrez le nombre d'heures : "
    minutes_label: .asciiz " minutes et "
    seconds_label: .asciiz " secondes\n"
    hours: .word 0
    minutes: .word 0
    seconds: .word 0

.text
    main:
        # Afficher le prompt pour entrer le nombre d'heures
        li $v0, 4
        la $a0, prompt
        syscall

        # Lire le nombre d'heures depuis l'entrée utilisateur
        li $v0, 5
        syscall
        sw $v0, hours

        # Convertir les heures en minutes
        lw $t0, hours      # Charger le nombre d'heures dans $t0
        li $t1, 60         # Nombre de minutes par heure
        mul $t2, $t0, $t1  # Multiplication pour obtenir les minutes
        sw $t2, minutes

        # Convertir les minutes en secondes
        lw $t0, minutes    # Charger le nombre de minutes dans $t0
        li $t1, 60         # Nombre de secondes par minute
        mul $t2, $t0, $t1  # Multiplication pour obtenir les secondes
        sw $t2, seconds

        # Afficher le résultat
        li $v0, 1
        lw $a0, minutes
        syscall

        li $v0, 4
        la $a0, minutes_label
        syscall

        li $v0, 1
        lw $a0, seconds
        syscall

        li $v0, 4
        la $a0, seconds_label
        syscall

        # Terminer le programme
        li $v0, 10
        syscall
