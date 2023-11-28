// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {AppStorage, Modifiers, LibAppStorage} from "../../shared/libraries/LibAppStorage.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract RainForestFacet is Modifiers, IERC20 {

    event tokenRefundEvent(address indexed _from, uint indexed _amount);
    event toekeBuyEvent(address indexed _to, uint indexed _amount);
    event useTokenPaybackEvent(address indexed _to, uint indexed _amount);

    function init(string memory _name, string memory _symbol, uint _initialSupply ,uint _limitSupply) external onlyOwner returns (bool) {
        AppStorage storage s = LibAppStorage.diamondStorage();

        s.rainForest._name = _name;
        s.rainForest._symbol = _symbol;
        s.rainForest._decimals = 18;
        s.rainForest._limitSupply = _limitSupply * 1e18;

        s.rainForest._totalSupply = _initialSupply * 1e18;
        s.rainForest._balances[address(this)] = s.rainForest._totalSupply;

        return true;
    }

    function symbol() public view virtual returns (string memory) {
        AppStorage storage s = LibAppStorage.diamondStorage();
        return s.rainForest._symbol;
    }

    function name() public view virtual returns (string memory) {
        AppStorage storage s = LibAppStorage.diamondStorage();
        return s.rainForest._name;
    }

    function decimals() public view virtual returns (uint8) {
        AppStorage storage s = LibAppStorage.diamondStorage();
        return s.rainForest._decimals;
    }

    function limitSupply() public view virtual returns (uint256) {
        AppStorage storage s = LibAppStorage.diamondStorage();
        return s.rainForest._limitSupply;
    }
    // ERC20 INTERFACE FUNCTIONS

    function totalSupply() external view returns (uint256) {
        AppStorage storage s = LibAppStorage.diamondStorage();
        return s.rainForest._totalSupply;
    }

    function balanceOf(address account_) external view returns (uint256) {
        AppStorage storage s = LibAppStorage.diamondStorage();
        return s.rainForest._balances[account_];
    }

    function transfer(address to_, uint256 amount_) external returns (bool) {
        return _transfer(msg.sender, to_, amount_);
    }

    function transferFrom(
        address from_,
        address to_,
        uint256 amount_
    ) external returns (bool) {
        _requireAllowance(from_, to_, amount_);
        return _transfer(from_, to_, amount_);
    }

    function allowance(
        address owner_,
        address spender_
    ) public view returns (uint256) {
        AppStorage storage s = LibAppStorage.diamondStorage();
        return s.rainForest._allowances[owner_][spender_];
    }

    function approve(
        address spender_,
        uint256 amount_
    ) external returns (bool) {
        return _approve(msg.sender, spender_, amount_);
    }

    // EXTENDED FUNCTIONS
    
    // PRIVATE FUNCTIONS

    function _requireFunds(address from_, uint256 amount_) private view {
        require(_sufficientFunds(from_, amount_), "ERC20: Insufficient Funds");
    }

    function _requireAllowance(
        address owner_,
        address spender_,
        uint256 amount_
    ) private view {
        require(
            _sufficientAllowance(owner_, spender_, amount_),
            "ERC20: Insufficient Allowance"
        );
    }

    function _sufficientFunds(
        address from_,
        uint256 amount_
    ) private view returns (bool) {
        AppStorage storage s = LibAppStorage.diamondStorage();
        return s.rainForest._balances[from_] >= amount_;
    }

    function _sufficientAllowance(
        address owner_,
        address spender_,
        uint256 amount_
    ) private view returns (bool) {
        AppStorage storage s = LibAppStorage.diamondStorage();
        return s.rainForest._allowances[owner_][spender_] >= amount_;
    }

    function _approve(
        address approver_,
        address spender_,
        uint256 amount_
    ) private returns (bool) {
        _requireFunds(approver_, amount_);

        AppStorage storage s = LibAppStorage.diamondStorage();
        s.rainForest._allowances[approver_][spender_] = amount_;

        emit Approval(approver_, spender_, amount_);
        return true;
    }

    function _transfer(
        address from_,
        address to_,
        uint256 amount_
    ) private returns (bool) {
        _requireFunds(from_, amount_);

        AppStorage storage s = LibAppStorage.diamondStorage();
        s.rainForest._balances[from_] -= amount_;
        s.rainForest._balances[to_] += amount_;

        emit Transfer(from_, to_, amount_);
        return true;
    }

    function _mint(address to_, uint256 amount_) private returns (bool) {
        require(to_ != address(0), "ERC20: can't mint to 0 address");
        AppStorage storage s = LibAppStorage.diamondStorage();
        require(s.rainForest._totalSupply + amount_ <= s.rainForest._limitSupply, "ERC20: can't mint over limit supply");
        s.rainForest._totalSupply += amount_;
        s.rainForest._balances[to_] += amount_;

        emit Transfer(address(0), to_, amount_);
        return true;
    }

    function _burn(address from_, uint256 amount_) private returns (bool) {
        require(from_ != address(0), "ERC20: can't burn from 0 address");
        _requireFunds(from_, amount_);

        AppStorage storage s = LibAppStorage.diamondStorage();
        s.rainForest._balances[from_] -= amount_;
        s.rainForest._totalSupply -= amount_;

        emit Transfer(from_, address(0), amount_);
        return true;
    }


    // extention functions
    function tokenBuy(uint _amount) external payable returns (bool){
        require(msg.value == _amount, "RainForest: amount is not equal to msg.value");
        require(s.rainForest._totalSupply + _amount <= s.rainForest._limitSupply, "RainForest: can't mint over limit supply");

        _mint(msg.sender, _amount);

        emit toekeBuyEvent(msg.sender, _amount);
    }
    function tokenRefund(uint _amount) external returns (bool){
        _burn(msg.sender, _amount);
        payable(msg.sender).transfer(_amount);

        emit tokenRefundEvent(msg.sender, _amount);
    }



    // add modifier > onlyFacetContract
    function useTokenPayback(address _to, uint _amount) internal returns (bool){
        require(msg.value == _amount, "RainForest: amount is not equal to msg.value");
        require(s.rainForest._totalSupply + _amount <= s.rainForest._limitSupply, "RainForest: can't mint over limit supply");

        _mint(_to, _amount);
        
        emit useTokenPaybackEvent(_to, _amount);
    }


    // admin functions
    function exitAssets(address _to) external onlyOwner returns (bool){
        payable(_to).transfer(address(this).balance);
    }
}
