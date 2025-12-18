Return-Path: <linux-next+bounces-9471-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3AECCBEE1
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 14:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BA0030B4C79
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 13:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41CFE3093D8;
	Thu, 18 Dec 2025 13:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lrwc1kYS"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC3F2F83A2
	for <linux-next@vger.kernel.org>; Thu, 18 Dec 2025 13:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766063177; cv=none; b=P1vpnImyijJAm6LAPJ21+izXQiNs83PfyMCdpx0BtGwVbJehfj2ahs5GvYZjAt/FKurIejElDI8j8o+TsnlhdgML0mq4wlmknWT+zxhAJqZE97nsqSm32gchN2a636LbyuDJSUUsDsjlGK9/zh5UILVnnSkHH8I5MA63Zsysapg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766063177; c=relaxed/simple;
	bh=RDENRrTIMOpS6t4n8a8XPUbOvNSXTxBzQuabFLD751g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7U6HIc1dbRWvMQ+fQpY3RbdalHE1nYbkklKL7otpim5/g5Ny5xslhxryFZE07FWEGlpH4KUjP100ViIPOaKNYYW5InBf77127gsnPOe6QXzwZUeX1qNgyGhzk1cZhkcXf9EKlIdyaSiUFdR3ADaAD4SLi+RPGmSIEE+2Fk71fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lrwc1kYS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE769C4CEFB
	for <linux-next@vger.kernel.org>; Thu, 18 Dec 2025 13:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766063176;
	bh=RDENRrTIMOpS6t4n8a8XPUbOvNSXTxBzQuabFLD751g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lrwc1kYS0UCOToYZiXsfRw0x/VTWHWM6KWCjCFjuDMzGni3JoPt2bRF97eK/I981a
	 8uqISxozdiG8BoTugYoNu53J8A3Za2s4+Vc3J3v/H1Kncw/RfPVJKhzycWsn2XCgZ3
	 0cSDTmUJE9EOquRsNvcsFZ188oidjEx4bPDeldpbi24ivOUpGm7Vxksv7YlKrHVTTk
	 il9tIA7swzwZtrT2hBq+Lhfy+NK/VP7fiV9A+s2inLxer9cTZ7gc44Mh4D3bbwtdK6
	 ZEM2fe9Z8EeQBWY1jpRXCnsJimlBqmg2+d2jlojcomr/rKebYP6HtoBEWKpkEwID8W
	 J8CMwwfHtQ2Wg==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b735487129fso107893266b.0
        for <linux-next@vger.kernel.org>; Thu, 18 Dec 2025 05:06:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVe70PGSejK4uJoSzdTToLf2fYav9oXLNFpoLvEHISC/msqnorFvAsp8wofbUC8CUUqidvE647SSr0u@vger.kernel.org
X-Gm-Message-State: AOJu0YwDuwVSOtqPpcyFakSoQYFxJq+Iosymsp2x6rrS0VyU0+D3MLrK
	3KbzGhZ6COg3OJat9pQ7+ytbPxJfdTt1Vdih/mgfHWRcA5i3aoY/hOAdgqQdJaL/im3vpM3PhFW
	Da7nyZSS2P+8dIw3sRw6icOLU3Mp20A==
X-Google-Smtp-Source: AGHT+IFyeSyUnQ3ctKcvIUDMIh9HedpGmevPZd5yBSb50oEGlKT4hKBPHNStcQVH1HgxiSoFuu4jO7ZNavrJ0NFs2zU=
X-Received: by 2002:a17:907:2d86:b0:b7d:22b1:2145 with SMTP id
 a640c23a62f3a-b7d23663146mr2229190766b.23.1766063175342; Thu, 18 Dec 2025
 05:06:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118143843.0046d6dd@canb.auug.org.au> <20251128161000.08b3ba05@canb.auug.org.au>
 <CAL_JsqJw+b=Ro1=cz7wMwwUdPr9eE3C=Snr0skYwTjn1RjX5cg@mail.gmail.com>
 <20251129093141.2d04c8ad@canb.auug.org.au> <20251216121924.07a826d7@canb.auug.org.au>
 <20251218211542.20a57515@canb.auug.org.au>
