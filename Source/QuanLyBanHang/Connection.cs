using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyBanHang
{
    class Connection
    {
        public static SqlConnection connect = new SqlConnection(@"Data Source=DESKTOP-74B7VKK\SQLEXPRESS;Initial Catalog=ACCOUNTANT_MANAGEMENT;Integrated Security=True");
    }
}
