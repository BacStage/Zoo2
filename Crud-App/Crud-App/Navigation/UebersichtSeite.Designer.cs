using System.Data.SqlClient;

namespace Crud_App.Navigation
{
    partial class UebersichtSeite
    {
        /// <summary> 
        /// Erforderliche Designervariable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Verwendete Ressourcen bereinigen.
        /// </summary>
        /// <param name="disposing">True, wenn verwaltete Ressourcen gelöscht werden sollen; andernfalls False.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);

            // new SqlConnection = 
        }

        #region Vom Komponenten-Designer generierter Code

        /// <summary> 
        /// Erforderliche Methode für die Designerunterstützung. 
        /// Der Inhalt der Methode darf nicht mit dem Code-Editor geändert werden.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.bindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.label1 = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.mitarbeiterData = new Crud_App.MitarbeiterData();
            this.mitarbeiterBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.mitarbeiterTableAdapter = new Crud_App.MitarbeiterDataTableAdapters.MitarbeiterTableAdapter();
            this.mitarbeiterIDDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.vornameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.strasseDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pLZDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ortDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tätigkeitNrDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.geschlechtDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.aktivDataGridViewCheckBoxColumn = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.mitarbeiterData)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.mitarbeiterBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(389, 56);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(221, 24);
            this.label1.TabIndex = 0;
            this.label1.Text = "Übersicht aller Mitarbeiter";
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.mitarbeiterIDDataGridViewTextBoxColumn,
            this.nameDataGridViewTextBoxColumn,
            this.vornameDataGridViewTextBoxColumn,
            this.strasseDataGridViewTextBoxColumn,
            this.pLZDataGridViewTextBoxColumn,
            this.ortDataGridViewTextBoxColumn,
            this.tätigkeitNrDataGridViewTextBoxColumn,
            this.geschlechtDataGridViewTextBoxColumn,
            this.aktivDataGridViewCheckBoxColumn});
            this.dataGridView1.DataSource = this.mitarbeiterBindingSource;
            this.dataGridView1.Location = new System.Drawing.Point(27, 121);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.Size = new System.Drawing.Size(956, 448);
            this.dataGridView1.TabIndex = 1;
            // 
            // mitarbeiterData
            // 
            this.mitarbeiterData.DataSetName = "MitarbeiterData";
            this.mitarbeiterData.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // mitarbeiterBindingSource
            // 
            this.mitarbeiterBindingSource.DataMember = "Mitarbeiter";
            this.mitarbeiterBindingSource.DataSource = this.mitarbeiterData;
            // 
            // mitarbeiterTableAdapter
            // 
            this.mitarbeiterTableAdapter.ClearBeforeFill = true;
            // 
            // mitarbeiterIDDataGridViewTextBoxColumn
            // 
            this.mitarbeiterIDDataGridViewTextBoxColumn.DataPropertyName = "Mitarbeiter_ID";
            this.mitarbeiterIDDataGridViewTextBoxColumn.HeaderText = "Mitarbeiter_ID";
            this.mitarbeiterIDDataGridViewTextBoxColumn.Name = "mitarbeiterIDDataGridViewTextBoxColumn";
            this.mitarbeiterIDDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // nameDataGridViewTextBoxColumn
            // 
            this.nameDataGridViewTextBoxColumn.DataPropertyName = "Name";
            this.nameDataGridViewTextBoxColumn.HeaderText = "Name";
            this.nameDataGridViewTextBoxColumn.Name = "nameDataGridViewTextBoxColumn";
            this.nameDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // vornameDataGridViewTextBoxColumn
            // 
            this.vornameDataGridViewTextBoxColumn.DataPropertyName = "Vorname";
            this.vornameDataGridViewTextBoxColumn.HeaderText = "Vorname";
            this.vornameDataGridViewTextBoxColumn.Name = "vornameDataGridViewTextBoxColumn";
            this.vornameDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // strasseDataGridViewTextBoxColumn
            // 
            this.strasseDataGridViewTextBoxColumn.DataPropertyName = "Strasse";
            this.strasseDataGridViewTextBoxColumn.HeaderText = "Strasse";
            this.strasseDataGridViewTextBoxColumn.Name = "strasseDataGridViewTextBoxColumn";
            this.strasseDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // pLZDataGridViewTextBoxColumn
            // 
            this.pLZDataGridViewTextBoxColumn.DataPropertyName = "PLZ";
            this.pLZDataGridViewTextBoxColumn.HeaderText = "PLZ";
            this.pLZDataGridViewTextBoxColumn.Name = "pLZDataGridViewTextBoxColumn";
            this.pLZDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // ortDataGridViewTextBoxColumn
            // 
            this.ortDataGridViewTextBoxColumn.DataPropertyName = "Ort";
            this.ortDataGridViewTextBoxColumn.HeaderText = "Ort";
            this.ortDataGridViewTextBoxColumn.Name = "ortDataGridViewTextBoxColumn";
            this.ortDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // tätigkeitNrDataGridViewTextBoxColumn
            // 
            this.tätigkeitNrDataGridViewTextBoxColumn.DataPropertyName = "Tätigkeit_Nr";
            this.tätigkeitNrDataGridViewTextBoxColumn.HeaderText = "Tätigkeit_Nr";
            this.tätigkeitNrDataGridViewTextBoxColumn.Name = "tätigkeitNrDataGridViewTextBoxColumn";
            this.tätigkeitNrDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // geschlechtDataGridViewTextBoxColumn
            // 
            this.geschlechtDataGridViewTextBoxColumn.DataPropertyName = "Geschlecht";
            this.geschlechtDataGridViewTextBoxColumn.HeaderText = "Geschlecht";
            this.geschlechtDataGridViewTextBoxColumn.Name = "geschlechtDataGridViewTextBoxColumn";
            this.geschlechtDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // aktivDataGridViewCheckBoxColumn
            // 
            this.aktivDataGridViewCheckBoxColumn.DataPropertyName = "aktiv";
            this.aktivDataGridViewCheckBoxColumn.HeaderText = "aktiv";
            this.aktivDataGridViewCheckBoxColumn.Name = "aktivDataGridViewCheckBoxColumn";
            this.aktivDataGridViewCheckBoxColumn.ReadOnly = true;
            // 
            // UebersichtSeite
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.label1);
            this.Name = "UebersichtSeite";
            this.Size = new System.Drawing.Size(1033, 634);
            this.Load += new System.EventHandler(this.UebersichtSeite_Load);
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.mitarbeiterData)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.mitarbeiterBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion


        private System.Windows.Forms.BindingSource bindingSource1;
        private System.Windows.Forms.Label label1;

        
        public System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DataGridViewTextBoxColumn mitarbeiterIDDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn vornameDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn strasseDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn pLZDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn ortDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn tätigkeitNrDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn geschlechtDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewCheckBoxColumn aktivDataGridViewCheckBoxColumn;
        private System.Windows.Forms.BindingSource mitarbeiterBindingSource;
        private MitarbeiterData mitarbeiterData;
        private MitarbeiterDataTableAdapters.MitarbeiterTableAdapter mitarbeiterTableAdapter;
    }
}
