from flask import Flask, render_template, request, redirect, url_for
import pymysql

conn = pymysql.connect(host = 'localhost',
                          user ='root',
                          password = '',
                          db = 'findik_haritasi',
                          cursorclass = pymysql.cursors.DictCursor,
                          port=3306 )

app = Flask(__name__)


@app.route("/login", methods=["GET", "POST"])
def login():
    hata=None
    cursor = conn.cursor()  
        
    if request.method == "POST":
        kullanici_adi = request.form.get("Kullanici_adi")
        sifre = request.form.get("Sifre")

        cursor.execute(
            "SELECT * FROM Yonetici  WHERE Kullanici_adi = %s AND Sifre = %s",
            (kullanici_adi, sifre)
        )  

        
        sonuc = cursor.fetchone()  

        if sonuc:
            return redirect(url_for("tuccar_home")) 
        else:
            hata = "Kullanıcı Bulunamadı!"

    return render_template("login.html", hata=hata)


@app.route("/", methods=["GET", "POST"])
def musteri_home():
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM Sehir")
    sehirler = cursor.fetchall()

    selected_sehir = request.form.get("SehirID") 
    selected_ilce = request.form.get("IlceID") 
    filtre = request.form.get("filtre") 
    ilceler = []
    tuccarlar = []

    if selected_sehir:
        cursor.execute("SELECT * FROM Ilce WHERE SehirID=%s", (selected_sehir,))
        ilceler = cursor.fetchall()

    if filtre:
        if selected_ilce:
            cursor.execute("SELECT * FROM Tuccar WHERE IlceID=%s", (selected_ilce,))
        elif selected_sehir:
            cursor.execute("""
                SELECT * FROM Tuccar 
                WHERE IlceID IN (SELECT IlceID FROM Ilce WHERE SehirID=%s)
            """, (selected_sehir,))
        else:
            cursor.execute("SELECT * FROM Tuccar")
        tuccarlar = cursor.fetchall()


    return render_template("musteri_home.html",
                           sehirler=sehirler,
                           ilceler=ilceler,
                           tuccarlar=tuccarlar,
                           selected_sehir=selected_sehir,
                           selected_ilce=selected_ilce)



@app.route("/tuccar_home", methods=["GET", "POST"])
def tuccar_home():
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM Sehir")
    sehirler = cursor.fetchall() 

    selected_sehir = request.form.get("SehirID")
    selected_ilce = request.form.get("IlceID")


    ilceler = []
    tuccarlar = []
 
    if selected_sehir:
        cursor.execute("SELECT * FROM Ilce WHERE SehirID=%s",(selected_sehir,))
        ilceler = cursor.fetchall()

    if request.method == "GET":
        cursor.execute("SELECT * FROM Tuccar")
        tuccarlar = cursor.fetchall()

    elif request.method == "POST":

        if selected_ilce:
            cursor.execute(
                "SELECT * FROM Tuccar WHERE IlceID=%s",
                (selected_ilce,)
            )

        elif selected_sehir:

            cursor.execute("""
                SELECT * FROM Tuccar
                WHERE IlceID IN (
                    SELECT IlceID FROM Ilce WHERE SehirID=%s
                )
            """, (selected_sehir,))


        tuccarlar = cursor.fetchall()

    return render_template(
        "tuccar_home.html",
        sehirler=sehirler,
        ilceler=ilceler,
        tuccarlar=tuccarlar,
        selected_sehir=selected_sehir,
        selected_ilce=selected_ilce
    )


@app.route("/ekle", methods=["GET", "POST"])
def ekle():
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM Sehir")
    sehirler = cursor.fetchall() 

    selected_sehir = request.form.get("SehirID")

    ilceler = []
    if selected_sehir:
        cursor.execute("SELECT * FROM Ilce WHERE SehirID=%s", (selected_sehir,))
        ilceler = cursor.fetchall() 

    if request.method == "POST" and request.form.get("Firma_adi"):
        firma_adi = request.form.get("Firma_adi")
        telefon = request.form.get("Telefon")
        adres = request.form.get("Adres")
        ilce_id = request.form.get("IlceID")
        fiyat = request.form.get("Fiyat")

        cursor.execute("""
            INSERT INTO Tuccar (Firma_adi, Telefon, Adres, IlceID, Fiyat)
            VALUES (%s, %s, %s, %s, %s)
        """, (firma_adi, telefon, adres, ilce_id, fiyat))
        conn.commit()
        return redirect(url_for("tuccar_home"))
    
    return render_template(
    "ekle.html",
    sehirler=sehirler,
    ilceler=ilceler,
    selected_sehir=selected_sehir
    )


@app.route("/sil/<int:tuccar_id>")
def sil(tuccar_id):
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Tuccar WHERE TuccarID=%s", (tuccar_id,))
    conn.commit()
    return redirect(url_for("tuccar_home"))


@app.route("/guncelle/<int:tuccar_id>", methods=["GET", "POST"])
def guncelle(tuccar_id):
    cursor = conn.cursor()


    cursor.execute("SELECT * FROM Sehir")
    sehirler = cursor.fetchall() 

    cursor.execute("""
        SELECT 
            t.*,
            i.SehirID
        FROM Tuccar t
        JOIN Ilce i ON t.IlceID = i.IlceID
        WHERE t.TuccarID = %s
    """, (tuccar_id,))
    tuccar = cursor.fetchone()

    selected_sehir = tuccar["SehirID"]

    cursor.execute("SELECT * FROM Ilce WHERE SehirID=%s", (selected_sehir,))
    ilceler = cursor.fetchall()

    if request.method == "POST":
        firma_adi = request.form["Firma_adi"]
        telefon = request.form["Telefon"]
        adres = request.form["Adres"]
        fiyat = request.form["Fiyat"]
        ilce = request.form["IlceID"]

        cursor.execute("""
            UPDATE Tuccar
            SET Firma_adi=%s, Telefon=%s, Adres=%s, Fiyat=%s, IlceID=%s
            WHERE TuccarID=%s 
        """, (firma_adi, telefon, adres, fiyat, ilce, tuccar_id))

        conn.commit() 
        return redirect(url_for("tuccar_home")) 

    return render_template(
        "guncelle.html",
        tuccar=tuccar,
        sehirler=sehirler,
        ilceler=ilceler,
        selected_sehir=selected_sehir
    )


if __name__ == "__main__":
    app.run(debug=True)
