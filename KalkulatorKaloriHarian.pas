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
