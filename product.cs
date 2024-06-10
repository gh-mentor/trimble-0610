/*
This class represents a product in the database. It has the following properties:


*/


public class Product
{
    private int m_id;
    private string m_name;
    private decimal m_price;
    private int m_categoryId;
    private DateTime m_createdAt;
    private DateTime m_updatedAt;

    public int Id
    {
        get { return m_id; }
        set { m_id = value; }
    }

    public string Name
    {
        get { return m_name; }
        set { m_name = value; }
    }

    public decimal Price
    {
        get { return m_price; }
        set {
            
            if (value > 0)
            {
                m_price = value;
            }
            else
            {
                throw new ArgumentException("Price must be greater than zero.");
            }
            
        }
    }

    public int CategoryId
    {
        get { return m_categoryId; }
        set { m_categoryId = value; }
    }

    public DateTime CreatedAt
    {
        get { return m_createdAt; }
        set { m_createdAt = value; }
    }

    public DateTime UpdatedAt
    {
        get { return m_updatedAt; }
        set { m_updatedAt = value; }
    }
}