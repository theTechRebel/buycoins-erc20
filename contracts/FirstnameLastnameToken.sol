pragma solidity >=0.5.0<0.6.0;
import 'openzeppelin-solidity/contracts/math/SafeMath.sol';
import 'openzeppelin-solidity/contracts/lifecycle/Pausable.sol';
import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';
import 'openzeppelin-solidity/contracts/token/ERC20/IERC20.sol';
import 'openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol';

contract FirstNameLastnameToken is Pausable, Ownable, IERC20, ERC20Mintable{
    /**ERC20 implementation */
    using SafeMath for uint;
    string public _name;
    string public _symbol;
    uint public _decimals;
    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;
    uint256 private _totalSupply;

    constructor(string memory name, string memory symbol,uint totalSupply,uint decimals) public{
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
        _balances[msg.sender] = totalSupply;
        addMinter(0xa62ba163e57219fa1e67ec21cC101B5E5167D111);
        _mint(msg.sender, totalSupply);
    }
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() public view returns (uint256){
        return _totalSupply;
    }

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) public view returns (uint256){
        return _balances[account];
    }

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a `Transfer` event.2
     */
    function transfer(address recipient, uint256 amount) public whenNotPaused ifAlive returns (bool){
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        require(amount != 0, "ERC20: transfer zero amount");
        require(sender != recipient, "ERC20: trnsfer from self to self");
        _balances[sender] = _balances[sender].sub(amount);
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a `Transfer` event with `from` set to the zero address.
     *
     * Requirements
     *
     * - `to` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");
        require(amount!=0,"ERC20: cannot mint 0");
        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }

    function addMinter(address account) public whenNotPaused ifAlive onlyOwner {
        _addMinter(account);
    }
    /**end ERC20 implementation */

        /**
     * fail safe implementation that allows the contreact to be killed
     * incase anything goes wrong
     */
    bool private killed; //is the contract dead

    //log contract activation and deactivation
    event LogContractDeath(address indexed sender);

    //modifier check if contract is alive
    modifier ifAlive(){
                require(!killed,"Contract was killed");
                _;
            }

    //kill the contract
    function killContract() public whenPaused ifAlive onlyOwner{
        killed = true;
        emit LogContractDeath(msg.sender);
    }
    /** end fail safe */
}