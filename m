Return-Path: <linux-next+bounces-9150-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDA8C7BDE3
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 23:33:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD9403A835F
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 22:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C322C15AE;
	Fri, 21 Nov 2025 22:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mq3a6zX7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7239D2E8B84
	for <linux-next@vger.kernel.org>; Fri, 21 Nov 2025 22:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763764400; cv=none; b=QrfMn8MDUvPtTUrH5C9w7My+quH+4l3pogl6nYOyaRqND8+PzL5sQV/Fs1U+cs6K7EGutgrsYiR7Nq5BNP9aMhV2E1n+n/cE2pNkhVLFIozXmXkbK8LW+oJlljGjIVidIKwqlToPHsot9mbjyg5/+zJrCl3wQHLJWQMYlKm7jEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763764400; c=relaxed/simple;
	bh=oowUxpo8Z2sE48KafeZqmWZ/LjcnKAAK61cxaAHNG6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JEq+3Tc5G0xjIrJqM2o8y+ApPls4i9UTN82N990lTMT3EYbLAwVpQ0vCh3TXIl/1/EO7RCU//IhwDtIMGAL3xXGte3yY4bXXuIirhobR63yM/f4n2TjHh17aMKySl+VIPu39VX+1bTkjFMrwBEFIOMaWOfUx3/7UtPFlH4gkxpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mq3a6zX7; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4eda6a8cc12so25665221cf.0
        for <linux-next@vger.kernel.org>; Fri, 21 Nov 2025 14:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763764397; x=1764369197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMZlpfY8I0HrP0ciLhA/rh2zqgKZy2Jt9ixY4CcJE7I=;
        b=mq3a6zX7zoR6mrpmVy/Siv2kohcqDYm8pZWmZVPAKmYE6mbLFd2zGYE5opjGgbHBWo
         yrnRhird12gDSuA3TZKcwn2q66L4Nh62RhzSOTICFRnqnVvJD4arQQRfn+DOJqJB06uK
         X0Hzo00uN+Vi0wYLUGxKOFsBHUduCoMyoR9nWiUmSkN5HC7I5dsUarUWcXkPZSi3QnuM
         eEkup3VBbR5xvVt1YPPaKQUuUDuZYShavz9TAixfxInp2O4Iwd7xQ2PQYjdcipVpDN//
         2Cug6PuC8aurcq+VQl8hY3+C2g9SeJdMRQWMWaasd3mzXBjhJgd1X2X01vmILS+PUNhK
         JIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763764397; x=1764369197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TMZlpfY8I0HrP0ciLhA/rh2zqgKZy2Jt9ixY4CcJE7I=;
        b=lRc/Ma4oZJFM/puUBLTv947MqJTI5ewXarNlK8sAw+DgFLCCoUxuTCdYdAgxto4zMX
         yGoGIW6HUzk6OEk4II0NpZGt5xsmZ9ajnxnqNLTt81lJ583s536kynuDv3vkQxi6gNnD
         bv6gHdz4sELh5hERVMNf3e6L+YAzeHoaFhHmysTKRKWnK7qkH7FWitPxNd15LIgLM2hi
         7AjQafdrK/4A3spi5p4ZgSsGLwv3nZMVidKkdkNz9mQL97P+ISj3Ebn989uleKaoZsQ1
         kLWZFirXSYc5Xz0QkBsu6G+2pgro4nnCj8Ha3kXsa35RDPJSL6wJ34Sx2qUw/JXgenhX
         NV4A==
X-Forwarded-Encrypted: i=1; AJvYcCVDSgW6DErlgOU+dd6LVMyEHpC780jRKpu3WsWcsN7aSoaNsAqUbQ4uCP37iiwZaY7oOIRZaD1/HAHf@vger.kernel.org
X-Gm-Message-State: AOJu0YyLUIhuxZNGKO0thW7laqeRw/rnWv6M7jKerDP2zE6dkqXnT1cl
	NdUkP7zmPtMOFZx2tB6xFxqsJo5Gi7YFJSo8D4TbZY9tYMsM10JE3UCk
