Return-Path: <linux-next+bounces-4525-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1419B49CB
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 13:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D784E2841FD
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 12:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6776B9450;
	Tue, 29 Oct 2024 12:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJ2VMfoP"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE9D621;
	Tue, 29 Oct 2024 12:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730205432; cv=none; b=ibNby7AoqDPaGdeVpJITA6S+WtXYoXqjFBb8pyJThogkejZ2XTeUdwLv0zzIVtJkmpkFkaxjjv7AjJasS2rDYQC4Zq9l6YTcSVlYDT7+RmFFoeF0ujFNwcEnzDmJS3PZxO9REeRv8byKP50YE9ATn9RVxmpxDoVfCoxk9swEbF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730205432; c=relaxed/simple;
	bh=ttfjY+MH9b+Ju9iZtq/mZxSsiobWmovANm+hl+qlmFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CfcWlrLYT/H+XYSsx5eFdSwzHSkSJGPFhLs43nYSQq7OzRmfhGtw1rECfmNTnSGEnOhA5+/vEU7CLIDLHmApSqJ2SOm4Hs102f/rZqXv5Pm1hIVd2T3awskME7t8ejSJJHFj8BY5pQoagfPBlyYz1wroBUMbnR03elkTjvXXex0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJ2VMfoP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA70C4CEE5;
	Tue, 29 Oct 2024 12:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730205431;
	bh=ttfjY+MH9b+Ju9iZtq/mZxSsiobWmovANm+hl+qlmFs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QJ2VMfoPOzC268MYZimuFH2P1Z8uH8jtg5uYjMvlEXGAVS9AW8UVIQAbKSkiwkOR2
	 erPJT2Daffm2kAIpZ8D1EY9M8Bj0NsjrqwCN93UE+maM6LgHT4A8v7r7tnqt1+4A8E
	 Y/QTEMT2HiFtyNNTUBg5ojfxeBqMhIuSOOdLf64bOQN3dbSQ/gHFjQddadgvrkrNkz
	 7sOWE3kNR2FA/ufx1RMXq03iR81XLE8R1P1YOI4za/wtjjHZilezlaJeFtSDX3Ng8/
	 zoUDRcJ3cm6G80IILYRq3tCNcw8a3yNcJAYylvhyeyfc4pHR6vqBLagKbDG2meiHiw
	 xlmh/X3YZVL6w==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53a0c160b94so6024011e87.2;
        Tue, 29 Oct 2024 05:37:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEhpYD7AAP2XEoE9fXq2hI0WqmUy8VncKYv3sdwVkMh+OVCf2b9WbtQsRYbhIHSTDBlPVqPqDi1AulxP4=@vger.kernel.org, AJvYcCVVLoPA90FuRDcglfzZmC4VXSVx8vtjgR8hKl4gjMoXg6FRDQX0J/L1JpJNbUA8rievRAv2wB9rqgQsZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVehYj/Q0Wr1S2XzwAzRva0Ap9ESuBVn7PMRtjkjz7LR1zom0V
	8BDEJVltbsXpY8tougAFo5s3KQNG++CImMARjRuP14om/Qcz2PHKvHL+ziuyVbilijCl4hAITn5
	7lblLiv/fWPhHc0DshDHmt5wRFw==
X-Google-Smtp-Source: AGHT+IH+kuW0ek6eDAn+WDsINzIleWLdW/Aik3w0TkprHENp2JQDHCcLJ19/23TTRWcbbyvwdCEyYSrnmKiP10rx/p0=
X-Received: by 2002:a05:6512:3b1f:b0:52e:987f:cfc6 with SMTP id
 2adb3069b0e04-53b34a321bcmr5723415e87.51.1730205430192; Tue, 29 Oct 2024
 05:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241029084338.194942-1-herve.codina@bootlin.com> <20241029084338.194942-2-herve.codina@bootlin.com>
In-Reply-To: <20241029084338.194942-2-herve.codina@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 Oct 2024 07:36:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKYdQa8RAdrUuwkUjZQHi=PbEKqN-ebPq=Yuj++mRtuiA@mail.gmail.com>
Message-ID: <CAL_JsqKYdQa8RAdrUuwkUjZQHi=PbEKqN-ebPq=Yuj++mRtuiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] misc: lan966x_pci: Fix dtc warns 'missing or empty
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

On Tue, Oct 29, 2024 at 3:43=E2=80=AFAM Herve Codina <herve.codina@bootlin.=
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

