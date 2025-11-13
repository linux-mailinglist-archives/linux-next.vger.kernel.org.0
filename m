Return-Path: <linux-next+bounces-8950-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0820DC5615B
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 08:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A830034F667
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 07:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4431232939B;
	Thu, 13 Nov 2025 07:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="INh9kisN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D14442A96
	for <linux-next@vger.kernel.org>; Thu, 13 Nov 2025 07:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763019447; cv=none; b=mPTD0stHNVQJk1WQ/JgepXw0UkUiF4yGbePenmhuDSW/wgeV6bg2YTCPlfqxGToKWq2dMmdBYe7xoOJ6GORl5R5sV2ABI+RLQx9asU5RW2HNr4DN2BeyynsnuceMRRdZa0W2FmE3asBul5SCi0vyTqH9FLW7ad1Fr7/v8u4nVuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763019447; c=relaxed/simple;
	bh=I/WpisZDYfQ6eCNY3xqj3kPfAZ27Pt/dd0Ntuhox6BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UOasWE1bbk7MCGuc3ht8P5IBgdRB/x7PBFb/5JAuSpSZCMPwgNIwuPxUDpvgp992KSg7C0Prr2KfV45Y6R0B9EpeD4vIaH0DG2i2qqDjAeswmqeHIOZH70ahP+PddoYSPWHsapuujtU9uTK7lNazxSyMKZDhVYrjMc3p3pdS8+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=INh9kisN; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64080ccf749so724993a12.2
        for <linux-next@vger.kernel.org>; Wed, 12 Nov 2025 23:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763019438; x=1763624238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4ErwKpSB7O06bd8pyRpgr/pjZeD/ktQ7vFDy/Wy+0Yk=;
        b=INh9kisN5YK8NAnyE9AoeNpRdCEsOuXou0i8pGvKb9XQVk7FnsUsj7/B4Ma4fHD+YT
         b0pahEBS209G2TUHRid8B4YWs5VevneZ30f9iyo2cKMXUEra6Ynq1hYrfFJlutusN0wj
         tTqD9G0lPyJmXWoyGddl7Rwcgcegvg+ftFFl2op2agdSO4iLtFOJikV/MXZO2XdmUFRq
         bY66pjgSFpBkAd6DSkoJsmCuGJKX/VYrVnDK9bta7odlTqoO3P5cIjl+lqo6Zcb3Qqj0
         UU/s9w+xgCbxMCMfwxPb0Pcd+QUU4ZZlb8gYPULgQKNzOuOBlyFlxphlidhFr5av12Tp
         YFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763019438; x=1763624238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ErwKpSB7O06bd8pyRpgr/pjZeD/ktQ7vFDy/Wy+0Yk=;
        b=mc1RDV759o2W65FbmPHuLTW1TL2HrwvelTMas5EL1izFFBV0KD0aT8qd8Iqw/kXuVD
         ap3jTpn4CMc45sZThzmEt9RrXLA1lYpfvZy2cRidWHWnC9N4u/VxnE++TyYSZ7rUWc5A
         xzGwhzpeSNeMTWdmLjFTJ+A7P31r+Tde3vhJ1YikykMlHnRUe6tvaDePgogdQl3Bf7g/
         qx0ny4vqWOBVg6jqWgsu47/KqtSfnubsM/WydqUkmoUQvVm/LfvN6AY8PXZ4y7OqB+kR
         rEMTtpmPFjCP+vixi80EdLntNmDcSzT8WExa+AvUGzGZAE9UUBgzGzLIl7XUQl0cDReh
         IHLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn2DmBsLeI87/lnjdgOaFB50UxxJGZOh1zFCQD5oEerOKmUfRbHhSMvEYjMJwOrRa1+AZq7VAMmJ7a@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Hvf8aeOrfoCohUfQdfxUxdZFSK4mcTL5VVMMjQ2BvS7ti9as
	fxIqkXRkS49BxQ4rlHROxnP9lpmYKpeuOjVmx5xN/o+5UK0uyiHYP5F8xdS+bEa+gS8=