X-Gm-Gg: ASbGncu/YdQX+UuTJO4k9756ZzhRvqJmDqhv6xvZiJo5151cRD+qfsk1Sxiq939SjaQ
	CYIS2EvzsIyviYZypGZG8HQ5wWnKtbTpOzGafKMXhwDDSYlv809hvEWGg1yFmKGEvpM4p7MSA/8
	YYHzKaF7joLeo2fidBislE//5ZnwiUk/wP9HRSyNcZ+vZOwhucS5M7xhEZ+U2ZaelbeYczdcRQA
	dGuLwZ+Sn791+rgPZQ5mOpt/hLwylyRWHav2YqoonZNf/SRga9PxX0Vp5Tb9ysGSBNrGTUb2iSj
	wd7jpmLypL/NNQ+nsS7o5VMaKwuQiFaxV/7ak1ctutifXqTJc4ssxRrCq8HkPmSRmRIzf2RxbCS
	jRWpB6hjMj1aXweycVR3Gqs+vp7S52+ZMUJSm7rfk5QHrf0G7WDyuq158d0hFxB00HumBY9bw5M
	uBud8PqwG7C7YUroAPCNi/T8fZEQeijoxXgnhsLSC2Woy/mDBOPqSKN65OELBc6WDx0C3szrscJ
	e9Vhm6jl0U9fBg=
X-Google-Smtp-Source: AGHT+IHyQi7mbkfC7GjWwW3yCDXaLJ6WCU1Gi59b/Vgz+tJ/4Ue0Uqm+6o16/Psbu/3xj9TbQoOUSA==
X-Received: by 2002:ac8:5f12:0:b0:4e8:b4d1:ece2 with SMTP id d75a77b69052e-4ee58854b96mr58309351cf.18.1763764397191;
        Fri, 21 Nov 2025 14:33:17 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48d53aaesm43076091cf.8.2025.11.21.14.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 14:33:16 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2447DF40076;
	Fri, 21 Nov 2025 17:33:16 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 21 Nov 2025 17:33:16 -0500
X-ME-Sender: <xms:q-ggaR_iF5ZVBj9lF6NpRYSSSPDiMcckvYTn4aPOaYbJmo1irEpr2w>
    <xme:q-ggaRiMGHF4UU5p4BtjSsqS_NtSwgnlisuqSEiFc43rW3n_1z0_wx3DbXaI5p1oR
    Z4V5dOrpQJcpmacNRJNVALdyiOy2PELVoV-vV4kokHG5Ffts40i>
X-ME-Received: <xmr:q-ggaaZvwvON_FODkrOsqeS8VduRKN4F3mil5DzSMrpUmcQCf5dMuLU296rMRijE2SL7LnECRpPMJFGOfkmsKAAGA0BKUETB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfeduudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeetgedujeejudehveekteetfeefhfffheetgfeugfetffekieetiedtudehgfff
    gfenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhm
    vghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekhe
    ehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghm
    vgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhfrhestggrnhgsrdgr
    uhhughdrohhrghdrrghupdhrtghpthhtohepsghighgvrghshieslhhinhhuthhrohhnih
    igrdguvgdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhlohhnghesrhgvughhrghtrdgtohhmpdhrtghpthhtohepph
    gvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:rOggae_qzo2t13cls6lLA3gXhQK6Bf2B-gJoxuJzs80rC5kMCjfRtA>
    <xmx:rOggaUNYC2VVK43Yy-py9QuUYGcuD-Uwh4XkeMu6jmGyNpZckvu9fw>
    <xmx:rOggaTGY49nWZime6iWYLQoLadDqtCipJ7FdAXid5IfAaicoq7HyRg>
    <xmx:rOggaazgaNXg0vasiqxKUsVeG3JjwmegqxDpDUjyC1g043Za560K9A>
    <xmx:rOggacqvfLAHPhFQ1XxbXtvYPDnNvhdFgfr_zyC3ZaJnR0NPqduzX0-f>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Nov 2025 17:33:15 -0500 (EST)
Date: Fri, 21 Nov 2025 14:33:14 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Waiman Long <llong@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Subject: Re: linux-next: boot warning from the final tree
Message-ID: <aSDoquGlA55Ge100@tardis.local>
References: <20251117202214.4f710f02@canb.auug.org.au>
 <20251121215819.GA1374726@ax162>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121215819.GA1374726@ax162>

