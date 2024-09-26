Return-Path: <linux-next+bounces-3979-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB729873F3
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 14:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46C95281B0F
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 12:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33FC21BC4E;
	Thu, 26 Sep 2024 12:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2L1LkbN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BBE17753;
	Thu, 26 Sep 2024 12:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727355505; cv=none; b=Glrp+oRZgBoBvYi31s8FkIge05mO1cU4c7wykhVxtVX+bajCQ895mpI7GPoMAb1zXEAC/xbxCLA2fpWI168UqHBn7t9yKOKtUyX+IN5CBB0sb3uu9JsrB2DR2UsOrOe1+6oE+/pse8pZawBkqiPgMQ1L2CghXbodDxS15i17t8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727355505; c=relaxed/simple;
	bh=fMlTONffvN0F7wMItGmzatOGjISQXfAl+ludmbJwJY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LRbrOZh02OQx9NfSAmvK90yl2BxFNMhWD3splrPV37scbXZD8wte/zMdd87S6Oagi/c4l08ljaOXY4pdOLGdpVVt/894NEmyMvnHmTK6zRUu9wiJJ5QZs63GUjwFBM7jpkDTWbZbDIQVYaXrcZRmmHxbEN2nAB8+QzTCMwJZZzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2L1LkbN; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7191f1875d3so118094b3a.0;
        Thu, 26 Sep 2024 05:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727355503; x=1727960303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0BYzlMrOi7VZjQ5y4++1BLhXF0hsNa8c8xf9GFikU8=;
        b=F2L1LkbNHMRAB9FJY+4JEAT1xKcyw3Q77LqAbZDQulgHF+LUY3ft6dkdn9ETaOlgLv
         jhMRu4bRBLN2KNGtguETFHy2JW9cFTgMnwRoAJgb/41qY1o8BZwCI6ZKSqwavF3yvfaV
         liKOp2hJHcPL+8awE78L2R3OMHvurDRYO1rrPOEdYhfR2XXPm4ud9DIno3LxTTY8jBZD
         C8hD2zmmv5M0f++JzBatB/IRte7/mHSSvde+54lBT5BhhFw1IhQpp9EUMPgEHTtn8Bop
         dL2yGjeo8+OwbzBIPcoym2scWQx9uXjKjGmqaAUuh8MOqkuas9SOfQPBdh0k0pG4igqq
         jZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727355503; x=1727960303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0BYzlMrOi7VZjQ5y4++1BLhXF0hsNa8c8xf9GFikU8=;
        b=AmOhjFE3wJVurKeodcJAQhsqAosQnDvNYbdRESlaGuygA5iS71xZLlwGCWQR+INNbP
         2W4a69KQ9EtIw4ZYTL5bSSJ5oqCXbsyIKxzTHQndj4w9Hg5Sl0+IXu438cvU1qyMcDkX
         YZyxPBea2ubMGg1zquu1fO2G83RxJU+yP2Z7JpDjSwabeqbOdbLbWuMN15e+8E5kCSU7
         +kELNU4C3sOr7BOM0cCS8rjfZMSbKtw+RWB1QOn1FrRWJXQAt+N69px7hmcV1dFeawIj
         Qq/fkaCJra638oWaWy1K2ZGlnH+jfBOgpNQZPt9HJ6qomYYAMknU4Xypz0Azha8hwtzq
         L+uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPxhUZai6CDHkVLfcd50cJmusY7TkeND0UmnAcFpp77ZRkOx7L9w2+IfvXCM73zwn5A9umju0je4vCgw==@vger.kernel.org, AJvYcCXCUY9MZHWUkEETDGYvcaYcSfmRQTel6CdQ1UD6mJ7NcSRNePQuaZIGJuDoWB/fY0qAx7dXMjop8iqVC+c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ViejxQ8KWHWp0nV96Qu1auB3ERVdmvwM6+uSn/zHE708uZf9
	kF41FF4VLYQeZyjojNsSChc+qzm7QvKVsKDvJO5xxB+eQ1hWsHcmZZJyfBn3d6ePi6ohjzrIpSp
	AQ+ucf2z9AYFeoCvwgqv/3dYUXmraqwi5Rlg=
X-Google-Smtp-Source: AGHT+IGxRPW5+VeECToDn6TpJgUInusyZhj/Vuct9LBCnAa/pZ4JgPhETunduvkp8BQE6HbZ4rDHH/FLDkCzPDH5RWY=
X-Received: by 2002:a05:6a20:a11b:b0:1cf:4fc0:4ad8 with SMTP id
 adf61e73a8af0-1d4d4aaefd8mr4698842637.6.1727355502984; Thu, 26 Sep 2024
 05:58:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926100434.45d58861@canb.auug.org.au> <CAH5fLgjRVZA3Gmb7Ogs+Y65T38EpNVeVEqmg93ZB4dn0Y7J3aA@mail.gmail.com>
 <20240926181348.3965b040@canb.auug.org.au> <CANiq72kFH125Pk6K-JaswWDFmcvtP2GKx2-3ZAULF4PmpW7M-w@mail.gmail.com>
 <CA+icZUUWBiZj67VxO=LPS5_Bt+i_g6s-HFT9Ts4UmmuPNk2kbA@mail.gmail.com>
In-Reply-To: <CA+icZUUWBiZj67VxO=LPS5_Bt+i_g6s-HFT9Ts4UmmuPNk2kbA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Sep 2024 14:58:10 +0200
Message-ID: <CANiq72=dp=+kUHerFvUcL1TDLeuVz=xd781wm7WFmU1Sj-S8LA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of Linus' tree
To: sedat.dilek@gmail.com, Nathan Chancellor <nathan@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Alice Ryhl <aliceryhl@google.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Gatlin Newhouse <gatlin.newhouse@gmail.com>, 
	Kees Cook <kees@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Marco Elver <elver@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 2:49=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> Do you offer a (an optimized - optimized for kernel-builds) prebuilt
> RUST toolchain - preferable for x86-64 hosts - like Nathan +
> LLVM/Clang folk offer (see [1],[2])?

Yes, Nathan himself provides those! :)

    https://mirrors.edge.kernel.org/pub/tools/llvm/rust/

He may comment further -- I think the Rust compiler itself is not
built (yet?) with PGO etc. like he does for the LLVM side.

As usual -- thanks Nathan!

> Maybe I have missed in [3] or overlooked.

If you go into the Quick Start guide from your link, you will see it
linked at the top:

    https://docs.kernel.org/rust/quick-start.html

I also mentioned these in LPC's Kernel Summit track (sorry, no
video/stream yet, as far as I understand):
https://lpc.events/event/18/contributions/1912/

> [ Provocative ]
> Can I REALLY use a RUST-compiled Linux-kernel on BARE METAL?
> Do I need special hardware?
> Do you have a working in sense of bootable linux-config file?
> ^^ This is a real question - not interested in any "technical preview".
> ^^ You do NOT need to answer all this!

I am not sure what you mean -- people has been using Linux with Rust
enabled in real hardware for quite a while, e.g. Android and Asahi,
plus others are upcoming (Fedora, as far as I know), and I regularly
test in CI that the kernel boots in QEMU for several architectures and
configs that we already have in-tree.

I also regularly test in CI that the kernel can be built with
`rustup`'s binaries, with several distro toolchains and with Nathan's
toolchains too.

Cheers,
Miguel

