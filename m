Return-Path: <linux-next+bounces-3798-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF76976BC3
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 16:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 934E01F23467
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 14:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38ED71AE053;
	Thu, 12 Sep 2024 14:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETRKohEN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A181B2ECD;
	Thu, 12 Sep 2024 14:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726150571; cv=none; b=G+8/+YxIEZEwZBAbC4e92bhmlJ0xd2yb2v4gG1I2aq16uHEbbXbQjmuY7VuKN+3xvyoOTX2S/mlaX0xbq3O4JfbazbvcayAr1MszyhWk5nnGmHswyKrkqej3VoiXULyd2RwMiDddBi+VwE8hWBUxa43o046dC5ijdEgzOKEirmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726150571; c=relaxed/simple;
	bh=hd7bYJjKsetG/qAejVRqZ3gPuIxQayzn2jYl4iBpDmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pDv2GhoMMOXlWI8vMkjJgLvRxFuPX047e2lsxPA7sb38VO/mogFgLYevUgxm1cxhPgkRHHn2mfanZYvCBHJH4mFBThF3hEWYkQfr/Zs2bTvqKQcnpQWFK6HlXgkPU4gmqCiGDguRS811vOv3+2x1FGXTNeSDO3OZSZBaJuUEPuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETRKohEN; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7092dd03223so183564a34.1;
        Thu, 12 Sep 2024 07:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726150569; x=1726755369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5q/aiK+W9oGv3NhL8TwsrDYz8Pjrqgc7jByWkFjmNU=;
        b=ETRKohENR6z2zewogwl0OkliLd4IK0VfKVqrfP/ThYDNGzJvLFyUY89Go/sLjTUP9c
         0NgGrC45dVesubW4VMvpaZpiBeAXqfaaCRYLAtsCopDDdPT5ykBtLcqLGFkls+e1o/Ve
         Sio/WdG3C89BA7ToY2inVxaltZErbGLWf1xoVFtgp7nUPVAshOXvWqXPeHQo61xiFmob
         RXNVTAO3wTpE46LCqVv+i+aFw8uPPxuA9qQAPX6tyzmz/x6Zd24woOZO5Q2bCzToHTl3
         Du2xIFCnSq2PMuFxNNmfYXfvbAaFfUbcfcP2Xj/0m/wDcTCV/YwV+ArGRip4aRkK6lvN
         GHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726150569; x=1726755369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5q/aiK+W9oGv3NhL8TwsrDYz8Pjrqgc7jByWkFjmNU=;
        b=Sb7mfkNLHEH/BsxGxcvy22Jb0aHHbUvMD1E+9tqMYgwThslQgySYbQ5jCbGTDhTR6m
         NF8KQiB0MOv0hTkmy9ltd4aSsk8QJghUFbCtcwg/XcmivB7kwbPYQZizIHYa2RGUKCHf
         jL6xxV57dZmsOi2fCW8+LmY/v5SSQs0SZ9E9mIM5085yxelgXrh7jEGAEo1ZvowB4H1D
         M6Nr2n+5/pR5SSU4z+R4oai/k0zQObh25mn1mFo8buPXA/CJnUzhrBrl/rnXp7QnmY78
         /BntCdZBkNisxQCmiuBnPpdPjZfVhik2NA3YpzWMkteDRjWTLGdA3/d1QBez0EpXErXc
         i+ow==
X-Forwarded-Encrypted: i=1; AJvYcCVGLqt0uTElDYvVRju1zNTSumZUsM2lzKXGijJqs7NM6bgNtP9B2duQ8hRH6u9tb7d2hrUEgkHw525buvE=@vger.kernel.org, AJvYcCX598ZWCs9Hlm6vYKnVRWVUFmbiFoPZ397iLWRMYniLBdbAx74IpS+Xp4TRvFN84B4JdSm/NWYnsNphEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbBYROJZE+gFWVAfntKYVXj8i0JHDszpv7CVNp2UA5ses+NpWx
	wjKdt8h6IWWAKtmb2aWYU66z/FjTsjePHyzGd91658ZlKmXEnXYSIt36jneQPSCH/7Pix3RcW5y
	NB2J6ydZVIpw6YvybfLDqtTNnCrI=
X-Google-Smtp-Source: AGHT+IGYOiv5iUwIrr/uUlnM76kt0QoMn1Hz/+z3d7YdA1RVBxNb8lGNX/pT6cxKnbzDKpZsxuB94U+bId0FpIB+LQU=
X-Received: by 2002:a05:6830:3c09:b0:710:ec4a:b394 with SMTP id
 46e09a7af769-7110957134cmr1958018a34.29.1726150568518; Thu, 12 Sep 2024
 07:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822142603.3608a26d@canb.auug.org.au> <20240828150900.7ffd7588@canb.auug.org.au>
 <20240906183621.6c630b7f@canb.auug.org.au> <12e1eda76baaa67109da3798b1b184b4a94531e6.camel@collabora.com>
 <20240912183408.36acc6dd@canb.auug.org.au>
In-Reply-To: <20240912183408.36acc6dd@canb.auug.org.au>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 12 Sep 2024 09:15:57 -0500
Message-ID: <CABb+yY07P0zs6nT2CrZ+TnO+2XxZKYUfEjyRj2wwn+zAx9T0iQ@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the rpmsg tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Martyn Welch <martyn.welch@collabora.com>, Andrew Davis <afd@ti.com>, Hari Nagalla <hnagalla@ti.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, arnd@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 3:34=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> On Fri, 06 Sep 2024 09:58:23 +0100 Martyn Welch <martyn.welch@collabora.c=
om> wrote:
> >
> > On Fri, 2024-09-06 at 18:36 +1000, Stephen Rothwell wrote:
> > >
> > > On Wed, 28 Aug 2024 15:09:00 +1000 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
> > > >
> > > > On Thu, 22 Aug 2024 14:26:03 +1000 Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:
> > > > >
> > > > > After merging the rpmsg tree, today's linux-next build (x86_64
> > > > > allmodconfig) produced this warning:
> > > > >
> > > > > WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
> > > > >   Depends on [n]: MAILBOX [=3Dy] && (ARCH_OMAP2PLUS || ARCH_K3)
> > > > >   Selected by [m]:
> > > > >   - TI_K3_M4_REMOTEPROC [=3Dm] && REMOTEPROC [=3Dy] && (ARCH_K3 |=
| COMPILE_TEST [=3Dy])
> > > > >
> > > > > Probably introduced by commit
> > > > >
> > > > >   ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M=
4F subsystem")
> > > >
> > > > I am still seeing this warning.
> > >
> > > I am still getting this warning.
> >
> > I believe this is the required fix, but I believe it's waiting for
> > review/merging:
> >
> > https://lore.kernel.org/all/010201919d8b298f-dd1585dd-7c4d-4865-9483-ff=
6cd7399a90-000000@eu-west-1.amazonses.com/
>
> I am still getting this warning.
>
 This https://lore.kernel.org/lkml/20240909203825.1666947-1-arnd@kernel.org=
/T/#u
  seems like a more complete solution.

I am ok if it goes through TI or another tree.

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

