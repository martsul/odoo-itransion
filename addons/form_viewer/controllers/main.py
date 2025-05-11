from odoo import http
from odoo.http import request
import requests
import json


class FormViewerController(http.Controller):

    @http.route("/token_form", type="http", auth="public", website=True)
    def token_form(self, **kwargs):
        return request.render(
            "form_viewer.token_template", {"submitted": False, "token": ""}
        )

    @http.route(
        "/submit_token",
        type="http",
        auth="public",
        methods=["POST"],
        website=True,
        csrf=False,
    )
    def submit_token(self, **post):
        token = post.get("token")
        try:
            response = requests.post(
                "https://questionnaire-server-gajm.onrender.com/api/odoo_api_key",
                headers={"Content-Type": "application/json"},
                json={"api": token},
            )

            if response.status_code == 200:
                data = {"data": response.json()}
            else:
                data = {"error": f"HTTP {response.status_code}: {response.text}"}

        except Exception as e:
            data = {"error": str(e)}

        return request.render(
            "form_viewer.token_template",
            {"submitted": True, "token": token, "data": data},
        )
