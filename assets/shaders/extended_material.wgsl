#import bevy_pbr::pbr_fragment
#import bevy_pbr::pbr_types

// This is a bit unfortunate. Maybe something clever could be done here?
#ifdef MESHLET_MESH_MATERIAL_PASS
#import bevy_pbr::meshlet_visibility_buffer_resolve::VertexOutput
#else ifdef PREPASS_PIPELINE
#import bevy_pbr::prepass_io::VertexOutput
#else
#import bevy_pbr::forward_io::VertexOutput
#endif

override fn pbr_fragment::pbr_input_from_standard_material(in: VertexOutput,
    is_front: bool,
) -> pbr_types::PbrInput {
    var pbr_input = pbr_fragment::pbr_input_from_standard_material(in, is_front);
    pbr_input.material.base_color.b = pbr_input.material.base_color.r;
    return pbr_input;
}
