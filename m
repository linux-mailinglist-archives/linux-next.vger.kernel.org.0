Return-Path: <linux-next+bounces-5593-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEF4A48627
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 18:05:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 337767A21ED
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 17:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A7F1D5AD3;
	Thu, 27 Feb 2025 17:05:36 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3831AC435;
	Thu, 27 Feb 2025 17:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740675936; cv=none; b=tE/52Yu88acYh59FHdjL+AQxWhV+88gTQQR9PKP331NUpY0Yjmo35F8+76EGY3NAZv9jVGuwpb/Bn+KGntTDXp2M0MeVe+QFzC1anCwr0bOuuWhvU1wazLch+RFFJSJK1H2sJHONoguFeyygG4L7dCWkm1gHyXjjt8WFS+u3+qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740675936; c=relaxed/simple;
	bh=1tZSLN4X+l32NGHBqbq/zSf3s6/20SE6aOLhpRj9kIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWl3/0xbCi/V6mVek0R//lwXA4PzbhX1kN9LZ+y4kLGAnW1wxOniJ1FMeuXqUprQmOSyjn7yzUklnJznznEk/PNxgz0cazqGQszs1BNmCZ14zIpMZ0yyyXYFLDbx8qyZ19OR3FiINAaQ+Goumpad9xCmmDvzVO6dxABvvYs6LAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e89a2501a0so6420106d6.1;
        Thu, 27 Feb 2025 09:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740675932; x=1741280732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACi7nERFPWMWiBfUXY4B9J4MEAONq+xaiL87Es4sw0U=;
        b=pTBQz0+VXLc0llaDuGSlKwoy/7rjK9k8Hs+0h61AqsJ3b3j+KsPmwHtvyTjBliI/OO
         H072IwW1k4NwGvj8nU1viP7YSIUyMyhay6XSvH9r0ssNW16KMgt2v7/8h7/9EKev/bNM
         fq6FPWTaqcd2jEpnHOE8bI39dhO+u7TqEBY4TDOWo1IE7v601z+F9wDQuzsahK+B5TYK
         s6G1oKMegVa96TUQ0OtxHNpXu/P/I+4Rk+lbd0/IB00Yw5ejJCA6OgXwzAOPJsWwVjN4
         wHmaIOcWfG7NQE2T/qZXJ3ywbGXOip5AlNmg747Kxjnk1syEMAyiee0x4+HNvBYE2Yrl
         fgWw==
X-Forwarded-Encrypted: i=1; AJvYcCWM7FVyzlNmIgdPHtMDbjQ0x9OjKN2mB974lAPQ8l6/L7OnnFPjLIg57BadPPuXT6wKIBKZ1+XKOcMVew==@vger.kernel.org, AJvYcCWeF+vFukdWTRnEjLKogMOhSXPFOWiY7Kda8ErbFCZs7cHoRGR+V+gUHYk29l07VGX6uaDWP7tb327y8l0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsdzO188PKFd0G5a7dui17J7dAl1X2uGr7QVujng4DGPvvnUD2
	ojHajyg63SvetdtAARyTUBOf37aOqKSfv5Mv/yiyfFpkypLMbr5IbuXQ5oRq
X-Gm-Gg: ASbGncu2nrLlfkENFvUwX3QviLkI5g+Qp7BtWo2cr1FNjwvqw8cyYgn695295NS9SYK
	Qc0P/HMUQ5yswINgojjjsAlLvaIwmFunhSlAJj3PyIoTGhnFE8+JJwHCh2K+AadWYwAuVel5hrN
	1cuZNRjtBHaV13GeSrdPdzgQYpNqkvlhoG2xC5oYkdy6C+ZByDMd8cN5i3ykrHStZM/Qu7O5eXP
	yc79tXDj9VDekYqZ9PlyDxua0kA4iv5RkBiSVeQpMrmhHEQtJsu1M+98RD+4wAXh/fmTllkOMAx
	qVo3jmC8FMDRe/6khkyyBOtpitcJlE8rsWQKrXGESgtOYBvTOXFoGAxBtxAuDOpFj/0U
X-Google-Smtp-Source: AGHT+IGt2870N0U7Cr2YaCx2fitE4hO3Dn1nv6OV2Cw7RFDFw1CmLdrZ6tbrUa7qPOrXVF0McxSnZg==
X-Received: by 2002:a05:6214:500f:b0:6e8:9c3b:af08 with SMTP id 6a1803df08f44-6e8a0d6d748mr2650426d6.30.1740675931856;
        Thu, 27 Feb 2025 09:05:31 -0800 (PST)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976da639sm11649136d6.116.2025.02.27.09.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 09:05:31 -0800 (PST)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-47208e35f9cso13812041cf.3;
        Thu, 27 Feb 2025 09:05:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwux9BI5EULfcPXLxvGrEe8/UYSqGDOG0I2v7MEzv6yRAxj1jYJ1eoSey7O2InHB6TyM7swdB7eDcRq7I=@vger.kernel.org, AJvYcCVYfKZxyCxxkf5AzrkyYiTCVTnKMbv4p23ynRhcbld1N593eDnOlRHHpK9wFcZ73rgkDojVMfyaYRw4jQ==@vger.kernel.org
