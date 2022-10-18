from .models import Posts
from django import forms

class PostsForm(forms.Form):
    content = forms.CharField(widget=forms.Textarea)
    def __init__(self, *args, **kwargs):
        super(PostsForm, self).__init__(*args, **kwargs)
        for name in self.fields.keys():
            self.fields[name].widget.attrs.update({
                'class': 'form-control',
                'placeholder':'writing something...',
                'rows': '5'
            })

