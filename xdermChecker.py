import requests
import subprocess

resp = requests.get('https://api.ipify.org/?format=json')
if resp.status_code == 200 :
    respJSON = resp.json()
    if respJSON['ip'] != '' :
        process = subprocess.Popen(['xderm-mini', 'start'], 
                           stdout=subprocess.PIPE,
                           universal_newlines=True)
        while True:
            output = process.stdout.readline()
            print(output.strip())
            # Do something else
            return_code = process.poll()
            if return_code is not None:
                print('RETURN CODE', return_code)
                # Process has finished, read rest of the output 
                for output in process.stdout.readlines():
                    print(output.strip())
                break
