def r(*args, **kwargs):
    with open(*args, **kwargs) as f:
        return f.read()
