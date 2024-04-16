using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Crud_App.Navigation
{
    public partial class UpdateSeite : UserControl
    {
        const string username = "personalabteilung";
        const string password = "abc123";
        string connectionString = @"Data Source=(localdb)\mssqllocaldb;" +
                    "Initial Catalog=Zoo;" +
                    "Persist Security Info=True;User ID=" + username + ";Password=" + password + "";
        SqlCommand sqlCommand;

        public UpdateSeite()
        {
            InitializeComponent();
        }


        private void buttonMitarbeiterSuche_Click(object sender, EventArgs e)
        {
            string query = "";

            if (!textBoxSucheMitId.Text.Equals(""))
            {
                query += $"SELECT Mitarbeiter_ID, Vorname, Name, Strasse, PLZ, Ort, Tätigkeit_Nr, Geschlecht FROM dbo.Mitarbeiter " +
                    $"WHERE Mitarbeiter_ID = '"+textBoxSucheMitId.Text+"'";
            }

            if (!textBoxSucheMitVorname.Text.Equals("") && !textBoxSucheMitNachname.Text.Equals(""))
            {
                query += $"SELECT Mitarbeiter_ID, Vorname, Name, Strasse, PLZ, Ort, Tätigkeit_Nr, Geschlecht FROM dbo.Mitarbeiter " +
                   $"WHERE Vorname LIKE '%" + textBoxSucheMitVorname.Text + "%' AND Name LIKE '%"+textBoxSucheMitNachname.Text+"%'";
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                var cmd = new SqlCommand(query, con);
                string query2 = "SELECT Tätigkeit_ID, Bezeichnung FROM dbo.Tätigkeit";
                var sqlDataAdapter = new SqlDataAdapter(query2, con);
                var dt = new DataTable();
                

                sqlDataAdapter.Fill(dt);
                listBoxAuswahlTaetigkeit.DataSource = dt;
                listBoxAuswahlTaetigkeit.DisplayMember = "Bezeichnung";
                listBoxAuswahlTaetigkeit.ValueMember = "Tätigkeit_ID";

                var reader = cmd.ExecuteReader();

                reader.Read();

                textBoxMitarbeiterId.Text = Convert.ToString(reader.GetInt16(0));
                textBoxVorname.Text = reader.GetString(1);
                textBoxNachname.Text = reader.GetString(2);
                textBoxStrasse.Text = reader.GetString(3);
                textBoxPlz.Text = reader.GetString(4);
                textBoxOrt.Text = reader.GetString(5);
                
                textBoxGeschlechtKurz.Text = reader.GetString(7);

                listBoxAuswahlTaetigkeit.SelectedValue = reader.GetInt16(6);
                con.Close();
            }
            
        }

        private void speichernButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                var query = $"UPDATE dbo.Mitarbeiter SET " +
                    $"Vorname = '" + textBoxVorname.Text + "', " +
                    $"Name = '" + textBoxNachname.Text + "', " +
                    $"Strasse = '" + textBoxStrasse.Text + "', " +
                    $"PLZ = '" + textBoxPlz.Text + "', " +
                    $"Ort = '" + textBoxOrt.Text + "', " +
                    $"Tätigkeit_Nr = '" + listBoxAuswahlTaetigkeit.SelectedValue + "', " +
                    $"Geschlecht = '" + textBoxGeschlechtKurz.Text + "' " +
                    $"WHERE Mitarbeiter_ID = '"+textBoxMitarbeiterId.Text+"';";

                var cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Mitarbeiter aktualisiert.");
                con.Close();
            }
        }
    }   
}