On Fri, Nov 21, 2025 at 02:58:19PM -0700, Nathan Chancellor wrote:
> On Mon, Nov 17, 2025 at 08:22:14PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next qemu boot (powerpc pseries_le_defconfig) produced
> > this warning:
> > 
> >   ftrace: allocating 48915 entries in 288 pages
> >   ftrace: allocated 287 pages with 6 groups
> >   ------------[ cut here ]------------
> >   DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> >   WARNING: kernel/locking/mutex.c:156 at mutex_lock+0xcc/0x100, CPU#0: swapper/0/0
> >   Modules linked in:
> >   CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.18.0-rc6-09359-g921087e37218 #1 VOLUNTARY 
> >   Hardware name: IBM pSeries (emulated by qemu) POWER9 (architected) 0x4e1202 0xf000005 of:SLOF,HEAD hv:linux,kvm pSeries
> >   NIP:  c00000000148041c LR: c000000001480418 CTR: 0000000000000000
> >   REGS: c000000002957a10 TRAP: 0700   Not tainted  (6.18.0-rc6-09359-g921087e37218)
> >   MSR:  8000000002021033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 24022240  XER: 00000000
> >   CFAR: c00000000021123c IRQMASK: 3 
> >   GPR00: c000000001480418 c000000002957cb0 c000000001a3a100 0000000000000028 
> >   GPR04: 00000000ffffe04a c0000000026abe88 0000000000000001 000000000000004b 
> >   GPR08: c0000000026abd28 0000000000000000 0000000000000000 0000000044022240 
> >   GPR12: 0000000000000000 c000000002ae9000 0000000000000000 0000000001bff430 
> >   GPR16: 000000007e68f070 c00000007f79c480 c000000002969160 c000000002a0f5d8 
> >   GPR20: c0000000026a1138 c0000000026a1120 0000000000000000 c0000000019541b8 
> >   GPR24: c00000000218a480 c00000000296e1d0 000000007d612000 c00000000380be10 
> >   GPR28: c00000000380be20 c00000000380be00 c000000002640100 c00000000380be20 
> >   NIP [c00000000148041c] mutex_lock+0xcc/0x100
> >   LR [c000000001480418] mutex_lock+0xc8/0x100
> >   Call Trace:
> >   [c000000002957cb0] [c000000001480418] mutex_lock+0xc8/0x100 (unreliable)
> >   [c000000002957d20] [c00000000024a60c] alloc_workqueue_noprof+0x38c/0x8ec
> >   [c000000002957e00] [c00000000203018c] workqueue_init_early+0x4d8/0x6ec
> >   [c000000002957f30] [c000000002004448] start_kernel+0x74c/0xa4c
> >   [c000000002957fe0] [c00000000000e99c] start_here_common+0x1c/0x20
> >   Code: 4182ffb4 3d2200f3 392971e4 81290000 2c090000 4082ffa0 3c82ffe0 3c62ffe0 3884bfe0 3863bf68 4ad90d45 60000000 <0fe00000> 4bffff80 60000000 60000000 
> >   ---[ end trace 0000000000000000 ]---
> >   rcu: Hierarchical RCU implementation.
> > 
> > I have no idea what caused this.
> 
> I noticed this warning in my QEMU boot tests as well and bisected it
> down to commit 3572e2edc7b6 ("locking/mutex: Redo __mutex_init()").
> 
>   $ make -skj"$(nproc)" ARCH=powerpc CROSS_COMPILE=powerpc64-linux- clean ppc64le_guest_defconfig zImage.epapr
> 
>   $ curl -LSs https://github.com/ClangBuiltLinux/boot-utils/releases/download/20241120-044434/ppc64le-rootfs.cpio.zst | zstd -d >rootfs.cpio
> 
>   $ qemu-system-ppc64 \
>       -display none \
>       -nodefaults \
>       -device ipmi-bmc-sim,id=bmc0 \
>       -device isa-ipmi-bt,bmc=bmc0,irq=10 \
>       -machine powernv \
>       -kernel arch/powerpc/boot/zImage.epapr \
>       -initrd rootfs.cpio \
>       -m 2G \
>       -serial mon:stdio
>   ...
>   [    0.000000][    T0] Linux version 6.18.0-rc2-00016-g3572e2edc7b6 (nathan@ax162) (powerpc64-linux-gcc (GCC) 15.2.0, GNU ld (GNU Binutils) 2.45) #1 SMP Fri Nov 21 13:55:26 MST 2025
>   ...
>   [    0.000000][    T0] ------------[ cut here ]------------
>   [    0.000000][    T0] DEBUG_LOCKS_WARN_ON(lock->magic != lock)
>   [    0.000000][    T0] WARNING: CPU: 0 PID: 0 at kernel/locking/mutex.c:156 mutex_lock+0xd4/0x100
>   [    0.000000][    T0] Modules linked in:
>   [    0.000000][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.18.0-rc2-00016-g3572e2edc7b6 #1 VOLUNTARY
>   [    0.000000][    T0] Hardware name: IBM PowerNV (emulated by qemu) POWER10 0x801200 opal:v7.1-106-g785a5e307 PowerNV
>   [    0.000000][    T0] NIP:  c0000000014b2974 LR: c0000000014b2970 CTR: 0000000000000000
>   [    0.000000][    T0] REGS: c0000000029979f0 TRAP: 0700   Not tainted  (6.18.0-rc2-00016-g3572e2edc7b6)
>   [    0.000000][    T0] MSR:  9000000002021033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 24000220  XER: 00000000
>   [    0.000000][    T0] CFAR: c00000000021ed7c IRQMASK: 3
>   [    0.000000][    T0] GPR00: c0000000014b2970 c000000002997c90 c000000001a78100 0000000000000028
>   [    0.000000][    T0] GPR04: 00000000ffffe04a c0000000026ed958 0000000000000001 000000000000004b
>   [    0.000000][    T0] GPR08: c0000000026ed7f0 0000000000000000 0000000000000000 0000000044000220
>   [    0.000000][    T0] GPR12: c0000000026ed880 c000000002ba0000 0000000000000018 0000000000000000
>   [    0.000000][    T0] GPR16: 0000000000000000 c0000000026e2b88 c0000000026e2ba0 c00000007be5a400
>   [    0.000000][    T0] GPR20: c0000000029ed0e0 c000000002aaf7e0 0000000000000000 c0000000019911b8
>   [    0.000000][    T0] GPR24: c0000000021ca400 c0000000029f2150 0000000079c90000 c000000003081410
>   [    0.000000][    T0] GPR28: c000000003081420 c000000003081400 c0000000021cce98 c000000003081420
>   [    0.000000][    T0] NIP [c0000000014b2974] mutex_lock+0xd4/0x100
>   [    0.000000][    T0] LR [c0000000014b2970] mutex_lock+0xd0/0x100
>   [    0.000000][    T0] Call Trace:
>   [    0.000000][    T0] [c000000002997c90] [c0000000014b2970] mutex_lock+0xd0/0x100 (unreliable)
>   [    0.000000][    T0] [c000000002997d10] [c000000000258ddc] alloc_workqueue_noprof+0x44c/0x8c8
>   [    0.000000][    T0] [c000000002997df0] [c00000000203080c] workqueue_init_early+0x4e4/0x700
>   [    0.000000][    T0] [c000000002997f30] [c000000002004388] start_kernel+0x638/0x938
>   [    0.000000][    T0] [c000000002997fe0] [c00000000000e99c] start_here_common+0x1c/0x20
>   [    0.000000][    T0] Code: 4182ffa8 3d2200f8 3929d134 81290000 2c090000 4082ff94 3c82ffde 3c62ffde 38846d98 38636d20 4ad6c32d 60000000 <0fe00000> e9410068 4bffff70 38210080
>   [    0.000000][    T0] ---[ end trace 0000000000000000 ]---
>   ...
> 
> At the parent change, there is no warning.
> 

Thank you both, seems we missed the case where LOCKDEP=n but
DEBUG_MUTEXES=y, I feel like the following should be the correct fix.

Regards,
Boqun

------------->8
Subject: [PATCH] locking/mutex: Initialize mutex::magic even when LOCKDEP=n

When DEBUG_MUTEXES=y and LOCKDEP=n, mutex_lock() still checks on
->magic, hence debug_mutex_init() should be called in
mutex_init_generic() as well. While we are at it, decouple LOCKDEP
logic from debug_mutex_init(), because in this way debug_mutex_init()
only needs one parameter, and we now have mutex_init_lockep() for
LOCKDEP=y scenarios.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/lkml/20251117202214.4f710f02@canb.auug.org.au/
Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/lkml/20251121215819.GA1374726@ax162/
Fixes: 3572e2edc7b6 ("locking/mutex: Redo __mutex_init()")
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 kernel/locking/mutex-debug.c | 10 +---------
 kernel/locking/mutex.c       |  8 +++++++-
 kernel/locking/mutex.h       |  5 ++---
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/kernel/locking/mutex-debug.c b/kernel/locking/mutex-debug.c
index 949103fd8e9b..2c6b02d4699b 100644
--- a/kernel/locking/mutex-debug.c
+++ b/kernel/locking/mutex-debug.c
@@ -78,16 +78,8 @@ void debug_mutex_unlock(struct mutex *lock)
 	}
 }
 
