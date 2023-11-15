// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {IAggregator} from "@bisonai/orakl-contracts/src/v0.1/interfaces/IAggregator.sol";

contract DataFeedConsumer {
    int256 public answer;
    uint80 public roundId;

    function getLatestData(address _proxy) public {
        IAggregator dataFeed = IAggregator(_proxy);
        (
            uint80 roundId_,
            int256 answer_ /* uint startedAt */ /* uint updatedAt */ /* uint80 answeredInRound */,
            ,
            ,

        ) = dataFeed.latestRoundData();

        answer = answer_;
        roundId = roundId_;
    }

    function decimals(address _proxy) public view returns (uint8) {
        IAggregator dataFeed = IAggregator(_proxy);
        return dataFeed.decimals();
    }
}
