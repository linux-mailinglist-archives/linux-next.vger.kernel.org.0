Return-Path: <linux-next+bounces-6367-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDA2A99777
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 20:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 282265A0CE1
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 18:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610CC28A1E8;
	Wed, 23 Apr 2025 18:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zaa7Fsfd"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371A226A0D6;
	Wed, 23 Apr 2025 18:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745431666; cv=none; b=kAsxqsKwTXQqjidUMb1Bm7ieiJT2T62wJxieX6/3X5MqcdDdJSRtSSYT/LKMnNv57DP3md/JXIwRIH/vdAu7sxMNBPDVZ+GXg8PZ4pfp69diFogaf3VbLsL23fboAlh+wsgc7X8tnq4PCk116w3d2LdLWsSPlxALKXQR0KfIsAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745431666; c=relaxed/simple;
	bh=Hiz3p5NAaskU2bEZcPcr5jV+32+iZJuF/POMLz1Hv6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMRUdYKl8vlbwn5F7agYnOw46BfNV+uLZwkzAhl42Syk6Soyw9HKJh2Yp14kujLjzUV3Vb6fikahwObNaTVfOjTp1fgKb77JHWDhqqWZHODJDUEDsJK1iFrBcdeuyavOZHJe1JbDuQx6+edn5QQsg25WQX7vxi75XuX+urUNNw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zaa7Fsfd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB844C4CEE2;
	Wed, 23 Apr 2025 18:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745431665;
	bh=Hiz3p5NAaskU2bEZcPcr5jV+32+iZJuF/POMLz1Hv6c=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Zaa7Fsfdo3kR8k5RbaP5uRSD8biSiXcWJWecKzBmbd91m91nQF0MOy3cBVs29mffX
	 CVtFxfFKJwbTswG2FV1df5sCuXbto5dr/bqz7yNTXpT2XFDrk5WB9GkUEm01pLFyP6
	 PEES81ECwJun1oTlDmCwQ/b5jVcVALBXuM99PhzKZf5uEQu2aL/MuKbqpLJbtPaSim
	 FyE2ZLO5MU81zWRYzP9pKrEKhomf/syi8DHXpfbfnom82JVp7bTqwi4nvUj6MRwv7Q
	 NY+vNbZiYM7gNxn8fFN2nKw092UTv+wSnwIogYioBlusTvuPzEIQE9XPw9uO/hY3OS
	 xdaqCvCynb0ag==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5A5FECE0B75; Wed, 23 Apr 2025 11:07:45 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:07:45 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Aithal, Srikanth" <sraithal@amd.com>
Cc: Bert Karwatzki <spasswolf@web.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org,
	Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: commit dd4cf8c9e1f4 leads to failed boot
Message-ID: <82ff38fc-b295-472c-bde5-bd96f0d144fb@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20250423115409.3425-1-spasswolf@web.de>
 <647b9aa4-f46e-4009-a223-78bfc6cc6768@amd.com>
 <fa8dd394-45c1-48d3-881c-5f3d5422df39@paulmck-laptop>
 <5a4a3d0d-a2e1-4fd3-acd2-3ae12a2ac7b0@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a4a3d0d-a2e1-4fd3-acd2-3ae12a2ac7b0@amd.com>

On Wed, Apr 23, 2025 at 08:49:08PM +0530, Aithal, Srikanth wrote:
> On 4/23/2025 7:48 PM, Paul E. McKenney wrote:
> > On Wed, Apr 23, 2025 at 07:09:42PM +0530, Aithal, Srikanth wrote:
> > > On 4/23/2025 5:24 PM, Bert Karwatzki wrote:
> > > > Since linux next-20250422 booting fails on my MSI Alpha 15 Laptop runnning
> > > > debian sid. When booting kernel message appear on screen but no messages from
> > > > init (systemd). There are also no logs written even thought emergency sync
> > > > via magic sysrq works (a message is printed on screen), presumably because
> > > > / is not mounted. I bisected this (from 6.15-rc3 to next-20250422) and found
> > > > commit dd4cf8c9e1f4 as the first bad commit.
> > > > Reverting commit dd4cf8c9e1f4 in next-20250422 fixes the issue.
> > > 
> > > 
> > > Hello,
> > > 
> > > On AMD platform as well boot failed starting next-20250422, bisecting the
> > > issue led me to same commit dd4cf8c9e1f4. I have attached kernel config and
> > > logs.
> > 
> > Thank you all for the bisection and the report!
> > 
> > Please check out the predecessor of commit dd4cf8c9e1f4 ("ratelimit:
> > Force re-initialization when rate-limiting re-enabled"):
> > 
> > 13fa70e052dd ("ratelimit: Allow zero ->burst to disable ratelimiting")
> > 
> > Then please apply the patch shown below, and let me know what happens?
> > (Yes, I should have split that commit up...)
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> > index 04f16b8e24575..13ed636642270 100644
> > --- a/lib/ratelimit.c
> > +++ b/lib/ratelimit.c
> > @@ -35,7 +35,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
> >   	unsigned long flags;
> >   	int ret;
> > -	if (!interval || !burst)
> > +	if (interval <= 0 || burst <= 0)
> >   		return 1;
> >   	/*
> 
> 
> I applied above patch on top of 13fa70e052dd ("ratelimit: Allow zero ->burst
> to disable ratelimiting") [linux-20250423]. This is fixing the boot issue.
> 
> Tested-by: Srikanth Aithal <sraithal@amd.com>

Thank you both, and to Bert for intuiting the correct -next commit!

Could you please try the next increment, which is this patch, again
on top of 24ff89c63355 ("ratelimit: Allow zero ->burst to > disable
ratelimiting")?

In the meantime, I will expose the version you two just tested to
-next.

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 04f16b8e24575..8f6c54f719ef2 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -35,8 +35,10 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	unsigned long flags;
 	int ret;
 
-	if (!interval || !burst)
+	if (interval <= 0 || burst <= 0) {
+		ret = burst > 0;
 		return 1;
+	}
 
 	/*
 	 * If we contend on this state's lock then just check if