X-Received: by 2002:ad4:5eca:0:b0:6e5:a0fc:f663 with SMTP id
 6a1803df08f44-6e8a0acbcccmr3656746d6.0.1740675930964; Thu, 27 Feb 2025
 09:05:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220113338.60ba2290@canb.auug.org.au> <CAPDyKFqBwari-MoRefG82kbxovVaLt3ewRVFihHoLbrOSWSnMQ@mail.gmail.com>
 <CAMuHMdXQK2+-FaqK6FJWPYrS1TfASfZaJ0-VJBLdB53MZY_rxQ@mail.gmail.com> <15141602.O6BkTfRZtg@diego>
In-Reply-To: <15141602.O6BkTfRZtg@diego>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Feb 2025 18:05:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU102nhmHoxo+z2XCxNf+gLFuBnAZamtW+V=WjKFX9rjA@mail.gmail.com>
X-Gm-Features: AQ5f1JrYTz4pgiQMro2bimmhPKLQZRU8C5t7-vnLd2jGJdIsD8fGO4kgjg7FPho
Message-ID: <CAMuHMdU102nhmHoxo+z2XCxNf+gLFuBnAZamtW+V=WjKFX9rjA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pmdomain tree
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On Thu, 27 Feb 2025 at 17:16, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
> Am Donnerstag, 27. Februar 2025, 16:56:01 MEZ schrieb Geert Uytterhoeven:
> > On Mon, 24 Feb 2025 at 13:27, Ulf Hansson <ulf.hansson@linaro.org> wrot=
e:
> > > On Mon, 24 Feb 2025 at 06:20, Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> > > > On Mon, 24 Feb 2025 12:23:18 +1100 Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:
> > > > > On Thu, 20 Feb 2025 11:33:38 +1100 Stephen Rothwell <sfr@canb.auu=
g.org.au> wrote:
> > > > > > After merging the pmdomain tree, today's linux-next build (x86_=
64
> > > > > > allmodconfig) failed like this:
> > > > > >
> > > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `rockchip_do_pmu_se=
t_power_domain':
> > > > > > pm-domains.c:(.text+0x19aa103): undefined reference to `arm_smc=
cc_1_1_get_conduit'
> > > > > >
> > > > > > Caused by commit
> > > > > >
> > > > > >   61eeb9678789 ("pmdomain: rockchip: Check if SMC could be hand=
led by TA")
> > > > > >
> > > > > > $ grep CONFIG_HAVE_ARM_SMCCC_DISCOVERY .config
> > > > > > $
> > > > > >
> > > > > > I have used the pmdomain tree from next-20250219 for today.
> > > > >
> > > > > I am still seeing this build failure.
> > > >
> > > > And now that commit from the pmdomain tree has been merged into the
> > > > scsi-mkp tree and so the build failure happens there as well.
> > > >
> > > > I have used the scsi-mkp tree from next-20250221 for today.
> > > >
> > > > --
> > > > Cheers,
> > > > Stephen Rothwell
> > >
> > > Stephen, thanks for reporting and sorry for the delay.
> > >
> > > I have now fixed the problem on the next branch as well on the
> > > immutable rockchip branch. Martin, please pull again.
> >
> > So this was fixed by adding a dependency on HAVE_ARM_SMCCC_DISCOVERY[1]=
.
> >
> > I am no Rockchip expert, but is this the correct fix?
> > As arch/arm/boot/dts/rockchip/rk3036.dtsi uses enable-method =3D
> > "rockchip,rk3036-smp", e.g. RK3036 does not depend on PSCI, so I assume
> > you could run a kernel without PSCI support on RK3036 before?
>
> All still relevant 32bit Rockchip SoCs (rv11*) already switched over to
> PSCI. So if one uses some sort of distro-kernel (or one simply built from
> the in-kernel defconfig), PSCI support will be in there already.

OK.

> So the only case where this is relevant, is for kernels custom-build for
> one specific soc type.
>
> The rk3036 (and rk3128) are from the same era as the rk3288 - 2014 .
> That's more than 10 years ago. And we're not talking about these old
> boards not working anymore - just a _possible_ size increase in very
> special cases (of not using any distro-like kernel).
>
> arm32 psci.o is 176kb ... and even my r3036-kylin board came with 512MB
> ram. So personally I'm not too worried.

My worry is not so much about the size increase, but about
CONFIG_ROCKCHIP_PM_DOMAINS becoming disabled when
running "make oldconfig" if CONFIG_PSCI is disabled.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

