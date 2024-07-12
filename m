Return-Path: <linux-next+bounces-2955-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A8592F44E
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 05:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE8051F2234B
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 03:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C3810A0D;
	Fri, 12 Jul 2024 03:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eCz12Zs8"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033E110940
	for <linux-next@vger.kernel.org>; Fri, 12 Jul 2024 03:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720753991; cv=none; b=ribRnOqbnyxTTHk/ncx6UJ28yP0wHxIzNDjIGMs+DV8FnrsF7Wt+H8o+f0geNX9ZAeuwk1O4eI5QM3dweulLXj6Lo8cthtnLttyEEk7oJwvlmdQAJ91rFmThxEI+kHrEN/rWwjiJjuWNvVlMNbF2vvKgj7lM1JdvsxkG8pmS0SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720753991; c=relaxed/simple;
	bh=4CMnMmZKlqqfGQs63MdCFUNUoJWF+9xTEqu+cn+eEz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HnQmVw9o+KnMyLKC0kNTrbYFQ/ythQvhTI6WaTarnLG+tkPZ8DlneILzERJsoYFZoPqa0CJMZgijnAPkXu2SQG+C+8TOJ3VqmOnaYKL1T8XLF3gCpzgREWAEnqEwW4g3IzLWNNO2n/KcUXRUEaVgUGA5HkN+HFvpB7hZRwpPlws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eCz12Zs8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720753988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXY/sZpO06n+Rdcmg5Em3FyGZZSOlUrDiJ4rTK+vojA=;
	b=eCz12Zs8ejdcMsRvmO9XI9Iquo8DWOEkM/NXhY9+beiy+7iqnACFjIn0GuWTdPnz6lw9Sy
	ue4xFzLtnli3rS0chZyCTBCL2sm3loTSoOBNuKk++jZy7dxTk744BpXQB/PAJTppJLTu3m
	a/unOOlU15/QyQY+Jyg2BKg8VqIFf20=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-ziKAbyGDN5a4ikOSq6ToPg-1; Thu, 11 Jul 2024 23:12:55 -0400
X-MC-Unique: ziKAbyGDN5a4ikOSq6ToPg-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2c9e5c4fdefso1976521a91.0
        for <linux-next@vger.kernel.org>; Thu, 11 Jul 2024 20:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720753974; x=1721358774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXY/sZpO06n+Rdcmg5Em3FyGZZSOlUrDiJ4rTK+vojA=;
        b=YAk88yG72z8vYP0NXCCbFTz6nO4PJYUT61NWdmQ7NDk7yzMLp8EpEVg0zDtcMH7tr2
         IuCz0FqVWmx5C5cudUM/ywCVwAN8Z+DFRhypPl6JWy7qzmDmgOT2qJvbr7DYTw7CINrM
         CG1B08u7iKxQoSPpEV4g95bL+IqNOzkL9iahOIdwHFVMLcBTctrUcY5tqI89Ot/2zWsp
         nEqVCqCienWF5hZndvCLhB2mdRmzRF4Wc9nAuA81ciRWer+MTzNVkbQK4eD/q4iyu8C6
         o+VjF6L/7QXnnQgm5d+IaAF3RVQtnM6/UeAHAwzFoj9lv7hAtEWYBJGfJETFwhkIeUzX
         TYpg==
X-Forwarded-Encrypted: i=1; AJvYcCXdBqudbUFScvWBvIcOkmc7rhO4dyka0ApL1iszUDiKZGq1SQqJdv3IsLJrF9yz/MtvXW5f9QOQ72Ex+/19QpIB/cUX/n/FtS/w9w==
X-Gm-Message-State: AOJu0YwbIOIQ7dx3sfWijUI2u+9cEkWqHAka+tKZf5+HDAKufV8Fkbi/
	8uaxM5kXGj8BCECFEvGk9a2Hi87qSY1qHTAjwbc3Z+GhlJUhPx/vf0v0mAlfvmL8ylhzwfZ+V3p
	uMzC+Fu/Ke9eO3ydWJWdlQ+BeSFaUInE6zVPyCbWxvPcXs6/nC7cT2TC5JhUhuKVwU990h1NRQe
	xUKbewb1K6RhHLkJqoVVOMp+s6KxuYhPnrgqI0VMnvTQ==
