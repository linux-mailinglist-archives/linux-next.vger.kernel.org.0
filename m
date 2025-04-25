Return-Path: <linux-next+bounces-6384-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5326CA9C3E6
	for <lists+linux-next@lfdr.de>; Fri, 25 Apr 2025 11:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1B1E1BC139C
	for <lists+linux-next@lfdr.de>; Fri, 25 Apr 2025 09:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E14223DCE;
	Fri, 25 Apr 2025 09:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="U4JsJ+o2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D21233712
	for <linux-next@vger.kernel.org>; Fri, 25 Apr 2025 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573738; cv=none; b=dDKarsc5ZyXaQxqGE+U/zta7D/uFcizKjYt1F7psrtMUh24d5ZQAjZCkzrnnbbouC3i5KPPw/mtmEYE5XwJ09/OVNW7LEfBgahgGkvrvImZwM1AXiY6Z+Xaqu4vPrGJJouBsUsS6Hsn8FgZ/JWMmsb2GiIcPcZ2+QUcIyoi3IdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573738; c=relaxed/simple;
	bh=iuJj6daWqOexNpQYyOtWPS919zzdCqSf5D7wsS+hUNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdGPAEhQ7GUHLvkUgyeHOnQwi8sa+q2eUkpFC+rvygwMgJ9SARLgp46Zh400VhVThnSowePWgrZkXRE6J1Pijj71R9z4jjcHrMvujCTdcNaGc5neXIbdzo5nrgWLxv+aa5gHLEwqKTSJgCA0+4jgHxOnPPpPVPKD9T0WzS1KdWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=U4JsJ+o2; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso1282031f8f.1
        for <linux-next@vger.kernel.org>; Fri, 25 Apr 2025 02:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745573735; x=1746178535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iqogTqVfqp0fhah+UPvQWOhdV+0RH4Tc+Kwby4w7cYk=;
        b=U4JsJ+o2h+xE//ctjks1clL8sO4k0hdOeqfewSIGEpgmxJu6km4AsSHU33CiBJ4bAG
         erE4hsbx6o86GY5zWzA7gSmFlLv0+0KBBX/9QYA84Vr6Z8piUpa5iU3B3HdkoP5dqtsv
         XBDtDN99J0qOSOU9Vbc2PIjV1p8i/Dh9X/C8nj+LM78wxuwQ3iPo5uvIKhDkbmCF5Yhz
         FACv6x1BtMadbCg9qoRiQ/BXLfoyKd0t3w5w8k6nfypJ4nhTWXpjNXpizZpSLgzKlVS5
         POp9l4IW7oXIqXhCE1JQpWiB3BlFc2feObRWjhCHEv2s/B202FPb3GYDDcOGuNqlB8t1
         TVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745573735; x=1746178535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqogTqVfqp0fhah+UPvQWOhdV+0RH4Tc+Kwby4w7cYk=;
        b=rj7NGsvZulzySOVls63LZvW9ZPZQozGd7/dLxfrqSlzjZ4GBiduO2fghAkAXGOiyAN
         xDi46JQKCbgWyYN3/XfobcahfYAMPCldQ/CoM5Z3l3Wor65JrMh5poe7qDaReuVTlK+x
         B+ToT2GS2jiaRptuUbw77uLVppFPAfCJ76188iIwAOeuFI0/ow+lsfJo4gCiFRh2b7kG
         QUT5ATvyM6tWsMRMcpd1ppNRqC4DcGl1RO/627FG1aVMLhFnQwbMlF+KMFFmRfpmtzYW
         bNcYMwXH2/AJNMYJZw+7vAKhVUmcvcL2wBmFecZNGideVJPXRCajWPNi9Wy6CCk6Kadi
         ytzg==
X-Forwarded-Encrypted: i=1; AJvYcCUqnenmw0+dha49Bo5YTlLUVtnUn1gE0JMl54hXhYxRBunwoZz/NEy3np57svffwBu+dwNj91TKGmjd@vger.kernel.org
X-Gm-Message-State: AOJu0YyWCRj8U/WMKxCTSEiQWcfcoUTPB08jTMGyyT2cM1gMBy3RsDBG
	VFhBVLSG00LeUOGoMAon7dhmjN9b9B+rdRRAnY2qeI2Gqe44O7zoXENsWI3UBYs=
X-Gm-Gg: ASbGncuU5j2NCL09A3iY/UUtu+qkY/4jmLy0spARRbbOhB8uINAujmKHySLft8etNFt
	eRBrawF6HRukEUNDLw4/TyL/v+HTv3ltyw/1r1gVwQh49gun/u/OUgZhHhb6sWdiugYtX4XWxkb
	/kEa9w6n2ca36sV8np5a4vsS0GCh8wljZ/pe1fVcOfOp0h/3LoaPQTw6vNRzfVMQEGWmbkT0siC
	37OSCRikIOswEt8gqLc7s5crF1trQL3KDgeExNQ2rNtm13YRkf2Se3CLHNC6veQ/Jlc2ZD2ALTL
	2UlNKvMe3M4G3dcTyw9aqdjxX3mz4AjWGrJ0rqhZGS0=
