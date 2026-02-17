
# -*- coding: utf-8 -*-

"""

NetBackup Error Code Definitions (49 codes)

"""



ERROR_CODE_MAP = {

    '1': {'name': 'Partially Successful Operation', 'category': 'Status', 'automation_level': 'LEVEL_1'},

    '2': {'name': 'No Files Backed Up', 'category': 'Backup', 'automation_level': 'LEVEL_2'},

    '3': {'name': 'Valid Archive But No Files Deleted', 'category': 'Archive', 'automation_level': 'LEVEL_1'},

    '4': {'name': 'Archive File Removal Failed', 'category': 'Archive', 'automation_level': 'LEVEL_2'},

    '5': {'name': 'Restore Failed', 'category': 'Restore', 'automation_level': 'LEVEL_2'},

    '6': {'name': 'Backup Failed', 'category': 'Backup', 'automation_level': 'LEVEL_2'},

    '7': {'name': 'Archive Failed', 'category': 'Archive', 'automation_level': 'LEVEL_2'},

    '10': {'name': 'Allocation Failed', 'category': 'System', 'automation_level': 'LEVEL_2'},

    '11': {'name': 'System Call Failed', 'category': 'System', 'automation_level': 'LEVEL_2'},

    '12': {'name': 'File Open Failed', 'category': 'File I/O', 'automation_level': 'LEVEL_2'},

    '13': {'name': 'File Read Failed', 'category': 'File I/O', 'automation_level': 'LEVEL_1'},

    '14': {'name': 'File Write Failed', 'category': 'File I/O', 'automation_level': 'LEVEL_2'},

    '15': {'name': 'File Close Failed', 'category': 'File I/O', 'automation_level': 'LEVEL_2'},

    '19': {'name': 'GetServByName Failed', 'category': 'Network', 'automation_level': 'LEVEL_2'},

    '20': {'name': 'Invalid Command Parameter', 'category': 'Configuration', 'automation_level': 'LEVEL_1'},

    '21': {'name': 'Socket Open Failed', 'category': 'Network', 'automation_level': 'LEVEL_2'},

    '22': {'name': 'Socket Close Failed', 'category': 'Network', 'automation_level': 'LEVEL_2'},

    '23': {'name': 'Socket Read Failed', 'category': 'Network', 'automation_level': 'LEVEL_2'},

    '24': {'name': 'Socket Write Failed', 'category': 'Network', 'automation_level': 'LEVEL_2'},

    '25': {'name': 'Cannot Connect on Socket', 'category': 'Network', 'automation_level': 'LEVEL_1'},

    '26': {'name': 'Cannot Listen on Socket', 'category': 'Network', 'automation_level': 'LEVEL_2'},

    '41': {'name': 'Network Connection Broken', 'category': 'Network', 'automation_level': 'LEVEL_1'},

    '42': {'name': 'Network Connection Timed Out', 'category': 'Network', 'automation_level': 'LEVEL_2'},

    '43': {'name': 'Network Data Send Failed', 'category': 'Network', 'automation_level': 'LEVEL_2'},

    '48': {'name': 'Client Hostname Not Found', 'category': 'Network', 'automation_level': 'LEVEL_1'},

    '54': {'name': 'Client Not Found', 'category': 'Network', 'automation_level': 'LEVEL_2'},

    '58': {'name': 'Client Communication Failed', 'category': 'Network', 'automation_level': 'LEVEL_2'},

    '83': {'name': 'Media Open Error', 'category': 'Media/Tape', 'automation_level': 'LEVEL_2'},

    '84': {'name': 'Media Write Error', 'category': 'Media/Tape', 'automation_level': 'LEVEL_2'},

    '85': {'name': 'Media Read Error', 'category': 'Media/Tape', 'automation_level': 'LEVEL_2'},

    '86': {'name': 'Media Position Error', 'category': 'Media/Tape', 'automation_level': 'LEVEL_2'},

    '87': {'name': 'Media Verify Error', 'category': 'Media/Tape', 'automation_level': 'LEVEL_2'},

    '88': {'name': 'Media Mount Error', 'category': 'Media/Tape', 'automation_level': 'LEVEL_2'},

    '89': {'name': 'Shared Memory Setup Failed', 'category': 'System', 'automation_level': 'LEVEL_2'},

    '96': {'name': 'Drive Not Available', 'category': 'Media/Tape', 'automation_level': 'LEVEL_2'},

    '150': {'name': 'Storage Unit Not Available', 'category': 'Storage', 'automation_level': 'LEVEL_2'},

    '158': {'name': 'Disk Volume Full', 'category': 'Storage', 'automation_level': 'LEVEL_1'},

    '196': {'name': 'Storage Unit Write Failed', 'category': 'Storage', 'automation_level': 'LEVEL_2'},

    '213': {'name': 'Tape Drive Offline', 'category': 'Media/Tape', 'automation_level': 'LEVEL_2'},

    '222': {'name': 'Media ID Mismatch', 'category': 'Media/Tape', 'automation_level': 'LEVEL_2'},

    '227': {'name': 'Media Configuration Error', 'category': 'Media/Tape', 'automation_level': 'LEVEL_2'},

    '230': {'name': 'No Media Available', 'category': 'Media/Tape', 'automation_level': 'LEVEL_2'},

    '833': {'name': 'Policy Schedule Not Found', 'category': 'Policy', 'automation_level': 'LEVEL_1'},

    '896': {'name': 'Policy Execution Failed', 'category': 'Policy', 'automation_level': 'LEVEL_2'},

    '2074': {'name': 'Catalog Database Error', 'category': 'Database', 'automation_level': 'LEVEL_2'},

    '2820': {'name': 'Connection Failed', 'category': 'Network', 'automation_level': 'LEVEL_1'},

    '3012': {'name': 'Restore Session Failed', 'category': 'Restore', 'automation_level': 'LEVEL_2'},

    '4032': {'name': 'Archive Policy Error', 'category': 'Policy', 'automation_level': 'LEVEL_2'},

    '5110': {'name': 'Deduplication Error', 'category': 'Storage', 'automation_level': 'LEVEL_2'},

}

