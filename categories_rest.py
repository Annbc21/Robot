from robot.libraries.BuiltIn import BuiltIn
from JsonValidator import JsonValidator

class Categories_rest(object):
    builtin_lib: BuiltIn = BuiltIn()
    js: JsonValidator = JsonValidator()

    def get_requests_lib(self):
        return self.builtin_lib.get_library_instance("Req")

    def get_data_from_rest(self, alias, params, expected_status='200'):
        result = self.get_requests_lib().get_on_session(alias=alias, url='/categories?', params=params, expected_status= expected_status)
        return result.json()

    def get_price_products_via_params(self, alias, params, ):
        result = self.get_data_from_rest(alias=alias, params=params)
        category = self.js.get_elements(result,'$..category')
        categoryname = self.js.get_elements(result, '$..categoryname')
        cat_list = (category[0],categoryname[0])
        return cat_list

    def post_data_from_rest(self, alias, data, expected_status='201'):
        result = self.get_requests_lib().post_on_session(alias=alias, url='/categories?', data=data,
                                                        expected_status=expected_status)

    def get_data_from_rest_ver2(self, alias, params, expected_status='200'):
        result = self.get_requests_lib().get_on_session(alias=alias, url='/products?', params=params, expected_status= expected_status)
        return result.json()


    def get_title_and_category(self, alias, params, ):
        result = self.get_data_from_rest_ver2(alias=alias, params=params)
        title = self.js.get_elements(result,'$..title')
        categoryname = self.js.get_elements(result, '$..categoryname')
        cat_list = (title[0],categoryname[0])
        return cat_list