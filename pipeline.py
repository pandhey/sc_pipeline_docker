import yaml
from analysis_run import analysis

def pipeline(config_file_name):
    with open(config_file_name) as config, \
            open("defaults.yaml") as defaults:
        run_dict = yaml.load(defaults)
        config_dict = yaml.load(config)
        run_dict.update(config_dict)

    analysis(run_dict)

