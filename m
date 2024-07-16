Return-Path: <linux-next+bounces-3042-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D406F9333E5
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 23:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 655A3280DF0
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 21:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9318912B17C;
	Tue, 16 Jul 2024 21:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cYGAuAil"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089E228377;
	Tue, 16 Jul 2024 21:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721166840; cv=none; b=qqfqKe53u438d15PUdb4dMKA1DNYvNPLuKv48pVoyra/DbykvH+DP/BeGgcSOyLypzISf9S1sG26sXmM8RY7xDBl2psPFCGKrR5uTZtLdmm6XVLkeO1JDS3cY73tZRzgJPHau/FDeAS85fVhQNwxOd+AJkhI8SLSemMtK1NBqxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721166840; c=relaxed/simple;
	bh=A0fclLpJWkP2yZqrSSIXUus+n2XBbVpz8EgGx4fvx0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=f2w7E3idU5Z6wcmKI1VWaFbgQGm4uWg7Ak+V2GAMcxZSTD8jPmCI3//nV7AGwyWCMRygMqeCwHXfktdsZXdITk+82lNdY1A8vR9FDsWI2hF8pmH6jgrjb25p4WbbgKIv7/LVd60Tq4wbZ4A/cGRxiSXrPcs7O/Ja11v1X+/Obh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cYGAuAil; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721166836;
	bh=ynZTJLJQIUVZOJ2GizIwv/8EO7bFYDec/9W7craPLbk=;
	h=Date:From:To:Cc:Subject:From;
	b=cYGAuAilCwr0UpBCqkCUVpDDBGTnqkon8r0+anz/aRXCVM+HGCyk4RmX2hgrV6QMf
	 JwMLv9Z96DMJzaUjdtoucEDQ/aJC/6OLUuD8HZU8V0dZIj9EZfvdAf8POY+pntyOPE
	 DPtWxPtu48bM6wXrza4h9LoW7xblP4aoPM7spnpssibifG/EoE6ncrhia0J/wC9dNp
	 VefCceWPchQrvXIVNqpyABTtUyHToIdwC3eadD0cqg3tBBSWFFDzWlPBZp/sNVu+9R
	 ULQLonY6Ry5IFpRY9NhWDmIJqzmkhoKQ1NwD4OQACdPyi+DzbvCFnlW9C3672PHAPe
	 90iCxoKvZ5cAQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WNtBC6R1Hz4x1y;
	Wed, 17 Jul 2024 07:53:55 +1000 (AEST)
Date: Wed, 17 Jul 2024 07:53:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the stm32 tree
Message-ID: <20240717075355.10020fec@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Fvg1CSt7iT36s.cD8xRieeq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Fvg1CSt7iT36s.cD8xRieeq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  1245911be805 ("ARM: multi_v7_defconfig: Add MCP23S08 pinctrl support")
  1eafc48af859 ("arm64: stm32: enable scmi regulator for stm32")
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

--Sig_/Fvg1CSt7iT36s.cD8xRieeq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaW6/MACgkQAVBC80lX
0GyaPAf9HofBFI3AblhYj0cJoQSbVccTn6hR8p7dRYAzMNQKbKgVti/1A0bqgaKt
2P6o5zdThT2ZeYY3KaJe3aVoa0WsfCFAvlUb888Dbqeb78Ez9fmC1xzM+gpB9qLE
BkXnR6Z68OK97CZync9zaIE0cc0PiWoz6rQSXwHdGl8jo4qiXawCAfJTllbo1/vH
v8WeBh0koUFl1UfDMErLd6ir1Hz99hh0LNvr4YOvHOYfUKjoaX8/kJg1SJj7nEgk
43L4Jfg0S7z3Z0xOXFEAdtrp3UzgF5wpHbehfXVC9YvHH2QOEX16KUOVN3dZPjjM
LhJoc0g6cpUaMkJB2Ii1OHtTU1LMig==
=ijI9
-----END PGP SIGNATURE-----

--Sig_/Fvg1CSt7iT36s.cD8xRieeq--

