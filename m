Return-Path: <linux-next+bounces-3981-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EB69875D8
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 16:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE78F1F2239A
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 14:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8B713632B;
	Thu, 26 Sep 2024 14:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODPqvmSI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469EF2AE94;
	Thu, 26 Sep 2024 14:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727361883; cv=none; b=FyDtDOumPFdGiGT1a2y4Lc8LmvYIpY5iPBNaKC+U4QTOICl8MRQ+FmBm6ijAZqxqDZDIYM8eBRIBHWSD3ndsgqFx7SCUnEW/14K6CwLS3YQVGhDziAIAzXyaMEoXxL2rPZuDXh6IovF2d7RXysWduCOeykT/ve3oMfCUMedeKqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727361883; c=relaxed/simple;
	bh=KHiIOMuKFrpmgjeiaWPc6Ffbcb0QLfWDPwZ7Pt1/qMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QbzekVOw/IMy7OXA6+6T3usSId9U1D2uXk4jkrDyVlXsv2D9HyVr+5rZukMXn8wkqFkR6m9FBNrOMMPetM/W4Ncd2hlMzGkS9Lhpl/6dw+8Ago3wI4M3aW9Y3zIH6a9/6x9uo5mrnxm8ZY1HegnP3RjjTS/Zg4UxGV3Gzf12Xcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODPqvmSI; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53567b4c3f4so1195424e87.2;
        Thu, 26 Sep 2024 07:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727361880; x=1727966680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aEuVELZYPUhfbaLfMAa7ALwlXBOTrHLw6cCw0jRrWMg=;
        b=ODPqvmSIc1PC0X9GZRcJ2C8dKGRFgeNJtqeR0vR6VTIIP3/44nbmTygoLTla/peHUB
         azB04aEfV4XzX9PR9d3S2edEcP2mhC6D63uIbMm9EBLEMRp3OvDJXTNtk5NjkyY2HDx3
         0dQ9I2vOdjoJfvEdN55aL6atOuh5eas37Nbx6lfkWJiF0e86NW+unSX9/P1WZBYwU/Qh
         JLSnuFYodoodThGg/oKXvW48nZSbsN4HRTEzouVcnqb3dTabLmPv4QOl6sq0oeOfZC+j
         cqNqF+1BcKfUY4dF7QqEN7UaEX26Xb7nHdEjkryyyixbvcaaaYVN8vDUhNBI8QLc3bZw
         OBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727361880; x=1727966680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aEuVELZYPUhfbaLfMAa7ALwlXBOTrHLw6cCw0jRrWMg=;
        b=ZBgpogubmoTepe5UTJpKZbtGZ61/BFEKEsQGTwult9oMi2rp7OaLrGuePHpnuCRwD0
         Gf2xrkktOH49KtMj094IRiBr1z1EZhgVCvTBLOa1UWdlYrMw/IPfalwx0gGVhjAPacP6
         D0OkurE6PIufPjtN5xROLbXUA+/sBMiv7xWPzWdhhzKvLosL6gnkmqL+DB2GIw65nUIN
         cKhNzVTtcL3B2o/i67e6hQNVC/B97GKbZzEZZ6/3H9E/+ObA6yCILvJ8hprO9IrTIJDH
         cwSU/oWNReB2gzP+Qjgv+z4y8zHf2CvRYmHGIpJUrtNuAPCk3GBqi1ET9wcaOuQVPq3y
         VzAg==
X-Forwarded-Encrypted: i=1; AJvYcCVDkHJmiOq42EpT0hT9xhevIbAtslH/rvl2oSOrdO3Je/WGTqiuFpkBwkJZIRnl36cxwNNICZm0EuqTmA==@vger.kernel.org, AJvYcCXv+rPN8i3T2rYismS/uDJUdSXRY3ZMsL6T99zl9cTqpz6yD0kiJzop3ha5XU+cR10x5poXrbOP6dMlCt4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwarhtpH6QNskEeDBL5u5ngOU3330azb61MmeazwmF5U7UEZaT8
	s54sHluuF6u1YjvsawWuJSOfjuVgdz9DW3rTcms6e7oktA98YYN55rbilwFLXGjGqXnKkWguKmb
	L+BJ/Sdz3ia9mmK2WfLW7DbOx47YiLKbT
