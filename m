Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97FBF347CF1
	for <lists+linux-next@lfdr.de>; Wed, 24 Mar 2021 16:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236751AbhCXPqg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Mar 2021 11:46:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:57720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236575AbhCXPqS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Mar 2021 11:46:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48CF761A09;
        Wed, 24 Mar 2021 15:46:17 +0000 (UTC)
Date:   Wed, 24 Mar 2021 15:46:14 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Will Deacon <will@kernel.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm64 tree
Message-ID: <20210324154613.GA3709@arm.com>
References: <20210324081445.7db17c31@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324081445.7db17c31@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 24, 2021 at 08:14:45AM +1100, Stephen Rothwell wrote:
> Commits
> 
>   b17f265bb4cc ("kselftest/arm64: mte: Fix MTE feature detection")
>   4dfc9d30a8ab ("kselftest/arm64: mte: common: Fix write() warnings")
> 
> are missing a Signed-off-by from their author.

Thanks Stephen. Now fixed.

-- 
Catalin
