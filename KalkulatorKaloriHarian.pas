program KalkulatorKaloriHarian;
uses crt;
const /// konstanta untuk aktivitas
    sgtJarang = 1.2;
    jarang = 1.375;
    normal = 1.55;
    sering = 1.725;
    sgtSering = 1.9;

type mandiriM = record  /// record untuk metode mandiri
    mamiM : string;
    kaloriM, jumlahmamiM : integer;
end;

type menuTM = record    /// record untuk metode menu
    mamiTM : char;
    jumlahmamiTM,kaloriTM : integer;
end;
var 
nama, ket0: string;
jeniskelamin, menu, bumilsui, LanjutPesan : char;
PilihanMetode, aktivitas, Jumlah, i, jumlahKonsumsi, bb, tb, Keterangan, umur  : integer;
aktv, ket,bmrP, bmrL, bmrMILSUI, TotalKaloriKonsumsi, KaloriAkhir, diet, totaldiet, naikbb, totalnaikbb : real;
data1 : array [1..100] of mandiriM;
data2 : array [1..100] of menuTM;


procedure welcome;
begin
    clrscr;
    writeln('---------------------------------------------------');
    writeln('Selamat Datang di Kalkulator Kalori Harian ^^');
    writeln('---------------------------------------------------');
    writeln('Ingin menghitung kalori dengan metode apa hari ini?');
    writeln('Pilihan : ');
    writeln('   1. Mandiri ');
    writeln('   2. Tampilan Menu');
    writeln('-------------------------------------------------');
    writeln;
    write('Pilih Metode (1/2) : ');
    readln(PilihanMetode);
end;

procedure TampilkanMetode(PilihanMetode : integer);
begin
    if PilihanMetode = 1 then
    begin
        clrscr;
        writeln('--------------------------------------------------------');
        writeln('Baik! Anda telah memilih Metode Mandiri!');
        writeln('Pastikan Anda telah mengetahui makanan apa saja yang');
        writeln('telah Anda konsumsi hari ini beserta jumlah kalorinya!');
        writeln('--------------------------------------------------------');
        writeln;
    end;

    if PilihanMetode = 2 then 
    begin
        clrscr;
        writeln('--------------------------------------------------------');
        writeln('Baik! Anda telah memilih Metode Tampilan Menu!');
        writeln('Pastikan Anda telah mengetahui makanan apa saja');
        writeln('yang telah Anda konsumsi hari ini. Metode ini hanya');
        writeln('memperkirakan kalori yang telah Anda makan melalui menu');
        writeln('yang Anda pilih. Menu yang ditampilkan bisa saja tidak');
        writeln('ada pada daftar makanan yang telah Anda makan hari ini!');
        writeln('--------------------------------------------------------');
        writeln;
    end;
end;

procedure KeteranganHamilSusu;
begin
    clrscr;
    writeln('===== Keterangan Ibu Hamil atau Menyusui =====');
    writeln('1. Hamil trisemester 1');
    writeln('2. Hamil trisemester 2');
    writeln('3. Hamil trisemester 3');
    writeln('4. Menyusui pada 6 bulan pertama');
    writeln('5. Menyusui pada 6 bulan kedua');
    writeln;
    write ('Pilih Keterangan Anda (1-5) : ');
    readln(Keterangan);

    case Keterangan of
    1 : begin ket0 := 'Hamil trisemester 1'; ket := 180; end; 
    2 : begin ket0 := 'Hamil trisemester 2'; ket := 300; end; 
    3 : begin ket0 := 'Hamil trisemester 3'; ket := 300; end; 
    4 : begin ket0 := 'Menyusui pada 6 bulan pertama'; ket := 330; end;
    5 : begin ket0 := 'Menyusui pada 6 bulan kedua'; ket := 400; end; 
    else
    begin
        writeln('Pilihan tidak valid. Ulangi dengan memasukkan nomor 1-5 saja.');
        writeln('Tekan "enter" untuk mencoba kembali...');
        readln;
        clrscr;
        KeteranganHamilSusu;
    end;
    end;
end;

procedure PilihAktivitas;
begin
    clrscr;
    writeln('===== Pilih Aktivitas =====');
    writeln('1. Sangat Jarang  : sangat jarang olahraga ');
    writeln('2. Jarang         : olahraga 1-3 hari/minggu');
    writeln('3. Normal         : olahraga 3-5 hari/minggu');
    writeln('4. Sering         : olahraga 6-7 hari/minggu');
    writeln('5. Sangat Sering  : olahraga setiap hari (bisa 2x olahraga dalam sehari)');
    writeln;
    write ('Pilih Aktivitas (1-5) : ');
    readln(aktivitas);

    case aktivitas of
    1 : aktv := sgtJarang; 
    2 : aktv := jarang;
    3 : aktv := normal; 
    4 : aktv := sering; 
    5 : aktv := sgtSering;
    else
    begin
        writeln('Pilihan tidak valid. Ulangi dengan memasukkan nomor 1-5 saja.');
        writeln('Tekan "enter" untuk mencoba kembali...');
        readln;
        clrscr;
        PilihAktivitas;
    end;
    end;
