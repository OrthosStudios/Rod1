shader_type spatial;
render_mode cull_disabled, specular_schlick_ggx, unshaded;




void vertex() {
// Output:0

}

void fragment() {
	ALBEDO = vec3(0.41, 0.41, 0.41);
// Input:5
	vec3 n_out5p0 = vec3(UV, 0.0);

// Input:2
	float n_out2p0 = TIME;

// Scalar:30
	float n_out30p0 = 1.200000;

// ScalarOp:31
	float n_out31p0 = n_out2p0 / n_out30p0;

// ScalarFunc:14
	float n_out14p0 = tan(n_out31p0);

// ScalarOp:13
	float n_in13p1 = 0.10000;
	float n_out13p0 = n_out14p0 / n_in13p1;

// VectorCompose:7
	float n_in7p0 = 0.00000;
	float n_in7p2 = 0.00000;
	vec3 n_out7p0 = vec3(n_in7p0, n_out13p0, n_in7p2);

// DotProduct:10
	float n_out10p0 = dot(n_out5p0, n_out7p0);

// ScalarFunc:12
	float n_out12p0 = -(n_out10p0);

// ScalarFunc:15
	float n_out15p0 = min(max(n_out12p0, 0.0), 1.0);

// ScalarFunc:17
	float n_out17p0 = 1.0 - n_out15p0;

// ScalarFunc:20
	float n_out20p0 = fract(n_out17p0);

// ScalarFunc:18
	float n_out18p0 = atan(n_out20p0);

// Scalar:22
	float n_out22p0 = 0.350000;

// ScalarOp:21
	float n_out21p0 = n_out18p0 * n_out22p0;

// ScalarFunc:28
	float n_out28p0 = -(n_out10p0);

// Input:34
	float n_out34p0 = TIME;

// Scalar:33
	float n_out33p0 = 200.000000;

// ScalarOp:32
	float n_out32p0 = n_out34p0 / n_out33p0;

// ScalarOp:35
	float n_out35p0 = n_out28p0 * n_out32p0;

// ScalarFunc:23
	float n_out23p0 = roundEven(n_out35p0);

// ScalarFunc:25
	float n_out25p0 = min(max(n_out23p0, 0.0), 1.0);

// ScalarFunc:26
	float n_out26p0 = tan(n_out25p0);

// ScalarOp:24
	float n_out24p0 = n_out21p0 * n_out26p0;

// Input:11
	vec3 n_out11p0 = COLOR.rgb;

// Output:0
	ALPHA = n_out24p0;
	EMISSION = n_out11p0;

}

void light() {
// Output:0

}
