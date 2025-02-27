Return-Path: <linux-next+bounces-5591-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DF1A48401
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 17:01:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C9993A4E42
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 16:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964DE1B4F04;
	Thu, 27 Feb 2025 15:56:18 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE1C1A8F71;
	Thu, 27 Feb 2025 15:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740671778; cv=none; b=KBJ6hpNsdxNcvYW51tsYOHKdzUxMceqKUwPPly23QTQVusvJPzDnxXAqwdBk4dZESjgG8B0NLoOOi99dtx1TQQOTOnAQRPMrDnK/ZZ9BjjcuK/wXCsEu/d5RMYPJ/Klu1WyzWwuP5gp7zo3mKFv7GYWgTLVPt3P/QfOM05YTiVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740671778; c=relaxed/simple;
	bh=O31QWsWhEdJPcxEfijIzjG4zqGpZGtPaBd21f/eiGz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WrEtQVm7jIFd/QyrEKlzdcP/Qsb/BShMauEXph/KNlv/lRCzKY+NWhTE+oXm8T2Ga2vSomVOYlbCgejy4BAde93UzEfmrI0pcspcPn0yLO2RRyL9PZMjXqf11F6CKsQQddh0qaQsEu1maScdjnfS4twyJ+FUWEiYraguSBSuZUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-521b188df16so517184e0c.2;
        Thu, 27 Feb 2025 07:56:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740671774; x=1741276574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aFJ5Eia6UibVOcRma6ZeIYR+6LZRfE7cEm85FyS86v8=;
        b=DPR38MHLIj2RKOoar/khWj4wVBbjZ2rdaH/z3Htw75YqVwXURQ1UWAYLYRsJfPy0Cf
         rwxdrDCfIAqE9+zcrhJrEX4oEptxJ3nFKQi3+W0zF1LquMn+wrJTGGbS9h8ALrwM/HCS
         elfOKONa+CvJ5h+0Ly4IOhGgw1xOXSfPnIx4pTvoTIwKJnieQBNFGJq6mUkHjHYoxtoZ
         dRqylaenXbrRTlT7byAKwFiECeK5Emmdn4n+nrr/tqGCl0VjGW10G6z0aN6wxF9P5h1w
         hz793neQx62Fqj/Kc00PmCF/u+bypb70/azJl1F3eNRddiP36r20gkRB5T4O0LspKmk5
         TU6g==
X-Forwarded-Encrypted: i=1; AJvYcCWhz6Iui7xFuvEF6j7nTp6r85/mPMj81PginvlUOb4g5Fl9YieAUBQTNlVXbEzUvWJ90ZOAruL70EwAbw==@vger.kernel.org, AJvYcCXIwHfLnrPMSAEbYBWGXgeOKQDmFeu4zQrZ3WQmweh1QHttxPqvzju11CWQ8kZlX3KDk2k7FSkzQ42Z86Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhrimHh0zYR6sA30wU1ogY/UnwPN9MmPFnKZsBUmL5xQpqMvk/
	mhtZpKweFwYqpgttIxPW8IjeO7FVld9n6eZQdVRZDCYQC+JJrgk2pJ9eDHT5
X-Gm-Gg: ASbGncvbBoAc9mprew3xfLkhGFoV8JnpzScwD5Of1Sc0Z80yVtBPWDK/hpf0Ybtjuzy
	xA2h8Bn8ECj28kNx5cXJy4HFp20TOhERfOp4WGUYgXS0faJxsCJLrWJ3ZTRrAnuV713JvsUaesm
	8nbS1JfM2iwEaqtFvqNJ7jolez26UkmuBfrU0UlbVaWJabKAPs1uTnOw/FeILF7UO4zVN/9C4sJ
	uPDhBP2tS7uZ2+NaYr0KEp7lKAMNog4Bl9eSU4wGCDr18PP5RZ2KFvkMAweGTpp+svkXUHm3dmc
	VYqM8KIMqPNzNR+zfOGbdqb2J4teGSgFawT2I/ErOY0AHTX1MaLJddIqo6aoyA6q
