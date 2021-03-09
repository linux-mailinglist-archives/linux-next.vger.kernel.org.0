Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8C3331E9B
	for <lists+linux-next@lfdr.de>; Tue,  9 Mar 2021 06:25:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbhCIFZO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Mar 2021 00:25:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:38440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229656AbhCIFYs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Mar 2021 00:24:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D18964E13;
        Tue,  9 Mar 2021 05:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615267488;
        bh=P+acFq1M1bRg7jGDOAbI4OOdDRHGlnVqShsCmRuglhg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=oxF75FlgVoD31odZ2vOjwQfL5ylrrlAx/fRaN+ooQDLijmtZFDSKz/VRy43CjJ0xA
         xqZ9bwTVhB2E9bOwlt7MPKdopLGuTfZHJSxiaP54tRfYY1zIGEUalCm06pvGykvrnx
         rNcTO9lTTg+UKLC1oKaNSoydFC9FGGkQMtLu+zurXdGXlxKCZpZNW30rW7MgxJgbqa
         YMcw+M+PhX5nDcJenKjoMjYU5hneCl/U180+vZwT6u6O8jUYNm854q0x6P/kTb7zy+
         +tYAo6ahi2YT+UGlC1yjTqBSKy7C0SfMl9Ix3iGxCzzGfHt9OzsYeYhF4qNjLHmPRy
         WIomzFEiHS4XQ==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 274453523792; Mon,  8 Mar 2021 21:24:48 -0800 (PST)
Date:   Mon, 8 Mar 2021 21:24:48 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20210309052448.GR2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210308170327.3fc9badd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308170327.3fc9badd@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 08, 2021 at 05:03:27PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   3e90d423e754 ("EXP net: phy: make mdio_bus_phy_suspend/resume as __maybe_unused")
> 
> is missing a Signed-off-by from its committer.

Fixed, thank you and apologies!

							Thanx, Paul
