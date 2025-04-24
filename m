Return-Path: <linux-next+bounces-6375-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F96A9A472
	for <lists+linux-next@lfdr.de>; Thu, 24 Apr 2025 09:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 390723BDA58
	for <lists+linux-next@lfdr.de>; Thu, 24 Apr 2025 07:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE50219A72;
	Thu, 24 Apr 2025 07:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SKkxg7KQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA6C1F4727
	for <linux-next@vger.kernel.org>; Thu, 24 Apr 2025 07:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745480188; cv=none; b=PHUUlGovfySFm2uVtCcqaJpHScU2UX30lg3wg/DrcFg0087R7YX85XUqbC+2/xZQEqi32vZpIDDXLB9tqBIQXdh+2AaA+Vqhtla9et2FoV+HaUSjRfDM3GNWwrRNP8q9mVwl8VqEzLZ/GFuY7nTZHhmiO6/NGr/KschLkYCI/No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745480188; c=relaxed/simple;
	bh=Kq3s++rgvtQWtgsslDUakCjoW1pmvc8YL7a3KpKjKak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sb+o2zrvAm4tEwkUOVsB4Bur/sJ32g5eOfO9rUPMixSl40jWElHdfZjH/LA+rVT8m5/FNIMRb8aKpZgpwirVIrlhrN/cD8EcE0md5RRPhvUcgpspK609LPjOWqQ76rbCbGEjVnhVaZppy+ImWLRyzzITXUH77yEX+xA3nQupF+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SKkxg7KQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so4018625e9.1
        for <linux-next@vger.kernel.org>; Thu, 24 Apr 2025 00:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745480184; x=1746084984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n3PlX1g3WvkTquEDOT/3KP8Qz93IfG3BoXc8zl+KOuQ=;
        b=SKkxg7KQN+GUipELtbxQmRGodx225okkFsHYCn300iw74w+SpPcsjztqDbAuOgFMR7
         Ip+Q8od6yiUW1qXTwi/p1bMDJ8qd9PTEinec+102rvBfHWF4Xvu+PuFBcNLeZEWGUJtf
         o2mynkOCYkKXH2260PKGYvZIhe8ORDZiqUSZBfeK6e7sAQ/F3+qpkRgHMMHhTiQDMyei
         K3EXnOBMHV46BaybzRHDkG4gp3IC8O6LKGqNMNRJz18XPMqjkdWTdTsSaW3KCNOrYSaW
         E7Aowq9EvzK8exNLMCy7TyNX/lz9qtoRf+t96phPeJYf+AxO4shMOIpIMJfc/7y+QBlF
         XfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745480184; x=1746084984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3PlX1g3WvkTquEDOT/3KP8Qz93IfG3BoXc8zl+KOuQ=;
        b=jzirIJjeAECLS7Yjb+VGqSwESuQlCC3Twcb1VT7lT2SF9VEWMRvZ3EFwNNv56XJMOH
         3E/sKqQiZ5aDsdkYSRbgW1vRtkz04gUDmOdiwXEcxuqyQ0yfHAqklx88eLf0fq18/TXg
         Crz62NQzIGj5qNl7MZ5XTR/WGP9B6xmEJKZQIGjnWg6oh/hGui4fhcsVgblNiV4FyKWt
         udO5LnpiiOB0CRzPPqQZzhrSRM1u+sr4wwQOM0w/J0BokmP8Fvl3LZ/WaJKNCL2uiVv4
         tOZkmjC6Fa8GWpNZxW3HkZCVXB4LQfBchwXFpfWeOIQ94IUK2+ukWT8Jfa9yB8E7xUvZ
         lN7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4HsreV9FvuS//WkhpCaG4HC69f2/SrTwjfM/assP9QoOXuJ4jAwHMuPFpzeiv53uwajJIG+dOkZsm@vger.kernel.org
X-Gm-Message-State: AOJu0YwUPeApbUs0i9keG4j2WC+0qrrXA6e/y3nHEpUfgNpg7iE5OhIb
	Rd8XB445zWEQL3ZZSfraWIH2j5YRjNQ4nkAAUrNPbWLQG5dd1oaG1HjNdpYDwQw=
