Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2B2625C7C1
	for <lists+linux-next@lfdr.de>; Thu,  3 Sep 2020 19:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727786AbgICRCu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Sep 2020 13:02:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:38604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726025AbgICRCu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Sep 2020 13:02:50 -0400
Received: from paulmck-ThinkPad-P72.home (unknown [50.45.173.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 36C0D20758;
        Thu,  3 Sep 2020 17:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599152570;
        bh=S5GznL+HUXa0px3F6rIqo1KWGR2wrWuJLt1BiGDgm88=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ZdUnKKoSXP+4UtxOZdbtj62/VBQszlhNCH0MfC2Zq/JoMjqRSZ4S79z5O1JJW2hPv
         wOP0RG9nEr7AsjeE4+dUvcd99GSO321F26NUES+27OboMW/sdid5lHjVvK8+cjoXQW
         2yF6huEV98u1b0T8/Wf1wVFkRwbejy856K7QhBcw=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 172B4352300A; Thu,  3 Sep 2020 10:02:50 -0700 (PDT)
Date:   Thu, 3 Sep 2020 10:02:50 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jonathan Corbet <corbet@lwn.net>, SeongJae Park <sjpark@amazon.de>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the jc_docs tree
Message-ID: <20200903170250.GQ29330@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200902143101.4ea59943@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902143101.4ea59943@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 02, 2020 at 02:31:01PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   Documentation/memory-barriers.txt
> 
> between commit:
> 
>   537f3a7cf48e ("docs/memory-barriers.txt: Fix references for DMA*.txt files")
> 
> from the jc_docs tree and commit:
> 
>   6f6705147bab ("docs: fix references for DMA*.txt files")
> 
> from the rcu tree.
> 
> I fixed it up (they are preety much the same - I used the former) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

I removed my copy, and if testing goes well, it should get to you in a
few hours.

							Thanx, Paul
