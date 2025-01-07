Return-Path: <linux-next+bounces-5067-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7FDA033CF
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 01:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6845E1644D3
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 00:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3E7259480;
	Tue,  7 Jan 2025 00:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aQgv/3x4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8812615A8;
	Tue,  7 Jan 2025 00:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736208688; cv=none; b=UT6IwORlT1uKb/vVrzUdE3qsKXl3/QrfGdghO+gAiEqRP4h92Wd0+awDKheVPRiSs+XzGUywlaO4S5yY5W7fJNpSdO+vqWudVSzyQBnIRti9J7HGkMODDBtgg+/aE6W2Flxx45fmsV6vZOFqWUSw3/WEGZHpypiBZVLAb4k0acA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736208688; c=relaxed/simple;
	bh=eMHjiboGoRzIL3NKtvufVsimXrsNLxdcHCzMi37PwUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CwpG3dvSyhQnPbe/hrGQRo9MlcU+9XfHPBYRc8k1Jn02xlFObYRKmkDq4Mo9Njn1FzIwMbqAGUMmm/agpRFP6yOjBYWWKF5azqn0FU+dAvtnnw/SKCWBQncVhL5ZSBwlY8Js1g6iW4VkSHdsrwLYsFGGOeyfwAbTyO3GCox/aPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aQgv/3x4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736208674;
	bh=SQMs9fTKwzRaw7Cdvo+jhTYMx9pWxrR9GqVmJqAAdn8=;
	h=Date:From:To:Cc:Subject:From;
	b=aQgv/3x4TYSFMvMS5bQY4DrOQtufxllhm6Re5hRn5PIgUktQOBDQfTl0TgSJcYGkU
	 ej25V7TsFiS/bsHvXu9gefrXEeoPk3bsLVQVpNowBeQllByGjJQzQlY0poRPy1g+YD
	 qs61usx+e4t78h60W9BEdb18v0XUqhu7WmAKn6IBgmsQbGdDGHsAl8rtfms4fzKKiu
	 MUcC/bOuffGlA49MFMuDK9Epwn6MGBiXrlPgZjt2waCmhm4pmtb5ycI4MuirxQ5zWG
	 RA6uPUQvRzzlbv3F7+G/w4McYgCifgLAXhUUPqHsXM+0XmrLZ5rH62UgePJV4+xvQa
	 u04AY2jLrLsBA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRs0L0QtNz4wb0;
	Tue,  7 Jan 2025 11:11:12 +1100 (AEDT)
Date: Tue, 7 Jan 2025 11:11:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michal Simek <monstr@monstr.eu>
Cc: Michal Simek <michal.simek@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the xilinx tree
Message-ID: <20250107111117.599016eb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C1SmyXzY0fah22F+cgNYJma";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/C1SmyXzY0fah22F+cgNYJma
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xilinx tree, today's linux-next build (arm
multi_v7_defconfig) produced these warnings:

arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts:55.3-13: Warning (reg_format): /=
axi/memory-controller@e000e000/nand-controller@0,0/nand@0:reg: property has=
 invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: Warning (pci_device_reg): Faile=
d prerequisite 'reg_format'
arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: Warning (pci_device_bus_num): F=
ailed prerequisite 'reg_format'
arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: Warning (i2c_bus_reg): Failed p=
rerequisite 'reg_format'
arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: Warning (spi_bus_reg): Failed p=
rerequisite 'reg_format'
arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts:54.9-56.4: Warning (avoid_defaul=
t_addr_size): /axi/memory-controller@e000e000/nand-controller@0,0/nand@0: R=
elying on default #address-cells value
arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts:54.9-56.4: Warning (avoid_defaul=
t_addr_size): /axi/memory-controller@e000e000/nand-controller@0,0/nand@0: R=
elying on default #size-cells value

Presumably introduced by commit

  dd6c610ac948 ("ARM: zynq: Do not define address/size-cells for nand-contr=
oller")

--=20
Cheers,
Stephen Rothwell

--Sig_/C1SmyXzY0fah22F+cgNYJma
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd8cSUACgkQAVBC80lX
0GycDAf9E6r3KQCA3EsP+Yk5UYuXlcMzqcmNX8X6GiMvl+0f7308JpX6leNauNgh
tohPwAQFjD9Io3IOcDfQ9suWeKbXJcpyJwABWAK9JV9uKnsUTcrPYDLt+mHe5RAL
3+zozCXiNRnJado7McevCuOZNJ+81rWbynBEqLi9umusHCkgkwVxgBcvNAErPJ55
WSIrLCfi6M0p0qMVt0jFJDKxn0HKtxYBoooZlCJlpQitGwYMDlh3xU727gwJ37h8
s7K2h+1gG/DwB22sFP53fPAsGVEAH3jqxP0KRJVvnf2rU2BVU5+7Xs4S3FkUzKqk
BTqowI7L3xA+mgrfyj5k312/Rn4WJQ==
=LPx3
-----END PGP SIGNATURE-----

--Sig_/C1SmyXzY0fah22F+cgNYJma--

