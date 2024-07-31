Return-Path: <linux-next+bounces-3177-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9790943979
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 01:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74BFB1F22DE6
	for <lists+linux-next@lfdr.de>; Wed, 31 Jul 2024 23:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8871614B097;
	Wed, 31 Jul 2024 23:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gou4eYjW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FB116DC18;
	Wed, 31 Jul 2024 23:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722469614; cv=none; b=Ncmpm/jFawEPUOiJXrKe0CcxPlm3zika+0ci9gIqEPxw1P6LjnMAB2FclmS16dHcy1vAaR2+FQaqe8nFPzh9xevHDxbETh9+oG5ZLr6iZHzMn8N2dkRxE2zIbsvdFBZ9ErVrfNzbAdQNZ/BFRY6pS0paD3R1KoHpd5NgG3d7y4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722469614; c=relaxed/simple;
	bh=4CllI5JYtB8gD8+ULbcQHaCWjlZXTdjx7xrOZ2HPPAI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JazB5Q+qZx+AYTk1zQO6lxiSq+XqvJu/KC33BSfuOBNUgHUwqmufHwpY3f0kN7N/Bpq8V7Y2LA55Tj7RZ+dgeYpDyjXo+4L/NRuJOE60iD55hc/dgSI9As1vG54VmWm4V9e9iiMKyyguy4WHdHrHVcOtUMtJyX3X+DNA089KkC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gou4eYjW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722469610;
	bh=YDGZwp9ng90T2/Df7goq3T7ZaVE8u1W/+w7Mct2Bglg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gou4eYjWVJoDwI/EVvM/Tm0x7p8bOhDtatJSkmzSy5pG/EUXFyYk7qlbIKHoGAn21
	 rw4i26J6y5ynZe78zKVxDRAf1SpjiyWABETMhKUYkb4ExHZYaqn1BQbRhKPaAAK0P0
	 moQgt+XFuPSihipaOgXoeNfFfFdt0IsLoHOVocRFLwxd27CIQ03eOINcF6YbHxXVox
	 VjNafcCgs+qHufje05sZj+BGNVmcTDB+GMTbygSIx9io6EuevpJlC8Gzy5H5nmL0A/
	 lT2FtBuDUzrQI5jWJKZs7z6RaapMUeCe17uNdPuPKeRp3skB6BbSn2a7zawSvul6//
	 HPceDy3JqLXHQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZ7zZ30ltz4wxk;
	Thu,  1 Aug 2024 09:46:50 +1000 (AEST)
Date: Thu, 1 Aug 2024 09:46:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the stm32 tree
Message-ID: <20240801094649.0ea1f73d@canb.auug.org.au>
In-Reply-To: <20240717075355.10020fec@canb.auug.org.au>
References: <20240717075355.10020fec@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d.rd=yzUlSt3VbH2DghGSCu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/d.rd=yzUlSt3VbH2DghGSCu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 17 Jul 2024 07:53:55 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
>=20
>   1245911be805 ("ARM: multi_v7_defconfig: Add MCP23S08 pinctrl support")
>   1eafc48af859 ("arm64: stm32: enable scmi regulator for stm32")
>   2599b1f071f4 ("ARM: dts: stm32: Document output pins for PWMs on stm32m=
p135f-dk")
>   32bc9d195039 ("ARM: dts: stm32: Add ethernet support for DH STM32MP13xx=
 DHCOR DHSBC board")
>   3389697affa5 ("arm64: dts: st: add HPDMA nodes on stm32mp251")
>   55dc557485c7 ("arm64: dts: st: add ethernet1 and ethernet2 support on s=
tm32mp25")
>   5d6c1cef82a0 ("arm64: dts: st: describe power supplies for stm32mp257f-=
ev1 board")
>   9bcaeb10520a ("ARM: dts: stm32: add ethernet1 for STM32MP135F-DK board")
>   a11b40677a34 ("regulator: Add STM32MP25 regulator bindings")
>   a29ad03d8393 ("arm64: dts: st: add scmi regulators on stm32mp25")
>   a43179fe3f09 ("arm64: dts: st: add eth2 pinctrl entries in stm32mp25-pi=
nctrl.dtsi")
>   a4a0254811cc ("ARM: dts: stm32: omit unused pinctrl groups from stm32mp=
13 dtb files")
>   a80ce2d743fb ("ARM: dts: stm32: add ethernet1 and ethernet2 support on =
stm32mp13")
>   ba3e48a76df3 ("ARM: dts: stm32: OP-TEE async notif interrupt for ST STM=
32MP15x boards")
>   c62c13b4efe4 ("ARM: dts: stm32: add ethernet1/2 RMII pins for STM32MP13=
F-DK board")
>   d41b45f29bc3 ("ARM: dts: stm32: order stm32mp13-pinctrl nodes")
>   de2997982cf9 ("arm64: dts: st: enable Ethernet2 on stm32mp257f-ev1 boar=
d")

These duplicates are till there.

--=20
Cheers,
Stephen Rothwell

--Sig_/d.rd=yzUlSt3VbH2DghGSCu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaqzOkACgkQAVBC80lX
0GxI4Qf/ZHB6RZ16DIEhZQ7ayW47zMm5Y/tpdf+6u331Nfn1k8QarU1ncswbd7UO
FTZlg7f2YqlAwd6jFJGaxn8f9aabgKEynnrRY9DbC40iYpvwJBktTCxSJg5plyPB
KOznxp7eL8U90XnI7GrBDSP/QAT9PYdPZn54Oi+NRm0ZJGcvskMUa0hlqqn1spHi
GIuZq6DQ1OJ5lAw7xCwb37pCZCefxzVxbH5jwdcykXFDRoy92t9ItpYLrLMtshnW
zhMrsjefBrxYO8YwOW/UZiAiWP7HFWE1Y+tqKVZa/DnpGdHqkn8UpJt6Jb0kaBi9
mRNNq8rFa3OuZxIPHpQClL48/syadw==
=WcoT
-----END PGP SIGNATURE-----

--Sig_/d.rd=yzUlSt3VbH2DghGSCu--

