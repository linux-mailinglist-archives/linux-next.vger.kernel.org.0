Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8CD842C66D
	for <lists+linux-next@lfdr.de>; Wed, 13 Oct 2021 18:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhJMQd6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Oct 2021 12:33:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:44658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhJMQd5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 13 Oct 2021 12:33:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53F1760E0C;
        Wed, 13 Oct 2021 16:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634142714;
        bh=DH5W/Ysbb6J1n1ZMKbfCrC0jB4YSKweOWD+96M39Xv4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=NYGBmdhZYYVI3+xWKJX4aox6mQpokWS/E+Q8job7hlrMLPJFgeXjTDV8l0blHNMF/
         hbgDbIk788eRNh71j14zSFMmkLA09ZAS8IdG2z4RN31AWcZD0ERxwrm6hLPouNj8uc
         pyv3ZsBvjyiL2miFoDVtH+JYXwDZh1AIdVXvnGnGIp0p/4oG2izyuI4KQrJ+990CaX
         yOGxrPCjIfagNOiGq9Mq2MMLuNylbBfCXwy/NwZvF8NMMoPdgBVarkCFy9OCj/zduG
         P9TiW/vqbtzR0TrfAsISrCpdF8w+m5jn7NJSlSNC7T+vt2I5zmQlzfTnFk+SCrTgP+
         5hzY/dO8RaltA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 178B05C0687; Wed, 13 Oct 2021 09:31:54 -0700 (PDT)
Date:   Wed, 13 Oct 2021 09:31:54 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20211013163154.GT880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211012154828.312f870f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012154828.312f870f@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 12, 2021 at 03:48:28PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   kernel/rcu/tasks.h
> 
> between commit:
> 
>   9b3c4ab3045e ("sched,rcu: Rework try_invoke_on_locked_down_task()")
> 
> from the tip tree and commit:
> 
>   18f08e758f34 ("rcu-tasks: Add trc_inspect_reader() checks for exiting critical section")
> 
> from the rcu tree.
> 
> I fixed it up (I hope - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Thank you for catching this!  I have it down for my upcoming pull
request.

							Thanx, Paul

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc kernel/rcu/tasks.h
> index 171bc848e8e3,e4a32db9f712..000000000000
> --- a/kernel/rcu/tasks.h
> +++ b/kernel/rcu/tasks.h
> @@@ -928,10 -919,10 +919,10 @@@ reset_ipi
>   }
>   
>   /* Callback function for scheduler to check locked-down task.  */
>  -static bool trc_inspect_reader(struct task_struct *t, void *arg)
>  +static int trc_inspect_reader(struct task_struct *t, void *arg)
>   {
>   	int cpu = task_cpu(t);
> - 	bool in_qs = false;
> + 	int nesting;
>   	bool ofl = cpu_is_offline(cpu);
>   
>   	if (task_curr(t)) {
> @@@ -951,18 -942,18 +942,18 @@@
>   		n_heavy_reader_updates++;
>   		if (ofl)
>   			n_heavy_reader_ofl_updates++;
> - 		in_qs = true;
> + 		nesting = 0;
>   	} else {
>   		// The task is not running, so C-language access is safe.
> - 		in_qs = likely(!t->trc_reader_nesting);
> + 		nesting = t->trc_reader_nesting;
>   	}
>   
> - 	// Mark as checked so that the grace-period kthread will
> - 	// remove it from the holdout list.
> - 	t->trc_reader_checked = true;
> - 
> - 	if (in_qs)
> - 		return 0;  // Already in quiescent state, done!!!
> + 	// If not exiting a read-side critical section, mark as checked
> + 	// so that the grace-period kthread will remove it from the
> + 	// holdout list.
> + 	t->trc_reader_checked = nesting >= 0;
> + 	if (nesting <= 0)
>  -		return !nesting;  // If in QS, done, otherwise try again later.
> ++		return (!nesting) ? 0 : -EINVAL;  // If in QS, done, otherwise try again later.
>   
>   	// The task is in a read-side critical section, so set up its
>   	// state so that it will awaken the grace-period kthread upon exit