X-Google-Smtp-Source: AGHT+IGxxlttTFCzENGmbpmzgvG/XLbXV6mK9EjKBexXbDOoGO2AwYMonkV7I1J2ju1h0Fnc8qlWag==
X-Received: by 2002:a05:6102:3e06:b0:4bb:e8c5:b172 with SMTP id ada2fe7eead31-4c00ad1da62mr7547632137.8.1740671774493;
        Thu, 27 Feb 2025 07:56:14 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c03464628asm297107137.12.2025.02.27.07.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 07:56:14 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86715793b1fso483446241.0;
        Thu, 27 Feb 2025 07:56:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+gsUyMHsOwrnfOg6Qkg9o3JXVPvQaHJsKuILF7agDjzoyJMI4T6pnDBYZK5lAXytOFNS5QktjXvYnN8U=@vger.kernel.org, AJvYcCVFc+oFc0JzgqtlZK1cac7qAkZLNbnla0bA/cC2CL8E2ng8M1cJeJJrJuRxZNeprDBqhYH4JRh8xPK8qQ==@vger.kernel.org
X-Received: by 2002:a05:6102:f0d:b0:4ba:eb24:fb06 with SMTP id
 ada2fe7eead31-4c00ad18a67mr6802085137.6.1740671773909; Thu, 27 Feb 2025
 07:56:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220113338.60ba2290@canb.auug.org.au> <20250224122318.228f695c@canb.auug.org.au>
 <20250224162048.7806bb1d@canb.auug.org.au> <CAPDyKFqBwari-MoRefG82kbxovVaLt3ewRVFihHoLbrOSWSnMQ@mail.gmail.com>
In-Reply-To: <CAPDyKFqBwari-MoRefG82kbxovVaLt3ewRVFihHoLbrOSWSnMQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Feb 2025 16:56:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQK2+-FaqK6FJWPYrS1TfASfZaJ0-VJBLdB53MZY_rxQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrjHlAbuysEEVA6IxbSRvlU9EscxxV1nIJdocuB7VXlKkNYNBw7_Ofvd80
Message-ID: <CAMuHMdXQK2+-FaqK6FJWPYrS1TfASfZaJ0-VJBLdB53MZY_rxQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pmdomain tree
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Shawn Lin <shawn.lin@rock-chips.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"

Hi Ulf,

On Mon, 24 Feb 2025 at 13:27, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Mon, 24 Feb 2025 at 06:20, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > On Mon, 24 Feb 2025 12:23:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > On Thu, 20 Feb 2025 11:33:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > > After merging the pmdomain tree, today's linux-next build (x86_64
> > > > allmodconfig) failed like this:
> > > >
> > > > x86_64-linux-gnu-ld: vmlinux.o: in function `rockchip_do_pmu_set_power_domain':
> > > > pm-domains.c:(.text+0x19aa103): undefined reference to `arm_smccc_1_1_get_conduit'
> > > >
> > > > Caused by commit
> > > >
> > > >   61eeb9678789 ("pmdomain: rockchip: Check if SMC could be handled by TA")
> > > >
> > > > $ grep CONFIG_HAVE_ARM_SMCCC_DISCOVERY .config
> > > > $
> > > >
> > > > I have used the pmdomain tree from next-20250219 for today.
> > >
> > > I am still seeing this build failure.
> >
> > And now that commit from the pmdomain tree has been merged into the
> > scsi-mkp tree and so the build failure happens there as well.
> >
> > I have used the scsi-mkp tree from next-20250221 for today.
> >
> > --
> > Cheers,
> > Stephen Rothwell
>
> Stephen, thanks for reporting and sorry for the delay.
>
> I have now fixed the problem on the next branch as well on the
> immutable rockchip branch. Martin, please pull again.

So this was fixed by adding a dependency on HAVE_ARM_SMCCC_DISCOVERY[1].

I am no Rockchip expert, but is this the correct fix?
As arch/arm/boot/dts/rockchip/rk3036.dtsi uses enable-method =
"rockchip,rk3036-smp", e.g. RK3036 does not depend on PSCI, so I assume
you could run a kernel without PSCI support on RK3036 before?

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git/commit/?h=next&id=bc4bc2a1609712e6c5de01be8a20341b710dc99b

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