In-Reply-To: <20251218211542.20a57515@canb.auug.org.au>
From: Rob Herring <robh@kernel.org>
Date: Thu, 18 Dec 2025 07:06:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKTP3x+Z0=hYtzmuNBWc_Qjgvrr0zSjNcJMk9BxZLZvuw@mail.gmail.com>
X-Gm-Features: AQt7F2rZf6LHjbsvm30dIpHFrU6K83l_r0ieXsPX0nYgbFsJoPOrm3a4fglNn1s
Message-ID: <CAL_JsqKTP3x+Z0=hYtzmuNBWc_Qjgvrr0zSjNcJMk9BxZLZvuw@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the devicetree tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Matthias Brugger <mbrugger@suse.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+platform maintainers

On Thu, Dec 18, 2025 at 4:15=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> On Tue, 16 Dec 2025 12:19:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Sat, 29 Nov 2025 09:31:41 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
> > >
> > > On Fri, 28 Nov 2025 08:54:34 -0600 Rob Herring <robh@kernel.org> wrot=
e:
> > > >
> > > > On Thu, Nov 27, 2025 at 11:10=E2=80=AFPM Stephen Rothwell <sfr@canb=
.auug.org.au> wrote:
> > > > >
> > > > > On Tue, 18 Nov 2025 14:38:43 +1100 Stephen Rothwell <sfr@canb.auu=
g.org.au> wrote:
> > > > > >
> > > > > > After merging the devicetree tree, today's linux-next build (ar=
m64
> > > > > > defconfig) produced these warnings:
> > > > > >
> > > > > > scripts/Makefile.dtbs:20: .dtbo is not applied to any base: rp1=
.dtbo
> > > > > > scripts/Makefile.dtbs:20: .dtbo is not applied to any base: mt7=
986a-bananapi-bpi-r3-emmc.dtbo mt7986a-bananapi-bpi-r3-nand.dtbo mt7986a-ba=
nanapi-bpi-r3-nor.dtbo mt7986a-bananapi-bpi-r3-sata.dtbo mt7986a-bananapi-b=
pi-r3-sd.dtbo mt7988a-bananapi-bpi-r4-emmc.dtbo mt7988a-bananapi-bpi-r4-pro=
-cn15.dtbo mt7988a-bananapi-bpi-r4-pro-cn18.dtbo mt7988a-bananapi-bpi-r4-pr=
o-emmc.dtbo mt7988a-bananapi-bpi-r4-pro-sd.dtbo mt7988a-bananapi-bpi-r4-sd.=
dtbo mt8395-radxa-nio-12l-8-hd-panel.dtbo
> > > > > > scripts/Makefile.dtbs:20: .dtbo is not applied to any base: k3-=
am62x-phyboard-lyra-gpio-fan.dtbo k3-am62-lp-sk-nand.dtbo k3-am642-phyboard=
-electra-gpio-fan.dtbo k3-am642-phyboard-electra-pcie-usb2.dtbo k3-am642-ph=
yboard-electra-x27-gpio1-spi1-uart3.dtbo k3-am642-phyboard-electra-peb-c-01=
0.dtbo k3-am6xx-phycore-disable-eth-phy.dtbo k3-am6xx-phycore-disable-rtc.d=
tbo k3-am6xx-phycore-disable-spi-nor.dtbo k3-am6xx-phycore-qspi-nor.dtbo k3=
-j721e-evm-gesi-exp-board.dtbo k3-am67a-kontron-sa67-gpios.dtbo

FWIW, the fix for this last one is in next.

Still waiting for the platform maintainers to pick up the other 2 fixes...

> > > > > >
> > > > > > Exposed by commit
> > > > > >
> > > > > >   d8c8a575f5aa ("kbuild: Ensure .dtbo targets are applied to a =
base .dtb")
> > > > >
> > > > > I am still seeing these warnings.
> > > >
> > > > Patches are posted to fix all of them[1][2][3].
> > > >
> > > > Rob
> > > >
> > > > [1] https://lore.kernel.org/all/20251117211503.728354-2-robh@kernel=
.org/
> > > > [2] https://lore.kernel.org/all/20251117211306.725678-1-robh@kernel=
.org/
> > > > [3] https://lore.kernel.org/all/20251117211316.725960-1-robh@kernel=
.org/
> > >
> > > Thanks.
> >
> > I am still seeing these warnings.
>
> Since yesterday (I think) I have started getting these messages twice.

I can confirm that. I suspect that's due to some kbuild changes in my
tree to support "make arch/arm64/boot/dts/foo/" targets.

Rob

