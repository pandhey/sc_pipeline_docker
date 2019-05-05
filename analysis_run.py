import os
import copy
import pathlib
from exception_and_warnings import *
from jinja2 import Environment, FileSystemLoader

TEMPLATE_DIR = "/path_to/templates"


def prepare_files(work_dir, config):
    with open(os.path.join(work_dir, "analysis.R"), "w") as analysis_file, \
            open(os.path.join(work_dir, "task.bash"), "w") as task_file:
        j2_env = Environment(loader=FileSystemLoader(TEMPLATE_DIR),
                             trim_blocks=True)

        rendered_code = j2_env.get_template('analysis.R').render(**config)
        analysis_file.write(rendered_code)
        rendered_task = j2_env.get_template('task.bash').render(**config)
        task_file.write(rendered_task)


def prepare_meta_files(work_dir, config):
    with open(os.path.join(work_dir, "align_task.bash"), "w") as align_task_file, \
            open(os.path.join(work_dir, "super_task.bash"), "w") as super_task_file:
        j2_env = Environment(loader=FileSystemLoader(TEMPLATE_DIR),
                             trim_blocks=True)

        rendered_code = j2_env.get_template('align_task.bash').render(**config)
        align_task_file.write(rendered_code)
        rendered_task = j2_env.get_template('super_task.bash').render(**config)
        super_task_file.write(rendered_task)


def analysis_run(config):
    work_dir = config["AnalysisFolder"]
    pathlib.Path(work_dir).mkdir(parents=True, exist_ok=True)
    prepare_files(work_dir, config)


def analysis(config):
    pathlib.Path(config["PathToAnalysis"]).mkdir(parents=True, exist_ok=True)
    prepare_meta_files(config["PathToAnalysis"], config)
    if config['Merge']:
        if len(config['SampleIds']) > 1:
            config_local = copy.deepcopy(config)
            config_local["AnalysisFolder"] = os.path.join(config["PathToAnalysis"], "merged")
            config_local["AnalysisType"] = "many"
            analysis_run(config_local)
        else:
            warnings.warn("Less than two samples but `Merge` set True, skipping merge")

    if config['RunSingleAnalysis']:
        for i, sample in enumerate(config["SampleIds"]):
            config_local = copy.deepcopy(config)
            config_local["AnalysisFolder"] = os.path.join(config["PathToAnalysis"],
                                                          config["SampleIds"][i])
            config_local["SampleId"] = config["SampleIds"][i]
            config_local["SampleName"] = config["SampleNames"][i]
            config_local["AnalysisType"] = "single"
            analysis_run(config_local)

