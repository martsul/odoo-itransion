from odoo import http
from odoo.http import request

class FormViewerController(http.Controller):

    @http.route('/token_form', type='http', auth='public', website=True)
    def token_form(self, **kwargs):
        return request.render('form_viewer.token_template', {
            'submitted': False,
            'token': ''
        })

    @http.route('/submit_token', type='http', auth='public', methods=['POST'], website=True, csrf=False)
    def submit_token(self, **post):
        token = post.get('token')
        return request.render('form_viewer.token_template', {
            'submitted': True,
            'token': token
        })
