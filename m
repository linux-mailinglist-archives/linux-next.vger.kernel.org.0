Return-Path: <linux-next+bounces-3982-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F69987619
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 16:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 604761F27849
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 14:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F148614D703;
	Thu, 26 Sep 2024 14:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ft1ed3bA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D0F14C5AA;
	Thu, 26 Sep 2024 14:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727362653; cv=none; b=ZLEwaVXt3hYhC4kQ/od4Inu1cuL/W/0dfcfpBffn9KX4C2irzz2yC3DkXZlB/FmMGFRXJV38aEViplekxZq1JXST7QzU7pRym5jMJJVTpna2rJk10fYM62AgSaz+AM5l+RhVauk1sg645O52rfu2c/FfQzmnTFJ3LtuBtk7wBs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727362653; c=relaxed/simple;
	bh=XIFLXkDWChXrbCAgba83mOwWjQ0NGHY68nV21beDkJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gOUONWZ3oadC1mtBI/3iKpc+BxlMBaHJYIoHtHjY6jaw7RgA7orQTyDj7eSiPFSI4YC6znNytz94XUiLOVRjrzb0f5ybVK6XQXDb7xmqJbmdrvsy0Azrlb57CZeTml5V77MRD5a3L3yqVj9oR+X45lVEw7TEpQHXCFmu/2/MAOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ft1ed3bA; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7191f1875d3so135223b3a.0;
        Thu, 26 Sep 2024 07:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727362652; x=1727967452; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIFLXkDWChXrbCAgba83mOwWjQ0NGHY68nV21beDkJk=;
        b=Ft1ed3bA0q6jpIcqHeD4ZptgMsYQeRG1xFHaXDT9GxNMhMCVpJTpYPfXmqDvfFZMyY
         kgY0zpAGmwvfw8OnEHrZouWUdW9XgvhTTNJKRj0xYrGzoL5xrRO3z3VcZHrjwUmTaUoH
         GtSv54h0IqPZnWQNmPk6QSUueI6X9F2vij2XZTY5eF3kNjKCZZ/A4fafezY+QpDQa+mp
         dXE5Lt23Ii7g0B6rJglWOnMewu6IXTIVYUCklUYpmxTdjpEN8/DV1TqB1xZRa2XzzJJZ
         5qq7DK/byDHExVE600rUanQWJNQZMhaffNinbTdPqcdSTdiOa3AYKgDRtTHPEWgZO6UN
         bwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727362652; x=1727967452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIFLXkDWChXrbCAgba83mOwWjQ0NGHY68nV21beDkJk=;
        b=j8/9t0OuqXb1BbEc4BefZVeX4XwIabiTu9nkTNRG8C/ypSr6f04Mbe85v43jhIKB7A
         XKuDBtmLNeptyMwADSYNhxBd8Lqi6sGZPlcS1g8NISLsyF5Fk2oD3oZ3EXuT/ZTYZXg2
         wRHENy2DKp8BuIW5W4eGjVkQKiIC0pDHJB7TPCs7ViICOyCzJHfFLUkTjENfcUUQRj+R
         PZuNWVuc8xjiSU1VQ2yCKSiVaexvXPz53RaFfgx75okM0JsCj+Xfwf9jP800HrC2yaNp
         cFU8YFzQe16tZ696zvOs0WPPDp9TKnLBEh0t8D6zmoum2bo56AzqixkeU7C0GOLdFagK
         RjiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnM/5b5OB1uXN5hXWScmiIuvf+Foob8NHCtC/Z7cGqDcwJHPln1x6XcyjDYdf2pfldbaI2KOKioFZ7fQ==@vger.kernel.org, AJvYcCXN+QehWnx0j4zwGwKbPwnNS36gT2U6iQVWwlmARu72mfTzHHQoGldyuveUU5PxMIwmKfg7KBjTlN9Ww9s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycx0vkQ7/sLUwD8mqhUQMJU86zVvuE7oRUWpEEwZjIZYFkOWHt
	Z9RFnyAWNWdpyHWIpqskgQyIylh8TTz6/lsly65ozXxLHzDDXinTSY5nTI2Ka8TpuLNgl/HEopm
	NWNli0Fw16wil4DOfOUu8SbQGVfE=
X-Google-Smtp-Source: AGHT+IEpMnyRW32qeNoxUIaOjT9QnKUaBgx2qsROb1O6eSmx3nzpHCE/JFCuH2TMDf3DmEr7nV5FCuZiJQrlsdtDPoQ=
X-Received: by 2002:aa7:8881:0:b0:70a:efec:6b88 with SMTP id
 d2e1a72fcca58-71b2605647amr54228b3a.3.1727362651838; Thu, 26 Sep 2024
 07:57:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926100434.45d58861@canb.auug.org.au> <CAH5fLgjRVZA3Gmb7Ogs+Y65T38EpNVeVEqmg93ZB4dn0Y7J3aA@mail.gmail.com>
 <20240926181348.3965b040@canb.auug.org.au> <CANiq72kFH125Pk6K-JaswWDFmcvtP2GKx2-3ZAULF4PmpW7M-w@mail.gmail.com>
 <CA+icZUUWBiZj67VxO=LPS5_Bt+i_g6s-HFT9Ts4UmmuPNk2kbA@mail.gmail.com>
 <CANiq72=dp=+kUHerFvUcL1TDLeuVz=xd781wm7WFmU1Sj-S8LA@mail.gmail.com> <CA+icZUVVRvXA0G932bsEiEWhdv=Zd0WOPOEMXeHudTzqEp6pKA@mail.gmail.com>
In-Reply-To: <CA+icZUVVRvXA0G932bsEiEWhdv=Zd0WOPOEMXeHudTzqEp6pKA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Sep 2024 16:57:17 +0200
Message-ID: <CANiq72kywpi6YzsJXjshEt=h-5YdGWWOiaA3ZT8tcj3mGx6x2A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of Linus' tree
To: sedat.dilek@gmail.com
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

On Thu, Sep 26, 2024 at 4:44=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> Thanks for the link!

You're welcome!

> Asahi or Fedora-Asahi?
> Do you have a link to a Linux-Live-System or maybe a pointer to a kernel-=
config?
>
> Is it possible to download a built VM (rustup-binary) and test in QEMU
> for example?

You should be able to build and boot your own kernels with Rust
enabled like you would normally do, as long as the requirements are
met.

But Rust for Linux is not a Linux distribution, if that is what you are ask=
ing.

Regarding Asahi and other users/distributions, I would suggest asking
them directly if you are interested in their setup.

For help on setting things up etc., I would suggest asking in our
Zulip -- please see https://rust-for-linux.com/contact.

Thanks!

Cheers,
Miguel

