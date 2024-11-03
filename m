Return-Path: <linux-next+bounces-4594-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0799BA63B
	for <lists+linux-next@lfdr.de>; Sun,  3 Nov 2024 16:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40A001C20CA7
	for <lists+linux-next@lfdr.de>; Sun,  3 Nov 2024 15:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616C017C9E8;
	Sun,  3 Nov 2024 15:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qy8gOKmM"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DD1C2FB;
	Sun,  3 Nov 2024 15:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730646222; cv=none; b=RmaKcZOsZ9uRKOmEZJ8ImKD74jkmbAXT/3q8n0uGLOOH6Psy9gfzInr+AbI1WH8Brm3HZarWKBwvKH+PFBOwFeZgCYnU5eiezg8QwROa9h3Z6krDyLm2VvP/B9mrwhDiMmaiUlX44H1//fste2pGXPvYE7rbA8bzlTXO8oON8To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730646222; c=relaxed/simple;
	bh=563EfkE5D0QNLDN9RLp0kZKWZbAwx5LWLn3gA89ZDCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hziOWCEHs1xCrVT25uJTwW9Sgyus+rrtAXPi4PqFyjEbu8iUCHErsXQcTrcsKn40mh26qAKjgHeN1wdo2Ze8a7xUbM9Id3/IvOqboLsTBzTAe9cfkUE3nm1DQiPa2yP3a+3nYjcd18DaEBBVL4x6p9bfag2AuOzlv6a450f3sPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qy8gOKmM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB12EC4CECD;
	Sun,  3 Nov 2024 15:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730646221;
	bh=563EfkE5D0QNLDN9RLp0kZKWZbAwx5LWLn3gA89ZDCk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Qy8gOKmMxEPwCYBx5xJgYEuqXaFBWZoeFhihwMlG0nJLISo/ynHbP/XHe1kkbVijj
	 L+VjC3xqq0QIbPRWAtj3TBf/jMJvnE6Xu73jUwiJKd8cbpNEy12h9edJJ1xGV4CE5R
	 YWhGr2inXn9zIKScw18blnRbSwnW6HoI4roiDeae+gto1nTIqxUGYQ+VKGg6YEo/KT
	 EkfYmQgj+N7go4j1tOOZv9yBXc7/73d2gG/FlY56CIbbViyL1ljdffwaKgijVxB2uf
	 yDCdYmJiVonyR3wdDFG1l6hTnRst0q3+NP3MqUolk7tNLKQ1usq4vPkJgVdeWtLWGa
	 craUhhQ0Il6cA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 6454ECE0F53; Sun,  3 Nov 2024 07:03:41 -0800 (PST)
Date: Sun, 3 Nov 2024 07:03:41 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Marco Elver <elver@google.com>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	sfr@canb.auug.org.au, longman@redhat.com, cl@linux.com,
	penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com,
	akpm@linux-foundation.org, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] scftorture: Use workqueue to free scf_check
Message-ID: <88694240-1eea-4f4c-bb7b-80de25f252e7@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <ZyUxBr5Umbc9odcH@boqun-archlinux>
 <20241101195438.1658633-1-boqun.feng@gmail.com>
 <37c2ad76-37d1-44da-9532-65d67e849bba@paulmck-laptop>
 <ZybviLZqjw_VYg8A@Boquns-Mac-mini.local>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZybviLZqjw_VYg8A@Boquns-Mac-mini.local>

