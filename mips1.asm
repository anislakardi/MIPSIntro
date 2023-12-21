.data
array: .space 400      # Tableau de 100 éléments (ajuster la taille selon vos besoins)
size_prompt: .asciiz "Entrez la taille du tableau : "
value_prompt: .asciiz "Entrez la valeur pour l'élément "
newline: .asciiz "\n"

.text
main:
    # Demander à l'utilisateur de saisir la taille du tableau
    li   $v0, 4
    la   $a0, size_prompt
    syscall

    # Lire la taille du tableau depuis l'entrée utilisateur
    li   $v0, 5
    syscall
    move $t1, $v0  # Stocker la taille dans $t1

    la   $t0, array     # Charger l'adresse de début du tableau dans $t0

    li   $t2, 0         # Initialiser un compteur à 0

fill_loop:
    bge  $t2, $t1, end_fill   # Sortir de la boucle si le compteur est supérieur ou égal à la taille

    # Demander à l'utilisateur de saisir la valeur pour l'élément actuel
    li   $v0, 4
    la   $a0, value_prompt
    syscall

    # Lire la valeur depuis l'entrée utilisateur
    li   $v0, 5
    syscall
    sw   $v0, 0($t0)  # Stocker la valeur dans le tableau à l'adresse pointée par $t0

    addi $t0, $t0, 4    # Avancer l'adresse du tableau de 4 octets (taille d'un mot)
    addi $t2, $t2, 1    # Incrémenter le compteur

    j    fill_loop      # Revenir au début de la boucle

end_fill:

    # Votre code ici pour traiter le tableau rempli, l'afficher, etc.

    # Fin du programme
    li   $v0, 10        # Appel système pour quitter le programme
    syscall
