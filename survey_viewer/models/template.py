from odoo import models, fields

class SurveyTemplate(models.Model):
    _name = "survey.template"
    _description = "Survey Template"

    author = fields.Char(string="Author")
    title = fields.Char(string="Title")
    questions = fields.One2many("survey.question", "template_id", string="Questions")


class SurveyQuestion(models.Model):
    _name = "survey.question"
    _description = "Survey Question"

    template_id = fields.Many2one("survey.template", string="Template")
    text = fields.Char(string="Question Text")
    type = fields.Selection([
        ("text", "Text"),
        ("number", "Number")
    ], string="Question Type")

    num_answers = fields.Integer(string="Number of Answers")
    avg = fields.Float(string="Average")
    min = fields.Float(string="Min")
    max = fields.Float(string="Max")
    top_answers = fields.Text(string="Top Answers (for text)")
