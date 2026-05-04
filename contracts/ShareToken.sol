// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract ShareToken is ERC20, ERC20Permit, ERC20Votes {
    constructor() ERC20("ShareToken", "STK") ERC20Permit("ShareToken") {
        // Cấp toàn bộ 1,000,000 token ban đầu cho người tạo (Admin/Chủ tịch)
        // Sau đó Admin sẽ dùng ví này để phân bổ theo tỷ lệ 45%, 25%, 30% như kịch bản
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    // Các hàm override bắt buộc dưới đây giúp theo dõi lịch sử số dư để biểu quyết
    function _afterTokenTransfer(address from, address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._burn(account, amount);
    }
}
