Return-Path: <linux-next+bounces-4492-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A76E9B324A
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 14:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC7761C22069
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 13:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBD51DB54B;
	Mon, 28 Oct 2024 13:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfqAiIly"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63363191F91;
	Mon, 28 Oct 2024 13:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730123816; cv=none; b=QG3Kbh10ax10pAG607GvoT8wIsNZb1SbiRR13BpucSlD+51HcNRW9WCCtX63GKxxpJPK+OWwXSVBkWdpTEYm00iheiOE3+UBjjwNCBh8s3C0x7c+jokV/pI4adQv6wul1GjKIpnaw2ON1IoNWz/Bs2CvtzP5dRT5rSOQjsWeYds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730123816; c=relaxed/simple;
	bh=w2zEV9R6B3qSHnWHq7ai+qKl7JxuJaWiiHxpRdEWAJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R9m+nOkqtFsTad5cH2ISvp0cHSGYk85y5fR/m6uVNYrmNctB7217BCwVljKfqjnyT0ijakuJogk85gbpyC8YduuZFHnCxxHVf7CBX8rVlPtg1ZF2gCcE4YYUSbrT1DzneppVksZBC+zt5f7MCZml4OUt+BrCeJVgAW5bme4162E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfqAiIly; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD37C4AF09;
	Mon, 28 Oct 2024 13:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730123816;
	bh=w2zEV9R6B3qSHnWHq7ai+qKl7JxuJaWiiHxpRdEWAJU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PfqAiIly+pNSBOHvB2doCwSnDO6E/tN0W95plZM6B95FSCOYMGin4CQXdJYSguc6I
	 3/KbshXJCOjUrtYtHao4Q7B0CQWDG3sBUoHkAM7bPaLjndcXHxWh8UFj4IjLt+TxbA
	 TTev6jIt0TCC9yjlvWkqgiQHDpzByHRvU7kbvmywEVZm+GEThyiefXanJZAG9Rkc3h
	 eXxJw1zSLFdjAVpt0yAjD1T/001frZGTyZdN7WWYHHUSjsiWnj3y+DV4PYjfdM/e56
	 mwyVNwUrmmEPCzf2RVEPvLyYw7tYhh1gcL9BI8g3Yh1jd9soTmIM4FEunv3YKTGr1R
	 xhhd7/BuQCDHw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539e59dadebso5092214e87.0;
        Mon, 28 Oct 2024 06:56:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrwzCIChUX15yqfcURzEOzk2gCo/14/aH59wiUv1nMjCV8VwBi9orBRDvxCnshlfn1ubW1Ex6tryr6R0I=@vger.kernel.org, AJvYcCWxOMzzFme1OqdFcquvwB/JwuL7gYe8jQ3Z19aTwQSLGORPqGdUD1ey5iyFZUTJHRSFPqcjFTD6PSsufQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3JLFEPWKkDxmBDkepf3B4+WrhW1caX6p7SWlVzUBBv3SPMaNF
	7MgTWSBxZZaB7qDyzFegKQCBozEI0dD1rCGJa03Qppl7VpboT/6ZkngCdxqKqJ+JmrDRvHaao85
	lYkXBrzI0tIcUiO29ZoyC5+c5sQ==
X-Google-Smtp-Source: AGHT+IFY0TufIGKFsh37080fzf3R9npLr8DTAgwH7Vp8VPARsO8sw1jEVwigFk5K5MfTti8T0RQu/Ztylb41+pL38jU=
X-Received: by 2002:a05:6512:3b27:b0:539:de9c:c890 with SMTP id
 2adb3069b0e04-53b34c5f9b5mr3091871e87.42.1730123814631; Mon, 28 Oct 2024
 06:56:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028122405.27090-1-herve.codina@bootlin.com> <20241028122405.27090-3-herve.codina@bootlin.com>
In-Reply-To: <20241028122405.27090-3-herve.codina@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 28 Oct 2024 08:56:42 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+doHunzxKroG7m+Ex4Cz-YSwQ7zW2B3tAPi_LFSBfJ_A@mail.gmail.com>
Message-ID: <CAL_Jsq+doHunzxKroG7m+Ex4Cz-YSwQ7zW2B3tAPi_LFSBfJ_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] misc: lan966x_pci: Fix dtc warn 'Missing interrupt-parent'
To: Herve Codina <herve.codina@bootlin.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 7:24=E2=80=AFAM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> dtc generates the following warning when building the LAN966x devicetree
> overlay (lan966x_pci.dtso):
>   Warning (interrupts_property): /fragment@0/__overlay__/pci-ep-bus@0/oic=
@e00c0120: Missing interrupt-parent
>
> The oic interrupt parent is the PCI device itself. The PCI device node
> is the node on which the dtbo will be applied and this node already has
> properties needed.
>
> In order to remove the warning, add the missing properties in the
> overlay fragment node. Properties in this node will not be added when
> the overlay is applied (which is what we expect) but makes dtc happy.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20241025110919.64b1cffb@canb.auug.org=
.au/
> Fixes: 185686beb464 ("misc: Add support for LAN966x PCI device")
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
> The referenced commit is in the reset tree
> ---
>  drivers/misc/lan966x_pci.dtso | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

