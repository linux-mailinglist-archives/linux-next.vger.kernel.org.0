Return-Path: <linux-next+bounces-8116-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D03B37D62
	for <lists+linux-next@lfdr.de>; Wed, 27 Aug 2025 10:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47EB81BA31EE
	for <lists+linux-next@lfdr.de>; Wed, 27 Aug 2025 08:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1D83074A0;
	Wed, 27 Aug 2025 08:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="obuped9r"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925CE26E140
	for <linux-next@vger.kernel.org>; Wed, 27 Aug 2025 08:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756282649; cv=none; b=MoeDthjtPSVSbVLUxYYKU+5EficmDe23rsnLIXzMvKF4vP8bREvWwgjehD94jhQm6vtihcu6A0pmg/MzRtgcPxCHY7j5p+IR9egmr9yaf+NjBU2+dpHOZJH6JgJobfO7SY/1E7S46QEZUegFvEAW7d+TpBbic3o8aw+r9+oRtSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756282649; c=relaxed/simple;
	bh=ini/Dg/qMFzbwNKKWsndLioGgin9QxvTIdp1lM1/knI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0mCjhp2WMnWTv8OhWxDEQdKZt4JUhLf4BQ7lGXCgHNf2w/3SDJ7o+oVmpjFpob5IUxM5tlSFfre9ZtfKL1rXwCZYLYMdoI9AZ87a1ckgyn51hJYp3zpIupS+GST8bv/FNz5/J0uPNeFC1CB8Zd7RHzGOz9YqBtIS8gibqeYiC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=obuped9r; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32326e20aadso7571060a91.2
        for <linux-next@vger.kernel.org>; Wed, 27 Aug 2025 01:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756282647; x=1756887447; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rw6pFx8vb3qCt0eWgbwwuAkBawJ8J17IDZtKMfIRe0c=;
        b=obuped9rbSfrUg7Okvj9eClcN01eQD3HeGjusSPYhbeuFw8xltyElp4/hfJhH5iBvM
         8LDYDIfJQAihp7GxsnhGVU2spdInwgqELRbkQ8vA7Dx1fZBUHpic1XkwagU2aORPXgsm
         rPCZB8OG2yxyYGwGnhI8M9kHaD846tvGBAU2lTicxIaKXasp7eEdbLKGG6rNGQswHutp
         tYO5vexSrJOPoqSoXrUICB+gutExOkMZSa0gDyMaZY4LFM3UsQs34UdBZkhURk10D9V9
         Kz0sGcQnLlAY4k3PPC7+HZcP5N7F4PkH10ZLTfqGayQu/gVb7MgO+otRiA9hjnlEh1mm
         RzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756282647; x=1756887447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rw6pFx8vb3qCt0eWgbwwuAkBawJ8J17IDZtKMfIRe0c=;
        b=j9DNzOcPTq61XSlZkdESArZiArETL2RixdTFNfGcBgA0/eeF4xZtojH/9Imk5GZplF
         dxeP/KnElFx7tCJ1IU35TSEEdSpWDr6+u3t0uCP6vataM3rkkIzlU7TtJ14YFGteQ+Zg
         m6NB+GCSSZZhAPcKfz64DdjiygPUjqUbFS9u/7KMmvWmsbM4/PoCmCFcZs3D2j3Dn2Li
         ukttSgzaegKdzFsIg1tHxcxSHGVJU4OuB7Ubq1sLvYwzf2GaPOOBjISwqT6b1bk7AFe/
         aOaz0A2qGTSK+b3VesdIU61N5+zbqmNvp9c8Snp1rmvjr4gBnw8lN7dAGNX0/+1+DVk8
         nLfw==
X-Forwarded-Encrypted: i=1; AJvYcCXWBTYrj16o14jMyBmwOj2sez3qAtmnFqTEWLV5kUiwesjmPpa71GIKNxJmyA/gExY6A3WoVGpak2LT@vger.kernel.org
X-Gm-Message-State: AOJu0YzkSR/5LbKbcIqqqAEqjsz+9VM/4ck1v7JXLuemK7kpHpBwoG/2
	RUFbHjmq9PFRO40hgBoymfSpbPhmhe2IKDFCUVnjmkB/L6x5FSmjHypGvji4ySIDL4pionTAsP1
	fC9EdvyDidOH55TOZOgxOwfMkQgfuWIRMbGSJqEw3Ow==
