Return-Path: <linux-next+bounces-4676-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A1F9C08CC
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 15:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 641E32846E1
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 14:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8E5212D0B;
	Thu,  7 Nov 2024 14:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPBkKLJr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8654529CF4;
	Thu,  7 Nov 2024 14:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730989379; cv=none; b=C+c0963x+bmpxnh4xKQ9mRGEmBxeNPI0Q5D1+aVRzyxx8LCy77M8Hqw06KgK077bu1Lf6hgm4OmUntQK/DjT9XNGo8gnhcQDx4WmMZ2BRQLEmXQS/rYy9z52y1/xBmWl4C0y4lLVRdzXAKC+jWPiWF/aaW40f+/vl4p3VMF28bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730989379; c=relaxed/simple;
	bh=KqzZ6WY79YDLF1OpB1WL5ZQJCC7MXmKi54LGk5AgKQQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=QvIdiZBpdMtd+snkM5nc/4N5xUQCJv4m6ESUdRl2IzOdmtmQ1CDMGoTs8XoqzNVCdqoFIKrheEZJ99LB0TCT6AxJ7WP0NEdeC5n0fqwKKIVWtzFVxc+Pzyv2yLilfIxH+mqRZChuTfMusi+d38bGPhIxHW+LiPOazxY8Yqg0zh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPBkKLJr; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4609c9b39d0so6657461cf.1;
        Thu, 07 Nov 2024 06:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730989376; x=1731594176; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:references:in-reply-to:message-id
         :cc:to:from:date:mime-version:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8ChnhCYzMNWeR7/L12G3EeHqZZWIuyUN+IvvX5XAtw=;
        b=RPBkKLJrD0lcM5k6MH7A2usS4U5vZ6rVbDNAlS+vLZzKjOmyRLWDegie5wT5vbuYvT
         wA+PVX/+EcGSOCcX6EU2NQNjbw5MIek8Qf67+nDECyzoSxWvXJCfq68JkJB1NBm+27Hm
         TZ0vJjkETuz3xjWsP6pjogpSWjZd7UaIc0+bmC9pvSJBysR4VoOgTZc2u8xMzaH7qRxZ
         lY9L4QABjQgir8D8qdHkL7YnqS3pbg+F8CQ9Ub4tv6hHi1BLeJNmt4ipIGw9w6E2DKU0
         bt+jxsOAo2WAbkFcUAif5YNaeQJNbcL26tDe/ah542siE9aK9ei/fXrVk7Uv8GK6vGoF
         ZNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730989376; x=1731594176;
        h=content-transfer-encoding:subject:references:in-reply-to:message-id
         :cc:to:from:date:mime-version:feedback-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V8ChnhCYzMNWeR7/L12G3EeHqZZWIuyUN+IvvX5XAtw=;
        b=lCXpcKJ5ELuhiXCG8ddMgV/8TRgV2m6cZjFzeVJLWqX7m8NVrO6B8WzLFscY+QmMGg
         guAcwTyns0EEuRy2sxR1TcTLOfhegHEH5jfPSUPp08+VfLzZmrZYfKPnEP2DXySAdSBr
         MIxNjP97y5QFxtYNQw2/aefRYZR+PZXPo2UdYkqhUqyVDPALOa99nU1gI4Hn6tjqgKc4
         XWwH3iDRUaexNLBBmzEcqJnln7jbKRA6QrPNClhnogtBNB7Dgy+I/YfU0NlWVOnqXZ9J
         mq+WnLemKIVdd8dihFz7D/xpjLYsWx+cdVqLkXtv8dqpChKeN/t+XRV7Q6gFSJOujtbH
         2kfg==
X-Forwarded-Encrypted: i=1; AJvYcCUOkbAuF/DYWp757syxj2Resl+vQbZrSDBZ8MGvRhajBGsNoMQEZprbu0Qhf3nBVC/QZ1MVZf2EoH0/Qg==@vger.kernel.org, AJvYcCUTQszsm8eNjdNO+Kunu/pEQZdvRk1FVW1UmIEWSfboIa/m0G4Y1Aqeohv9iT8Egpv8FryHYysSJnKPstg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOWpRblk0dUpS3TjLWPlvtaJiTPUU0+4YQdBD1L1i+BAGjJGHm
	24j+a6v1u9UmaHBlPsEz72SEMYD2oRBOov3kYaRJBPC7JaMeQa0t
