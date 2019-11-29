pragma solidity >=0.4.23 <0.6.0;

contract TraficLights {
    address public owner;
    mapping(uint => uint[]) public greenWawesSuccesses;
    mapping(uint => uint[]) public greenWawesFails;
    uint public greenWaweCounter;

    event GreenWaweAdded(uint waweId, uint lightsCount);
    event GreenWaweReset(uint waweId);
    event LightFostered(uint waweId, uint lightId);
    event LightDroped(uint waweId, uint lightId);

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    /** @dev Add Game wave.
      * @param lightsCount Number of lights in wawe.
      */
    function addGreenWawe(uint lightsCount) public onlyOwner {
        greenWawesSuccesses[greenWaweCounter] = new uint[](lightsCount);
        greenWawesFails[greenWaweCounter] = new uint[](lightsCount);
        emit GreenWaweAdded(greenWaweCounter, lightsCount);
        greenWaweCounter += 1;
    }

    /** @dev Set all lights counters to zero.
      * @param waweId Wawe id.
      */
    function resetGreenWawe(uint waweId) public onlyOwner {
        greenWawesSuccesses[waweId] = new uint[](greenWawesSuccesses[waweId].length);
        greenWawesFails[waweId] = new uint[](greenWawesFails[waweId].length);
        emit GreenWaweReset(greenWaweCounter);
    }

    /** @dev Add one point to light counter.
      * @param waweId Wawe id.
      * @param lightId Light id.
      */
    function fosterLight(uint waweId, uint lightId) public onlyOwner {
        require(waweId < greenWaweCounter, "Green wawe doesn't exist");
        greenWawesSuccesses[waweId][lightId] += 1;
        emit LightFostered(waweId, lightId);
    }

    /** @dev Substract one point of light counter.
      * @param waweId Wawe id.
      * @param lightId Light id.
      */
    function dropLight(uint waweId, uint lightId) public onlyOwner {
        require(waweId < greenWaweCounter, "Green wawe doesn't exist");
        greenWawesSuccesses[waweId][lightId] += 1;
        emit LightDroped(waweId, lightId);
    }

    /** @dev Get couters of lights in wawe.
      * @param waweId Wawe id.
      */
    function getLights(uint waweId) public view returns(uint[] memory, uint[] memory) {
        return (greenWawesSuccesses[waweId], greenWawesFails[waweId]);
    }

}