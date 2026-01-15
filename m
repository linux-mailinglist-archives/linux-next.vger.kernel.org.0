Return-Path: <linux-next+bounces-9670-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BF0D22664
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 05:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C35363029232
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 04:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052D32D2491;
	Thu, 15 Jan 2026 04:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UV/Dp3BA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5949523ABBF;
	Thu, 15 Jan 2026 04:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768452952; cv=none; b=BiEXQeTUK8CSWkn1aohn3dq1rcMSmQYYIGvnFkAyF7sAUojIQ2ehkcqKaW9fDtuasFDTQypIXv9dECU8EIDx14JlLgIlYKlW2jAulDP3eINQiVpp+3ABSYaWrHkS6yFxtImb1VIXJSPvbgrgZXcb0N9cyRxELBELjvtjiDkkWmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768452952; c=relaxed/simple;
	bh=UUQEBfZiWiNCtMm0nujS8Ugd/XAPg8P570wMVI9rVLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lx0oxviAeL69IXEpuUbLzvr+hYWgRGpAxEJoaLHhuy5KTePYd+3Zy+fMsCUMAwalc+Od2ZViBd3/ffPfcfpkl9ayyLu8Om9bqUkzJe+4wiy4W2zrNHGYcOKeWaY/U1kYCt9TqQ+9nqE0Pe9YcEkMcrrPzBu0jZ7zqqJrnq4zbQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UV/Dp3BA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768452947;
	bh=t5DGis806N4zH3zFWRN5zIYVDivFt0E107PqySBjSPA=;
	h=Date:From:To:Cc:Subject:From;
	b=UV/Dp3BApuyeda7rlHsH75DrOVQiDP3o4HjNtU4XXKeJ18w57Gm1GDvrwUCMtYGhT
	 laQzf/WB/2k/wgUzrAqW4m3TCMG4qoZikuSjD/zdIgxYDF+eogVr8GxB87b3aN3NDw
	 18iL/0RuUnUR4qq+n2hJKS95POcjgt+Lli9eoWc4sTPe1P3/ZKiSUPUAYDdcz5Jt59
	 1Gp/KnqjWk8ov/wZO5JKGnd+vVRAB5akW3swlzCtHO8s/3JlBTVth2RhnPeSyAhWU2
	 c7odtmvTIbKLlfd5ORjnv5bih1T7iakA2DJ1DOIRQ79fFK92jB6CkUWQCci6nqRnuF
	 mlbury9DDPopg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ds9fW4LKxz4wCJ;
	Thu, 15 Jan 2026 15:55:47 +1100 (AEDT)
Date: Thu, 15 Jan 2026 15:55:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sjoerd Simons <sjoerd@collabora.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the mediatek tree
Message-ID: <20260115155546.5670f815@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fUJ5+f=14wUTQ56sl/UR2EM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fUJ5+f=14wUTQ56sl/UR2EM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mediatek tree, today's linux-next build (arm64
defconfig) produced these warnings:

arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts:98.3-13: Warning (reg_=
format): /soc/ethernet@15100000/mac@0:reg: property has invalid length (4 b=
ytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts:108.3-13: Warning (reg=
_format): /soc/ethernet@15100000/mac@1:reg: property has invalid length (4 =
bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: Warning (pci_device_r=
eg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: Warning (pci_device_b=
us_num): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: Warning (i2c_bus_reg)=
: Failed prerequisite 'reg_format'
arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: Warning (spi_bus_reg)=
: Failed prerequisite 'reg_format'
arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts:96.15-103.4: Warning (=
avoid_default_addr_size): /soc/ethernet@15100000/mac@0: Relying on default =
#address-cells value
arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts:96.15-103.4: Warning (=
avoid_default_addr_size): /soc/ethernet@15100000/mac@0: Relying on default =
#size-cells value
arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts:106.15-111.4: Warning =
(avoid_default_addr_size): /soc/ethernet@15100000/mac@1: Relying on default=
 #address-cells value
arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts:106.15-111.4: Warning =
(avoid_default_addr_size): /soc/ethernet@15100000/mac@1: Relying on default=
 #size-cells value

Introduced by commit

  ecc68d72b50d ("arm64: dts: mediatek: mt7981b-openwrt-one: Enable Ethernet=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/fUJ5+f=14wUTQ56sl/UR2EM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmloc1IACgkQAVBC80lX
0GzFdgf/WqIZM8WlzDCv6TAK2be4yPOgA/Ym459V/FOs/BU1edyJHzKtO02/zAq8
fLW1ZIRER6Wv/r6FKcp0zj+bmoGJQbBu78kEtAAgKsuDABi2lNFn73TIZF+hH3Kg
p7wmpOj7liNMuP0cFPYtL9eDzslAo+JWd6DnH21jTq+bu/0KCAU6wRTJvK3tGcIn
OUupKL6kNpJM6Cl70VujHQWjzlRNiRYj/aGh8YJ7CY8esk9n+HivPpJgikZ9t/jj
jl01R6GzqM9GsZqqIY+QiUeK/XqCQI0ogFdfvnxjJMRM9Q90lIIW0cvkfqcuFST7
tFEX/VojwJ8L9mR+v8hUXUH86w5QrA==
=4102
-----END PGP SIGNATURE-----

--Sig_/fUJ5+f=14wUTQ56sl/UR2EM--

