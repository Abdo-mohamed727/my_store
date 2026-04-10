class AdminQueries {
  factory AdminQueries() => instance;

  const AdminQueries._();

  static const AdminQueries instance = AdminQueries._();

  Map<String, dynamic> getProductsNumberQuery() {
    return {
      'query': '''
       {
         products {
           title
         }
       }
''',
    };
  }

  Map<String, dynamic> getUsersNumberQuery() {
    return {
      'query': '''
       {
         users {
           name
         }
       }
''',
    };
  }

  Map<String, dynamic> getCategoryNumberQuery() {
    return {
      'query': '''
       {
         categories {
           id
         }
       }
''',
    };
  }

  Map<String, dynamic> getAllCategoriesQuery() {
    return {
      'query': '''
       {
         categories {
           id
           name
           image
         }
       }
''',
    };
  }

  Map<String, dynamic> createCategoryQuery({
    required String name,
    required String image,
  }) {
    return {
      'query': r'''
mutation CreateCategory($name: String!, $image: String!) {
  addCategory(data: { name: $name, image: $image }) {
    id
    name
    image
  }
}
''',
      'variables': {
        'name': name,
        'image': image,
      },
    };
  }

  Map<String, dynamic> getAllProductsQuery() {
    return {
      'query': '''
       {
         products {
           id
           title
           price
           description
           images
           category {
             id
             name
           }
         }
       }
''',
    };
  }

  Map<String, dynamic> deleteCategoryQuery({required String id}) {
    return {
      'query': r'''
mutation DeleteCategory($id: ID!) {
  deleteCategory(id: $id)
}
''',
      'variables': {
        'id': id,
      },
    };
  }

  Map<String, dynamic> updateCategoryQuery({
    required String id,
    required String name,
    required String image,
  }) {
    return {
      'query': r'''
mutation UpdateCategory($id: ID!, $name: String!, $image: String!) {
  updateCategory(id: $id, changes: { name: $name, image: $image }) {
    id
    name
    image
  }
}
''',
      'variables': {
        'id': id,
        'name': name,
        'image': image,
      },
    };
  }

  Map<String, dynamic> createProductQuery({
    required String title,
    required double price,
    required String description,
    required List<String> images,
    required String categoryId,
  }) {
    return {
      'query': r'''
mutation CreateProduct($title: String!, $price: Float!, $description: String!, $images: [String!]!, $categoryId: Float!) {
  addProduct(data: { title: $title, price: $price, description: $description, images: $images, categoryId: $categoryId }) {
    id
    title
  }
}
''',
      'variables': {
        'title': title,
        'price': price,
        'description': description,
        'images': images,
        'categoryId': double.parse(categoryId),
      },
    };
  }
  Map<String, dynamic> updateProductQuery({
    required String id,
    required String title,
    required double price,
    required String description,
    required List<String> images,
    required String categoryId,
  }) {
    return {
      'query': r'''
mutation UpdateProduct($id: ID!, $title: String!, $price: Float!, $description: String!, $images: [String!]!, $categoryId: Float!) {
  updateProduct(id: $id, changes: { title: $title, price: $price, description: $description, images: $images, categoryId: $categoryId }) {
    id
    title
  }
}
''',
      'variables': {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'images': images,
        'categoryId': double.parse(categoryId),
      },
    };
  }
}
