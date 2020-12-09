import numpy as np

class trickyNumber:
	def __init__(self, mantisa, exponent):
		self.mantisa = mantisa
		self.exponent = exponent

	def mul(self, L_num):
		res = trickyNumber(0, 0)
		res.mantisa = self.mantisa * L_num.mantisa
		res.exponent = self.exponent + L_num.exponent

		return res

	def divide(self, L_num):
		res = trickyNumber(0, 0)
		res.mantisa = self.mantisa / L_num.mantisa
		res.exponent = self.exponent - L_num.exponent

		return res
	
	def show(self):
		print("%7.6fE%3d"%(self.mantisa, self.exponent))
	
	def get_val(self):
		return self.mantisa * (10 ** self.exponent)
	

hbar = trickyNumber(1.0545718, -34) #m^2 kg/s
ele_mass = trickyNumber(9.10938356, -31) #kg
ele_2mass = ele_mass.mul(trickyNumber(2, 0))
v = 0.9915114759184130
G = np.array([v, v, v])
G_squre = trickyNumber(G.dot(G), 0) #(1/bohr**2)
m_div_bohr_sq = trickyNumber(1.88973**2, 20)
J_to_Ry = trickyNumber(4.587420897, 17)

hbar_squre = hbar.mul(hbar)

cut_off_mixUnit = G_squre.mul(hbar_squre).divide(ele_2mass)
cut_off = cut_off_mixUnit.mul(m_div_bohr_sq).mul(J_to_Ry)

cut_off = cut_off.get_val()
v = cut_off ** 3
igwx = ((4 * np.pi / 3) * (85 ** 3) / v )

print("igwx = %.0f"%(igwx/(8)))
