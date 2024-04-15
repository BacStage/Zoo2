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
            // const string tempDataSource = "localhost\\SQLEXPRESS01";
            // const string productionDataSource = "(localdb)\\mssqllocaldb";

            const string connectionString = @"Data Source=(localdb)\mssqllocaldb;" +
                    "Initial Catalog=Zoo;" +
                    "Persist Security Info=True;User ID=" + username + ";Password=" + password + "";

            string vorname = textBoxVorname.Text;



            using (SqlConnection con = new SqlConnection(connectionString)) 
            {
                con.Open();
                var query = $"INSERT into Mitarbeiter(Vorname, Name, Strasse, PLZ, Ort) values('"+vorname+"', '"+textBoxNachname.Text+"', '"+textBoxStrasse.Text+"', '"+textBoxPlz.Text+"', '"+textBoxOrt.Text+"')";

                var cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Mitarbeiter hinzugefügt.");
                con.Close();
            }
        }
    }
}