X-Google-Smtp-Source: AGHT+IGPR1Xjfbc3eFsCOaVLSKqt8kcMoR+LBR2Ieg03VWwf80oAMJCQZAsJ9agXCSl0qngcnJbJiw==
X-Received: by 2002:a05:622a:1b1b:b0:461:52b3:7ce5 with SMTP id d75a77b69052e-46307f4e324mr1038321cf.37.1730989373167;
        Thu, 07 Nov 2024 06:22:53 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ff41de0asm8249581cf.33.2024.11.07.06.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 06:22:52 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 26F61120006A;
	Thu,  7 Nov 2024 09:22:52 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-12.internal (MEProxy); Thu, 07 Nov 2024 09:22:52 -0500
X-ME-Sender: <xms:PM0sZ-u3U237Sj4UhqZ8LDMWMZxWDrD2FjoLAA9231giZlVq3t9XAA>
    <xme:PM0sZzeNfGKVOxi-LaHTXvhfL3qwoi9r4HUGlMcRS3JdFYuGf0QsIeS-ds10P_8UP
    sgfv7mwJ-cAvKYn-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrtdeggdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdeuohhquhhnucfhvghnghdfuceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeegtddvvdevgedthfeuleekgfeftdefkeej
    udehgeekvdeukeeiueejgfefveeitdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
    ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
    nhgrmhgvpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtoheprghlvgig
    rdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehpvghtvghriiesihhnfh
    hrrgguvggrugdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegsihhgvggrshihsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoh
    epthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepvgiiuhhlihgrnhes
    rhgvughhrghtrdgtohhmpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhmpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:PM0sZ5zi-60Yc-W51ZQe75bdgwF3PGO1kzvUf4dJMLYpbasCf68eHQ>
    <xmx:PM0sZ5MQi9azvPOYlokoYwD6j4POxT34wPlGUMuHAeXpuKc5PX9B9Q>
    <xmx:PM0sZ-_k4UeU7JIqjlz6svntD1f7WOHE-PpIX4yPlpcA0rj_BBFyFw>
    <xmx:PM0sZxXQF14DJ0dVjjHG5ASngwO6RyEHjTudufFbMavs7_bsPABVNw>
    <xmx:PM0sZ3cIEPFKBtSixpcyl88OUVeWMjQtlcWS2c1pG4Qttb8Y2Cr5GUvs>
Feedback-ID: iad51458e:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F1217B00068; Thu,  7 Nov 2024 09:22:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 07 Nov 2024 06:22:31 -0800
From: "Boqun Feng" <boqun.feng@gmail.com>
To: "Peter Zijlstra" <peterz@infradead.org>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Linux Next Mailing List" <linux-next@vger.kernel.org>,
 "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>, ezulian@redhat.com
Message-Id: <cade359b-8e58-4031-b21b-3c47e0dcf3af@app.fastmail.com>
In-Reply-To: <20241107141212.GB34695@noisy.programming.kicks-ass.net>
References: <20241107182411.57e2b418@canb.auug.org.au>
 <20241107103414.GT10375@noisy.programming.kicks-ass.net>
 <20241108000432.335ec09a@canb.auug.org.au>
 <20241107141212.GB34695@noisy.programming.kicks-ass.net>
