Return-Path: <linux-next+bounces-2848-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A42A92AD05
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 02:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44F72280F7D
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 00:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3244F19F;
	Tue,  9 Jul 2024 00:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NgY057Ui"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4AF15BB;
	Tue,  9 Jul 2024 00:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720484035; cv=none; b=VEledYNWd/E3B5u16ofd5j1tnT1jPxcKlGkLFBaRKgP71IP/WlEuhNZ69QPfUcjWBpbgaCaeGZA4a1a4cRU7NxU9i8OB3D2UHPcBAM/hqysaxjuiRVXhe8FK5E3u8k5euyBnQADZgo97ygv8tt52Q5YY3cmZYz+JsXdpLLdRNr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720484035; c=relaxed/simple;
	bh=Mb12xR5lEqoTMdGbNLeG53ZBvDW6qJOOXoCH23ARxoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jmn/VngnrQLqBsOftv8Hkh2hTb/Y1cCpRVOQtINURev6f7eG+5JdWJ9McFReRxtmWyFm1RGLaQEBzK0HAk+4mID3HltxyzNk7XX7XZk2PQFnAo1apDpGBvgkMu6xAZJIWpsIA7GBfuPC7tPTQNnTjPHBAgWpBt270IXNdVkt+yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NgY057Ui; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720484030;
	bh=7TKJvcglB4/AWtYt0knLNN92+nI3DFG8+djJVoRKvoU=;
	h=Date:From:To:Cc:Subject:From;
	b=NgY057UiMtcLGYfEK7wD+s0Kafvc0rlJw9ck8d4rM98pqcxXaaRS/ri2XDka7GqBb
	 O94zHpPIT9Sywt9RViP3odc/BaAzleyK77HTjfhj0Gj4ui4AQhGAdTIy0K78w7Ot+s
	 MDN0erNY+6Ri4ia/IuvD5YPBLtn+C9s+yyrfxrd7tiDyIhEjf1VAKr0my2OW6ao/E4
	 nSMuGbWqn5EuXX/HpHUFMpMUezuvo1KiM6GWuJ3D5vsvCZgxD7vc8nASXyLFCc+mCH
	 ud9puw9p5eCxclm+VZvYQzdJnXoJJzVKuTN3kJXfGPSSXYlO//Imk7g6e8zJV7dYlV
	 3nZu5GMR70Sjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJ1gL2hLjz4wb2;
	Tue,  9 Jul 2024 10:13:50 +1000 (AEST)
Date: Tue, 9 Jul 2024 10:13:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>, Olof Johansson
 <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the stm32 tree
Message-ID: <20240709101349.02040caa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5=S9=Ywkr+c1nEVexhs0zK_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5=S9=Ywkr+c1nEVexhs0zK_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc tree as different
commits (but the same patches):

  1245911be805 ("ARM: multi_v7_defconfig: Add MCP23S08 pinctrl support")
  2599b1f071f4 ("ARM: dts: stm32: Document output pins for PWMs on stm32mp1=
35f-dk")
  32bc9d195039 ("ARM: dts: stm32: Add ethernet support for DH STM32MP13xx D=
HCOR DHSBC board")
  3389697affa5 ("arm64: dts: st: add HPDMA nodes on stm32mp251")
  55dc557485c7 ("arm64: dts: st: add ethernet1 and ethernet2 support on stm=
32mp25")
  5d6c1cef82a0 ("arm64: dts: st: describe power supplies for stm32mp257f-ev=
1 board")
  9bcaeb10520a ("ARM: dts: stm32: add ethernet1 for STM32MP135F-DK board")
  a11b40677a34 ("regulator: Add STM32MP25 regulator bindings")
  a29ad03d8393 ("arm64: dts: st: add scmi regulators on stm32mp25")
  a43179fe3f09 ("arm64: dts: st: add eth2 pinctrl entries in stm32mp25-pinc=
trl.dtsi")
  a4a0254811cc ("ARM: dts: stm32: omit unused pinctrl groups from stm32mp13=
 dtb files")
  a80ce2d743fb ("ARM: dts: stm32: add ethernet1 and ethernet2 support on st=
m32mp13")
  ba3e48a76df3 ("ARM: dts: stm32: OP-TEE async notif interrupt for ST STM32=
MP15x boards")
  c62c13b4efe4 ("ARM: dts: stm32: add ethernet1/2 RMII pins for STM32MP13F-=
DK board")
  d41b45f29bc3 ("ARM: dts: stm32: order stm32mp13-pinctrl nodes")
  de2997982cf9 ("arm64: dts: st: enable Ethernet2 on stm32mp257f-ev1 board")

--=20
Cheers,
Stephen Rothwell

--Sig_/5=S9=Ywkr+c1nEVexhs0zK_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaMgL0ACgkQAVBC80lX
0GylIggAiKlBZwD5EOyhWhidAbirpGT7nGVIDwk1ruUtICoUcPX/Yyg7t9E9nb2R
Dqbs8MY3KMrCtwczbuFKl6xZoqeuFxjou28cuGuDUuCGG0fwdtvDoLnNqlqE9dIo
AmQuvIXMEPNHmDGS+RVaZVmP5j2lZWULNc6PZEuDOZQTk7KWaMygqR3sznT3izit
85+CF6AzEMIKtr/WzGCADK0sIiJt764PVnKdMYPblypbEZMbdIGCCWisvOyPC//x
nZNLCk5qpLmO29LZlCu22Swbx3nHSjbtmbJBHoL5IPra6NVQZPRF4MvhtfxHCFs1
WCBsVzhhJVN3ff2oTsvkGJgybYFr2A==
=1vuG
-----END PGP SIGNATURE-----

--Sig_/5=S9=Ywkr+c1nEVexhs0zK_--

