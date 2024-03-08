Return-Path: <linux-next+bounces-1561-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A82876417
	for <lists+linux-next@lfdr.de>; Fri,  8 Mar 2024 13:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D67E71C215DD
	for <lists+linux-next@lfdr.de>; Fri,  8 Mar 2024 12:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35EA56756;
	Fri,  8 Mar 2024 12:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYuwNAVg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D7253818;
	Fri,  8 Mar 2024 12:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709899957; cv=none; b=AuJWmFzYq22K+4lJjQxEui3ztWopYuqJmPVM6FAMd7RryqpYZ0qsHn4XWPx+41nTPzxKEX89112x3/pdM5CCIFRH5ogaQKKsj5iRMa+AKsMY71nyw9cLZ8JxFtCqyCldJm6dt6RqTVWuiLIRbhI/MszXguAwlB1UrjMs9rcXyF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709899957; c=relaxed/simple;
	bh=544OZUrJA9dUBIh274nDnLFkCaRopvsFSDGO0SwIxvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMKmBFb06qb737UXC59xvd2C6YzrloBXhoDQF0FZ55E81jXY0SBumtwkZzfC95ysd8gdsm4o1iAe+fZd3cgmGhV1BY3h5oT4poCHtHAqFI8wzlm1xxivfX3Fff+7zk8dYOnP9jYMAZLgsLx3uIO18A5pzWwYzRaf8pcD9WeCIsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYuwNAVg; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d094bc2244so28145961fa.1;
        Fri, 08 Mar 2024 04:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709899954; x=1710504754; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=meFIHVCgIsrANISbGy64o1HL0u5OXJpL/X7mLIVqRgg=;
        b=SYuwNAVgjCIF74z0Aoop/YPO+ZE7DQiqYj7RxvKGodBxn+hXa9qKOiPYMn5bd88JfG
         YCct1sEPz8TsdmFM2cJE4j8Ry218GdbwGZ60FFebqgeJMF4w3Daj/vwedc4n1HxlvJ/k
         JT3D+NeDWex+a0/mpy+BYtlhjLGumoVImHzEuj7kE+Ud61N6HP6IGGSUwyOb6nbgwefz
         rCwfjmhwn5llN2HVYnjWr/MdzJBvq8802PJIwyLweFPYkc6mf2jz++5PATsO6Oscln8e
         hSMf7asOJmtcHATABTbB/efxqJpbdDuOPVl3oScOTu2/zwGM8qHuLbX4r6ueEypQjtdv
         dWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709899954; x=1710504754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=meFIHVCgIsrANISbGy64o1HL0u5OXJpL/X7mLIVqRgg=;
        b=sGLUwbLn8cZ7HCeM7mSCRfOdlW9omQeC2zpjTU4IoBmTcTKtCa5EabZXixgFdqiT9Q
         NpMgNRguB/TzImcxFfSB7rtoqbcHohUaKHOcXPzoDeqNq9hAVu8DJsjlzH9DBy2K2Vds
         iuVh0eXmLsWwVxJGJEvyEJXCsBM03RfmiHsirC0XiMMxVok0xmZGHTpbPdazH24PsiXR
         8crkgRUmMqsVa1s+OyQDchZdR8wPPDVanFx2a6HRvKZ6ozvSJ9CwARVhnxBRV0g6Ge7M
         fCcokYTnYz6iV3cYgaew16uQJyI4Cu0LM5IC5i+i3AWZy78zY5oMlff7S3na5Z96BekO
         MfCA==
X-Forwarded-Encrypted: i=1; AJvYcCXXP0YkkqWKZ4MRgNd0XUi7Sz8NeJ+XbnZH87hlX7l/6h0VxrDqs9fZYchH6w/YM7XDp0oeH+zqfd5rumM8glEyRME/xhUhyUuf0lTzGaOWLNyk4EtiUPCUQkYbMUbIAA==
X-Gm-Message-State: AOJu0YxvpHxylbhXc0r4XwNrVIP9CFVsOb9Z3eWfvUsTsCs2mzT6O3jk
	njqbhWufhHEr0GVFdx7EwF6HBkUikyHQWeUmZgG9YopKIomv25tQY69oglzp76E8Qb4oufUD7Zh
	zUr+oy2z/HnRDbl5w4rkub9iDb3A=
