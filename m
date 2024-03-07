Return-Path: <linux-next+bounces-1534-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD00875686
	for <lists+linux-next@lfdr.de>; Thu,  7 Mar 2024 20:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A8EE1C20CBC
	for <lists+linux-next@lfdr.de>; Thu,  7 Mar 2024 19:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBFC135A45;
	Thu,  7 Mar 2024 19:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFXdypb+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC651CABF;
	Thu,  7 Mar 2024 19:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709838174; cv=none; b=PcQTNYMB0GqkxU205Hx9Aoks0HnCfI67r08AQo1qE2QNqQzY7BJUDZ6DRfcFJVLYc5E0r5YjVIcqd3JzecLAuijNA70UyXGIzgWkA9DVGP0zatnwXfTb9h3e/oEGJ7C5H53NU4enmb/aa8w+2eo2u8FzxlxPauFnR7VB+2IdGVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709838174; c=relaxed/simple;
	bh=Z6To9HnP03DphJYrGWEIqIAjfjWhrFUPrtKc0ABJuFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OdNrjdRdOijiF+rrPi8aKG6Y8lBqHSZMv5pCcUP6ydQ6uJBXoZznjzxaiU0F1kQ1bG1LNv9mxUMPBVOF8051gAF5mmLhv/cS3Kl21TNOB3/n7of48dmLXYKRDeWpASlRdyG5qAQzLU0nh6WE6NmOz8DxyQBQYvyQAKwyHoPCRt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFXdypb+; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d309a23d76so21153001fa.1;
        Thu, 07 Mar 2024 11:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709838170; x=1710442970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6To9HnP03DphJYrGWEIqIAjfjWhrFUPrtKc0ABJuFI=;
        b=mFXdypb+H3eVzVVQ77zNNQXsiGCsjk1y1g4lP9QRc9/3sizYahBv3/ncdoRvZdSr9A
         OxO6lbL1ViZCvI7Lo05V9Fmnm3aCZrjwiokuDYDkVItDq37Nvnli7RKDfacf5ZiUyY3m
         GdnnOVBNiy5WEVYZ+1ByXk+oNI8fJ2Og1SJHIN+n8lGzAg+BMBkLgeb93Qv9HpuAbPv1
         KYoXcypb2fWNMsQLXtCW+RZGhmjUz97uZbwYZd+kgq85SamMX2DqCXeflU02QI9uRC7+
         mdmsgVHp1/AvfA8ZVrP/A1QpXFokvnoFwIyzimmWr56yzaSpybFk3lK1OrSaTVSkX/9G
         TR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709838170; x=1710442970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6To9HnP03DphJYrGWEIqIAjfjWhrFUPrtKc0ABJuFI=;
        b=UVY/brpKvL+N1y6fPr5RrrQlbDwUAFiXBcugOsC3yyvTkb+9tMAhN+XBrqpiNRKJLE
         VxBFyI22ipvJSKkoZ+SECwJViwbb0l1a4OuuP2iDv00iduRgMmty0I5n8XPNCqLRLk3V
         8Sags8kREdiFJ2HBVJy+q08wXaDKQaPZBOf9J54AuYNy/jdek5QK26sbR43e+kydcVvQ
         9AR0kdD2qupaxKXOv1FTUdPV37LaYLGcG2kouMEahcvylfJbH2oUaXmYHzQoJR70Ya7y
         EaCviJOHtUD0sLNYYzb1vw6z3OWQ9Jl0Di+DHAfxQ5X3UMBBB4vESa8n91nIBJp6ublh
         udCA==
X-Forwarded-Encrypted: i=1; AJvYcCXPFgylVfWAXrSGabI5Z7ZbrNC3xcEdozoZ/DnYKYbKf+oUZIa9qASTThvsr0Ms19o+gG/3hEq46Jgul+N9tPKzNzvjwdINu6HNMUcftH1Gq3x7KPRwkyQ3H0O48Sbi6w==
X-Gm-Message-State: AOJu0YxiWTuQbbX8KXx+cOLzqfjTPJXaBWqY/CVLIkO4Qx2gfgLgmU3L
	eKDeEUMSnMynmHW5a2I8+0hSOfI+aSCVYuhUZtx4O884dXwzCABn1+A5/TEkTLtqTY06uKa/jxO
	C8C+PDEZrLgUe26M4OW+r+lYKnxw=
X-Google-Smtp-Source: AGHT+IFOnenNV2ioydjlYq7svwlQ6sb5pSsdTZrS8h+5e87pENNyMrtVQt9tYWWqO0Gck2mzMMnTkH5ftYTgVE8xwOo=
X-Received: by 2002:a19:e003:0:b0:513:1cad:c83c with SMTP id
 x3-20020a19e003000000b005131cadc83cmr402506lfg.11.1709838170049; Thu, 07 Mar
 2024 11:02:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <65e9e748.a70a0220.606f7.53c0@mx.google.com> <7e216c88-77ee-47b8-becc-a0f780868d3c@sirena.org.uk>
 <CAPhsuW7c+OgFcZ9qWF7nes3SbaQdf5GYZZA+jyHAOzJ5omuZ8g@mail.gmail.com> <4ce67bde-3bd4-4a59-bce7-4a2764445783@sirena.org.uk>
In-Reply-To: <4ce67bde-3bd4-4a59-bce7-4a2764445783@sirena.org.uk>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Thu, 7 Mar 2024 20:02:38 +0100
Message-ID: <CANk7y0gBRgJQqeqXZmTXygKREUWn4OQ2cbTYqh5P9gN3ZSV2sQ@mail.gmail.com>
Subject: Re: next/master bisection: baseline.login on qemu_arm64-virt-gicv3-uefi
To: Mark Brown <broonie@kernel.org>
Cc: Song Liu <song@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Alexei Starovoitov <ast@kernel.org>, Will Deacon <will@kernel.org>, kernelci-results@groups.io, 
	bot@kernelci.org, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	bpf@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 7:34=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Mar 07, 2024 at 10:16:21AM -0800, Song Liu wrote:
> > On Thu, Mar 7, 2024 at 8:36=E2=80=AFAM Mark Brown <broonie@kernel.org> =
wrote:
>
> > > The KernelCI bisection bot found a boot regression n today's -next on
> > > qemu arm64 UEFI platforms with 64K pages which was bisected to commit
> > > 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory management").
> > > We OOM quite early in boot:
>
> > IIUC, 64kB pages means 512MB PMD. I think that's indeed too big. We
> > will need some logic to limit such cases.

As far as I understand, we need the prog pack to be PMD sized so it is
allocated as a huge page
and if we limit this then vmalloc() will not allocate a huge page and
the performance benefit will be lost.

>
> These qemu instances are only configured with 1G of RAM so that's rather
> large indeed.

I was able to reproduce this without UEFI as well, I used 600MB in
place of 1G. Prog pack tries to
allocate 512 MB and this causes the OOM panic.

Can we implement this in a way where if the memory can't be allocated
then we fallback to allocating less
memory rather than panicking. I don't know enough memory management to
know how it would be done.

Thanks,
Puranjay

