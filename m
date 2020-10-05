Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1473E283752
	for <lists+linux-next@lfdr.de>; Mon,  5 Oct 2020 16:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgJEOHX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Oct 2020 10:07:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:57378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbgJEOHX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Oct 2020 10:07:23 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E3581205F4;
        Mon,  5 Oct 2020 14:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601906842;
        bh=RNr7GFa4lcCSE4hOwgopu2j3NI1dTedg6OM4Kz6pkAE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=wma0BkRwNwVTW4PdM9GoadmA2UY3mj1Tq/F2Cc24vfVY1Em/rqM0/ofXEtWmXpyvt
         MLXYM/bmh2TgthbHFoJjzh7O7nOTD1iiBqkjZfCnKvBraIGVOoaPV0YFjz0p5+rQIr
         Jn9efzHLZTPxhJdCwVSdlO88XM5I4DX6Cv/DAets=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id B95E0352301E; Mon,  5 Oct 2020 07:07:22 -0700 (PDT)
Date:   Mon, 5 Oct 2020 07:07:22 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: linux-next: Fixes tag needs some work in the rcu tree
Message-ID: <20201005140722.GX29330@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20201005225315.0dd420c4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005225315.0dd420c4@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 05, 2020 at 10:53:15PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> n commit
> 
>   fe0d06f03320 ("srcu: Avoid escaped section names")
> 
> Fixes tag
> 
>   Fixes: commit fe15b50cdeee ("srcu: Allocate per-CPU data for DEFINE_SRCU() in modules")
> 
> has these problem(s):
> 
>   - leading word 'commit' unexpected

Will fix the Fixes, thank you!

							Thanx, Paul
