Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 603E2312442
	for <lists+linux-next@lfdr.de>; Sun,  7 Feb 2021 13:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhBGMVM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 7 Feb 2021 07:21:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:38676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229536AbhBGMVG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 7 Feb 2021 07:21:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FF3364DF2;
        Sun,  7 Feb 2021 12:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612700425;
        bh=+zjpqwW6eo3ecrpkc0mi+ePXDTh2f+umpfYOoumdKsk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y4UtJnopKsn1rIP3D9RR+5tgya/IJv3jlCWvrhFbx1w1QaE+JmUkDfBksAa0Aa45Z
         u+yMwYY+zggPyxkQHHXT5QrkD3+8nzlqWKZzu/axnRvDI+RgJtNcN86Jr1bR0EQ0lW
         W3byfaNRnya7A8T6bJp3TylLRxuXzQxguyLaGu+I8uQ1R5zwcZrAFszb9liQCxgAAv
         dpLxUcdsu7Tq/91C8aFTJrbYPcreY028qEojXK6NSl04l2cYXCCRqPF5wUL1xdWBag
         FsA6RrCygike4CussrpoSsEh68SMfpcIVxktSuWlGHWsVWKVd+SY196Co6o7DeCVrZ
         tx0AoWoLbM4Jw==
Date:   Sun, 7 Feb 2021 17:50:21 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bard Liao <yung-chuan.liao@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the soundwire tree
Message-ID: <20210207122021.GQ2656@vkoul-mobl.Dlink>
References: <20210207215900.1223b0ca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210207215900.1223b0ca@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 07-02-21, 21:59, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   531f45f2bdf6 ("soundwire: export sdw_write/read_no_pm functions")
> 
> Fixes tag
> 
>   Fixes: 60ee9be25571 ('soundwire: bus: add PM/no-PM versions of
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
> 
> Please do not split Fixes tags over more than one line.

Thanks for spotting it, fixed it up now

-- 
~Vinod
