﻿using Xunit;

namespace VsVim.UnitTest
{
    public sealed class ResultTest
    {
        [Fact]
        public void IsSuccess_Success()
        {
            Assert.True(Result.Success.IsSuccess);
            Assert.False(Result.Success.IsError);
        }
    }
}
