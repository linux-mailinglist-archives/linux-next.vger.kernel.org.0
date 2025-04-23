Return-Path: <linux-next+bounces-6369-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7148FA99906
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 21:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F54417F719
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 19:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D87266EF9;
	Wed, 23 Apr 2025 19:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rgc0kjuY"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADF7257AD4;
	Wed, 23 Apr 2025 19:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745438214; cv=none; b=RlmLBJhX3dqx1S7AzvUx7d70U8uqrf1QD/ZTbPmEzwmiPlMrsdbctuJB4VX277gyRP7sfdt86xk7Wt7BsZhTiOIMt3CYlSWqmUi+IXJp1jNFm8CsZbs5+0NOqgdEvAfM9XdwTVneww+f4Ozj+MIUG9+lrt67Zcj/e+PhCj4skSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745438214; c=relaxed/simple;
	bh=feYRrrYr5bFIK00bw1YMM23RQFbMMHEB6MzWFgeK4sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0baAegV5JRs04pxgPbhMKw4zd/aPqkHCd2PPF5u0+vdTrbJpQCY6IShMzMdu/vuuc3woWUhBOxoVcTYxJwhX69EWFxeECGlnVK16jURl4zldEfkuhOKW4JKkRCSfgOsLx3BYojZT87VtoWMOL6lIo+OA9ZGtnA+YcvhxxaMa/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rgc0kjuY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C487DC4CEE2;
	Wed, 23 Apr 2025 19:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745438213;
	bh=feYRrrYr5bFIK00bw1YMM23RQFbMMHEB6MzWFgeK4sQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Rgc0kjuYZK1uEhIF9MBLZUUVSd9g/ByFC06GSQeHFOcre/YeeCs5EngE1uPFS9EwH
	 me6mbPIeDomxNh0uh8R0PUcwzkGr5rwReL8VimMj+9qNj0BJDPenrzMP2P06+nvpnY
	 uAhYmpm39lTHUnCcDPwzYhQ/KJTMmilBYJC8g+GdUx45FLY7Cxax9xt1+VehW1vSrh
	 2w1MtvPcam+Iv87v07jEorsfEUXUDciWwdW46E1CIGW1bq7b+Q52N4yViMNYO42xvx
	 7NgP+B5OztXd5RgInaVKeBmCnNnoQ3LnoGLTc1fS86um/QKLjDxxQHc1QD0U20AW2U
	 lhcAb3ONZ9wKA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 637A9CE0B75; Wed, 23 Apr 2025 12:56:53 -0700 (PDT)
Date: Wed, 23 Apr 2025 12:56:53 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bert Karwatzki <spasswolf@web.de>
Cc: "Aithal, Srikanth" <sraithal@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org,
	Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: commit dd4cf8c9e1f4 leads to failed boot
Message-ID: <8ded350c-fc05-4bc2-aff2-33b440f6e2d6@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20250423115409.3425-1-spasswolf@web.de>
 <647b9aa4-f46e-4009-a223-78bfc6cc6768@amd.com>
 <fa8dd394-45c1-48d3-881c-5f3d5422df39@paulmck-laptop>
 <5a4a3d0d-a2e1-4fd3-acd2-3ae12a2ac7b0@amd.com>
 <82ff38fc-b295-472c-bde5-bd96f0d144fb@paulmck-laptop>
 <1509f29e04b3d1ac899981e0adaad98bbc0ee61a.camel@web.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1509f29e04b3d1ac899981e0adaad98bbc0ee61a.camel@web.de>

