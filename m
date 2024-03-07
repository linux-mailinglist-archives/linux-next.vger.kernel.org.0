Return-Path: <linux-next+bounces-1548-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B12875AC7
	for <lists+linux-next@lfdr.de>; Fri,  8 Mar 2024 00:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 752E528580C
	for <lists+linux-next@lfdr.de>; Thu,  7 Mar 2024 23:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4FD3D0B8;
	Thu,  7 Mar 2024 23:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tXeuew1Y"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648042E648;
	Thu,  7 Mar 2024 23:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709852446; cv=none; b=rJ9xt2SyOALQXI14ydGXXlzs/jhn630w2ee3FXz+yBkxtaO+DUeKkr85rBLajpQlMALuKAzR3X0YSkq0y4OE/iwCCIF6sXK4dwIzIGmqvacunVp9hqeF7Whr0m1A0f9Ah0+lHBDlw0gLyolXHoIGI6uSja7vYG3bF8zZe4PNw1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709852446; c=relaxed/simple;
	bh=0BNRnFKrPmqb8JaQMgFhNaR+/YfUrRcBITV+UhUg3ek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b8lauutBTeOTA158EAzIlfibU69e4sZS0JxxLX0dpKsyB245t584ceT/4uQTiCkAWoQdnWqR4L6HscpDgBQuL3IK1jlwZgRjkpcKWKHkToQoPb8lmU+mfXL2klv1tYxBluq5ufIbsSRvomLhwKh1rD6j7ZDIFI/e5oEiRP08XUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tXeuew1Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A4CC433B1;
	Thu,  7 Mar 2024 23:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709852446;
	bh=0BNRnFKrPmqb8JaQMgFhNaR+/YfUrRcBITV+UhUg3ek=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tXeuew1YyJIEz+oDjmSV0cwsFcBuHVY23U1kIUAqIZhkGDqLAQ0oxrLIR+iItj9SW
	 yW78XbjssAiVqZ1/WCvzByCaa531nWXw9ZZz/dXHX1FuPvQCM636NnLT4ancOxU+9q
	 zlJQU3JV5YUccyXPDosO1BR/S6606xjMIoiNZzG+KGaifOFoPWFPojN1UbPVn9AuXU
	 vmJmrr/hjbutmQGTFFlUuCfpV+fzZ/LOOL3bsxA5gJSLMO71mGxb6Slr1CGm2oHkI7
	 q8zRGDgCtu5uJwjVr+i9IAmd6CL667ZbC2yl2I6byx7E9XeAdk0D2AdoMt0o3WjMuD
	 D2Inyft1wyrew==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d309a23d76so22834811fa.1;
        Thu, 07 Mar 2024 15:00:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWRG4tZOOKLlrDZlXUKyalTc/RGg+q4xStCcyH5PNHCT+d8FHHK5Upww31ma9Ji2UvNmBS3Y0IxAqkz2MtwfIgUyn1g/3NamvxkWCcBYwMhUw79jnutOyNyVXQ0sQj95g==
X-Gm-Message-State: AOJu0Yz3SjU1l5b1hdwF4tH5eCHRa4I2pF1JSMWhbsrMQ1tniksfhqJt
	ZqyNlbldwsfPzSa8/t+DUWbKmaMVK3RIKRof9SLWxTcPsfJGg3cL8EwjWq60CI2uDqJ04xhs+zI
	i5zvA7JN9v7GM0o9mQoifeqbPBYI=