-void debug_mutex_init(struct mutex *lock, const char *name,
-		      struct lock_class_key *key)
+void debug_mutex_init(struct mutex *lock)
 {
-#ifdef CONFIG_DEBUG_LOCK_ALLOC
-	/*
-	 * Make sure we are not reinitializing a held lock:
-	 */
-	debug_check_no_locks_freed((void *)lock, sizeof(*lock));
-	lockdep_init_map_wait(&lock->dep_map, name, key, 0, LD_WAIT_SLEEP);
-#endif
 	lock->magic = lock;
 }
 
diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index f3bb352a368d..2a1d165b3167 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -51,6 +51,7 @@ static void __mutex_init_generic(struct mutex *lock)
 #ifdef CONFIG_MUTEX_SPIN_ON_OWNER
 	osq_lock_init(&lock->osq);
 #endif
+	debug_mutex_init(lock);
 }
 
 static inline struct task_struct *__owner_task(unsigned long owner)
@@ -173,7 +174,12 @@ static __always_inline bool __mutex_unlock_fast(struct mutex *lock)
 void mutex_init_lockep(struct mutex *lock, const char *name, struct lock_class_key *key)
 {
 	__mutex_init_generic(lock);
-	debug_mutex_init(lock, name, key);
+
+	/*
+	 * Make sure we are not reinitializing a held lock:
+	 */
+	debug_check_no_locks_freed((void *)lock, sizeof(*lock));
+	lockdep_init_map_wait(&lock->dep_map, name, key, 0, LD_WAIT_SLEEP);
 }
 EXPORT_SYMBOL(mutex_init_lockep);
 #endif /* !CONFIG_DEBUG_LOCK_ALLOC */
