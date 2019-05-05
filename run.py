from pipeline import pipeline
import argparse

parser = argparse.ArgumentParser(description="""10x single cell pipelines for CHPC

This pipeline performs sample alignment and further R analysis using
torque queueing system and written for WashU CHPC cluster

This pipeline requires single file with yaml configuration
Required fields in this YAML file are:

SampleIds: [list of name separated by comma]
SampleNames: [list of human-readable names separed by comma]
PathToFastq: path to folder that contains SampleIds
PathToAligned: path where to put the `cellranger count` results
Genome: path to cellranger reference genome
PathToAnalysis: path where to put further R analysis

""", formatter_class=argparse.RawDescriptionHelpFormatter)
parser.add_argument("config", help="YAML configuration for pipeline run", metavar="YAML_FILE")


def main():
    args = parser.parse_args()
    pipeline(args.config)


if __name__ == "__main__":
    main()