X-Google-Smtp-Source: AGHT+IHIvKBLMm2DYDZH0mQVeIadMl7yshOMcUdRiFEkU3IcF/jRIDNEu423eBEh/eV/YsvR3ATkeFr1xweFEoLngSE=
X-Received: by 2002:a05:6512:616:b0:513:2508:d2f with SMTP id
 b22-20020a056512061600b0051325080d2fmr1107647lfe.12.1709852443920; Thu, 07
 Mar 2024 15:00:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <65e9e748.a70a0220.606f7.53c0@mx.google.com> <7e216c88-77ee-47b8-becc-a0f780868d3c@sirena.org.uk>
 <CAPhsuW7c+OgFcZ9qWF7nes3SbaQdf5GYZZA+jyHAOzJ5omuZ8g@mail.gmail.com>
 <4ce67bde-3bd4-4a59-bce7-4a2764445783@sirena.org.uk> <CANk7y0gBRgJQqeqXZmTXygKREUWn4OQ2cbTYqh5P9gN3ZSV2sQ@mail.gmail.com>
In-Reply-To: <CANk7y0gBRgJQqeqXZmTXygKREUWn4OQ2cbTYqh5P9gN3ZSV2sQ@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Thu, 7 Mar 2024 15:00:32 -0800
X-Gmail-Original-Message-ID: <CAPhsuW4XtFn2Nb0hr9R5FAcNNYjHsT1khvF8mHSvZarT6bPdCQ@mail.gmail.com>
Message-ID: <CAPhsuW4XtFn2Nb0hr9R5FAcNNYjHsT1khvF8mHSvZarT6bPdCQ@mail.gmail.com>
Subject: Re: next/master bisection: baseline.login on qemu_arm64-virt-gicv3-uefi
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Alexei Starovoitov <ast@kernel.org>, Will Deacon <will@kernel.org>, kernelci-results@groups.io, 
	bot@kernelci.org, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	bpf@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 11:02=E2=80=AFAM Puranjay Mohan <puranjay12@gmail.co=
m> wrote:
>
> On Thu, Mar 7, 2024 at 7:34=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> >
> > On Thu, Mar 07, 2024 at 10:16:21AM -0800, Song Liu wrote:
> > > On Thu, Mar 7, 2024 at 8:36=E2=80=AFAM Mark Brown <broonie@kernel.org=
> wrote:
> >
> > > > The KernelCI bisection bot found a boot regression n today's -next =
on
> > > > qemu arm64 UEFI platforms with 64K pages which was bisected to comm=
it
> > > > 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory management"=
).
> > > > We OOM quite early in boot:
> >
> > > IIUC, 64kB pages means 512MB PMD. I think that's indeed too big. We
> > > will need some logic to limit such cases.
>
> As far as I understand, we need the prog pack to be PMD sized so it is
> allocated as a huge page
> and if we limit this then vmalloc() will not allocate a huge page and
> the performance benefit will be lost.

bpf_prog_pack gives benefits without using PMD pages. For arm64
with 64kB page, even bpf_prog_pack of 64kB can fit multiple bpf
programs in it. OTOH, 512MB is really big.

How about we do something like the following?

Thanks,
Song

diff --git i/kernel/bpf/core.c w/kernel/bpf/core.c
index 9ee4536d0a09..1fe05c280e31 100644
--- i/kernel/bpf/core.c
+++ w/kernel/bpf/core.c
@@ -888,7 +888,15 @@ static LIST_HEAD(pack_list);
  * CONFIG_MMU=3Dn. Use PAGE_SIZE in these cases.
  */
 #ifdef PMD_SIZE
-#define BPF_PROG_PACK_SIZE (PMD_SIZE * num_possible_nodes())
+  /* PMD_SIZE is really big for some archs. It doesn't make sense to
+   * reserve too much memory in one allocation. Cap BPF_PROG_PACK_SIZE to
+   * 2MiB * num_possible_nodes().
+   */
+  #if PMD_SIZE <=3D (1 << 21)
+    #define BPF_PROG_PACK_SIZE (PMD_SIZE * num_possible_nodes())
+  #else
+    #define BPF_PROG_PACK_SIZE ((1 << 21) * num_possible_nodes())
+  #endif
 #else
 #define BPF_PROG_PACK_SIZE PAGE_SIZE
 #endif

