Return-Path: <linux-next+bounces-3045-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0B39334E0
	for <lists+linux-next@lfdr.de>; Wed, 17 Jul 2024 03:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 479B91C2237E
	for <lists+linux-next@lfdr.de>; Wed, 17 Jul 2024 01:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0A9EC5;
	Wed, 17 Jul 2024 01:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="eLnBlx4T"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8389E803;
	Wed, 17 Jul 2024 01:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721178347; cv=none; b=preSqefjTQ/Af4Aoz0ZSVtK5WW6nxFjZQvzbTWUyadzH5sFYWQxTJngA/OcC86Atk6hlFCRWQ8049DyPEsaJYBMMKt55g9OgucO0+BobJ0dgsAbUkK5ZE60PI0PSunpS+qBJ6X+CBEFMdfdIolf9FzAF9FSSXqMGhGShbyN2Ef8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721178347; c=relaxed/simple;
	bh=o9n/+numq/d87IA7/c8EuulJ3n+dwF9m21PCrPK2x/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WP1ng2Q20AFEX2ppMFOr29Rb31d7JTb5Ou+ShhQnXkIVAybR/I+kEVXsbpnVu7CiNuRz1U2Z8CBnFvZCWAZBG2HNyU5cu7uFkFm+Fq5fTyZGSMYmzLRV/upiGlXVWtd7cA5hWrPFqyqoXxPpifmZJUYIf/+A48dZ+XRK1TlC2yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=eLnBlx4T; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721178340;
	bh=aLHCeL6c33+cbtjXR/4o1YO05pYTsMOU1LfDM+4Q244=;
	h=Date:From:To:Cc:Subject:From;
	b=eLnBlx4TM7Cejuaqb1CucyKOfw57ZMrPJpNcR5nD9nRNVeCiJL40vmWoDWCMiMXrC
	 vN6WPu6JRkWYS0+JOQzO0NZBj+X8+IMkyaW4i658gUVtpj/o+kHYg/wlIV7rESOnyl
	 W8dyUDHPoJ6kzSzXTdvY9bBgfX31L1h/NfIY+jefHB+tBk7d1Mh+ICUhFOVcA5+wXA
	 5rbv/GKW3zVZCJUCPtfma7QL4rL7ZJhXtxuD3B2XDEaZZ1CQuwnFYdKEZfSlEb7MqX
	 F3fLye1vIiy8LLfjy2u9buXtsKamMBTgb7cmo7zUsgjanr/n+f117eQU9HZ86aN4mN
	 Iw6NkKOCB1YYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WNyRR2MMtz4w2M;
	Wed, 17 Jul 2024 11:05:39 +1000 (AEST)
