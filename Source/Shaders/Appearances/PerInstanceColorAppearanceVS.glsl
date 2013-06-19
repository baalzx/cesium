attribute vec3 positionHigh;
attribute vec3 positionLow;
attribute vec3 normal;
attribute vec4 color;

varying vec3 v_positionEC;
varying vec3 v_normalEC;
varying vec4 v_color;

void main() 
{
    vec4 p = czm_translateRelativeToEye(positionHigh, positionLow);   

    v_positionEC = (czm_modelViewRelativeToEye * p).xyz;      // position in eye coordinates
    v_normalEC = czm_normal * normal;                         // normal in eye coordinates
    v_color = color;
    
    gl_Position = czm_modelViewProjectionRelativeToEye * p;
}
