Return-Path: <linux-next+bounces-4491-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D6D9B3243
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 14:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47F841C219CE
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 13:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1CE61D88B1;
	Mon, 28 Oct 2024 13:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnGlkqp9"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999EF1D2B1B;
	Mon, 28 Oct 2024 13:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730123739; cv=none; b=rW/1ASUkvWLDJSmVCfsBtQZSU7PazAzkQaUNw5keheX0PWbMM6rOL7wO1ExGAuY9oeLZBhbdFEwVgOSnlRQAIRxQLDNjJTALt2mxgfYQLpQ5IOLLNkhZwqx/7dGDu0pS2Y4efHja7Tzx2aWcNrmD0TMruS7FwZgBiqJ8mQ1LfW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730123739; c=relaxed/simple;
	bh=BEk4y2/bGFKxgt2PDJf8zrNHnZDu0Zz5bDwWK372opI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OxD9rcSd1TXTCo5fRdmstORtwAFc19DdGDUCcKvmd5brpeN6vqpv2ReYkQQSHwmOmTu01xPlFTb7RtjRs4R7ed74QMR/0GBx0plrtU1fLySQq4JyEC8GBErCnPyj6T3+zR/FvoL43yQjW4HWVt9KYuANAunt4r70xFdhXci8Zcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnGlkqp9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46005C4CEC3;
	Mon, 28 Oct 2024 13:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730123739;
	bh=BEk4y2/bGFKxgt2PDJf8zrNHnZDu0Zz5bDwWK372opI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TnGlkqp9dLeRqx7yZE2IAajYzIfUvrdIuDGOCRw3key5ItDRDc+uV1m4DVVf/m3Ln
	 wCnygrF+Tyj3Bat3Q8GMSf+jQa0SUDl6Z91gjIuyBB4ZKFqvGBAQbQtRmo+ORqkV2a
	 CHxXga/oINXoh5fqlQNVLrHeaWd9B4bQ1xDPpb3tMTiEz1GZonmUGvXGZy7tTovZAJ
	 TuJLI6jDoVdE1WWwDdYHl60mqPRPkZ0VIihhIePOYAr57yN6RR4WTnIubduSAHNvbG
	 e9VJL3nb2XB2OlF8CWNTxteWIbszAaTpdqW9Zme7HF4oyVuzYx5tcpLvXyqBVbXdPg
	 zScHmXnYTzCow==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539eb97f26aso4314608e87.2;
        Mon, 28 Oct 2024 06:55:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUx4k+ICCRNobTOwKapo9L9CUVNrT1NngfjVYZRHREH2XCue2DMyCMzlJ2mcSvDhkLPSBjoCkpBIYKofCU=@vger.kernel.org, AJvYcCVliRE25n4fO3RmBSOGV0mP7yzKnj8lCeqv102RF+F5BDnUq/MP5GulLsJ1TATJzKB6E0g7xtORp+1zpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeOI5zP94pU3uzYR5DY5GsGEx8EbzEV/ci2bi9YrFrLHft4lni
	CRMGhMDzFpWBgNCz/YB7HCcHZ3NPZ25VVf3jvoRrkWaOHvjfj2/tGJ7YmOqi4MBUWeo3wQmuHLg
	FDF/vRS1+UOqL2fY1q3CS7k23Jg==
X-Google-Smtp-Source: AGHT+IGBxw44WtOzb+AQgGTABKdQ9A/JFueQ/3Y5biiY0CiTz2i/poJamA5/AH6uLfebQodVKzYUYP/2ERmhVllkL/A=
X-Received: by 2002:a05:6512:32c6:b0:539:ee0a:4f8f with SMTP id
 2adb3069b0e04-53b3491cd35mr3163351e87.44.1730123737670; Mon, 28 Oct 2024
 06:55:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028122405.27090-1-herve.codina@bootlin.com> <20241028122405.27090-2-herve.codina@bootlin.com>
In-Reply-To: <20241028122405.27090-2-herve.codina@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 28 Oct 2024 08:55:24 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK7SjfJ7Re4k-A8fQB+tNHyM3r2Rcpct_zUfR2yhEj+iQ@mail.gmail.com>
Message-ID: <CAL_JsqK7SjfJ7Re4k-A8fQB+tNHyM3r2Rcpct_zUfR2yhEj+iQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] misc: lan966x_pci: Fix dtc warns 'missing or empty
 reg/ranges property'
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
> dtc generates the following warnings when building the LAN966x device
> tree overlay (lan966x_pci.dtso):
>   Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/cpu_clk:=
 missing or empty reg/ranges property
>   Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/ddr_clk:=
 missing or empty reg/ranges property
>   Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/sys_clk:=
 missing or empty reg/ranges property
>
> Indeed, related nodes are under the pci-ep-bus (simple-bus) which is not
> correct.
>
> Put them outside this node.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20241025110919.64b1cffb@canb.auug.org=
.au/
> Fixes: 185686beb464 ("misc: Add support for LAN966x PCI device")
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
> The referenced commit is in the reset tree
> ---
>  drivers/misc/lan966x_pci.dtso | 36 +++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dts=
o
> index 7282687df25f..5466d013da7d 100644
> --- a/drivers/misc/lan966x_pci.dtso
> +++ b/drivers/misc/lan966x_pci.dtso
> @@ -19,6 +19,24 @@ __overlay__ {
>                         #address-cells =3D <3>;
>                         #size-cells =3D <2>;
>
> +                       cpu_clk: cpu_clk {

Preferred node name is "clock-<freq-in-hz>"

Also, as a general rule, don't use "_" in node names (and properties).

Isn't there a schema for the device which needs these nodes added to
it? If not, there should be.

Rob