On Sat, Nov 02, 2024 at 08:35:36PM -0700, Boqun Feng wrote:
> On Fri, Nov 01, 2024 at 04:35:28PM -0700, Paul E. McKenney wrote:
> > On Fri, Nov 01, 2024 at 12:54:38PM -0700, Boqun Feng wrote:
> > > Paul reported an invalid wait context issue in scftorture catched by
> > > lockdep, and the cause of the issue is because scf_handler() may call
> > > kfree() to free the struct scf_check:
> > > 
> > > 	static void scf_handler(void *scfc_in)
> > >         {
> > >         [...]
> > >                 } else {
> > >                         kfree(scfcp);
> > >                 }
> > >         }
> > > 
> > > (call chain anlysis from Marco Elver)
> > > 
> > > This is problematic because smp_call_function() uses non-threaded
> > > interrupt and kfree() may acquire a local_lock which is a sleepable lock
> > > on RT.
> > > 
> > > The general rule is: do not alloc or free memory in non-threaded
> > > interrupt conntexts.
> > > 
> > > A quick fix is to use workqueue to defer the kfree(). However, this is
> > > OK only because scftorture is test code. In general the users of
> > > interrupts should avoid giving interrupt handlers the ownership of
> > > objects, that is, users should handle the lifetime of objects outside
> > > and interrupt handlers should only hold references to objects.
> > > 
> > > Reported-by: "Paul E. McKenney" <paulmck@kernel.org>
> > > Link: https://lore.kernel.org/lkml/41619255-cdc2-4573-a360-7794fc3614f7@paulmck-laptop/
> > > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > 
> > Thank you!
> > 
> > I was worried that putting each kfree() into a separate workqueue handler
> > would result in freeing not keeping up with allocation for asynchronous
> > testing (for example, scftorture.weight_single=1), but it seems to be
> > doing fine in early testing.
> 
> I shared the same worry, so it's why I added the comments before
> queue_work() saying it's only OK because it's test code, it's certainly
> not something recommended for general use.
> 
> But glad it turns out OK so far for scftorture ;-)

That said, I have only tried a couple of memory sizes at 64 CPUs, the
default (512M), which OOMs both with and without this fix and 7G, which
is selected by torture.sh, which avoids OOMing either way.  It would be
interesting to vary the memory provided between those limits and see if
there is any difference in behavior.

It avoids OOM at the default 512M at 16 CPUs.

Ah, and I did not check throughput, which might have changed.  A quick
test on my laptop says that it dropped by almost a factor of two,
from not quite 1M invocations/s to a bit more than 500K invocations/s.
So something more efficient does seem in order.  ;-)

tools/testing/selftests/rcutorture/bin/kvm.sh --torture scf --allcpus --configs PREEMPT --duration 30 --bootargs "scftorture.weight_single=1" --trust-make

							Thanx, Paul

> Regards,
> Boqun
> 
> > So I have queued this in my -rcu tree for review and further testing.
> > 
> > 							Thanx, Paul
> > 
> > > ---
> > >  kernel/scftorture.c | 14 +++++++++++++-
> > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/kernel/scftorture.c b/kernel/scftorture.c
> > > index 44e83a646264..ab6dcc7c0116 100644
> > > --- a/kernel/scftorture.c
> > > +++ b/kernel/scftorture.c
> > > @@ -127,6 +127,7 @@ static unsigned long scf_sel_totweight;
> > >  
> > >  // Communicate between caller and handler.
> > >  struct scf_check {
> > > +	struct work_struct work;
> > >  	bool scfc_in;
> > >  	bool scfc_out;
> > >  	int scfc_cpu; // -1 for not _single().
> > > @@ -252,6 +253,13 @@ static struct scf_selector *scf_sel_rand(struct torture_random_state *trsp)
> > >  	return &scf_sel_array[0];
> > >  }
> > >  
> > > +static void kfree_scf_check_work(struct work_struct *w)
> > > +{
> > > +	struct scf_check *scfcp = container_of(w, struct scf_check, work);
> > > +
> > > +	kfree(scfcp);
> > > +}
> > > +
> > >  // Update statistics and occasionally burn up mass quantities of CPU time,
> > >  // if told to do so via scftorture.longwait.  Otherwise, occasionally burn
> > >  // a little bit.
> > > @@ -296,7 +304,10 @@ static void scf_handler(void *scfc_in)
> > >  		if (scfcp->scfc_rpc)
> > >  			complete(&scfcp->scfc_completion);
> > >  	} else {
> > > -		kfree(scfcp);
> > > +		// Cannot call kfree() directly, pass it to workqueue. It's OK
> > > +		// only because this is test code, avoid this in real world
> > > +		// usage.
> > > +		queue_work(system_wq, &scfcp->work);
> > >  	}
> > >  }
> > >  
> > > @@ -335,6 +346,7 @@ static void scftorture_invoke_one(struct scf_statistics *scfp, struct torture_ra
> > >  			scfcp->scfc_wait = scfsp->scfs_wait;
> > >  			scfcp->scfc_out = false;
> > >  			scfcp->scfc_rpc = false;
> > > +			INIT_WORK(&scfcp->work, kfree_scf_check_work);
> > >  		}
> > >  	}
> > >  	switch (scfsp->scfs_prim) {
> > > -- 
> > > 2.45.2
> > > 