X-Gm-Gg: ASbGncv6K4165XLBfM1xrT4bqPzuwPojgBQqmxoHq6AgIjJKlLfm8n9DOltJVRtRyOu
	WCqLdKNRhj/9fX51023zKzVO3XCXg+nDIJ2PnMMzhCTc9TM+sYyXixLMYU3pnkQzh8Zx5Ab2tYP
	+4MNdu4zMZIfkXsXTHkhvleagpTjoU1V1A919jUzpFKRyDKujup5HXWItxhDWS4cvomQohPUDU2
	P8aTIbDEQQWTzJxbLY8zJRFUuwSNN3LnRoQXuDvkTs+HfIQXDa+HgvudvRPc47kYLxsTFd4g1FX
	dtUo4za6ZH2YCaVlcR9z+cGsRoFpLMC/bldsZTSzbKM=
X-Google-Smtp-Source: AGHT+IFcPSZIM/Eb6N3TfSme3U2cKw8HuWV8KenlAUgSdFXWQVEoFGprh1v+S+HeojSEe2tWbMSH1A==
X-Received: by 2002:a05:600c:a403:b0:43d:7413:cb3f with SMTP id 5b1f17b1804b1-4409c81864fmr8893135e9.5.1745480184382;
        Thu, 24 Apr 2025 00:36:24 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8976sm9253195e9.27.2025.04.24.00.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:36:23 -0700 (PDT)
Date: Thu, 24 Apr 2025 09:36:22 +0200
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
Message-ID: <aAnp9rdPhRY52F7N@pathway.suse.cz>
References: <20250423115409.3425-1-spasswolf@web.de>
 <647b9aa4-f46e-4009-a223-78bfc6cc6768@amd.com>
 <fa8dd394-45c1-48d3-881c-5f3d5422df39@paulmck-laptop>
 <5a4a3d0d-a2e1-4fd3-acd2-3ae12a2ac7b0@amd.com>
 <82ff38fc-b295-472c-bde5-bd96f0d144fb@paulmck-laptop>
 <1509f29e04b3d1ac899981e0adaad98bbc0ee61a.camel@web.de>
 <8ded350c-fc05-4bc2-aff2-33b440f6e2d6@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ded350c-fc05-4bc2-aff2-33b440f6e2d6@paulmck-laptop>

