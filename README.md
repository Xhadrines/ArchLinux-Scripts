# ArchLinux-Scripts

Un set de scripturi bash pentru instalarea și configurarea Arch Linux.

## Instalare

1. Clonează repository-ul folosind comanda:

```bash
git clone https://github.com/Xhadrines/ArchLinux-Scripts.git
```

2. Fă toate scripturile executabile folosind comanda:

```bash
chmod +x [cale_director]/[numele_fisierului].sh
```

3. Execută scriptul `[numele_fisierului].sh` folosind comanda:

```bash
sudo ./[cale_director]/[numele_fisierului].sh
```

4. Ordinea recomandată de execuție:

   1. Instalare de bază: `ArchSetup/base-install/`
   2. Post install: `ArchSetup/post-install/`
   3. Desktop environment: `ArchSetup/desktop/[alege_unul]/`
   4. Post-desktop: `ArchSetup/post-desktop/`
   5. SSD suplimentar (opțional): `ArchSetup/extra-ssd/`

5. Recomandări

- Rulează scripturile în ordinea afișată, pentru a evita erorile de dependență.

- Fiecare script este interactiv, deci citește mesajele afișate și urmează instrucțiunile.

- Pentru scripturile opționale, decizia de execuție este la tine.

### **NOTE:**

- Aceste scripturi au fost create în mod minimal și personalizat pentru nevoile mele specifice.
  Ele funcționează pentru configurația și preferințele mele, dar nu sunt un ghid universal pentru toate sistemele.

- Este recomandat să citești mesajele afișate de fiecare script și să verifici configurațiile înainte de a continua.

- Unele scripturi (ex. SSD suplimentar) sunt opționale și necesită atenție suplimentară.

- Folosește-le pe propria răspundere și adaptează-le dacă este necesar pentru alte sisteme.
