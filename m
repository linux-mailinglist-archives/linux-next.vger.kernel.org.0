Return-Path: <linux-next+bounces-3518-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6260967C03
	for <lists+linux-next@lfdr.de>; Sun,  1 Sep 2024 22:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2996BB2107F
	for <lists+linux-next@lfdr.de>; Sun,  1 Sep 2024 20:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B81F6F2F3;
	Sun,  1 Sep 2024 20:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6wqzHW1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814AE558BA;
	Sun,  1 Sep 2024 20:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725221590; cv=none; b=deri725wZDw+xbBQrwYgBsnndVtfWJ3rLSFgEYnwEepdXfXB5qQ9bsNCACdphPj8OV8MB7ALqkVWRv9oi/B9XPea2Xc5l5RIsCOomd2M+5RgOHK2PMs1y122gh8B/pCrm+xdUVB0imTSg3F08oAvGNEZjxjSMdPQdhHCXMEva4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725221590; c=relaxed/simple;
	bh=wNxNeeQJ+63p7djsyOzdK093vhCt0eKPoEsxF1T1m2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V37U5XV/QzXv39bXpPtr0dntATDAHpYG/bO97GhQycJXZ6ST5i4lBWtFlwKy5DkAarOhDe1v5xmn1/l/THJrA6OFh+Fqa1DaCfAE9j0gHLAXVwx1L5znDdmbpggwrDHVeK3saeDWfI2DT5SdryT+zKzvFFw7i8/7xLLF6Zq0yHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6wqzHW1; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5de8a3f1cc6so1684068eaf.1;
        Sun, 01 Sep 2024 13:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725221587; x=1725826387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6OwG31c6G0YUx2zi6DHRQVZYeu/WotnlRiMEIHUdAA=;
        b=k6wqzHW1Phl3ZZXlYZS1sxTR5aMDit8cTW5uDeX38ULxXrvjWLECtHBZGDinvg3b+M
         YCkXn5GWuzwevuTQBjv73S4Mgvots+yojR5ch+ATLMIFEk7dYrSwupb8YhJaP3FEPzCf
         iIIgpvaJGkmeGqfhAR5EUEzj/g+SvvjljNrnyAhbXtDxiEMYez4+Vqn7dslsg+OXjPZk
         t4i9fG2F/dX51iNV2xa6GXoMuGUVHMYmaYhs8Z50Xg1Ou6yareqKWtX0MNNigtyHCk7u
         ASVqAOsuds2zFfp00H98K9mQmJvD8HVt+pC1oBCUc1qzeqM5eSZz23W2MsjddN+8C4Am
         yoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725221587; x=1725826387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6OwG31c6G0YUx2zi6DHRQVZYeu/WotnlRiMEIHUdAA=;
        b=EHmaIgamBSYEnvBCUfOBSLGIr6hCRbFKkMCOjQC5A15jNsuSnDjf5kOFdSsxbdRGFE
         iuYiyZ3/yVRzmHsDI0zyHWj6h1XMe9quJ5tAynjlmC2mo+OGceXFcrRat4lCDnsMPb+U
         fodkYg0SGi0i+g1eBIRJpDEsD3HNNKT3+iKdzq0sbg2Z9D8om5kR9maopWqDS+XbK4uY
         8Ar7sKzlFeXagRPe8CIMQIqmqfP18ualsJ1yZ7l+6Fa4Jz9BRUQmO5LZrLhYNfBWFZp2
         JAf4OPWmoMFMKcsWPm6KJS7V91Y9wIDmYF/4Au1k5aUScFea2GpzKy+sAmn1T13LiI5+
         3aTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzoS2oaqhq7DlA5GzK0bEmhY6O6bM1jkAH9aN06sCvLRAsdVv9XdIOcZYCkqtrLYC5f00x4M1f1Z9P8S8=@vger.kernel.org, AJvYcCXT2Plook3UbyXlRBVeYCU8+L6LbQ4SnDb/UbsDd6nNMz4Szn7CZPXU/wYvGhUQ5LzIFv3UwLkwfyjAzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwwAdP7QqzKHpstj1qAZSgsIkN7K2NUeAbSQULyqGO9KXnFhpI
	2uIrFZ7+eQIcihV5B3xh/OtnBMJxk7AdNk6mihWY3X5I43W6g4A8dbcrwyCZhUiz1WnwBsofOQy
	l1O3Sp4WCIAy6jMDZI0hqVuyx5/0=