X-Gm-Gg: ASbGnct1w9+baPsUa/ooNG9vD5AyRTbUWktEfM65OTevRoFcoKDdXQiSLXXLp/OTNHP
	4UncxL0o4t+qd7r7bzEVrUbR2nRPMPePm39AZd5/UBl/m8jyy2jSYwRyJYozLRwH+jJorwDuVHP
	v9Ct297WOCe7vgiy+m5ew4YFTgbgcyk4hIW9JuKjPMdGsH5Qo8zZq0p4JnJe/+adMZuDG1f+CBZ
	F8wSF37ywj+A58P6tjffMDFrym3LUYgnH05R86M
X-Google-Smtp-Source: AGHT+IHXV0XIJbSOruANIhEDSo4ztOVg47pK0P0Ye2hoQsvKDAy3OuT0JReOys0s//MIC3rIMXgdY/LDTorvaRJkGgc=
X-Received: by 2002:a17:90b:54c3:b0:311:c970:c9c0 with SMTP id
 98e67ed59e1d1-32515ec1313mr22920541a91.22.1756282646397; Wed, 27 Aug 2025
 01:17:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813232835.43458-1-inochiama@gmail.com> <20250813232835.43458-3-inochiama@gmail.com>
 <aK4O7Hl8NCVEMznB@monster> <db2pkcmc7tmaozjjihca6qtixkeiy7hlrg325g3pqkuurkvr6u@oyz62hcymvhi>
 <qe23hkpdr6ui4mgjke2wp2pl3jmgcauzgrdxqq4olgrkbfy25d@avy6c6mg334s> <20250827004719.GA2519033@ax162>
In-Reply-To: <20250827004719.GA2519033@ax162>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 27 Aug 2025 13:47:14 +0530
X-Gm-Features: Ac12FXzvPaHx0Y-UEkNxm_tosSQU8r9fXEo91EwR-5NGfEUW74KCwisELg0mjB0
Message-ID: <CA+G9fYsAxq-RmU7fVSDQ8_B2Hm5NY7Q7=DUnqcpnt8BOtd0dUA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] PCI/MSI: Add startup/shutdown for per device domains
To: Nathan Chancellor <nathan@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, Anders Roxell <anders.roxell@linaro.org>, 
	regressions@lists.linux.dev, linux-next@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>, Marc Zyngier <maz@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Shradha Gupta <shradhagupta@linux.microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Jonathan Cameron <Jonathan.Cameron@huwei.com>, 
	Juergen Gross <jgross@suse.com>, Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Chen Wang <unicorn_wang@outlook.com>, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>, arnd@arndb.de, dan.carpenter@linaro.org, 
	benjamin.copeland@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Aug 2025 at 06:17, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Wed, Aug 27, 2025 at 07:28:46AM +0800, Inochi Amaoto wrote:
> > OK, I guess I know why: I have missed one condition for startup.
> >
> > Could you test the following patch? If worked, I will send it as
> > a fix.
>
> Yes, that appears to resolve the issue on one system. I cannot test the
> other at the moment since it is under load.

I have built on top of Linux next-20250826 tag and the qemu-arm64 boot test
pass and LTP smoke test also pass.

>
> Tested-by: Nathan Chancellor <nathan@kernel.org>

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

>
> > ---
> > diff --git a/drivers/pci/msi/irqdomain.c b/drivers/pci/msi/irqdomain.c
> > index e0a800f918e8..b11b7f63f0d6 100644
> > --- a/drivers/pci/msi/irqdomain.c
> > +++ b/drivers/pci/msi/irqdomain.c
> > @@ -154,6 +154,8 @@ static void cond_shutdown_parent(struct irq_data *data)
> >
> >       if (unlikely(info->flags & MSI_FLAG_PCI_MSI_STARTUP_PARENT))
> >               irq_chip_shutdown_parent(data);
> > +     else if (unlikely(info->flags & MSI_FLAG_PCI_MSI_MASK_PARENT))
> > +             irq_chip_mask_parent(data);
> >  }
> >
> >  static unsigned int cond_startup_parent(struct irq_data *data)
> > @@ -162,6 +164,9 @@ static unsigned int cond_startup_parent(struct irq_data *data)
> >
> >       if (unlikely(info->flags & MSI_FLAG_PCI_MSI_STARTUP_PARENT))
> >               return irq_chip_startup_parent(data);
> > +     else if (unlikely(info->flags & MSI_FLAG_PCI_MSI_MASK_PARENT))
> > +             irq_chip_unmask_parent(data);
> > +
> >       return 0;
> >  }
> >

