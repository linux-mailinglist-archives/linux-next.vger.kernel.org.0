Return-Path: <linux-next+bounces-4589-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A339B9B32
	for <lists+linux-next@lfdr.de>; Sat,  2 Nov 2024 00:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DD511F21CEF
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 23:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED19E154BFB;
	Fri,  1 Nov 2024 23:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UixwKEY5"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F531D555;
	Fri,  1 Nov 2024 23:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730504129; cv=none; b=lfPCj1DjIYEXGMHqyKaC9+F/md3uD8ogJ6owNAP2eApBZsGeaDFo5FotQ4nx1wov2gpbNnmJq2lI/lmxTv6oEOkRFGNXQgzYvDVPmERXcMvNjprgq8U+7bL8zeAoBxenhDltzXB8aDSTXZTQ9AeaDaeEVaYW4vvgqrGvY+Sy5fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730504129; c=relaxed/simple;
	bh=38aB2N81jTBUvMMnlfX7wcBFPqsI4F0XA1yHucd9Isg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvsRU7kCbfKrsKtLaeST9X/TgP6Vm1RGmoB5Rb/zqNeb3BBesqV4JgqWmCvKQ4dKzxbGC/13kuVJLANXTnWozD2+f/OlZJPJS+5iMqizW3XuFA8IUNLjXSRUthnqoYJrEM6hODTlV684qWLx5Gj9EK0eW6qtHnby/b5oOew09LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UixwKEY5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB10C4CECD;
	Fri,  1 Nov 2024 23:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730504129;
	bh=38aB2N81jTBUvMMnlfX7wcBFPqsI4F0XA1yHucd9Isg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=UixwKEY5hw0KOSn5J88cB4VClNVP6fHOD0IasQLd+vEQA9gkIXIC7cvMPOzsEAZfc
	 jHxaLyAKK5QXhhwu3hPtCbDWAkUOn+MazX6x9k52hYmccICUpva8X5xoHS97OBORsI
	 CD0GL7yfCca4lCalCoNczwL+NmNhTMHTggBgif8NN+MafPCZEmxW2Q5W+Vv0NKai0D
	 6U6w9nzXvb+PuZOG5437qJseL56jJ/O7THo38VvfH5+WZBujFwgNoQbEi9kvpEtaxg
	 5HrJVQNltF8bGySJa0/y6qLMt/ozaWB5nkqFUfU6wsBpw4tCY3VAXM/pQ71B0Jv8ga
	 +CjY5ToKkgvwA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D3782CE0F74; Fri,  1 Nov 2024 16:35:28 -0700 (PDT)
Date: Fri, 1 Nov 2024 16:35:28 -0700
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
Message-ID: <37c2ad76-37d1-44da-9532-65d67e849bba@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <ZyUxBr5Umbc9odcH@boqun-archlinux>
 <20241101195438.1658633-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101195438.1658633-1-boqun.feng@gmail.com>

On Fri, Nov 01, 2024 at 12:54:38PM -0700, Boqun Feng wrote:
> Paul reported an invalid wait context issue in scftorture catched by
> lockdep, and the cause of the issue is because scf_handler() may call
> kfree() to free the struct scf_check:
> 
> 	static void scf_handler(void *scfc_in)
>         {
>         [...]
>                 } else {
>                         kfree(scfcp);
>                 }
>         }
> 
> (call chain anlysis from Marco Elver)
> 
> This is problematic because smp_call_function() uses non-threaded
> interrupt and kfree() may acquire a local_lock which is a sleepable lock
> on RT.
> 
> The general rule is: do not alloc or free memory in non-threaded
> interrupt conntexts.
> 
> A quick fix is to use workqueue to defer the kfree(). However, this is
> OK only because scftorture is test code. In general the users of
> interrupts should avoid giving interrupt handlers the ownership of
> objects, that is, users should handle the lifetime of objects outside
> and interrupt handlers should only hold references to objects.
> 
> Reported-by: "Paul E. McKenney" <paulmck@kernel.org>
> Link: https://lore.kernel.org/lkml/41619255-cdc2-4573-a360-7794fc3614f7@paulmck-laptop/
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

Thank you!

I was worried that putting each kfree() into a separate workqueue handler
would result in freeing not keeping up with allocation for asynchronous
testing (for example, scftorture.weight_single=1), but it seems to be
doing fine in early testing.

So I have queued this in my -rcu tree for review and further testing.

							Thanx, Paul

> ---
>  kernel/scftorture.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/scftorture.c b/kernel/scftorture.c
> index 44e83a646264..ab6dcc7c0116 100644
> --- a/kernel/scftorture.c
> +++ b/kernel/scftorture.c
> @@ -127,6 +127,7 @@ static unsigned long scf_sel_totweight;
>  
>  // Communicate between caller and handler.
>  struct scf_check {
> +	struct work_struct work;
>  	bool scfc_in;
>  	bool scfc_out;
>  	int scfc_cpu; // -1 for not _single().
> @@ -252,6 +253,13 @@ static struct scf_selector *scf_sel_rand(struct torture_random_state *trsp)
>  	return &scf_sel_array[0];
>  }
>  
> +static void kfree_scf_check_work(struct work_struct *w)
> +{
> +	struct scf_check *scfcp = container_of(w, struct scf_check, work);
> +
> +	kfree(scfcp);
> +}
> +
>  // Update statistics and occasionally burn up mass quantities of CPU time,
>  // if told to do so via scftorture.longwait.  Otherwise, occasionally burn
>  // a little bit.
> @@ -296,7 +304,10 @@ static void scf_handler(void *scfc_in)
>  		if (scfcp->scfc_rpc)
>  			complete(&scfcp->scfc_completion);
>  	} else {
> -		kfree(scfcp);
> +		// Cannot call kfree() directly, pass it to workqueue. It's OK
> +		// only because this is test code, avoid this in real world
> +		// usage.
> +		queue_work(system_wq, &scfcp->work);
>  	}
>  }
>  
> @@ -335,6 +346,7 @@ static void scftorture_invoke_one(struct scf_statistics *scfp, struct torture_ra
>  			scfcp->scfc_wait = scfsp->scfs_wait;
>  			scfcp->scfc_out = false;
>  			scfcp->scfc_rpc = false;
> +			INIT_WORK(&scfcp->work, kfree_scf_check_work);
>  		}
>  	}
>  	switch (scfsp->scfs_prim) {
> -- 
> 2.45.2
> 

