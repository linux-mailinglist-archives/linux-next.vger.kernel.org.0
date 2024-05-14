Return-Path: <linux-next+bounces-2306-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0838C5E32
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 01:54:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 325DA1F21B36
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 23:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45AF182CA0;
	Tue, 14 May 2024 23:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OpB8C0ff"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E00E1E491;
	Tue, 14 May 2024 23:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715730881; cv=none; b=dN9lOCXaQFWfBtFifqCOMXTfStK/R5cvnz0IRDWnQNL3H9vtWp2kLNu3LmyS0f8F1rf2ob0TtQ3F8O275lH+QqXLsw94foUc2MxIciOzc80nN9dJR5UCJaqXYsfy0m0j1odhNKr+524grWdPaPyyY7r/Hm0syJCb/LitqLmxxSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715730881; c=relaxed/simple;
	bh=RjP5Ogn2C9mvxZm6Q859Jv0aQl8vHKC+bNk1Sz+BJSU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KY+0J/EMrm9WflYpKWpSxGn/pvGkdzPHk7sISeeSTj63XTFDjO82mFa8hGsla4VyEDgw2ZuzXrsE9bwpL//hkekOimu9U2kUHhtmOSHlxk8kWsvfhQf3cvXM1h+UdH3SkKikqZlJASQ3PEw1eGoaI1B3XbmnRNFS6tWGWynESh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OpB8C0ff; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715730875;
	bh=n+Lj6oCKZ019keo2Ewz/8zUIR6HzYkwEXKlNxnkZGY0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OpB8C0ff3cgFfXrmQqi8aogA87b0vsi0795pE9F0noH3M0ABEDRaSwa7TNA5i43ez
	 QS1WhKFgsgPOfdVlqHeymSRixrNyMQ1EWL2WrXyg8Kq7rgu2KD4YTT0uAffUDe8lUl
	 xfIJI9O/M5ClqWfpO+nyu6svQIBe6x+pm3DotdBKahO4rgd1FIlgvYovXHE/e6s3nk
	 +x1xxzT75amgcTMDwpfytIIFJ2LLSwsBbr4UGx0klc2JViaTbhduyWkRnJ4ADEQaUh
	 Jv+/bxNgltinH9sUtANiLXvl+oYzet4tatryHa561dUJcF5nLkfsVwRTSNlbW0VYxZ
	 NBse3Pkvv6WTg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VfCrV6jh6z4wc1;
	Wed, 15 May 2024 09:54:34 +1000 (AEST)
Date: Wed, 15 May 2024 09:54:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the stm32 tree
Message-ID: <20240515095434.34aa60ef@canb.auug.org.au>
In-Reply-To: <20240514083304.0a8b368b@canb.auug.org.au>
References: <20240430110428.30432b2f@canb.auug.org.au>
	<20240514083304.0a8b368b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mAn=v9xJ5NGl6X8E47POOmi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mAn=v9xJ5NGl6X8E47POOmi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 14 May 2024 08:33:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Tue, 30 Apr 2024 11:04:28 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > The following commits are also in the arm-soc tree as different
> > commits (but the same patches):
> >=20
> >   0087ca056c73 ("arm64: dts: st: add all 8 i2c nodes on stm32mp251")
> >   2886ab7437de ("arm64: dts: st: add rcc support for STM32MP25")
> >   385ca8e3841f ("arm64: dts: st: add spi3 / spi8 properties on stm32mp2=
57f-ev1"
> > )
> >   3e7d579c9fca ("ARM: dts: stm32: add ETZPC as a system bus for STM32MP=
15x boar
> > ds")
> >   4ef09379d765 ("arm64: dts: st: add i2c2 / i2c8 properties on stm32mp2=
57f-ev1"
> > )
> >   5e6b388d7bcb ("ARM: dts: stm32: move can3 node from stm32f746 to stm3=
2f769")
> >   7442597f90ba ("arm64: dts: st: add i2c2/i2c8 pins for stm32mp25")
> >   7c12d95564a2 ("ARM: dts: stm32: add LTDC pinctrl on STM32MP13x SoC fa=
mily")
> >   7c3d4f99a920 ("ARM: dts: stm32: put ETZPC as an access controller for=
 STM32MP
> > 15x boards")
> >   808691f7389d ("media: dt-bindings: add access-controllers to STM32MP2=
5 video=20
> > codecs")
> >   881bccce217e ("ARM: dts: stm32: add LTDC support for STM32MP13x SoC f=
amily")
> >   8fe31699b83d ("bus: stm32_firewall: fix off by one in stm32_firewall_=
get_firewall()")
> >   9e716b41a2b5 ("arm64: dts: st: add RIFSC as an access controller for =
STM32MP25x boards")
> >   a012bd75abf6 ("ARM: dts: stm32: enable display support on stm32mp135f=
-dk board")
> >   aee0ce48516c ("arm64: dts: st: add spi3/spi8 pins for stm32mp25")
> >   be62e9c0c3fc ("bus: etzpc: introduce ETZPC firewall controller driver=
")
> >   c7f2f2c0ace8 ("ARM: dts: stm32: add heartbeat led for stm32mp157c-ed1=
")
> >   cab43766e000 ("ARM: dts: stm32: add ETZPC as a system bus for STM32MP=
13x boards")
> >   d3740a9fd78c ("dt-bindings: display: simple: allow panel-common prope=
rties")
> >   dccdbccb7045 ("arm64: dts: st: correct masks for GIC PPI interrupts o=
n stm32mp25")
> >   de9b447d5678 ("ARM: dts: stm32: put ETZPC as an access controller for=
 STM32MP13x boards")
> >   ede58756bbe5 ("arm64: dts: st: add all 8 spi nodes on stm32mp251")
> >   f798f7079233 ("ARM: dts: stm32: add PWR regulators support on stm32mp=
131") =20
>=20
> Those commits are now duplicates of commits in Linus' tree.

And are now causing unnecessary conflicts in linux-next :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/mAn=v9xJ5NGl6X8E47POOmi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZD+boACgkQAVBC80lX
0GzF9wf/dWUygEjf52Y8WZglnvyYs/xwJooOjUwQuJ8tx0S5mBCYSviFXPB+V4c+
WIivNNJ2k4LTo9tZCtliG7YkK819UYCGFfVIYNoyKE8ZDttHf22Ps+OSTtbH5kT0
sfYS/5hkHw5Q8INiF93u/bhLexXr9eErkrTNOmFNPmu6LJ5OVHuxf6cBsmF8NXHk
DJ8zDRgzds9AKhVI5lWQOe41h/zC9ZsIvmzdVmTvJZJ1c5c5pfLVR+7mfkglhwrT
w5wJDGo2FTQ/ujmknIKbDSXHwoDM06DaJtMSmmCc3J3MLDoJhXH2m3Kw2aj0ixPf
Ds7GHi1AbhYhufExxaW9sS9Y13O+2A==
=QKp/
-----END PGP SIGNATURE-----

--Sig_/mAn=v9xJ5NGl6X8E47POOmi--