On Wed 2025-04-23 12:56:53, Paul E. McKenney wrote:
> On Wed, Apr 23, 2025 at 09:19:56PM +0200, Bert Karwatzki wrote:
> > Am Mittwoch, dem 23.04.2025 um 11:07 -0700 schrieb Paul E. McKenney:
> > > On Wed, Apr 23, 2025 at 08:49:08PM +0530, Aithal, Srikanth wrote:
> > > > On 4/23/2025 7:48 PM, Paul E. McKenney wrote:
> > > > > On Wed, Apr 23, 2025 at 07:09:42PM +0530, Aithal, Srikanth wrote:
> > > > > > On 4/23/2025 5:24 PM, Bert Karwatzki wrote:
> > > > > > > Since linux next-20250422 booting fails on my MSI Alpha 15 Laptop runnning
> > > > > > > debian sid. When booting kernel message appear on screen but no messages from
> > > > > > > init (systemd). There are also no logs written even thought emergency sync
> > > > > > > via magic sysrq works (a message is printed on screen), presumably because
> > > > > > > / is not mounted. I bisected this (from 6.15-rc3 to next-20250422) and found
> > > > > > > commit dd4cf8c9e1f4 as the first bad commit.
> > > > > > > Reverting commit dd4cf8c9e1f4 in next-20250422 fixes the issue.
> > > > > > 
> > > > > > 
> > > > > > Hello,
> > > > > > 
> > > > > > On AMD platform as well boot failed starting next-20250422, bisecting the
> > > > > > issue led me to same commit dd4cf8c9e1f4. I have attached kernel config and
> > > > > > logs.
> > > > > 
> > > > > Thank you all for the bisection and the report!
> > > > > 
> > > > > Please check out the predecessor of commit dd4cf8c9e1f4 ("ratelimit:
> > > > > Force re-initialization when rate-limiting re-enabled"):
> > > > > 
> > > > > 13fa70e052dd ("ratelimit: Allow zero ->burst to disable ratelimiting")
> > > > > 
> > > > > Then please apply the patch shown below, and let me know what happens?
> > > > > (Yes, I should have split that commit up...)
> > > > > 
> > > > > 							Thanx, Paul
> > > > > 
> > > > > ------------------------------------------------------------------------
> > > > > 
> > > > > diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> > > > > index 04f16b8e24575..13ed636642270 100644
> > > > > --- a/lib/ratelimit.c
> > > > > +++ b/lib/ratelimit.c
> > > > > @@ -35,7 +35,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
> > > > >   	unsigned long flags;
> > > > >   	int ret;
> > > > > -	if (!interval || !burst)
> > > > > +	if (interval <= 0 || burst <= 0)
> > > > >   		return 1;
> > > > >   	/*
> > > > 
> > > > 
> > > > I applied above patch on top of 13fa70e052dd ("ratelimit: Allow zero ->burst
> > > > to disable ratelimiting") [linux-20250423]. This is fixing the boot issue.
> > > > 
> > > > Tested-by: Srikanth Aithal <sraithal@amd.com>
> > > 
> > > Thank you both, and to Bert for intuiting the correct -next commit!
> > > 
> > > Could you please try the next increment, which is this patch, again
> > > on top of 24ff89c63355 ("ratelimit: Allow zero ->burst to > disable
> > > ratelimiting")?
> > > 
> > > In the meantime, I will expose the version you two just tested to
> > > -next.
> > > 
> > > 							Thanx, Paul
> > > 
> > > ------------------------------------------------------------------------
> > > 
> > > diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> > > index 04f16b8e24575..8f6c54f719ef2 100644
> > > --- a/lib/ratelimit.c
> > > +++ b/lib/ratelimit.c
> > > @@ -35,8 +35,10 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
> > >  	unsigned long flags;
> > >  	int ret;
> > >  
> > > -	if (!interval || !burst)
> > > +	if (interval <= 0 || burst <= 0) {
> > > +		ret = burst > 0;
> > >  		return 1;
> > > +	}
> > >  
> > >  	/*
> > >  	 * If we contend on this state's lock then just check if
> > 
> > If you set "ret = burst > 0", but "return 1" this will make no difference
> > (except in the case of a major compiler bug, probably), as I wrote in my other
> > email which overlapped yours, this fixes the issue in next-20250422:
> > 
> > diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> > index b5c727e976d2..fc28f6cf8269 100644
> > --- a/lib/ratelimit.c
> > +++ b/lib/ratelimit.c
> > @@ -40,7 +40,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
> >          * interval says never limit.
> >          */
> >         if (interval <= 0 || burst <= 0) {
> > -               ret = burst > 0;
> > +               ret = 1;
> >                 if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
> >                     !raw_spin_trylock_irqsave(&rs->lock, flags))
> >                         return ret;
> 
> You are quite right, your patch does fix the issue that you three say.

Honestly, I do not understand what a ratelimit user could cause this
issue. And I am not able to reproduce it on my test system (x86_64,
kvm). I mean that my system boots and I see the systemd meesages.

> Unfortunately, it prevents someone from completely suppressing output
> by setting burst to zero.  Could you please try the patch below?

I wondered whether some code used a non-initialized struct ratelimit_state.
I tried the following patch:

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index b5c727e976d2..f949a18e9c2b 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -35,6 +35,10 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	unsigned long flags;
 	int ret;
 
+	WARN_ONCE(interval <= 0 || burst <= 0,
+		  "Possibly using a non-initilized ratelimit struct with interval:%d, burst:%d\n",
+		  interval, burst);
+
 	/*
 	 * Non-positive burst says always limit, otherwise, non-positive
 	 * interval says never limit.


And it triggered:

[    2.874504] ------------[ cut here ]------------
[    2.875552] Possibly using a non-initilized ratelimit struct with interval:0, burst:0
[    2.876990] WARNING: CPU: 2 PID: 1 at lib/ratelimit.c:38 ___ratelimit+0x1e8/0x200
[    2.878435] Modules linked in:
[    2.879045] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W           6.15.0-rc3-next-20250422-default+ #22 PREEMPT(full)  f5d77f8de4aec34e420e26410c34bcb56f692aae
[    2.881287] Tainted: [W]=WARN
[    2.882010] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.3-2-gc13ff2cd-prebuilt.qemu.org 04/01/2014
[    2.886452] RIP: 0010:___ratelimit+0x1e8/0x200
[    2.888405] Code: 00 00 e9 b5 fe ff ff 41 bc 01 00 00 00 e9 f2 fe ff ff 89 ea 44 89 e6 48 c7 c7 f8 40 eb 92 c6 05 b5 4d 0f 01 01 e8 28 a0 de fe <0f> 0b e9 71 ff ff ff 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 80 00 00
[    2.891223] RSP: 0000:ffffcf1340013bd8 EFLAGS: 00010282
[    2.892033] RAX: 0000000000000000 RBX: ffff8a8cc2bfbaf0 RCX: 0000000000000000
[    2.893091] RDX: 0000000000000002 RSI: 00000000ffff7fff RDI: 00000000ffffffff
[    2.894158] RBP: 0000000000000000 R08: 00000000ffff7fff R09: ffff8a8d3fe3ffa8
[    2.895168] R10: 00000000ffff8000 R11: 0000000000000001 R12: 0000000000000000
[    2.896150] R13: ffffffff92e08d38 R14: ffff8a8cc369e400 R15: ffff8a8cc2e39f00
[    2.897138] FS:  0000000000000000(0000) GS:ffff8a8da6f3c000(0000) knlGS:0000000000000000
[    2.898224] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.899181] CR2: 0000000000000000 CR3: 0000000153256001 CR4: 0000000000370ef0
[    2.901865] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    2.903516] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    2.906593] Call Trace:
[    2.907143]  <TASK>
[    2.907582]  __ext4_msg+0x6e/0xa0
[    2.908132]  ? lock_is_held_type+0xd8/0x130
[    2.908755]  ext4_check_feature_compatibility+0x15e/0x2c0
[    2.909427]  __ext4_fill_super+0x543/0x1480
[    2.910049]  ext4_fill_super+0xcc/0x280
[    2.910641]  ? setup_bdev_super+0xfc/0x200
[    2.911265]  ? __pfx_ext4_fill_super+0x10/0x10
[    2.911882]  get_tree_bdev_flags+0x13e/0x1e0
[    2.912485]  vfs_get_tree+0x29/0xe0
[    2.912958]  ? capable+0x3a/0x60
[    2.913407]  do_new_mount+0x176/0x360
[    2.913920]  init_mount+0x5a/0x90
[    2.914389]  do_mount_root+0xa2/0x130
[    2.914923]  mount_root_generic+0xdd/0x270
[    2.916127]  ? mount_root+0x147/0x190
[    2.917989]  prepare_namespace+0x1e0/0x230
[    2.919124]  kernel_init_freeable+0x1ec/0x200
[    2.920907]  ? __pfx_kernel_init+0x10/0x10
[    2.922113]  kernel_init+0x1a/0x130
[    2.922616]  ret_from_fork+0x31/0x50
[    2.923093]  ? __pfx_kernel_init+0x10/0x10
[    2.923612]  ret_from_fork_asm+0x1a/0x30
[    2.924110]  </TASK>
[    2.924433] irq event stamp: 1696665
[    2.924955] hardirqs last  enabled at (1696675): [<ffffffff913fa54e>] __up_console_sem+0x5e/0x70
[    2.926072] hardirqs last disabled at (1696686): [<ffffffff913fa533>] __up_console_sem+0x43/0x70
[    2.927149] softirqs last  enabled at (1696612): [<ffffffff9135134e>] handle_softirqs+0x32e/0x400
[    2.928221] softirqs last disabled at (1696591): [<ffffffff91351509>] __irq_exit_rcu+0xd9/0x150
[    2.929167] ---[ end trace 0000000000000000 ]---
[    3.003162] EXT4-fs (vda2): mounted filesystem 587ae802-e330-4059-9b48-d5b845e1075a ro with ordered data mode. Quota mode: none.

I guess that it happens because the structure is initialized too late,
see:

static int __ext4_fill_super(struct fs_context *fc, struct super_block *sb)
{

	[ ... skipping a lot of initialization code ... ]

	/* Enable message ratelimiting. Default is 10 messages per 5 secs. */
	ratelimit_state_init(&sbi->s_err_ratelimit_state, 5 * HZ, 10);
	ratelimit_state_init(&sbi->s_warning_ratelimit_state, 5 * HZ, 10);
	ratelimit_state_init(&sbi->s_msg_ratelimit_state, 5 * HZ, 10);

	[...]
}

I guess that it is on purpose. They most likely do not want to
ratelimit the _very initial messages_ printed when the initialization
fails.

Maybe, it is not a good idea to allow to disable the ratelimit by
zero burst.

Best Regards,
Petr