X-Google-Smtp-Source: AGHT+IEC6VTjqWuhOwyxsDOfwJGcn9nSY1VJVlaXaxXEnh2WyXWMJNmMC/7ImdpQGecPZkEJNqiMETJe3C2mhQXzUUI=
X-Received: by 2002:a05:6512:2302:b0:52c:dc6f:75a3 with SMTP id
 2adb3069b0e04-5387c2b3068mr4574805e87.40.1727361879849; Thu, 26 Sep 2024
 07:44:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926100434.45d58861@canb.auug.org.au> <CAH5fLgjRVZA3Gmb7Ogs+Y65T38EpNVeVEqmg93ZB4dn0Y7J3aA@mail.gmail.com>
 <20240926181348.3965b040@canb.auug.org.au> <CANiq72kFH125Pk6K-JaswWDFmcvtP2GKx2-3ZAULF4PmpW7M-w@mail.gmail.com>
 <CA+icZUUWBiZj67VxO=LPS5_Bt+i_g6s-HFT9Ts4UmmuPNk2kbA@mail.gmail.com> <CANiq72=dp=+kUHerFvUcL1TDLeuVz=xd781wm7WFmU1Sj-S8LA@mail.gmail.com>
In-Reply-To: <CANiq72=dp=+kUHerFvUcL1TDLeuVz=xd781wm7WFmU1Sj-S8LA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 26 Sep 2024 16:44:03 +0200
Message-ID: <CA+icZUVVRvXA0G932bsEiEWhdv=Zd0WOPOEMXeHudTzqEp6pKA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of Linus' tree
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Alice Ryhl <aliceryhl@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Gatlin Newhouse <gatlin.newhouse@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Marco Elver <elver@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 2:58=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Sep 26, 2024 at 2:49=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.co=
m> wrote:
> >
> > Do you offer a (an optimized - optimized for kernel-builds) prebuilt
> > RUST toolchain - preferable for x86-64 hosts - like Nathan +
> > LLVM/Clang folk offer (see [1],[2])?
>
> Yes, Nathan himself provides those! :)
>
>     https://mirrors.edge.kernel.org/pub/tools/llvm/rust/
>

Thanks for the link!
OK, I darkly remember seeing this somewhere.

> He may comment further -- I think the Rust compiler itself is not
> built (yet?) with PGO etc. like he does for the LLVM side.
>
> As usual -- thanks Nathan!
>
> > Maybe I have missed in [3] or overlooked.
>
> If you go into the Quick Start guide from your link, you will see it
> linked at the top:
>
>     https://docs.kernel.org/rust/quick-start.html
>
> I also mentioned these in LPC's Kernel Summit track (sorry, no
> video/stream yet, as far as I understand):
> https://lpc.events/event/18/contributions/1912/
>
> > [ Provocative ]
> > Can I REALLY use a RUST-compiled Linux-kernel on BARE METAL?
> > Do I need special hardware?
> > Do you have a working in sense of bootable linux-config file?
> > ^^ This is a real question - not interested in any "technical preview".
> > ^^ You do NOT need to answer all this!
>
> I am not sure what you mean -- people has been using Linux with Rust
> enabled in real hardware for quite a while, e.g. Android and Asahi,
> plus others are upcoming (Fedora, as far as I know), and I regularly
> test in CI that the kernel boots in QEMU for several architectures and
> configs that we already have in-tree.
>

Asahi or Fedora-Asahi?
Do you have a link to a Linux-Live-System or maybe a pointer to a kernel-co=
nfig?

> I also regularly test in CI that the kernel can be built with
> `rustup`'s binaries, with several distro toolchains and with Nathan's
> toolchains too.
>

Is it possible to download a built VM (rustup-binary) and test in QEMU
for example?

I have NO experiences with RUST - but it looks like things/development
moved further.

Before I wanted to test gendwarfksyms-v3 from Sami.

Best regards and wishes,
-sed@-

