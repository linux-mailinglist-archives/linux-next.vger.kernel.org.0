Return-Path: <linux-next+bounces-9184-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 405C5C812AC
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 15:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 242EC4E5D48
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 14:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D366284689;
	Mon, 24 Nov 2025 14:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FiwPjOuc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC9726F2AD
	for <linux-next@vger.kernel.org>; Mon, 24 Nov 2025 14:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763995921; cv=none; b=uEC2lhkUJppukZ/Kc1TimK523YzLaEh+mYdu6KFdYzXZVY9LLAVfzCYhhjTDZ49EvokYo8UJbCIrOr8zUaceriip92ALdLeBysc+Q0b7t55V1RXWjaMAEUk+O0P4Oo3L4bwCG9vswiYYNS+ndi/Wzojkmn+qMfGXieQCN+5tjzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763995921; c=relaxed/simple;
	bh=jWkOSrLf5i1nUdThhjrA/mY70eee/RSjQZIa4bF2EDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dz+v0g/ZObG4GdIM9/CJnKfL+y/ryz2uD6a0Xic8LScKyRplbBDjKiw+/mmTCVGR9D4eYxb8bOxXNSyaEJiM5ok9FA3FYsjHZ3qjpA4AgZNSw9wjCJ9fUGbMazWVYVB0XXFHGVt0+ZxEz970tx2uxnSpS+cZZ8AMSC66EhUK0+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FiwPjOuc; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-bc0dd142007so48829a12.2
        for <linux-next@vger.kernel.org>; Mon, 24 Nov 2025 06:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763995919; x=1764600719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cuXBv9WUJm6Kko0g9y8Xk9WBvYZvMR/dgMEJPiZVyU=;
        b=FiwPjOucY9yWVy//mUEV6DUB+R0pxzi8pg3SFiu0+Y7RoowA1BP9FPFb/WGAgQVA8u
         xJZTZdR3UWpPzRRGg0fHVtC+2diHMxe5TnzGb+B9uLv+upUIBiNyvUCYFxUsIxhqGGV3
         mHuFWbhMYdVsgjyk+LWc4PbEi+9si8CoAmcD7ew9Gv7lS16PB1yJIRuycoeHEYbMXkes
         lsEO3XkNrHj42H9d5tQmEF7/AGxkhJqoCcXAyALccQzyLA1SQ96kr6wln55PcwJIYIsw
         moRHxXrn7X4zdkSV9D2hR+Rn0ET+C2Byj/ksllxAFNZfKqO2upA2whNfAOVcPunLzGmj
         uPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763995919; x=1764600719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/cuXBv9WUJm6Kko0g9y8Xk9WBvYZvMR/dgMEJPiZVyU=;
        b=IvouiqS6HgQDC/ci+Zd/xzqPUuDXZJCuzsVLtvlEsd2sziLS7xxdowPRc0bFwpk8vg
         ss0u1jQLm0g5pIdlhVBK+6KnmMNJr22YJN6+H5YCfZvG0lE6AbfcUM6UkhNF/1WPkMdH
         Agf7g6uNL2pGelq1ODZq1uC1wuw6y+/Cb7e3qpAZVnqeVznHoqo3stlSiWGZ0gQVsv3l
         6O5asXDvvlbz5fFxtxKOsqys+1VDmTcGZnUwWD+yJyLH6n050vjOIBe1x8pTxKbJKOwC
         OYkvxlcH04pQAm6JJEmzWdUjTIoDwm5aEjZ+FEIdimwLIIus0Kccrh2Mbi+6YX5QpI2s
         J6ow==
X-Forwarded-Encrypted: i=1; AJvYcCUIr7h4HZqgeyHQKKNeuDKVwlTbyp+5odxrmQyNgPGt2RTBLbtJODUeMUHt6msvZThmOXa3Lxrhdag2@vger.kernel.org
X-Gm-Message-State: AOJu0YxL0mGOLow6lHr4WTJoNCdFrnkDFDQvpfCCobzk7L3CLLT/HaUA
	7z+dRULL1iTs92yY+1iXPuak0d8X5cEsZ9/0oyn67U2YDEgsFyG6KJYMROyI79/OOM/KK9lpvxk
	427jQUbOLekVdwDs6cLqtJ6ezkRE+QD8=
X-Gm-Gg: ASbGncvgIYqimWKjOtV+7DYEKOQTrEoXWtkm37f+9HWaM8aWzJqq3XVUhpNWnIjf08B
	Up9UCm3Oe77PvLwmnSY7SXoRaHXQP/26RH7c5cDPzllM4yD2XLGAGPeZKSxck/JAdiI67FDMmuL
	WXgc/dGu49ck+VrgfC292AhSsbaL7qxWsMn4TEAzThHaosdqE6F/C59Zsr/j7ND/11+c1Zi4nBV
	zt3qf5P6hvbUIt8IMAJx2cOZavlDXYlWLx/cDQdwUm8kwirOBkkBtXeLVHrYne6liDb6dbTfFSj
	esrxEYCxp1r45tDYItwzK2Qfp6+Yip7xZou2UrkAnyP1a/u8yvq2GgCI7G5DFEUpX/aMAG6sQWj
	TSmwRCPtYQhmgMA==
X-Google-Smtp-Source: AGHT+IHPUoZtQP0D4LXyIGxGGt4feAJlxaU/xnzf58w7DLQtCNJmBFAVlgka05hrCrIG2fNw6s735Cx7RdDtbzh+p78=
X-Received: by 2002:a05:7300:ac82:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2a724c02369mr6966770eec.3.1763995918927; Mon, 24 Nov 2025
 06:51:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124231644.38d0303b@canb.auug.org.au> <20251124123249.GP4067720@noisy.programming.kicks-ass.net>
 <aSRlFB9PoOcZVmvt@tardis.local> <20251124144714.GT3245006@noisy.programming.kicks-ass.net>
In-Reply-To: <20251124144714.GT3245006@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 15:51:46 +0100
X-Gm-Features: AWmQ_bkcTjev6aW2ygRL9xeP9TP5FKOyn61229OF8XBDxgWHkq8wbcdDoBOjJiU
Message-ID: <CANiq72kN_QjYSCdzs9UCx2sHdR9Q2g_7_h-ZZ2y0qLZjhUxX6g@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, ojeda@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 3:47=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> I really don't think rustavailable is doing a good job here. Strictly
> speaking yes, its available, but figuring out why things don't work is a
> giant pain in the arse.

I guess `rusttoolchainavailable` would have been a better name, i.e.
it is only about the toolchain, not about the kernel config
requirements:

  rustavailable   - Checks whether the Rust toolchain is
                    available and, if not, explains why.

> Now, lets see if frobbing Kconfig to disqualify RANDSTRUCT will let
> allmodconfig work better.

By the way, I have had this patch around for RANDSTRUCT a long time:

    https://lore.kernel.org/rust-for-linux/20241119185747.862544-1-ojeda@ke=
rnel.org/

More than glad if someone confirms it works for them...

Cheers,
Miguel

