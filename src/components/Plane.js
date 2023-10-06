import THREE from "three";
const Plane = () => {
    const globalGeometry = new THREE.BoxGeometry()
    const globalMaterial = new THREE.MeshBasicMaterial()
    return (
        <mesh position={[0, 0, 0]}>
            geometry = {globalGeometry} args={[50, 50]}
            material = {globalMaterial} color={"#404040"}
        </mesh>
    );
}

export default Plane;


// import { extend } from '@react-three/fiber'
// import { OrbitControls, TransformControls } from 'three-stdlib'
// extend({ OrbitControls, TransformControls })

// const globalGeometry = new THREE.BoxGeometry()
// const globalMaterial = new THREE.MeshBasicMaterial()

// function Mesh() {
//     return (
//         <group dispose={null}>
//             <mesh geometry={globalGeometry} material={globalMaterial} />
//       }