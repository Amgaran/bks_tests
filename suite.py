import os
import pandas as pd
from generator import generate_case_files


def strip_meta_datadir(meta):
    meta['datadir'] = meta['datadir'].apply(lambda x: os.path.split(x)[-1])
    return meta


def generate_cases_for_all(meta, directory='bugs'):
    df_list = list(meta.T.to_dict().values())
    for case in df_list:
        generate_case_files(case, os.path.join(directory, case['datadir']))
