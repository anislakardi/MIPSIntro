.data
    prompt:     .asciiz "Entrez la distance en mètres : "
    result_msg: .asciiz "La distance en kilomètres est : "

.text
    main:
        # Afficher le message de saisie
        li $v0, 4               # Code du service d'impression de chaîne
        la $a0, prompt          # Adresse de la chaîne à imprimer
        syscall

        # Lire la distance en mètres
        li $v0, 5               # Code du service de lecture d'entier
        syscall
        move $t0, $v0           # Stocker la distance en mètres dans $t0

        # Convertir les mètres en kilomètres (1 mètre = 0.001 kilomètre)
        li $t1, 1000            # Facteur de conversion
        div $t0, $t1            # Division pour convertir en kilomètres
        mflo $t0                # Récupérer le quotient (résultat en kilomètres)

        # Afficher le message du résultat
        li $v0, 4               # Code du service d'impression de chaîne
        la $a0, result_msg      # Adresse de la chaîne à imprimer
        syscall

        # Afficher le résultat (distance en kilomètres)
        li $v0, 1               # Code du service d'impression d'entier
        move $a0, $t0           # Charger la distance en kilomètres dans $a0
        syscall

        # Terminer le programme
        li $v0, 10              # Code du service de sortie
        syscall