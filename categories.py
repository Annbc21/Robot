from robot.libraries.BuiltIn import BuiltIn

class Categories(object):
    builtin_lib: BuiltIn = BuiltIn()
    def get_postgresql_lib(self):
        return self.builtin_lib.get_library_instance("DB")

    def get_categories_by_category(self, category):
        sql = """SELECT * from bootcamp.categories p where p.category=%(category)s"""
        params = {"category": category}
        return self.get_postgresql_lib().execute_sql_string(sql, **params)

    def get_title_and_category_from_db(self):
        sql = """SELECT p.title, c.categoryname from bootcamp.products p 
                LEFT OUTER JOIN bootcamp.categories c ON c.category = p.category
                where p.title = 'ACADEMY ICE'"""
        return self.get_postgresql_lib().execute_sql_string(sql)

    def insert_test_variables(self,params):
        sql = """INSERT into bootcamp.categories (category, categoryname) VALUES (%(category)s ,%(categoryname)s)"""
        return self.get_postgresql_lib().execute_plpgsql_block(sql, **params)