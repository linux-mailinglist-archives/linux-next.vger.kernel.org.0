Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E56C926E315
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 20:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgIQSAZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 14:00:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:48532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726582AbgIQSAG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Sep 2020 14:00:06 -0400
Received: from paulmck-ThinkPad-P72.home (unknown [50.45.173.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7B75120707;
        Thu, 17 Sep 2020 18:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600365605;
        bh=sym+4IMmWlAE40RItS/W9ywy+geN2STM8ay5dMNNwpc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=PMUSAz74MXGzcOVQtNfwi5lSgSzsCRxzWrux+WySIWfqcheevXrAJNFThINhBMc/2
         JktNPJUzHRCqDEiMvEaC6ZlVBYb5L/poDNi6n0lUj1weKTBhqKQXBNzSenKEmuwGR2
         Hs4NkHwD3sJCEGzsSBXJNcuLhVUVfyWSkOdX6GrY=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 3BD8835225FA; Thu, 17 Sep 2020 11:00:05 -0700 (PDT)
Date:   Thu, 17 Sep 2020 11:00:05 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20200917180005.GM29330@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200917132652.738c4cc2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917132652.738c4cc2@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 17, 2020 at 01:26:52PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   903c5302fa2d ("sched/core: Allow try_invoke_on_locked_down_task() with irqs disabled")
> 
> is missing a Signed-off-by from its author and committer.
> 
> I didn't complain about this when it was first present because I figured
> it was just a debugging commit that would be removed quickly.  However,
> there are now quite a few follow up commits ...

Without Peter's Signed-off-by, I clearly won't be submitting it to the
upcoming merge window.

Peter, this is now quite close to your original patch.  May I please
add your Signed-off-by?

							Thanx, Paul