end;

procedure MetodeMandiri;
begin
    writeln('============== Metode Mandiri ==============');
    writeln;
    write('Jumlah makanan dan minuman yang dikonsumsi : ');
    readln(jumlahKonsumsi);
    writeln;

    for i := 1 to jumlahKonsumsi do 
    with data1 [i] do 
    begin
        write('Masukkan Nama Makanan/Minuman : ');
        readln(mamiM);
        write('Masukkan Jumlah Makanan/Minuman yang Dikonsumsi : ');
        readln(jumlahmamiM);
        write('Masukkan Jumlah Kalori : ');
        readln(kaloriM);
        writeln;
    end;
end;

procedure MetodeMenu;
begin
    writeln('============== Metode Menu ==============');
    writeln('A. Nasi Putih 100 gram/1 centong nasi');
    writeln('B. Nasi Merah 100 gram/1 centong nasi');
    writeln('C. Roti Putih 1 iris');
    writeln('D. Roti Gandum 1 iris');
    writeln('E. Mie Instan 80 gram');
    writeln('F. Hamburger 100 gram ');
    writeln('G. Cheeseburger 120 gram');
    writeln('H. Fried Chicken (1 potong paha) 100 gram');
    writeln('I. Fried Chicken (1 potong dada) 150 gram');
    writeln('J. Kentang Goreng 120 gram');
    writeln('K. Pizza (1 slice, 10 inch) 120 gram');
    writeln('L. Hotdog 150 gram ');
    writeln('M. Donat Cokelat 80 gram');
    writeln('N. Milkshake (medium) 300ml');
    writeln('O. Soda (medium) 350ml');
    writeln('P. Es Krim Sundae 200 gram');
    writeln('Q. Ice Cream Cone 100 gram');
    writeln('R. Kopi Hitam 250ml ');
    writeln('S. Teh Manis 250ml');
    writeln('T. Diet Coke 350ml');
    writeln('U. Kopi dengan susu dan gula 250ml');

    for i := 1 to jumlahKonsumsi do 
    with data2 [i] do 
    begin
        write('Masukkan Kode A-Z : ');
        readln(mamiTM);
        write('Masukkan Jumlah Makanan/Minuman yang Dikonsumsi : ');
        readln(jumlahmamiTM);
        writeln;
    end;

    for i := 1 to jumlahKonsumsi do 
    with data2 [i] do 
    begin 
        case mamiTM of
        'A': kaloriTM := 175; // Nasi Putih
        'B': kaloriTM := 110; // Nasi Merah
        'C': kaloriTM := 80;  // Roti Putih
        'D': kaloriTM := 70;  // Roti Gandum
        'E': kaloriTM := 350; // Mie Instan
        'F': kaloriTM := 250; // Hamburger
        'G': kaloriTM := 303; // Cheeseburger
        'H': kaloriTM := 200; // Fried Chicken (paha)
        'I': kaloriTM := 280; // Fried Chicken (dada)
        'J': kaloriTM := 365; // Kentang Goreng
        'K': kaloriTM := 285; // Pizza
        'L': kaloriTM := 290; // Hotdog
        'M': kaloriTM := 240; // Donat Cokelat
        'N': kaloriTM := 200; // Milkshake
        'O': kaloriTM := 140; // Soda
        'P': kaloriTM := 210; // Es Krim Sundae
        'Q': kaloriTM := 150; // Ice Cream Cone
        'R': kaloriTM := 2;   // Kopi Hitam
        'S': kaloriTM := 100; // Teh Manis
        'T': kaloriTM := 1;   // Diet Coke
        'U': kaloriTM := 150; // Kopi susu dan gula
        'V': kaloriTM := 200; // Susu Fullcream
        'W': kaloriTM := 52;  // Apel
        'X': kaloriTM := 89;  // Pisang
        'Y': kaloriTM := 30;  // Semangka
        'Z': kaloriTM := 47;  // Jeruk
        else
            kaloriTM := 0;
        end;
    end;
end;

    writeln('V. Susu Fullcream 250ml');
    writeln('W. Apel 100 gram');
    writeln('X. Pisang 100 gram ');
    writeln('Y. Semangka 100 gram');
    writeln('Z. Jeruk 100 gram ');
    writeln;
    write('Jumlah makanan dan minuman yang dikonsumsi : ');
    readln(jumlahKonsumsi);
    writeln;
