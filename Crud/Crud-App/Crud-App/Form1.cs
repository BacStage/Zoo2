using Crud_App.Navigation;
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
using navigation = Crud_App.Navigation;

namespace Crud_App
{
    public partial class Form1 : Form
    {
        NavigationControl navigationControl;

        public Form1()
        {
            InitializeComponent();
            InitializeNavigationControl();
        }

        public void InitializeNavigationControl()
        {
            List<UserControl> userControls = new List<UserControl>()
            {
                new UebersichtSeite(),
                new NeuanlageSeite(),
                new UpdateSeite()
            };

            navigationControl = new NavigationControl(userControls, inhaltPanel);
            navigationControl.Display(0);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            navigationControl.Display(0);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            navigationControl.Display(1);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            navigationControl.Display(2);
        }

        private void button4_Click(object sender, EventArgs e)
        {
            navigationControl.Display(3);
        }
    }
}