diff --git a/kernel/locking/mutex.h b/kernel/locking/mutex.h
index 2e8080a9bee3..9ad4da8cea00 100644
--- a/kernel/locking/mutex.h
+++ b/kernel/locking/mutex.h
@@ -59,8 +59,7 @@ extern void debug_mutex_add_waiter(struct mutex *lock,
 extern void debug_mutex_remove_waiter(struct mutex *lock, struct mutex_waiter *waiter,
 				      struct task_struct *task);
 extern void debug_mutex_unlock(struct mutex *lock);
-extern void debug_mutex_init(struct mutex *lock, const char *name,
-			     struct lock_class_key *key);
+extern void debug_mutex_init(struct mutex *lock);
 #else /* CONFIG_DEBUG_MUTEXES */
 # define debug_mutex_lock_common(lock, waiter)		do { } while (0)
 # define debug_mutex_wake_waiter(lock, waiter)		do { } while (0)
@@ -68,6 +67,6 @@ extern void debug_mutex_init(struct mutex *lock, const char *name,
 # define debug_mutex_add_waiter(lock, waiter, ti)	do { } while (0)
 # define debug_mutex_remove_waiter(lock, waiter, ti)	do { } while (0)
 # define debug_mutex_unlock(lock)			do { } while (0)
-# define debug_mutex_init(lock, name, key)		do { } while (0)
+# define debug_mutex_init(lock)				do { } while (0)
 #endif /* !CONFIG_DEBUG_MUTEXES */
 #endif /* CONFIG_PREEMPT_RT */
-- 
2.50.1 (Apple Git-155)


