Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29E40191FA0
	for <lists+linux-next@lfdr.de>; Wed, 25 Mar 2020 04:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbgCYDSK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Mar 2020 23:18:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:52680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727253AbgCYDSK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Mar 2020 23:18:10 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4B4A20724;
        Wed, 25 Mar 2020 03:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585106289;
        bh=WT+UQntac5tzO8d/jAML3RAJMt9d7BGMkzSINx9+TXs=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=VHY3FeGBcUyKCzCFi0frZlOLUOdRc+UgjisuLsw9xN8H3zvEXnZHiV55H5ihbYRWY
         BCVIltzjeW4mYATQdOMWpLQ9QnrMl2dAfMf1xjgwONOUHLSrn46O1MENQCwQEZ7m/n
         FG48py1QYRnBAnZJuF3Ao0lLbre+gD6XG9qvJ9GE=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 744A93522AC8; Tue, 24 Mar 2020 20:18:09 -0700 (PDT)
Date:   Tue, 24 Mar 2020 20:18:09 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20200325031809.GQ19865@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200325140845.5705b515@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325140845.5705b515@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 25, 2020 at 02:08:45PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rcu tree got conflicts in:
> 
>   lib/Kconfig.kcsan
>   kernel/kcsan/report.c
>   kernel/kcsan/kcsan.h
>   kernel/kcsan/debugfs.c
>   kernel/kcsan/core.c
>   kernel/kcsan/atomic.h
>   include/linux/kcsan-checks.h
> 
> between a series of commits from the tip tree and the same series of
> patches (but different commits) in the rcu tre (followed by some more
> changes in the rcu tree).
> 
> I fixed it up (I just used the rcu tree versions of these files) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
> 
> Please clean up the rcu tree WRT the tip tree.

Will do, and apologies for the hassle!

							Thanx, Paul