X-Received: by 2002:a17:90b:1bc3:b0:2c8:2236:e2c3 with SMTP id 98e67ed59e1d1-2cac509b515mr2201883a91.17.1720753973690;
        Thu, 11 Jul 2024 20:12:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtAK2n6iWFwX5bM16eYpsf4GlrruFMJ7fNUbwgy0bcVCD8qdJ7sxCfFWVabHQR0P0ve6dq9fYfAk7ofO0SHvs=
X-Received: by 2002:a17:90b:1bc3:b0:2c8:2236:e2c3 with SMTP id
 98e67ed59e1d1-2cac509b515mr2201859a91.17.1720753973198; Thu, 11 Jul 2024
 20:12:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701191319.087b227e@canb.auug.org.au> <20240701171901.GA882812@thelio-3990X>
 <20240712122843.312313a4@canb.auug.org.au>
In-Reply-To: <20240712122843.312313a4@canb.auug.org.au>
From: David Airlie <airlied@redhat.com>
Date: Fri, 12 Jul 2024 13:12:41 +1000
Message-ID: <CAMwc25oaX1K1Co0vSsN1H3busBLH9xA3-f4OAHZXN4iB4_d=gg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Nathan Chancellor <nathan@kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2024 at 12:28=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Hi all,
>
> On Mon, 1 Jul 2024 10:19:01 -0700 Nathan Chancellor <nathan@kernel.org> w=
rote:
> >
> > On Mon, Jul 01, 2024 at 07:13:19PM +1000, Stephen Rothwell wrote:
> > >
> > > After merging the drm tree, today's linux-next build (powerpc
> > > allyesconfig) failed like this:
> > >
> > > In file included from arch/powerpc/include/asm/mmu.h:144,
> > >                  from arch/powerpc/include/asm/paca.h:18,
> > >                  from arch/powerpc/include/asm/current.h:13,
> > >                  from include/linux/sched.h:12,
> > >                  from include/linux/ratelimit.h:6,
> > >                  from include/linux/dev_printk.h:16,
> > >                  from include/linux/device.h:15,
> > >                  from include/linux/dma-mapping.h:8,
> > >                  from drivers/gpu/drm/omapdrm/omap_gem.c:7:
> > > drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_pin_tiler':
> > > arch/powerpc/include/asm/page.h:25:33: error: conversion from 'long u=
nsigned int' to 'u16' {aka 'short unsigned int'} changes value from '65536'=
 to '0' [-Werror=3Doverflow]
> > >    25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
> > >       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > drivers/gpu/drm/omapdrm/omap_gem.c:758:42: note: in expansion of macr=
o 'PAGE_SIZE'
> > >   758 |                                          PAGE_SIZE);
> > >       |                                          ^~~~~~~~~
> > > drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_init':
> > > arch/powerpc/include/asm/page.h:25:33: error: conversion from 'long u=
nsigned int' to 'u16' {aka 'short unsigned int'} changes value from '65536'=
 to '0' [-Werror=3Doverflow]
> > >    25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
> > >       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > drivers/gpu/drm/omapdrm/omap_gem.c:1504:65: note: in expansion of mac=
ro 'PAGE_SIZE'
> > >  1504 |                         block =3D tiler_reserve_2d(fmts[i], w=
, h, PAGE_SIZE);
> > >       |                                                              =
   ^~~~~~~~~
> > > cc1: all warnings being treated as errors
> > >
> > > Exposed by commit
> > >
> > >   dc6fcaaba5a5 ("drm/omap: Allow build with COMPILE_TEST=3Dy")
> > >
> > > PowerPC 64 bit uses 64k pages.
> > >
> > > I have reverted that commit for today.
> >
> > FWIW, I sent a patch to address this in a bit of a more targeted manner
> > over a week ago:
> >
> > https://lore.kernel.org/20240620-omapdrm-restrict-compile-test-to-sub-6=
4kb-page-size-v1-1-5e56de71ffca@kernel.org/
> >
> > Although somehow, I left off Ville from that patch :/
>
> I am still reverting that commit (as of yesterday, the failure still
> occurs) ...

I'll merge this directly to drm-next today.

Dave.


