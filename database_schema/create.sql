USE HDlab

GO
DROP TABLE Etap
DROP TABLE Zlecenie
DROP TABLE Pracownik
DROP TABLE Uzytkownik
DROP TABLE Osoba
DROP TABLE Paczkomat
DROP TABLE Sortownia
DROP TABLE Adres
DROP TABLE Paczka
GO

CREATE TABLE Paczka (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  Wysokosc FLOAT,
  Szerokosc FLOAT,
  Dlugosc FLOAT,
  Waga FLOAT
);

CREATE TABLE Adres (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  Miasto VARCHAR(30),
  Ulica VARCHAR(30),
  Numer_ulicy INT,
  Geolokalizacja_dlugosc FLOAT,
  Geolokalizacja_szerokosc FLOAT,
);

CREATE TABLE Sortownia (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  ID_adresu INT REFERENCES Adres ON DELETE CASCADE ON UPDATE CASCADE,
  Region VARCHAR(30)
);

CREATE TABLE Paczkomat (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  ID_adresu INT REFERENCES Adres ON DELETE NO ACTION ON UPDATE NO ACTION,
  Duze_skrytki INT,
  Srednie_skrytki INT,
  Male_skrytki INT,
  ID_sortowni INT REFERENCES Sortownia ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Osoba (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  Imie VARCHAR(30),
  Nazwisko VARCHAR(40),
  Data_urodzenia DATE,
  Email VARCHAR(50)
);

CREATE TABLE Uzytkownik (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  ID_osoby INT REFERENCES Osoba ON DELETE CASCADE ON UPDATE CASCADE,
  Nick VARCHAR(30)
);

CREATE TABLE Pracownik (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  ID_osoby INT REFERENCES Osoba ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Zlecenie (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  ID_uzytkownika INT REFERENCES Uzytkownik ON DELETE CASCADE ON UPDATE CASCADE,
  ID_paczki INT REFERENCES Paczka ON DELETE NO ACTION ON UPDATE NO ACTION,
  ID_paczkomatu_wysylkowego INT REFERENCES Paczkomat ON DELETE NO ACTION ON UPDATE NO ACTION,
  ID_paczkomatu_odbiorczego INT REFERENCES Paczkomat ON DELETE NO ACTION ON UPDATE NO ACTION,
  [Status] VARCHAR(60)
);

CREATE TABLE Etap (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  Czas TIME ,
  [Data] DATE ,
  ID_adresu INT REFERENCES Adres ON DELETE NO ACTION ON UPDATE NO ACTION,
  Typ VARCHAR(60) ,
  ID_zlecenia INT REFERENCES Zlecenie ON DELETE CASCADE ON UPDATE CASCADE,
  ID_pracownika INT REFERENCES Pracownik ON DELETE NO ACTION ON UPDATE NO ACTION
);