X-Google-Smtp-Source: AGHT+IGbQx7AyTaVhAC380hOEJ9CK/SWGolUIaOQpnXE6nZ+VljvXhcvLKSQllZ85cQ46B2ep2oKpQ==
X-Received: by 2002:a5d:47ad:0:b0:390:f9d0:5e4 with SMTP id ffacd0b85a97d-3a074e1f808mr1256764f8f.21.1745573734549;
        Fri, 25 Apr 2025 02:35:34 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca42cdsm1790151f8f.22.2025.04.25.02.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:35:34 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:35:32 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Bert Karwatzki <spasswolf@web.de>,
	"Aithal, Srikanth" <sraithal@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org,
	Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: commit dd4cf8c9e1f4 leads to failed boot
Message-ID: <aAtXZPgcIlvdQKEq@pathway.suse.cz>
References: <20250423115409.3425-1-spasswolf@web.de>
 <647b9aa4-f46e-4009-a223-78bfc6cc6768@amd.com>
 <fa8dd394-45c1-48d3-881c-5f3d5422df39@paulmck-laptop>
 <5a4a3d0d-a2e1-4fd3-acd2-3ae12a2ac7b0@amd.com>
 <82ff38fc-b295-472c-bde5-bd96f0d144fb@paulmck-laptop>
 <1509f29e04b3d1ac899981e0adaad98bbc0ee61a.camel@web.de>
 <8ded350c-fc05-4bc2-aff2-33b440f6e2d6@paulmck-laptop>
 <aAnp9rdPhRY52F7N@pathway.suse.cz>
 <f54c213e-b8e2-418f-b7f4-a2fa72f098b1@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f54c213e-b8e2-418f-b7f4-a2fa72f098b1@paulmck-laptop>

On Thu 2025-04-24 07:43:38, Paul E. McKenney wrote:
> On Thu, Apr 24, 2025 at 09:36:22AM +0200, Petr Mladek wrote:
> > On Wed 2025-04-23 12:56:53, Paul E. McKenney wrote:
> > > On Wed, Apr 23, 2025 at 09:19:56PM +0200, Bert Karwatzki wrote:
> > > > Am Mittwoch, dem 23.04.2025 um 11:07 -0700 schrieb Paul E. McKenney:
> > > > > On Wed, Apr 23, 2025 at 08:49:08PM +0530, Aithal, Srikanth wrote:
> > > > > > On 4/23/2025 7:48 PM, Paul E. McKenney wrote:
> > > > > > > On Wed, Apr 23, 2025 at 07:09:42PM +0530, Aithal, Srikanth wrote:
> > > > > > > > On 4/23/2025 5:24 PM, Bert Karwatzki wrote:
> > > > > > > > > Since linux next-20250422 booting fails on my MSI Alpha 15 Laptop runnning
> > > > > > > > > debian sid. When booting kernel message appear on screen but no messages from
> > > > > > > > > init (systemd). There are also no logs written even thought emergency sync
> > > > > > > > > via magic sysrq works (a message is printed on screen), presumably because
> > > > > > > > > / is not mounted. I bisected this (from 6.15-rc3 to next-20250422) and found
> > > > > > > > > commit dd4cf8c9e1f4 as the first bad commit.
> > > > > > > > > Reverting commit dd4cf8c9e1f4 in next-20250422 fixes the issue.
> > > > > > > > 
> > > > > > > > 
> > > > > > > > Hello,
> > > > > > > > 
> > > > > > > > On AMD platform as well boot failed starting next-20250422, bisecting the
> > > > > > > > issue led me to same commit dd4cf8c9e1f4. I have attached kernel config and
> > > > > > > > logs.
> > > > > > > 
> > > > 
> > > > diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> > > > index b5c727e976d2..fc28f6cf8269 100644
> > > > --- a/lib/ratelimit.c
> > > > +++ b/lib/ratelimit.c
> > > > @@ -40,7 +40,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
> > > >          * interval says never limit.
> > > >          */
> > > >         if (interval <= 0 || burst <= 0) {
> > > > -               ret = burst > 0;
> > > > +               ret = 1;
> > > >                 if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
> > > >                     !raw_spin_trylock_irqsave(&rs->lock, flags))
> > > >                         return ret;
> > > 
> > > You are quite right, your patch does fix the issue that you three say.
> > 
> > Honestly, I do not understand what a ratelimit user could cause this
> > issue. And I am not able to reproduce it on my test system (x86_64,
> > kvm). I mean that my system boots and I see the systemd meesages.
> 
> My bug was that interval==0 suppressed all ratelimited output, when
> it is instead supposed to never suppress it, as illustrated by the
> RATELIMIT_STATE_INIT_DISABLED() macro that I somehow managed to ignore.
> (Yes, I need more tests!  And I will do so.)

Your code actually supported RATELIMIT_STATE_INIT_DISABLED().
___ratelimit() returned 1 because the burst was 10 > 0 ;-)

