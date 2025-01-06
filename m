Return-Path: <linux-next+bounces-5063-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1061AA03149
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 21:21:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03DD9162851
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 20:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D4F1D7E35;
	Mon,  6 Jan 2025 20:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SmFwW2NV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FBA194A53
	for <linux-next@vger.kernel.org>; Mon,  6 Jan 2025 20:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736194889; cv=none; b=Yuwzp/zMQG2FdECt9nEyahVOmFmcTO086tKcBrvwjCdZTXOy8ZA1vMHpT0z+AJax9L0cEpVyTljb/8pK1seKYCnGF8RS5m3aFBJTN2uVOgGhqfdN3wKkqklHWC5gE/ZEiqJ4cd5aSA46mrDn5OuVZ5IyhDunBPxlW37JUNEekqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736194889; c=relaxed/simple;
	bh=r2ChLg2eW1TE9IZBJdXxm7sDGaFn7GqQwx0PtzlX7MY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOlWHUotihCrRe+abLYTH4LAM73Qsp5e/Xs6Tyfy0HJ2hMcziyjDklqWOv3TQSGz7M4w4xmJdSWo8aINXX9+EPiRhTSPui0fmyURU26ts3Nu8X/+A00ALVLo/pJ5gNu1eXycBcE4KmqSCU1uviw53TiGOrGyrvg5t1KzDMrEK14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SmFwW2NV; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-467896541e1so49761cf.0
        for <linux-next@vger.kernel.org>; Mon, 06 Jan 2025 12:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736194886; x=1736799686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kd6tgjjZNJ3qv9QRMqbwob0u2UrXOveRcxTI0J2iJ78=;
        b=SmFwW2NVBZFnMUa5VFPDZMYAsTLEPkhlMNmoWpHvF31FshQj6UewfFgnLYzcqmzdc8
         deqrv0ZivMVSejGkb5D7BLsKsN9Fn82v4HL9OlOWCerC3XfGM3xdyURpU9xBxOvTYWuF
         pcVcLwJK5dASOZuQuHun4zU35QFavgJa+9iBbiBTzOJE79X4eJfKiFpxp8tGlldCVjzJ
         Z6d1FOcxdzEqOvxguzXI7bMx0rAuB88geg5Zwe6s9y/SbucYSEyvKXHgWoai+Mr0E7To
         n2myp9Sd/PdZPta7Lv305qWJ0r80kKACjVPmuBsK8wCyEpCnC/shjUah/yJ7YoBRf5LF
         fDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736194886; x=1736799686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kd6tgjjZNJ3qv9QRMqbwob0u2UrXOveRcxTI0J2iJ78=;
        b=FNqoQoq8i/QIcF8uhff1UkMWORnbbQNnJn2FiXfWAg0vitCGv0Ov+tZd3GisoKW/gK
         imbnPRQpXr2+4Gk/h/xDv3U+VvjMVR8PonIsQYWTcn5AatOvkfXrZjBppKcPFJSbu5IS
         XCUfCuzQlvI5Ugm0XpvT8OckVwTjycVyjt4F+pvhUItFfB7Zr9RKkwhqcCw001iMW3i8
         atUFXcJeHHSaRv6wwN2h9lcH8SSDxNl58RuCTRNrTRT3eBuLNNLCTVymTiq7toHIrpgv
         eHCjdO59S5QCGWU3YP5TmcibYFy4i0tG+fhcIyyrTpM+DVzNgaXTi7BnmewLqrPN8Xm3
         zJCw==
X-Forwarded-Encrypted: i=1; AJvYcCVGkAGcvymTjoS5+QT3afixZ09eJRTKea8S1ZtrLcmrnl5wiaCFrWizroVUShXjPihHwIGvgUTKMhQ9@vger.kernel.org
X-Gm-Message-State: AOJu0YySxS1O85xA4432PzOqj87NvlAk0k+PxfwWTbjasSGxugW9OmbF
	4MuHjcfOUx3KmjX4g3rzIga3EIxvJmStZttskXQkn56aRPXEjFGO/ANf0QQb2laYfz5iX34QqKt
	bC+rUmp3jVxa9QBNC/+KDxq/Ep2qovJmO7F3f
X-Gm-Gg: ASbGnctz+hNsf20iZvTX99ZYDZUBuFQgMXUGCUiFlGQur8fUL41lrVcw+ExNZm7mOhk
	KdmDqsGFEyou4//uuCsWxCtWLuDrztKc3Q9j81A==
X-Google-Smtp-Source: AGHT+IGyfS/WIac9KoVlREJSyBHmyLbKPW1L6p2BAYC6LAnvbK/mLXodtwnOWSD4NO8oO4/algtlgQFuSDRssTQz2nc=
X-Received: by 2002:a05:622a:13d0:b0:460:491e:d2a2 with SMTP id
 d75a77b69052e-46b3ba3ae91mr352081cf.17.1736194885835; Mon, 06 Jan 2025
 12:21:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209132446.77fcb14b@canb.auug.org.au> <20250106140928.50569876@canb.auug.org.au>
In-Reply-To: <20250106140928.50569876@canb.auug.org.au>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 6 Jan 2025 12:21:14 -0800
X-Gm-Features: AbW1kvYZCRPzUFYAR8_B4rTvMaDRyCVHcDds6TqQxgREG8pi4voX4mpx7Bgrdlw
Message-ID: <CAJuCfpEyhm3OoeOqfnYVoOo+C4PafX1zXakPb+wjCFB_9Q9NnA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 5, 2025 at 7:09=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
>
> On Mon, 9 Dec 2024 13:24:46 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > Today's linux-next merge of the tip tree got conflicts in:
> >
> >   include/linux/mm.h
> >   include/linux/mm_types.h
> >   kernel/fork.c
> >   tools/testing/vma/vma_internal.h
> >
> > between commits:
> >
> >   5f0d64389e1f ("mm: convert mm_lock_seq to a proper seqcount")
> >   062111898568 ("mm: move per-vma lock into vm_area_struct")
> >   85ad413389ae ("mm: make vma cache SLAB_TYPESAFE_BY_RCU")
> >
> > from the mm-unstable branch of the mm tree and commit:
> >
> >   eb449bd96954 ("mm: convert mm_lock_seq to a proper seqcount")
> >
> > from the tip tree.
> >
> > Note that commits 5f0d64389e1f and eb449bd96954 are identical patches.
> >
> > I fixed it up (I used the mm tree version) and can carry the fix as
> > necessary. This is now fixed as far as linux-next is concerned, but any
> > non trivial conflicts should be mentioned to your upstream maintainer
> > when your tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise any
> > particularly complex conflicts.
>
> I got 2 more conflicts today due to the duplicate patch above.

Hi Stephen,
Have you been able to resolve the conflicts? Can I help with that?
Thanks,
Suren.

>
> --
> Cheers,
> Stephen Rothwell

