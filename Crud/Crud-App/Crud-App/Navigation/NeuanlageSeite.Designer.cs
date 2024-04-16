
namespace Crud_App.Navigation
{
    partial class NeuanlageSeite
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
        }

        #region Vom Komponenten-Designer generierter Code

        /// <summary> 
        /// Erforderliche Methode für die Designerunterstützung. 
        /// Der Inhalt der Methode darf nicht mit dem Code-Editor geändert werden.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.textBoxVorname = new System.Windows.Forms.TextBox();
            this.textBoxNachname = new System.Windows.Forms.TextBox();
            this.textBoxStrasse = new System.Windows.Forms.TextBox();
            this.textBoxPlz = new System.Windows.Forms.TextBox();
            this.textBoxOrt = new System.Windows.Forms.TextBox();
            this.anlegenButton = new System.Windows.Forms.Button();
            this.listBoxAuswahlTaetigkeiten = new System.Windows.Forms.ListBox();
            this.zooDataSet1 = new Crud_App.ZooDataSet1();
            this.tätigkeitBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.tätigkeitTableAdapter = new Crud_App.ZooDataSet1TableAdapters.TätigkeitTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.zooDataSet1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tätigkeitBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(347, 49);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(234, 24);
            this.label1.TabIndex = 0;
            this.label1.Text = "Neuen Mitarbeiter anlegen";
            this.label1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(56, 118);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(63, 16);
            this.label2.TabIndex = 1;
            this.label2.Text = "Vorname";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(56, 154);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(74, 16);
            this.label3.TabIndex = 2;
            this.label3.Text = "Nachname";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(56, 242);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(48, 16);
            this.label5.TabIndex = 4;
            this.label5.Text = "Straße";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(56, 277);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(76, 16);
            this.label6.TabIndex = 6;
            this.label6.Text = "Postleitzahl";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(56, 317);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(25, 16);
            this.label7.TabIndex = 7;
            this.label7.Text = "Ort";
            // 
            // textBoxVorname
            // 
            this.textBoxVorname.Location = new System.Drawing.Point(147, 118);
            this.textBoxVorname.Name = "textBoxVorname";
            this.textBoxVorname.Size = new System.Drawing.Size(200, 20);
            this.textBoxVorname.TabIndex = 8;
            // 
            // textBoxNachname
            // 
            this.textBoxNachname.Location = new System.Drawing.Point(147, 151);
            this.textBoxNachname.Name = "textBoxNachname";
            this.textBoxNachname.Size = new System.Drawing.Size(200, 20);
            this.textBoxNachname.TabIndex = 9;
            // 
            // textBoxStrasse
            // 
            this.textBoxStrasse.Location = new System.Drawing.Point(147, 239);
            this.textBoxStrasse.Name = "textBoxStrasse";
            this.textBoxStrasse.Size = new System.Drawing.Size(200, 20);
            this.textBoxStrasse.TabIndex = 10;
            // 
            // textBoxPlz
            // 
            this.textBoxPlz.Location = new System.Drawing.Point(147, 276);
            this.textBoxPlz.Name = "textBoxPlz";
            this.textBoxPlz.Size = new System.Drawing.Size(200, 20);
            this.textBoxPlz.TabIndex = 11;
            // 
            // textBoxOrt
            // 
            this.textBoxOrt.Location = new System.Drawing.Point(147, 317);
            this.textBoxOrt.Name = "textBoxOrt";
            this.textBoxOrt.Size = new System.Drawing.Size(200, 20);
            this.textBoxOrt.TabIndex = 12;
            // 
            // anlegenButton
            // 
            this.anlegenButton.Location = new System.Drawing.Point(505, 307);
            this.anlegenButton.Name = "anlegenButton";
            this.anlegenButton.Size = new System.Drawing.Size(129, 36);
            this.anlegenButton.TabIndex = 13;
            this.anlegenButton.Text = "Anlegen";
            this.anlegenButton.UseVisualStyleBackColor = true;
            this.anlegenButton.Click += new System.EventHandler(this.button1_Click);
            // 
            // listBoxAuswahlTaetigkeiten
            // 
            this.listBoxAuswahlTaetigkeiten.DataSource = this.tätigkeitBindingSource;
            this.listBoxAuswahlTaetigkeiten.DisplayMember = "Bezeichnung";
            this.listBoxAuswahlTaetigkeiten.FormattingEnabled = true;
            this.listBoxAuswahlTaetigkeiten.Location = new System.Drawing.Point(503, 127);
            this.listBoxAuswahlTaetigkeiten.Name = "listBoxAuswahlTaetigkeiten";
            this.listBoxAuswahlTaetigkeiten.Size = new System.Drawing.Size(263, 108);
            this.listBoxAuswahlTaetigkeiten.TabIndex = 14;
            this.listBoxAuswahlTaetigkeiten.ValueMember = "Tätigkeit_ID";
            // 
            // zooDataSet1
            // 
            this.zooDataSet1.DataSetName = "ZooDataSet1";
            this.zooDataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // tätigkeitBindingSource
            // 
            this.tätigkeitBindingSource.DataMember = "Tätigkeit";
            this.tätigkeitBindingSource.DataSource = this.zooDataSet1;
            // 
            // tätigkeitTableAdapter
            // 
            this.tätigkeitTableAdapter.ClearBeforeFill = true;
            // 
            // NeuanlageSeite
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.listBoxAuswahlTaetigkeiten);
            this.Controls.Add(this.anlegenButton);
            this.Controls.Add(this.textBoxOrt);
            this.Controls.Add(this.textBoxPlz);
            this.Controls.Add(this.textBoxStrasse);
            this.Controls.Add(this.textBoxNachname);
            this.Controls.Add(this.textBoxVorname);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "NeuanlageSeite";
            this.Size = new System.Drawing.Size(978, 552);
            this.Load += new System.EventHandler(this.NeuanlageSeite_Load);
            ((System.ComponentModel.ISupportInitialize)(this.zooDataSet1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tätigkeitBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox textBoxVorname;
        private System.Windows.Forms.TextBox textBoxNachname;
        private System.Windows.Forms.TextBox textBoxStrasse;
        private System.Windows.Forms.TextBox textBoxPlz;
        private System.Windows.Forms.TextBox textBoxOrt;
        private System.Windows.Forms.Button anlegenButton;
        private System.Windows.Forms.ListBox listBoxAuswahlTaetigkeiten;
        private System.Windows.Forms.BindingSource tätigkeitBindingSource;
        private ZooDataSet1 zooDataSet1;
        private ZooDataSet1TableAdapters.TätigkeitTableAdapter tätigkeitTableAdapter;
    }
}
