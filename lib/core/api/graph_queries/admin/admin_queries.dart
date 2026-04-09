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
}
