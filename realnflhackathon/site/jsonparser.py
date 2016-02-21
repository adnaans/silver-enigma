import json

with open('data.json', 'r+') as f:
    data = json.load(f)
    data['id'] = 134 # <--- add `id` value.
    f.seek(0)        # <--- should reset file position to the beginning.
    json.dump(data, f, indent=4)