X-Google-Smtp-Source: AGHT+IFBNRy60ek/1OppKoH0Osl6U9Q6E57NlHmBVlZusNg5vkvK1iwyu2ZenlGHJCD16vxR3AP9LARVulWYCFzyYog=
X-Received: by 2002:a05:651c:b2b:b0:2d4:22d1:d96c with SMTP id
 b43-20020a05651c0b2b00b002d422d1d96cmr377155ljr.25.1709899953822; Fri, 08 Mar
 2024 04:12:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <65e9e748.a70a0220.606f7.53c0@mx.google.com> <7e216c88-77ee-47b8-becc-a0f780868d3c@sirena.org.uk>
 <CAPhsuW7c+OgFcZ9qWF7nes3SbaQdf5GYZZA+jyHAOzJ5omuZ8g@mail.gmail.com>
 <4ce67bde-3bd4-4a59-bce7-4a2764445783@sirena.org.uk> <CANk7y0gBRgJQqeqXZmTXygKREUWn4OQ2cbTYqh5P9gN3ZSV2sQ@mail.gmail.com>
 <CAPhsuW4XtFn2Nb0hr9R5FAcNNYjHsT1khvF8mHSvZarT6bPdCQ@mail.gmail.com>
In-Reply-To: <CAPhsuW4XtFn2Nb0hr9R5FAcNNYjHsT1khvF8mHSvZarT6bPdCQ@mail.gmail.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 8 Mar 2024 13:12:22 +0100
Message-ID: <CANk7y0gwpy2oNBf4zoRYTHrY1TqMNDwOY61RvC9V3xKaG0=o5Q@mail.gmail.com>
Subject: Re: next/master bisection: baseline.login on qemu_arm64-virt-gicv3-uefi
To: Song Liu <song@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Alexei Starovoitov <ast@kernel.org>, Will Deacon <will@kernel.org>, kernelci-results@groups.io, 
	bot@kernelci.org, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	bpf@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Song,

>
> bpf_prog_pack gives benefits without using PMD pages. For arm64
> with 64kB page, even bpf_prog_pack of 64kB can fit multiple bpf
> programs in it. OTOH, 512MB is really big.
>
> How about we do something like the following?
>
> Thanks,
> Song
>
> diff --git i/kernel/bpf/core.c w/kernel/bpf/core.c
> index 9ee4536d0a09..1fe05c280e31 100644
> --- i/kernel/bpf/core.c
> +++ w/kernel/bpf/core.c
> @@ -888,7 +888,15 @@ static LIST_HEAD(pack_list);
>   * CONFIG_MMU=n. Use PAGE_SIZE in these cases.
>   */
>  #ifdef PMD_SIZE
> -#define BPF_PROG_PACK_SIZE (PMD_SIZE * num_possible_nodes())
> +  /* PMD_SIZE is really big for some archs. It doesn't make sense to
> +   * reserve too much memory in one allocation. Cap BPF_PROG_PACK_SIZE to
> +   * 2MiB * num_possible_nodes().
> +   */
> +  #if PMD_SIZE <= (1 << 21)
> +    #define BPF_PROG_PACK_SIZE (PMD_SIZE * num_possible_nodes())
> +  #else
> +    #define BPF_PROG_PACK_SIZE ((1 << 21) * num_possible_nodes())
> +  #endif
>  #else
>  #define BPF_PROG_PACK_SIZE PAGE_SIZE
>  #endif

I have sent a patch with the above:
https://lore.kernel.org/all/20240308120712.88122-1-puranjay12@gmail.com/
Thanks for helping with this.

I have tested that this patch fixes this issue.

Thanks,
Puranjay