X-Gm-Gg: ASbGnctLA8nbOC3fE5cjq7KORlDc5/0iqdsR/Q3aZzSXyfstEK7SkGFM8rzz7RBkRdk
	7unsGq59YV/qZKTsyrUYNjxJ93ZjMyw62UsDr3o/ub31YgfVw53o6TvY1P20i/Wjg9kNQjUlrQL
	S5odsX8LNnOWTh+JKaXEsfbnJNCq1McNMYkR7so7B9PXinUC8n7Yr3ruRrKnm0fM/dR1hlcLSpQ
	VFNAp1oe8iI3LPEbg55Zlv+ZJwe8vH8VQnu/u047QHP6FwncJ397QqN5R4s0KCcjfPpnDPGC69T
	kAPQHxyIScjEBUYA7w1IWB/AOUjuL1KCnqj5MDAxrI4N4tAxSSCEK4Uz+YMM3ckSpLIkH2rOVZe
	o51rJQU7Yj3Xoa5BrFOn2mV/8VZeUtBbZKI3dkITOkbW24Y7aSa9JrdUzy+I5FNJFn+L5UkB9Rh
	z2z+8=
X-Google-Smtp-Source: AGHT+IE1XubvOmCmqqWcHZQN3QCxNQ8u2ErQ5jVOLKC4ySPOfcJKtLtnzPEW0D1kRbNejdQV4zA7gg==
X-Received: by 2002:a05:6402:40d6:b0:640:f8a7:aa25 with SMTP id 4fb4d7f45d1cf-6431a55e67fmr5271820a12.30.1763019438038;
        Wed, 12 Nov 2025 23:37:18 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b28b0sm831174a12.30.2025.11.12.23.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 23:37:17 -0800 (PST)
Date: Thu, 13 Nov 2025 08:37:15 +0100
From: Petr Mladek <pmladek@suse.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	d-tatianin@yandex-team.ru, john.ogness@linutronix.de,
	sfr@canb.auug.org.au, rostedt@goodmis.org, senozhatsky@chromium.org
Subject: Re: [BUG -next] WARNING: kernel/printk/printk_ringbuffer.c:1278 at
 get_data+0xb3/0x100
Message-ID: <aRWKq2KNKjxbXexA@pathway.suse.cz>
References: <a2f58837-2b29-4318-9c78-5905ab2e9d3b@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2f58837-2b29-4318-9c78-5905ab2e9d3b@paulmck-laptop>

Hi Paul,

first, thanks a lot for reporting the regression.

On Wed 2025-11-12 16:52:16, Paul E. McKenney wrote:
> Hello!
> 
> Some rcutorture runs on next-20251110 hit the following error on x86:
> 
> WARNING: kernel/printk/printk_ringbuffer.c:1278 at get_data+0xb3/0x100, CPU#0: rcu_torture_sta/63
> 
> This happens in about 20-25% of the rcutorture runs, and is the
> WARN_ON_ONCE(1) in the "else" clause of get_data().  There was no
> rcutorture scenario that failed to reproduce this bug, so I am guessing
> that the various .config files will not provide useful information.
> Please see the end of this email for a representative splat, which is
> usually rcutorture printing out something or another.  (Which, in its
> defense, has worked just fine in the past.)
> 
> Bisection converged on this commit:
> 
> 67e1b0052f6b ("printk_ringbuffer: don't needlessly wrap data blocks around")
> 
> Reverting this commit suppressed (or at least hugely reduced the
> probability of) the WARN_ON_ONCE().
> 
> The SRCU-T, SRCU-U, and TREE09 scenarios hit this most frequently at
> about double the base rate, but are CONFIG_SMP=n builds.  The RUDE01
> scenario was the most productive CONFIG_SMP=y scenario.  Reproduce as
> follows, where "N" is the number of CPUs on your system divided by three,
> rounded down:
> 
> tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 5 --configs "N*RUDE01"
> 
> Or if you can do CONFIG_SMP=n, the following works, where "N" is the
> number of CPUs on your system:
> 
> tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 5 --configs "N*SRCU-T"
> 
> Or please tell me what debug I should enable on my runs.

The problem was reported by two test robots last week. It happens when
a message fits exactly up to the last byte before the ring buffer gets
wrapped for the first time. It is interesting that you have seen
so frequently (in about 20-25% rcutorture runs).

Anyway, I have pushed a fix on Monday. It is the commit
cc3bad11de6e0d601 ("printk_ringbuffer: Fix check of
valid data size when blk_lpos overflows"), see
https://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git/commit/?h=for-6.19&id=cc3bad11de6e0d6012460487903e7167d3e73957

Thanks a lot for so exhaustive report. And I am sorry that you
probably spent a lot of time with it.

Best Regards,
Petr

