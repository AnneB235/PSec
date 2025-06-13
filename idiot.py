from tkinter import messagebox, Tk

root = Tk()
root.withdraw()

messages = [
    "Du steckst einfach fremde USB-Sticks ein? Echt jetzt?",
    "Mal ehrlich: Was dachtest du, was auf dem Stick ist? Gratis-Bitcoins?",
    "Du bist Teil eines Penetrationstests. Du hast bestanden. Als Opfer."
]

for msg in messages:
    messagebox.showwarning("USB Awareness", msg)
