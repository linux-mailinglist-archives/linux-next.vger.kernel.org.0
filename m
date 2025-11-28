Return-Path: <linux-next+bounces-9265-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF8BC925F4
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 15:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E50164E19AE
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 14:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC1F271448;
	Fri, 28 Nov 2025 14:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NmtYOEM1"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C692309B2
	for <linux-next@vger.kernel.org>; Fri, 28 Nov 2025 14:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764341688; cv=none; b=EIj6k8MW6FWt4lwMMqV2qJ9H2Wa+MLIa453rbNo4d1wsp9yjzd3dHZb4bJWeSx1UZ9s6p1VPjtfj7KdaBzwFnlRLUNdU5vYRRtCvW4bzXb6fjtWbuxm/G6TVhNvrveFgSornXoqM5gvU30AInuVkegxI8o/rfNrKozZQ2ZP7vwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764341688; c=relaxed/simple;
	bh=lhFfZSSgpjZVC7wmNvNdJH4NvqGmgwr20Q11Njcu06E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ih1ZUuRhKN9BX6q8U0N1t7Ke7I0urpL6qskPoRFZov4IKG8/hdukW9oZWbmOsJVaRmuX8W+BTeyuHuH9mce6QLV+WxZohtEMCUQsy12UZIWNjgWNIoH/mERNVZ39KbelDiYTo/HiGynkjOrmBHI5ZEojYQ6cRHZMFN5BbUbKfQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NmtYOEM1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2540C4CEFB
	for <linux-next@vger.kernel.org>; Fri, 28 Nov 2025 14:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764341687;
	bh=lhFfZSSgpjZVC7wmNvNdJH4NvqGmgwr20Q11Njcu06E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NmtYOEM1+UvmyqTYF/cQmV/N4dc4jnOQ/W/FT/umxfJEja0z6x46SCqSuGu/0ijQl
	 CmGRNYGmoM0J6A4G/T0dYSJsBDKIN8n70zpo1juULxr2TusFOL9EQv6Q9xQULwr71f
	 lOyAjMUBjSeIWSxtdJ8Y3rxzXq0ic4efUhQgVnPdf1XR+GPA/jOdYacPKDpAiy1I+q
	 bYUYKB1SN25R0okqnQRNVs/HyhUen3kW16qqmYctNguZlDhvwHwNyTKjkjCbfoqzrQ
	 6E6nQfPBOJbWOI7K0j5s9urYYFLX1R++9mYN2te4VQVH4fVNmEbVHLfPNOiq6TtFgz
	 bhnf/jgAo/RDw==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b736cd741c1so320095566b.0
        for <linux-next@vger.kernel.org>; Fri, 28 Nov 2025 06:54:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXY0YudbZtGSVCXVEPFAxhcnNNCCXW/iOLCsDOYCP8m767ztNiz6QsrGGgXUhBKS+JlUmFzo7jPtT3V@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu5fp4s7MWN2+TZ0y+vbDrteMtg2ejRPHOIVmnCegDKlssJR7/
	FZX/+hMvFbRB78c4jKaoXYLIJ7mQOebA1/WqrvHkrcAND3JBX4GecbElokGAeCZXpodqSclOSQO
	Ub+JjYmLjvHCzk3cJHQJMIBnq+Gx9Fw==
X-Google-Smtp-Source: AGHT+IFsy9wcjwRX3t4Jwa3Hd3+tqtG+edCByW1b7sklYzjRr+ux8cEZSFYk1gOxNXO3kHBI8663IwoFUb9/9EOw8fc=
X-Received: by 2002:a17:907:7287:b0:b73:9fea:331c with SMTP id
 a640c23a62f3a-b767170aec0mr3183483166b.47.1764341686264; Fri, 28 Nov 2025
 06:54:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118143843.0046d6dd@canb.auug.org.au> <20251128161000.08b3ba05@canb.auug.org.au>
In-Reply-To: <20251128161000.08b3ba05@canb.auug.org.au>
From: Rob Herring <robh@kernel.org>
Date: Fri, 28 Nov 2025 08:54:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJw+b=Ro1=cz7wMwwUdPr9eE3C=Snr0skYwTjn1RjX5cg@mail.gmail.com>
X-Gm-Features: AWmQ_bkJydiNCHhbxw-fCj9dwpCci_D54Zd3DVO50w4XOFgLWVs8yFK16Utk1Go
Message-ID: <CAL_JsqJw+b=Ro1=cz7wMwwUdPr9eE3C=Snr0skYwTjn1RjX5cg@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the devicetree tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 11:10=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Hi Stephen,
>
> On Tue, 18 Nov 2025 14:38:43 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Hi all,
> >
> > After merging the devicetree tree, today's linux-next build (arm64
> > defconfig) produced these warnings:
> >
> > scripts/Makefile.dtbs:20: .dtbo is not applied to any base: rp1.dtbo
> > scripts/Makefile.dtbs:20: .dtbo is not applied to any base: mt7986a-ban=
anapi-bpi-r3-emmc.dtbo mt7986a-bananapi-bpi-r3-nand.dtbo mt7986a-bananapi-b=
pi-r3-nor.dtbo mt7986a-bananapi-bpi-r3-sata.dtbo mt7986a-bananapi-bpi-r3-sd=
.dtbo mt7988a-bananapi-bpi-r4-emmc.dtbo mt7988a-bananapi-bpi-r4-pro-cn15.dt=
bo mt7988a-bananapi-bpi-r4-pro-cn18.dtbo mt7988a-bananapi-bpi-r4-pro-emmc.d=
tbo mt7988a-bananapi-bpi-r4-pro-sd.dtbo mt7988a-bananapi-bpi-r4-sd.dtbo mt8=
395-radxa-nio-12l-8-hd-panel.dtbo
> > scripts/Makefile.dtbs:20: .dtbo is not applied to any base: k3-am62x-ph=
yboard-lyra-gpio-fan.dtbo k3-am62-lp-sk-nand.dtbo k3-am642-phyboard-electra=
-gpio-fan.dtbo k3-am642-phyboard-electra-pcie-usb2.dtbo k3-am642-phyboard-e=
lectra-x27-gpio1-spi1-uart3.dtbo k3-am642-phyboard-electra-peb-c-010.dtbo k=
3-am6xx-phycore-disable-eth-phy.dtbo k3-am6xx-phycore-disable-rtc.dtbo k3-a=
m6xx-phycore-disable-spi-nor.dtbo k3-am6xx-phycore-qspi-nor.dtbo k3-j721e-e=
vm-gesi-exp-board.dtbo k3-am67a-kontron-sa67-gpios.dtbo
> >
> > Exposed by commit
> >
> >   d8c8a575f5aa ("kbuild: Ensure .dtbo targets are applied to a base .dt=
b")
>
> I am still seeing these warnings.

Patches are posted to fix all of them[1][2][3].

Rob

[1] https://lore.kernel.org/all/20251117211503.728354-2-robh@kernel.org/
[2] https://lore.kernel.org/all/20251117211306.725678-1-robh@kernel.org/
[3] https://lore.kernel.org/all/20251117211316.725960-1-robh@kernel.org/