Subject: Re: linux-next: build failure after merge of the tip tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, Nov 7, 2024, at 6:12 AM, Peter Zijlstra wrote:
> On Fri, Nov 08, 2024 at 12:04:32AM +1100, Stephen Rothwell wrote:
>> Hi Peter,
>> 
>> On Thu, 7 Nov 2024 11:34:14 +0100 Peter Zijlstra <peterz@infradead.org> wrote:
>> >
>> > On Thu, Nov 07, 2024 at 06:24:11PM +1100, Stephen Rothwell wrote:
>> > So I can't get RUST=y, even though make rustavailable is happy.
>> > 
>> > make LLVM=-19 allmodconfig does not get me RUST=y
>> > 
>> > I started out with tip/master, tried adding rust-next, then kbuild-next
>> > gave up and tried next/master. Nada.
>> 
>> Just on Linus' tree allmodconfig gives me:
>> 
>> $ grep RUST .config
>> CONFIG_RUSTC_VERSION=108100
>> CONFIG_RUST_IS_AVAILABLE=y
>> CONFIG_RUSTC_LLVM_VERSION=180108
>> CONFIG_RUST=y
>> CONFIG_RUSTC_VERSION_TEXT="rustc 1.81.0"
>> CONFIG_HAVE_RUST=y
>> CONFIG_RUST_FW_LOADER_ABSTRACTIONS=y
>> CONFIG_BLK_DEV_RUST_NULL=m
>> CONFIG_RADIO_TRUST=m
>> CONFIG_HID_THRUSTMASTER=m
>> CONFIG_THRUSTMASTER_FF=y
>> CONFIG_TRUSTED_KEYS=m
>> CONFIG_HAVE_TRUSTED_KEYS=y
>> CONFIG_TRUSTED_KEYS_TPM=y
>> CONFIG_TRUSTED_KEYS_TEE=y
>> CONFIG_TRUSTED_KEYS_CAAM=y
>> CONFIG_INTEGRITY_TRUSTED_KEYRING=y
>> CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT=y
>> CONFIG_SYSTEM_TRUSTED_KEYRING=y
>> CONFIG_SYSTEM_TRUSTED_KEYS=""
>> CONFIG_SECONDARY_TRUSTED_KEYRING=y
>> CONFIG_SECONDARY_TRUSTED_KEYRING_SIGNED_BY_BUILTIN=y
>> CONFIG_SAMPLES_RUST=y
>> CONFIG_SAMPLE_RUST_MINIMAL=m
>> CONFIG_SAMPLE_RUST_PRINT=m
>> CONFIG_SAMPLE_RUST_HOSTPROGS=y
>> CONFIG_RUST_DEBUG_ASSERTIONS=y
>> CONFIG_RUST_OVERFLOW_CHECKS=y
>> CONFIG_RUST_BUILD_ASSERT_ALLOW=y
>> 
>> $ rustc --version
>> rustc 1.81.0
>
> Yeah, I'm not sure what's going on. I occasionally get rust stuff, but
> mostly when I try allyesconfig. Weirdness.
>
>> > Anyway, I think the above needs something like this:
>> > 
>> > ---
>> > diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
>> > index b7b0945e8b3c..5804a6062eb1 100644
>> > --- a/rust/helpers/spinlock.c
>> > +++ b/rust/helpers/spinlock.c
>> > @@ -5,11 +5,16 @@
>> >  void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
>> >  				  struct lock_class_key *key)
>> >  {
>> > +#ifndef CONFIG_PREEMPT_RT
>> >  #ifdef CONFIG_DEBUG_SPINLOCK
>> >  	__raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
>> >  #else
>> >  	spin_lock_init(lock);
>> >  #endif
>> > +#else
>> > +	rt_mutex_base_init(&lock->lock);
>> > +	__rt_spin_lock_init(lock, name, key, false);
>> > +#endif
>> >  }
>> >  
>> >  void rust_helper_spin_lock(spinlock_t *lock)
>> 
>> I will try to remember to add that to the tip tree merge tomorrow.
>
> Boqun, could you test the above and make it happen?
>

FYI, Eder is already working on this:

https://lore.kernel.org/rust-for-linux/20241106211215.2005909-1-ezulian@redhat.com/

Eder, could you Cc locking for the next version?

Regards,
Boqun

>> > > Without the revert CONFIG_PREEMPT_RT=y, after the revert it is not set
>> > > and spinlock_check is only defined for !defined(CONFIG_PREEMPT_RT).  
>> > 
>> > Right, that moved PREEMPT_RT out of the preemption choice. Now I'm not
>> > sure we want it =y for all{yes,mod}config. Is the below the right
>> > incantation to avoid this?
>> > 
>> > ---
>> > diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
>> > index 7c1b29a3a491..54ea59ff8fbe 100644
>> > --- a/kernel/Kconfig.preempt
>> > +++ b/kernel/Kconfig.preempt
>> > @@ -88,7 +88,7 @@ endchoice
>> >  
>> >  config PREEMPT_RT
>> >  	bool "Fully Preemptible Kernel (Real-Time)"
>> > -	depends on EXPERT && ARCH_SUPPORTS_RT
>> > +	depends on EXPERT && ARCH_SUPPORTS_RT && !COMPILE_TEST
>> >  	select PREEMPTION
>> >  	help
>> >  	  This option turns the kernel into a real-time kernel by replacing
>> 
>> Yeah, that will do it.
>
> OK, I'll write it up and stick that in tip/sched/core along with them
> patches that's causing the grief :-)
>
> Attachments:
> * signature.asc