On Wed, Apr 23, 2025 at 09:19:56PM +0200, Bert Karwatzki wrote:
> Am Mittwoch, dem 23.04.2025 um 11:07 -0700 schrieb Paul E. McKenney:
> > On Wed, Apr 23, 2025 at 08:49:08PM +0530, Aithal, Srikanth wrote:
> > > On 4/23/2025 7:48 PM, Paul E. McKenney wrote:
> > > > On Wed, Apr 23, 2025 at 07:09:42PM +0530, Aithal, Srikanth wrote:
> > > > > On 4/23/2025 5:24 PM, Bert Karwatzki wrote:
> > > > > > Since linux next-20250422 booting fails on my MSI Alpha 15 Laptop runnning
> > > > > > debian sid. When booting kernel message appear on screen but no messages from
> > > > > > init (systemd). There are also no logs written even thought emergency sync
> > > > > > via magic sysrq works (a message is printed on screen), presumably because
> > > > > > / is not mounted. I bisected this (from 6.15-rc3 to next-20250422) and found
> > > > > > commit dd4cf8c9e1f4 as the first bad commit.
> > > > > > Reverting commit dd4cf8c9e1f4 in next-20250422 fixes the issue.
> > > > > 
> > > > > 
> > > > > Hello,
> > > > > 
> > > > > On AMD platform as well boot failed starting next-20250422, bisecting the
> > > > > issue led me to same commit dd4cf8c9e1f4. I have attached kernel config and
> > > > > logs.
> > > > 
> > > > Thank you all for the bisection and the report!
> > > > 
> > > > Please check out the predecessor of commit dd4cf8c9e1f4 ("ratelimit:
> > > > Force re-initialization when rate-limiting re-enabled"):
> > > > 
> > > > 13fa70e052dd ("ratelimit: Allow zero ->burst to disable ratelimiting")
> > > > 
> > > > Then please apply the patch shown below, and let me know what happens?
> > > > (Yes, I should have split that commit up...)
> > > > 
> > > > 							Thanx, Paul
> > > > 
> > > > ------------------------------------------------------------------------
> > > > 
> > > > diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> > > > index 04f16b8e24575..13ed636642270 100644
> > > > --- a/lib/ratelimit.c
> > > > +++ b/lib/ratelimit.c
> > > > @@ -35,7 +35,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
> > > >   	unsigned long flags;
> > > >   	int ret;
> > > > -	if (!interval || !burst)
> > > > +	if (interval <= 0 || burst <= 0)
> > > >   		return 1;
> > > >   	/*
> > > 
> > > 
> > > I applied above patch on top of 13fa70e052dd ("ratelimit: Allow zero ->burst
> > > to disable ratelimiting") [linux-20250423]. This is fixing the boot issue.
> > > 
> > > Tested-by: Srikanth Aithal <sraithal@amd.com>
> > 
> > Thank you both, and to Bert for intuiting the correct -next commit!
> > 
> > Could you please try the next increment, which is this patch, again
> > on top of 24ff89c63355 ("ratelimit: Allow zero ->burst to > disable
> > ratelimiting")?
> > 
> > In the meantime, I will expose the version you two just tested to
> > -next.
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> > index 04f16b8e24575..8f6c54f719ef2 100644
> > --- a/lib/ratelimit.c
> > +++ b/lib/ratelimit.c
> > @@ -35,8 +35,10 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
> >  	unsigned long flags;
> >  	int ret;
> >  
> > -	if (!interval || !burst)
> > +	if (interval <= 0 || burst <= 0) {
> > +		ret = burst > 0;
> >  		return 1;
> > +	}
> >  
> >  	/*
> >  	 * If we contend on this state's lock then just check if
> 
> If you set "ret = burst > 0", but "return 1" this will make no difference
> (except in the case of a major compiler bug, probably), as I wrote in my other
> email which overlapped yours, this fixes the issue in next-20250422:
> 
> diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> index b5c727e976d2..fc28f6cf8269 100644
> --- a/lib/ratelimit.c
> +++ b/lib/ratelimit.c
> @@ -40,7 +40,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
>          * interval says never limit.
>          */
>         if (interval <= 0 || burst <= 0) {
> -               ret = burst > 0;
> +               ret = 1;
>                 if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
>                     !raw_spin_trylock_irqsave(&rs->lock, flags))
>                         return ret;

You are quite right, your patch does fix the issue that you three say.
Unfortunately, it prevents someone from completely suppressing output
by setting burst to zero.  Could you please try the patch below?

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 04f16b8e24575..d6531e5c6ec4e 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -35,8 +35,8 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	unsigned long flags;
 	int ret;
 
-	if (!interval || !burst)
-		return 1;
+	if (interval <= 0 || burst <= 0)
+		return interval == 0 || burst > 0;
 
 	/*
 	 * If we contend on this state's lock then just check if

