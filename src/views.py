from django.shortcuts import render
from collections import OrderedDict
from django.http import HttpResponse
import os

# Create your views here.

def index(request):
    return render(request, 'src/index.html')


lists = OrderedDict([('col_height', ''), ('plinth_width', ''), ('beam_width', ''),
            ('cylinder_diameter', ''), ('roof_diameter', ''), ('lid_diameter', '')])

def specs(request):
    for var in lists.keys():
        #print var +"  "+request.POST.get(var)
        lists[var] = str(request.POST.get(var))
    print lists

    for var in lists.items():
        cmd = "sed -e "+"'s/"+var[0]+".*"+"/"+var[0]+"="+var[1]+";/g' openscad/values.scad "+ "> openscad/values_old.scad"
        os.system(cmd)
        cmd = "mv openscad/values_old.scad openscad/values.scad"
        print cmd
        os.system(cmd)
    return render(request, 'src/specs.html', {'lists': lists})

def download(request):
    cmd = "zip -r openscad/watertank.zip openscad/*"
    os.system(cmd)
    command = "openscad/watertank.zip"
    f = open(command)
    response = HttpResponse(f, content_type='application/zip')
    response['Content-Disposition'] = 'attachment; filename="watertank.zip"'
    return response
