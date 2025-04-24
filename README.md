# E-commerce Database Design

## Overview
This project implements a comprehensive e-commerce database design with multiple interconnected tables to manage products, categories, variations, and attributes.

## Database Structure
The database consists of the following key tables:

### Product Management
- `product` - Core product details including name, brand and base price
- `product_item` - Individual purchasable items with specific variations
- `product_image` - Product image URLs and file references
- `product_variation` - Links products to their variations (size, color etc)

### Categories & Classifications  
- `product_category` - Product classification (clothing, electronics etc)
- `brand` - Brand information and details
- `color` - Available color options

### Size Management
- `size_category` - Groups sizes by type (clothing, shoes etc) 
- `size_option` - Individual size options (S, M, L, 42 etc)

### Attributes
- `product_attribute` - Custom product attributes (material, weight etc)
- `attribute_category` - Attribute groupings (physical, technical)
- `attribute_type` - Attribute data types (text, number, boolean)

## Entity Relationship Diagram
The database schema and relationships are documented in the included ERD diagram. Key features:
- Clear entity definitions and attributes
- Primary/foreign key relationships
- Data flow between tables

## Implementation
- Database creation script available in `ecommerce.sql`
- Tables created with appropriate constraints and relationships
- Sample data included for testing

## Usage
1. Review the ERD to understand the database structure
2. Execute the SQL script to create the database and tables
3. Modify as needed for specific requirements

## Contributing
1. Fork the repository
2. Create a feature branch
3. Submit a pull request
