Return-Path: <linux-next+bounces-3978-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 056559873D4
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 14:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFC6C280FC3
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 12:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F241A93D;
	Thu, 26 Sep 2024 12:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIduKR7e"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3B7288DB;
	Thu, 26 Sep 2024 12:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727355001; cv=none; b=sYKW1s/OSy7Ky0ooQLfcu+CSIH1aqCeBuvhAzDlwd5jtRHMm2EHh/HbYPDsOAvPLIRlojFnBoNen8Op0I/2XBJsRrFOdIjMI1WhucpmyMDdRXl0e0yFhQbTGgCv0Cma9xLoo9WLamjaR0S101gwowcAgBj74Yh+oltymhFYFbeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727355001; c=relaxed/simple;
	bh=EZw4fBaLr5FMYfV0028IiojpFf2Ur4LZl3P/nAyp5dE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s1dos5DURKx43np8rjxZIFxzzi0z8MHyEgTrWbhIy3Z3SNk5NMnHD4ClB73U1SkUJ3blSyk/GnkaVl2S8vB1wf1KxfZ3gxvZIpW1c558oDc22rDPCj80npzMmi4THpcgMI3XGo1MSs13jlZzpgokrAP/Nj4Jvtq1JV9AR9dQcfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIduKR7e; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f75c6ed397so9791171fa.2;
        Thu, 26 Sep 2024 05:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727354998; x=1727959798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rnmdj6n8vjWULrb6hV13qc7mZVBYRPme0bXE0ktZ3qU=;
        b=XIduKR7e+JpUqv7IifgsxMpTvDTWm/7wxH+Ob1IY8JTvaC0xEMzz+sLCsZZBjGE2cL
         MdFI+lXhBrrXbgV3iQcjMpWtAZaIdSre7aWCrXtuOwG0+TTnN8M1Y/vSByy5uc1LDWme
         YA/3WLxEE5JNMx4EcaCkJbgWMyGrkAr3bjUdMQA4djTvMzlBnbD738wXnKwvKyhhyztU
         CqsbqhjO+3JobYF9DTiBoHYZ76VjVR6aGdSp48OvLSgiFavQlxM8q26zzJvBjWL8Bg+y
         q9kajL+0jHligh2tRIxOQzVN1xMYe480SCrV+y2+JpnjZ85dXPhSYOkur+NAW4IHMQrs
         JMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727354998; x=1727959798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rnmdj6n8vjWULrb6hV13qc7mZVBYRPme0bXE0ktZ3qU=;
        b=BFvHskamgmcIDXkKj1Qo2KfBuLGhm5rJWTY69EXCwgnVLZvq2gyhbxRpdXwj2SjpDL
         juvIEfJkuxDs9a87X+zLtFmSivrVfLMpvpxXdLbp06oRrTuI01jHEpuV8/FAChsl8o9D
         Vwj/Zk0blCog4qHfF21exSgnqw3laGnTJ+fWIus4xVay1tJ2X9Yl3t4p9E+EzO3XuBoG
         L/co2qGkejV9MDvPmhsE7ddV9S5YtfCwjszlm3c1UBn0uJhYtn6ybHqA7U5XgI+vPkyL
         mmLZCDfJcTeqP/n33GKQLXZNfILYdCEHF9wiFakovRprj6DarIo4rYWYgwfDHixEwqnv
         a68A==
X-Forwarded-Encrypted: i=1; AJvYcCUzazU4B1TNp42oY53mWyVL7GSOOhhzeTqP5fVQurCwJLB+jFycfKk9wgNpAr4UVOguICcM/AeN8VgqOJM=@vger.kernel.org, AJvYcCXEtm7u1F3v8HczRkY9+XV+B+n+W0V4sefMWx3jZBV9Xx4wMFP9MDRLY+h+5rYpAvrWHgcpKlG+qBdWmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YznjMt3tQDQC/5edZmUclgsubLo9bf9TnnO+XL2gqyo74oghun0
	vOFE2xgxLVuiiFAyyam+POkPAzPMGbpBMu1xPkAD0dPUaOmqyN0dGUrVAmzYO4BpX6TO09WI8Mi
	rMYDIYBFv6H2Qaj8r+oTHwb9FT8QZDDC8
X-Google-Smtp-Source: AGHT+IELOa1KW5SBW8THpjjm/S+T+xeog5VQLkErikETsJOSn2t0DI32m79zXjYYlEWwYqzQn6ArZtmLnAJ+TF+h5EM=
X-Received: by 2002:a2e:a995:0:b0:2f3:ecdd:2b8d with SMTP id
 38308e7fff4ca-2f915fdd4f6mr42461641fa.16.1727354997413; Thu, 26 Sep 2024
 05:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926100434.45d58861@canb.auug.org.au> <CAH5fLgjRVZA3Gmb7Ogs+Y65T38EpNVeVEqmg93ZB4dn0Y7J3aA@mail.gmail.com>
 <20240926181348.3965b040@canb.auug.org.au> <CANiq72kFH125Pk6K-JaswWDFmcvtP2GKx2-3ZAULF4PmpW7M-w@mail.gmail.com>
In-Reply-To: <CANiq72kFH125Pk6K-JaswWDFmcvtP2GKx2-3ZAULF4PmpW7M-w@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 26 Sep 2024 14:49:21 +0200
Message-ID: <CA+icZUUWBiZj67VxO=LPS5_Bt+i_g6s-HFT9Ts4UmmuPNk2kbA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of Linus' tree
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Alice Ryhl <aliceryhl@google.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Gatlin Newhouse <gatlin.newhouse@gmail.com>, 
	Kees Cook <kees@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Marco Elver <elver@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 10:24=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Sep 26, 2024 at 10:13=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:
> >
> > Thanks.  I will replace the reverts in my fixes tree with that until it
> > is applied to Linus' tree.
>
> Thanks! I will apply it to rust-fixes now, so in principle you will
> get it through that branch for tomorrow, in case it helps.
>
> Cheers,
> Miguel
>

Do you offer a (an optimized - optimized for kernel-builds) prebuilt
RUST toolchain - preferable for x86-64 hosts - like Nathan +
LLVM/Clang folk offer (see [1],[2])?
Maybe I have missed in [3] or overlooked.

INFO: I use LLVM/Clang-19 from [2] for my latest Linux v6.11 builds.
It's faster (20-25% in build-time) than distro LLVM toolchain (here:
Debian/unstable AMD64).

[ Provocative ]
Can I REALLY use a RUST-compiled Linux-kernel on BARE METAL?
Do I need special hardware?
Do you have a working in sense of bootable linux-config file?
^^ This is a real question - not interested in any "technical preview".
^^ You do NOT need to answer all this!
[ /Provocative ]

Thanks.

BR,
-Sedat-

[1] https://mirrors.edge.kernel.org/pub/tools/llvm/
[2] https://mirrors.edge.kernel.org/pub/tools/llvm/files/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/rust/

