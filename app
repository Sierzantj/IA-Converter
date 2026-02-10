from flask import Flask, render_template, request
#kdsajds

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/convert', methods=['POST'])
def convert():
    number = int(request.form['number'])
    #base = request.form['base']
    stbase = int(request.form['inbase'])
    endbase = int(request.form['endbase'])

    # Simple example: decimal to binary
    result = 0
    bs10 = 0
    final = 0
    step1 = 0
    conversion = str(number) + " converted from base " + str(stbase) + " to base " + str(endbase)
    # Begin Instructions Section

         # Find base 10
    
    # Base 10 --> End base
    # End Instruction Section

    for x in range(0,15):
           #test = ((number % 10**()))
           dig = ((number % 10**(x+1)) // 10**x) * stbase**x
           bs10 = bs10 + dig
    for y in range(0,15):
           convdig = ((bs10 % endbase**(y+1)) // endbase**y) * 10**y
           print(convdig)
           final = final + convdig
    result = final
    if stbase == endbase:
         step1 = "No conversion necessary, number will not change"
         result = number
    return render_template('index.html', result=result, conversion=conversion, step1=step1)
if __name__ == '__main__':
    app.run(debug=True)
