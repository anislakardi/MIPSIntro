.data
    prompt: .asciiz "Entrez le nombre en bits : "
    bytes_label: .asciiz " octets\n"
    kilobytes_label: .asciiz " kilo-octets\n"
    megabytes_label: .asciiz " méga-octets\n"
    gigabytes_label: .asciiz " giga-octets\n"

    bits: .word 0
    bytes: .word 0
    kilobytes: .word 0
    megabytes: .word 0
    gigabytes: .word 0

.text
    main:
        # Afficher le prompt pour entrer le nombre en bits
        li $v0, 4
        la $a0, prompt
        syscall

        # Lire le nombre en bits depuis l'entrée utilisateur
        li $v0, 5
        syscall
        sw $v0, bits

        # Convertir les bits en octets
        lw $t0, bits      # Charger le nombre de bits dans $t0
        li $t1, 8         # Nombre de bits par octet
        divu $t0, $t1     # Division pour obtenir le nombre d'octets
        mflo $t2
        sw $t2, bytes

        # Convertir les octets en kilo-octets
        lw $t0, bytes     # Charger le nombre d'octets dans $t0
        li $t1, 1024      # Nombre d'octets par kilo-octet
        divu $t0, $t1     # Division pour obtenir le nombre de kilo-octets
        mflo $t2
        sw $t2, kilobytes

        # Convertir les kilo-octets en méga-octets
        lw $t0, kilobytes # Charger le nombre de kilo-octets dans $t0
        divu $t0, $t1     # Division pour obtenir le nombre de méga-octets
        mflo $t2
        sw $t2, megabytes

        # Convertir les méga-octets en giga-octets
        lw $t0, megabytes # Charger le nombre de méga-octets dans $t0
        divu $t0, $t1     # Division pour obtenir le nombre de giga-octets
        mflo $t2
        sw $t2, gigabytes

        # Afficher le résultat
        li $v0, 1
        lw $a0, bytes
        syscall
        li $v0, 4
        la $a0, bytes_label
        syscall

        li $v0, 1
        lw $a0, kilobytes
        syscall
        li $v0, 4
        la $a0, kilobytes_label
        syscall

        li $v0, 1
        lw $a0, megabytes
        syscall
        li $v0, 4
        la $a0, megabytes_label
        syscall

        li $v0, 1
        lw $a0, gigabytes
        syscall
        li $v0, 4
        la $a0, gigabytes_label
        syscall

        # Terminer le programme
        li $v0, 10
        syscall