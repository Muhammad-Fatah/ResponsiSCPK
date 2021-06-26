opts = detectImportOptions('Real estate valuation data set.xlsx');
opts.SelectedVariableNames = (3:5);
data1 = readmatrix('Real estate valuation data set.xlsx',opts);


opts = detectImportOptions('Real estate valuation data set.xlsx');
opts.SelectedVariableNames = (8);
data2 = readmatrix('Real estate valuation data set.xlsx',opts);

data = [data1 data2];
data=data(1:50,:);


x = data;%Data rating kecocokan dari masing-masing alternatif
k = [0,0,1,0];%Atribut yang tekah ditentukan tiap-tiap kriteria, dimana nilai 1=atrribut keuntungan, dan  0= atribut biaya
w = [3,5,4,1];%Nilai bobot untuk tiap kriteria (1= sangat buruk, 2=buruk, 3= cukup, 4= tinggi, 5= sangat tinggi) 

%Perbaikan bobot
[m n]=size (x); %Inisialisasi untuk ukuran x
w=w./sum(w); %Membagi bobot per kriteria dengan jumlah total seluruh bobot

%Melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n,
    if k(j)==0, w(j)=-1*w(j);
    end;
end;
for i=1:m,
    S(i)=prod(x(i,:).^w);
end;

%Melakukan Perangkingan
V= S/sum(S);

Vtranspose=V.'; 
opts = detectImportOptions('Real estate valuation data set.xlsx');
opts.SelectedVariableNames = (1);
x2= readmatrix('Real estate valuation data set.xlsx',opts);
x2=x2(1:50,:);
x2=[x2 Vtranspose];
x2=sortrows(x2,-2);
x2 = x2(1:5,1);

disp ('Nomor Real Estate yang terbaik =')
disp (x2)