Date: Wed, 17 Jul 2024 11:05:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@the-dreams.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the i2c-host tree
Message-ID: <20240717110538.307d2374@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bR_hJY37neA/jm_YN3JRacj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bR_hJY37neA/jm_YN3JRacj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the i2c tree as different commits
(but the same patches):

  08c2806f83df ("i2c: add missing MODULE_DESCRIPTION() macros")
  0988733c1ea3 ("i2c: cros-ec-tunnel: reword according to newest specificat=
ion")
  0bfb86abc13c ("i2c: taos-evm: reword according to newest specification")
  0c100b011a53 ("i2c: mv64xxx: reword according to newest specification")
  12418c6c876e ("i2c: sun6i-p2wi: reword according to newest specification")
  1cea9e85a4fc ("i2c: riic: reword according to newest specification")
  1d291d556de4 ("i2c: davinci: reword according to newest specification")
  203dd613a070 ("i2c: gpio: reword according to newest specification")
  21061bb1a08e ("dt-bindings: i2c: ti,omap4: reference i2c-controller.yaml =
schema")
  2549539f9a53 ("i2c: virtio: reword according to newest specification")
  2a2517364157 ("i2c: omap: wakeup the controller during suspend() callback=
")
  2c7b395d57f1 ("i2c: fsi: reword according to newest specification")
  2cd3f4110ba0 ("dt-bindings: i2c: at91: Add sama7d65 compatible string")
  2ea86160d2e8 ("i2c: mlxcpld: reword according to newest specification")
  3acc267537da ("i2c: au1550: reword according to newest specification")
  3d1c913cc014 ("i2c: highlander: reword according to newest specification")
  3e1bdd54c03f ("i2c: xiic: improve error message when transfer fails to st=
art")
  4d332dab1df6 ("dt-bindings: i2c: samsung,s3c2410: drop unneeded address/s=
ize-cells")
  4e1b2108c01b ("i2c: bcm-kona: reword according to newest specification")
  52bea1e3899e ("i2c: i801: reword according to newest specification")
  550f64b8ee41 ("dt-bindings: i2c: nxp,lpc1788-i2c: convert to dt schema")
  56339090ab6d ("i2c: rcar: minor changes to adhere to coding style")
  58097f20abbc ("i2c: robotfuzz-osif: reword according to newest specificat=
ion")
  596ad7a32540 ("i2c: hix5hd2: reword according to newest specification")
  5af3a280c276 ("i2c: isch: reword according to newest specification")
  609f3f38efea ("i2c: powermac: reword according to newest specification")
  637e37d70bef ("i2c: pxa-pci: reword according to newest specification")
  696f8f5d6294 ("i2c: uniphier: reword according to newest specification")
  70b281fa6c67 ("i2c: tiny-usb: reword according to newest specification")
  72197a476885 ("i2c: pasemi: reword according to newest specification")
  72ea4c9e1e77 ("i2c: ocores: reword according to newest specification")
  78e81085a57f ("i2c: st: reword according to newest specification")
  7c88ac8cd226 ("i2c: ls2x: reword according to newest specification")
  7f66b8801bb8 ("i2c: kempld: reword according to newest specification")
  85b3d19d1d46 ("i2c: digicolor: reword according to newest specification")
  865de70d3a75 ("i2c: sis5595: reword according to newest specification")
  8a26969c8361 ("dt-bindings: i2c: amlogic,meson6-i2c: add optional power-d=
omains")
  8b13b2d891c0 ("dt-bindings: i2c: atmel,at91sam: drop unneeded address/siz=
e-cells")
  8cfda8699498 ("i2c: stm32f4: reword according to newest specification")
  955e511670da ("i2c: i801: Add support for Intel Arrow Lake-H")
  98aaf8ae91ac ("i2c: cht-wc: reword according to newest specification")
  997f918ad550 ("i2c: thunderx-pcidrv: reword according to newest specifica=
tion")
  9f124555b24f ("i2c: ali15x3: reword according to newest specification")
  9fdff9d7e0f9 ("i2c: designware: Constify read-only struct regmap_config")
  a2a9df7a071a ("i2c: rcar: WARN about spurious irqs")
  a2ff342da8bd ("i2c: nvidia-gpu: reword according to newest specification")
  a62cc06e2e8c ("i2c: opal: reword according to newest specification")
  a63e93d4af0a ("dt-bindings: i2c: nvidia,tegra20: drop unneeded address/si=
ze-cells")
  a7d13996ec23 ("i2c: lpc2k: reword according to newest specification")
  a9d85cc53091 ("i2c: mpc: reword according to newest specification")
  aada2bfbb77d ("i2c: mt7621: reword according to newest specification")
  abe7b0461de5 ("i2c: cp2615: reword according to newest specification")
  b008f2e69b40 ("i2c: ljca: reword according to newest specification")
  b0f7c9a60825 ("i2c: owl: reword according to newest specification")
  b4a6459f77e4 ("i2c: brcmstb: reword according to newest specification")
  b5aee134c996 ("i2c: altera: reword according to newest specification")
  b8247c128fbc ("i2c: rzv2m: reword according to newest specification")
  b8298473472d ("i2c: bcm2835: reword according to newest specification")
  c452ae71d026 ("dt-bindings: i2c: dw: Document compatible thead,th1520-i2c=
")
  c80279693891 ("i2c: sprd: reword according to newest specification")
  cbe36ec2d5cd ("i2c: hisi: reword according to newest specification")
  cbece0a3d76a ("i2c: reword i2c_algorithm according to newest specificatio=
n")
  cd3427307f0e ("i2c: viperboard: reword according to newest specification")
  d27bfc46b90d ("i2c: jz4780: reword according to newest specification")
  dd694c3ee789 ("i2c: piix4: reword according to newest specification")
  df49da24c369 ("i2c: diolan-u2c: reword according to newest specification")
  df6b9386616d ("dt-bindings: i2c: adjust indentation in DTS example to cod=
ing style")
  dfc6126ed7c9 ("i2c: dln2: reword according to newest specification")
  e0cd93dfc0e1 ("i2c: iop3xx: reword according to newest specification")
  e23e87244add ("i2c: viai2c: reword according to newest specification")
  e3e92ad67351 ("i2c: mt7621: Add Airoha EN7581 i2c support")
  ee0e76803e44 ("i2c: omap: switch to NOIRQ_SYSTEM_SLEEP_PM_OPS() and RUNTI=
ME_PM_OPS()")
  f282dabda3e5 ("i2c: octeon: reword according to newest specification")
  f4f4cace7539 ("i2c: rk3x: reword according to newest specification")
  f58e6438229c ("i2c: ibm_iic: reword according to newest specification")
  f5a2055323af ("i2c: cpm: reword according to newest specification")
  fd8c13ac5678 ("i2c: uniphier-f: reword according to newest specification")
  ffbc35657b7a ("i2c: tegra-bpmp: reword according to newest specification")

--=20
Cheers,
Stephen Rothwell

--Sig_/bR_hJY37neA/jm_YN3JRacj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaXGOIACgkQAVBC80lX
0Gyh5Af/bC4rZb3pnheiCC49Z0E2eh+aSAWPsr5t51z56Nd5ACmytLFkKH7K3svW
ipxT72338B6+b5gz51WOzoOogu2OWd4+G7AZGLlKAW1J2965LRlZAmbiebTNqCma
d/sKe9l0h66vB9n5q+O4rYP6JsQbl39fK6COP0idVPVEOmiLcakX8LH5jiT04ZoC
xRseJzDXS6lNnH+7HpVK9h2RpzNcwESx5KftK04h12yazkhFSwLUcUJHnM9s3rZR
AXjfy9mZw4JBWgD1B84wvAHJN9dOW8aRTd6eQ0Fh3WnKHMYFpYExTk6p7VQ+lWSP
QGxGEyHBG724YfaVI/jSfRZcvdLjHQ==
=tuyJ
-----END PGP SIGNATURE-----

--Sig_/bR_hJY37neA/jm_YN3JRacj--