> > > Unfortunately, it prevents someone from completely suppressing output
> > > by setting burst to zero.  Could you please try the patch below?
> > 
> > I wondered whether some code used a non-initialized struct ratelimit_state.
> > I tried the following patch:
> > 
> > diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> > index b5c727e976d2..f949a18e9c2b 100644
> > --- a/lib/ratelimit.c
> > +++ b/lib/ratelimit.c
> > @@ -35,6 +35,10 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
> >  	unsigned long flags;
> >  	int ret;
> >  
> > +	WARN_ONCE(interval <= 0 || burst <= 0,
> > +		  "Possibly using a non-initilized ratelimit struct with interval:%d, burst:%d\n",
> > +		  interval, burst);
> > +
> >  	/*
> >  	 * Non-positive burst says always limit, otherwise, non-positive
> >  	 * interval says never limit.
> > 
> > 
> > And it triggered:
> > 
> > [    2.874504] ------------[ cut here ]------------
> > [    2.875552] Possibly using a non-initilized ratelimit struct with interval:0, burst:0
> > [    2.876990] WARNING: CPU: 2 PID: 1 at lib/ratelimit.c:38 ___ratelimit+0x1e8/0x200
> > [    2.878435] Modules linked in:
> > [    2.879045] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W           6.15.0-rc3-next-20250422-default+ #22 PREEMPT(full)  f5d77f8de4aec34e420e26410c34bcb56f692aae
> > [    2.881287] Tainted: [W]=WARN
> > [    2.882010] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.3-2-gc13ff2cd-prebuilt.qemu.org 04/01/2014
> > [    2.886452] RIP: 0010:___ratelimit+0x1e8/0x200
> > [    2.888405] Code: 00 00 e9 b5 fe ff ff 41 bc 01 00 00 00 e9 f2 fe ff ff 89 ea 44 89 e6 48 c7 c7 f8 40 eb 92 c6 05 b5 4d 0f 01 01 e8 28 a0 de fe <0f> 0b e9 71 ff ff ff 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 80 00 00
> > [    2.891223] RSP: 0000:ffffcf1340013bd8 EFLAGS: 00010282
> > [    2.892033] RAX: 0000000000000000 RBX: ffff8a8cc2bfbaf0 RCX: 0000000000000000
> > [    2.893091] RDX: 0000000000000002 RSI: 00000000ffff7fff RDI: 00000000ffffffff
> > [    2.894158] RBP: 0000000000000000 R08: 00000000ffff7fff R09: ffff8a8d3fe3ffa8
> > [    2.895168] R10: 00000000ffff8000 R11: 0000000000000001 R12: 0000000000000000
> > [    2.896150] R13: ffffffff92e08d38 R14: ffff8a8cc369e400 R15: ffff8a8cc2e39f00
> > [    2.897138] FS:  0000000000000000(0000) GS:ffff8a8da6f3c000(0000) knlGS:0000000000000000
> > [    2.898224] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    2.899181] CR2: 0000000000000000 CR3: 0000000153256001 CR4: 0000000000370ef0
> > [    2.901865] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > [    2.903516] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > [    2.906593] Call Trace:
> > [    2.907143]  <TASK>
> > [    2.907582]  __ext4_msg+0x6e/0xa0
> 
> Ths is the ->s_msg_ratelimit_state field of the ext4_sb_info structure,
> which is allocated via kzalloc().  It looks like these two statements:
> 
> EXT4_RW_ATTR_SBI_PI(msg_ratelimit_interval_ms, s_msg_ratelimit_state.interval);
> EXT4_RW_ATTR_SBI_PI(msg_ratelimit_burst, s_msg_ratelimit_state.burst);
> 
> Allow the sysadm to specify rate-limiting if desired, with the default of
> no rate limiting.  And zero-initialization seems like a reasonable thing
> to allow for a default-never-ratelimited ratelimit_state structure, not?

Exactly. I belive that ___ratelimit() should return 1 (always pass) when
the structure is zero-initialized. I was not clear enough.

It is not ideal from the semantic POV. It would make sense to use
"zero" burst for always limiting the output. But this does
not work in the zero-initialized case.

A solution would be to handle the corner cases (always pass, never
pass) using some flag, for example:

#define RATELIMIT_ALWAYS_PASS		BIT(2)
#define RATELIMIT_NEVER_PASS		BIT(3)

instead of some combinations of interval and burst values.

But I think that it is not worth it. I guess that most users
want to use ___ratelimit() for a real rate limiting. And
the only problem is the not-yet-initialized structure which
should just "pass".

> So given Bert's survey of the users, would it make sense to have your
> WARN_ONCE(), but only if either burst or interval is negative?

It might make sense. It would help to catch a use of not-yet-initialized
and not-even-zeroed struct ratelimit_state which might produce random
results.

> Unless you tell me otherwise, I will add that with your Signed-off-by,
> and noting Bert's good work.

Feel free to use my SOB.

Best Regards,
Petr

PS: I see that you have already sent v3 of the series. I am going to
    look at it. I am not sure if I manage it today though.