X-Google-Smtp-Source: AGHT+IFqgM+5p3Af/0c1Ft+OyQ6xAXftNZMOPu3i3M6Opg8NY8o4aVV1A0NS53x+F0YAnEQBnv4X8dzRUJZev3S6p8s=
X-Received: by 2002:a05:6870:2f0a:b0:277:fd44:9e17 with SMTP id
 586e51a60fabf-277fd452a72mr42335fac.19.1725221587447; Sun, 01 Sep 2024
 13:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822142603.3608a26d@canb.auug.org.au> <20240828150900.7ffd7588@canb.auug.org.au>
 <57440a796530c153cd0ee3e7b11c2fbab9887fbf.camel@collabora.com>
In-Reply-To: <57440a796530c153cd0ee3e7b11c2fbab9887fbf.camel@collabora.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 1 Sep 2024 15:12:56 -0500
Message-ID: <CABb+yY2jNpXL+7RhrObh8ec+wxk3SJuX6eXH3YVfSz=P=1oD8w@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the rpmsg tree
To: Martyn Welch <martyn.welch@collabora.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, Hari Nagalla <hnagalla@ti.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 4:45=E2=80=AFAM Martyn Welch <martyn.welch@collabor=
a.com> wrote:
>
> On Wed, 2024-08-28 at 15:09 +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > On Thu, 22 Aug 2024 14:26:03 +1000 Stephen Rothwell
> > <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the rpmsg tree, today's linux-next build (x86_64
> > > allmodconfig) produced this warning:
> > >
> > > WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
> > >   Depends on [n]: MAILBOX [=3Dy] && (ARCH_OMAP2PLUS || ARCH_K3)
> > >   Selected by [m]:
> > >   - TI_K3_M4_REMOTEPROC [=3Dm] && REMOTEPROC [=3Dy] && (ARCH_K3 ||
> > > COMPILE_TEST [=3Dy])
> > >
> > > Probably introduced by commit
> > >
> > >   ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F
> > > subsystem")
> >
> > I am still seeing this warning.
> >
>
> OK, just taken a look into this. I think the issue is the result of the
> inclusion of `COMPILE_TEST` in the Kconfig entry:
>
>   config TI_K3_M4_REMOTEPROC
>          tristate "TI K3 M4 remoteproc support"
>          depends on ARCH_K3 || COMPILE_TEST
>          select MAILBOX
>          select OMAP2PLUS_MBOX
>   ...
>
> Looking at the entry for `OMAP2PLUS_MBOX`, that doesn't have
> `COMPILE_TEST` listed under it's dependencies:
>
>   config OMAP2PLUS_MBOX
>           tristate "OMAP2+ Mailbox framework support"
>           depends on ARCH_OMAP2PLUS || ARCH_K3
>   ...
>
> If I understand right, either the `COMPILE_TEST` needs to be removed
> from `TI_K3_M4_REMOTEPROC` or added to `OMAP2PLUS_MBOX`.
>
> It appears that the OMAP2+ Mailbox support can at least be compiled on
> x86_64. so I assume the correct thing to do here is to enable that
> right?
>
> Jassi, I assume there's not specific reason for the OMAP2+ Mailbox
> framework support not having `COMPILE_TEST`, other than potentially
> being added just before it was a thing?
>
Seems like it.

-j

