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
    public partial class NeuanlageSeite : UserControl
    {
        public NeuanlageSeite()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            const string username = "personalabteilung";
            const string password = "abc123";
            const string tempDataSource = "localhost\\SQLEXPRESS01";
            // const string productionDataSource = "(localdb)\\mssqllocaldb";

            const string connectionString = @"Data Source=localhost\SQLEXPRESS01;" +
                    "Initial Catalog=Zoo;" +
                    "Persist Security Info=True;User ID=" + username + ";Password=" + password + "";

            
            using (SqlConnection con = new SqlConnection(connectionString)) 
            {
                con.Open();
                var query = $"INSERT into Mitarbeiter(Vorname, Name, Strasse, PLZ, Ort, Tätigkeit_Nr) values('" + textBoxVorname.Text + "', '" + textBoxNachname.Text+"', '"+textBoxStrasse.Text+"', '"+textBoxPlz.Text+"', '"+textBoxOrt.Text+"', '"+ listBoxAuswahlTaetigkeiten.SelectedValue+"')";

                var cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Mitarbeiter hinzugefügt.");
                con.Close();
            }
        }

        private void NeuanlageSeite_Load(object sender, EventArgs e)
        {

            const string username = "personalabteilung";
            const string password = "abc123";
            const string tempDataSource = "localhost\\SQLEXPRESS01";
            // const string productionDataSource = "(localdb)\\mssqllocaldb";

            const string connectionString = @"Data Source=localhost\SQLEXPRESS01;" +
                    "Initial Catalog=Zoo;" +
                    "Persist Security Info=True;User ID=" + username + ";Password=" + password + "";

            var connection = new SqlConnection(connectionString);

            connection.Open();
            string query = "SELECT Tätigkeit_ID, Bezeichnung FROM dbo.Tätigkeit";

            var sqlDataAdapter = new SqlDataAdapter(query, connection);
            var dt = new DataTable();

            sqlDataAdapter.Fill(dt);
            listBoxAuswahlTaetigkeiten.DataSource = dt;
            listBoxAuswahlTaetigkeiten.DisplayMember = "Bezeichnung";
            listBoxAuswahlTaetigkeiten.ValueMember = "Tätigkeit_ID";
            connection.Close();
            
        }
    }
}
