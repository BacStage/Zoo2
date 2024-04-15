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
    public partial class UebersichtSeite : UserControl
    {
        public UebersichtSeite()
        {
            InitializeComponent();
        }

        private void UebersichtSeite_Load(object sender, EventArgs e)
        {
            Fill_DatagridView();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void Fill_DatagridView()
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
            string query = "SELECT * FROM dbo.Mitarbeiter";

            var sqlDataAdapter = new SqlDataAdapter(query, connection);
            var ds = new DataSet();

            sqlDataAdapter.Fill(ds, "Mitarbeiter");
            dataGridView1.DataSource = ds;
            dataGridView1.DataMember = "Mitarbeiter";
            connection.Close();
        }
    }
}
