# Arhitektura Računara 2 (2024)

Ovaj repozitorijum sadrži materijale sa laboratorijskih vežbi i ispita iz predmeta **Arhitektura računara 2**, održanih **2024. godine**. 

Svi projekti su implementirani u VHDL jeziku (uglavnom prilagođeni za Xilinx ISE razvojno okruženje).

---

## 📂 Struktura Projekata

U nastavku je detaljan opis strukture direktorijuma i fajlova u repozitorijumu:

### 1. [Prva lab vežba](./1.%20Prva%20lab%20vezba)
Osnovni VHDL projekti koji pokrivaju kombinacionu logiku:
* **`decoder`** – Implementacija binarnog dekodera ([decoder.vhd](./1.%20Prva%20lab%20vezba/decoder/decoder.vhd)) i testbench-a za simulaciju ([tb_decoder.vhd](./1.%20Prva%20lab%20vezba/decoder/tb_decoder.vhd)).
* **`mux41`** – Multipleksor 4 u 1 ([mux41.vhd](./1.%20Prva%20lab%20vezba/mux41/mux41.vhd)) sa simulacionim fajlom ([tb.vhd](./1.%20Prva%20lab%20vezba/mux41/tb.vhd)).

### 2. [Druga lab vežba](./2.%20Druga%20lab%20vezba)
Složenije kombinacione mreže:
* **`Dec2-4_to_Dec3-8`** – Konstrukcija dekodera 3-u-8 korišćenjem više 2-u-4 dekodera ([Dec2to4.vhd](./2.%20Druga%20lab%20vezba/Dec2-4_to_Dec3-8/Dec2to4.vhd), [dec3-8.vhd](./2.%20Druga%20lab%20vezba/Dec2-4_to_Dec3-8/dec3-8.vhd), [Dec3to8.vhd](./2.%20Druga%20lab%20vezba/Dec2-4_to_Dec3-8/Dec3to8.vhd)).
* **`Dec_switch`** – Dekoder kontrolisan prekidačima ([proba.vhd](./2.%20Druga%20lab%20vezba/Dec_switch/proba.vhd)).

### 3. [Treća lab vežba](./3.%20Treca%20lab%20vezba)
Sekvencijalne mreže, flip-flopovi i brojači:
* **`brojac_t_ff_brzi`** – Sinhroni brzi brojač realizovan preko T flip-flopova ([brojac_t_ff.vhd](./3.%20Treca%20lab%20vezba/brojac_t_ff_brzi/brojac_t_ff.vhd), [tb_brojac_t_ff.vhd](./3.%20Treca%20lab%20vezba/brojac_t_ff_brzi/tb_brojac_t_ff.vhd)).
* **`counter3bitAsync`** – Asinhroni 3-bitni brojač koji koristi podelu takta i T flip-flopove ([counter3bitAsync.vhd](./3.%20Treca%20lab%20vezba/counter3bitAsync/counter3bitAsync.vhd), [TFF.vhd](./3.%20Treca%20lab%20vezba/counter3bitAsync/TFF.vhd), [Clock_Divider.vhd](./3.%20Treca%20lab%20vezba/counter3bitAsync/Clock_Divider.vhd)).
* **`JK_ff`** – JK flip-flop ([jk.vhd](./3.%20Treca%20lab%20vezba/JK_ff/jk.vhd)) sa testbench-om ([tb.vhd](./3.%20Treca%20lab%20vezba/JK_ff/tb.vhd)).

### 4. [Četvrta lab vežba](./4.%20Cetvrta%20lab%20vezba)
Složenije sekvencijalne komponente i sabirači:
* **`registar8bit`** – 8-bitni šift registar sa paralelnim upisom (`iLOAD`), podrškom za šiftovanje levo/desno i izborom između aritmetičkog i logičkog šiftovanja ([registar8bit.vhd](./4.%20Cetvrta%20lab%20vezba/registar8bit/registar8bit.vhd)).
* **`sabirac4bit`** – Strukturalno modelirani 4-bitni sabirač sastavljen od 1-bitnih potpunih sabirača ([sabirac4bit.vhd](./4.%20Cetvrta%20lab%20vezba/sabirac4bit/sabirac4bit.vhd), [adder1bit.vhd](./4.%20Cetvrta%20lab%20vezba/sabirac4bit/adder1bit.vhd), [tb_adder.vhd](./4.%20Cetvrta%20lab%20vezba/sabirac4bit/tb_adder.vhd)).
* **`zadaci.txt`** – Tekstualni opis postavke zadataka za 4. laboratorijsku vežbu ([zadaci.txt](./4.%20Cetvrta%20lab%20vezba/zadaci.txt)).

### 5. [Peta lab vežba](./5.%20Peta%20lab%20vezba)
* **`stoperica8bit`** – 8-bitna štoperica sa deliteljem frekvencije takta ([stoperica.vhd](./5.%20Peta%20lab%20vezba/stoperica8bit/stoperica.vhd), [clock_divider.vhd](./5.%20Peta%20lab%20vezba/stoperica8bit/clock_divider.vhd)).

### 6. [Šesta lab vežba](./6.%20Sesta%20lab%20vezba)
* **`Arit3`** – Projektovanje složenije aritmetičko-logičke strukture ([ArithStruct.vhd](./6.%20Sesta%20lab%20vezba/Arit3/AritStruct/ArithStruct.vhd)) koja koristi komponente kao što su 2-bitni sabirač, 2-bitni komparator, šifter ulevo i registar.
* **`LedShow`** – Modul za upravljanje i animaciju LED dioda ([LedShow.vhd](./6.%20Sesta%20lab%20vezba/LedShow/LedShow.vhd)) sa pratećim deliteljem takta ([clock_divider.vhd](./6.%20Sesta%20lab%20vezba/LedShow/clock_divider.vhd)).

### 7. [Ispit jun](./Ispit%20jun)
Praktični ispitni zadaci iz junskog roka:
* **`1`**, **`2`**, **`3`** – Različiti ispitni zadaci koji implementiraju specifične sekvencijalne i aritmetičke sisteme (npr. [ispit2.vhd](./Ispit%20jun/1/ispit2.vhd), [ispit3.vhd](./Ispit%20jun/2/ispit3.vhd), [ispit4.vhd](./Ispit%20jun/3/ispit4.vhd)).

### 8. [Razno](./Razno)
Razni dodatni primeri, vežbe i stariji zadaci:
* **`arithemic` / `AritmetickoKolo` / `arKolo`** – Implementacije aritmetičko-logičkih kola.
* **`counter8bit`** – 8-bitni binarni brojač ([brojac.vhd](./Razno/counter8bit/brojac.vhd)).
* **`LedBrightness` / `LedBrightness2`** – Modulacija širine impulsa (PWM) za kontrolu jačine svetlosti LED diode ([LedBrightness.vhd](./Razno/LedBrightness/LedBrightness.vhd), [Pwm_generator.vhd](./Razno/LedBrightness/Pwm_generator.vhd)).
* **`ledShow`** – Još jedna verzija animacije LED dioda.
* **`stoperica8bit` / `stoperica_2` / `stoperica_3`** – Alternativni dizajni i simulacije štoperica sa testbench-evima.
* **`zadatak_8.18` / `zadatak_8.19`** – Kompleksniji strukturni dizajni manjih procesora/kontrolera sa sopstvenom ALU jedinicom, registrima, dekoderima, brojačima i upravljačkom jedinicom.

---

⭐ Ostavite **zvezdicu (star)** ako vam je ovaj materijal pomogao u spremanju vežbi ili ispita!

