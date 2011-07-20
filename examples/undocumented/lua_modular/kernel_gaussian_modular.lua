require 'shogun'
require 'load'

traindat = load_numbers('../data/fm_train_real.dat')
testdat = load_numbers('../data/fm_test_real.dat')

parameter_list = {{traindat,testdat, 1.3},{traindat,testdat, 1.4}}

function kernel_gaussian_modular (fm_train_real,fm_test_real,width)

	feats_train=RealFeatures(fm_train_real)
	feats_test=RealFeatures(fm_test_real)

	kernel=GaussianKernel(feats_train, feats_train, width)
	
	km_train=kernel:get_kernel_matrix()
	kernel:init(feats_train, feats_test)
	km_test=kernel:get_kernel_matrix()

	return km_train,km_test,kernel
end

print 'Gaussian'
kernel_gaussian_modular(unpack(parameter_list[1]))