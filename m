Return-Path: <linux-next+bounces-4682-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BB39C0995
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 16:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BB601F22D7E
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 15:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60E72940D;
	Thu,  7 Nov 2024 15:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlEeO8bW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6781C80BEC;
	Thu,  7 Nov 2024 15:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730991944; cv=none; b=ieLO/XfLSNCyOvbYhDoVvIzlTcqa1Nas1P6iXgyz3Fd2P18NbygaptHy1LBGN5BZSlBcXkDHOHRXLwrwN4ZKyaYcUCOigqezZxSyQ2qLfHrjyv/Gnz6WAbAIqt4AerVQxPMeWcyM8DJGCaRbq26q56pGALX+Ixnnx9mMdHCDog0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730991944; c=relaxed/simple;
	bh=6IsMHV7oH7hy/z9xPdKW++jAggEOXOl2T8KjNVBgTnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NC4FlN4EA/G+6TTk2sdG/r0L/TK8Jz70NQYNgBaag8hI8jLK9IJ0zW1zqI2EQ6iahWjwHQHo62ITlT5qjz9G8F8bWydsqFeRVW1WQ60v05TvFdoaSRE3LdDPMk/koV2LNhNRK7dBtMUytOnGbz1bAgazOqEaKrZ4OMgw84THTsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlEeO8bW; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7eab7600800so158168a12.1;
        Thu, 07 Nov 2024 07:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730991942; x=1731596742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sH0moiQrbwrm3WapXCc4I45SxV0mZZ5dBG6d6hNPkOI=;
        b=TlEeO8bWMgE6YGCRVaPEClNxHsJdVl87vJRQSM4RrGcTbAjDZpg+3ByxmkeVkt0+7N
         dpnJ3ESAe/EVubE0xud/+i9V02RkEfTdTmq6ZiT+IceBovDbhaLnhf3uA29s+fLHG5NG
         i3LFSXY+GYNib2GCug6uFXVZ0oSDYdF4W23NRIUBCQf/mNZ0vgy4UIOfV+qvB8WkD2WH
         FPOaxVS+LBD0yH6Bx3874KDvIZsE7eLuaJh9sES2LmmVLwcZ1jIkqQOisKT2O/QqwuoF
         K5zwhy1ooFcEtVVP1chDVH5WpVGqn/Mb5hAoAiMt9qqVyzunlHpqCQuUGcbgNEkfqE22
         TMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730991942; x=1731596742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sH0moiQrbwrm3WapXCc4I45SxV0mZZ5dBG6d6hNPkOI=;
        b=MSXm4VTRr0R8Pr72HSQjIGv7yC3OfwoQJFnGqRmbgeRacyHR3aB4PAlkxWp8QIoLfH
         NjRSZYsrHGH9mVE5/VnNpwxca3CnuTcxRxtC5lN27Mib3xNsZ8tKiDUcCNoUf91rgzFj
         c0lMUoS0dtOQCdGiAEXXxrCeFA45xOAuaXlK8/eWuDcPHEzr3H+aVtmjEP5FDW4otG+j
         Yk8xuYSMrL1aXKfup0Ss5njw54FAoGTYL016ZQuoi6cYByfSO0a0ca0UJPKmcq5WhLz0
         Qyvsro5aLB2qtgeVUHWL8iK0Gm+z23oQ3KI6nHrfBvBpexRaXpCEk0yijyiyWLpe5Ype
         vyhg==
X-Forwarded-Encrypted: i=1; AJvYcCVPo6/Urw/S8i9MDcaTDfbnJxgfqFiMQKAVYuGO22uu1/GIqSHPwo8xO/RXfJuenbh/nbUaKeB9JnG+Fg==@vger.kernel.org, AJvYcCVUjdy98FZBKVrhTguG5qQoiuRKo/M7zGP3X9C2ADStgK9YmCn5kMB50jESQEerdMrSXS1B0e+82AvmPS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnQfjNxlyv6aVBSVaIFTBRiNjteDuQqcAdSu0rVHEvDGQhrifj
	Wc9ELFcNdLAGcLx+LEfRqWOeyzUCti3GM23TOH6tsciGtOBP2b5g5N5kJOo9JSsAbP4E+rqX0IT
	Q5GFT3jo4KfYjgBLPmXCNClfTvyw=
X-Google-Smtp-Source: AGHT+IECDHDwj24KT7y6dMMy0ViodFiGKCy0doRwVvrt5wZqFzCnfb70bxQWub9TIsP87ED/WMUn4afalI7+jjCPdt8=
X-Received: by 2002:a17:90b:38c4:b0:2e2:c3c7:bce8 with SMTP id
 98e67ed59e1d1-2e9afae70e6mr152159a91.7.1730991942534; Thu, 07 Nov 2024
 07:05:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107182411.57e2b418@canb.auug.org.au> <20241107103414.GT10375@noisy.programming.kicks-ass.net>
 <20241108000432.335ec09a@canb.auug.org.au> <20241107141212.GB34695@noisy.programming.kicks-ass.net>
 <cade359b-8e58-4031-b21b-3c47e0dcf3af@app.fastmail.com> <ZyzWUirB25EYTTOO@f39>
In-Reply-To: <ZyzWUirB25EYTTOO@f39>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 7 Nov 2024 16:05:30 +0100
Message-ID: <CANiq72mXCS=OnrPd9p5RpkMVRZFjf+JBEyg3MdZLqkbMEZs6dQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
To: Eder Zulian <ezulian@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 4:01=E2=80=AFPM Eder Zulian <ezulian@redhat.com> wro=
te:
>
> By the way, I'm using linux-next/master here and I think I had to make
> (MITIGATION_RETHUNK && KASAN) false at some point for x86_64 to get RUST=
=3Dy.

Yeah, that would be this one:

    depends on !(MITIGATION_RETHUNK && KASAN) || RUSTC_VERSION >=3D 108300

i.e. it can be avoided with Rust 1.83, to be released in 3 weeks (2024-11-2=
8).

Cheers,
Miguel

