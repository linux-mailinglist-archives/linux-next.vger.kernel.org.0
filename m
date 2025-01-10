Return-Path: <linux-next+bounces-5131-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1BAA08609
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 04:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 829B6169FB0
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 03:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF063FB9C;
	Fri, 10 Jan 2025 03:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="K3d0leqt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9852F3E;
	Fri, 10 Jan 2025 03:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736480064; cv=none; b=Wh/dQ6/Eu7JVDnvD5fX3DLtzYY4veUAIYfjjrq/F4A1WCzXHR5OK1xa++AX3TGhRL+BrTpnzMbH/FxHlOze2BzXYalT2HuPA4yZM4d3KFlxANPzjSAP60mMj2nfJPO5WfbP8WKVKIIQpwQNOgF7P8OyhudReDnhgLRQg5JR19Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736480064; c=relaxed/simple;
	bh=kRRa5C0ORHfpV1biYhVI40nP5oS+Lh+IZOl8OiZ3tQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rVMG5Aledo52teld7NhZIXZxR7mCRO8u8zA7Xmozz9x3KG3TO8xWF1MX2WYxMTsGr0J73V03rj+WplxAGtYz/Z4N3stbU/dPRz3q/wCVPTnFpKtDAf//cQm18otekMhFxI08ipX0/KvGUcTbjmCRfsWo/NXtJB9amOBrvQfKZVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=K3d0leqt; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736480051;
	bh=XG+n17peMaPlpW1J5DXrcE73KUJCN6albM3xsw/IHYg=;
	h=Date:From:To:Cc:Subject:From;
	b=K3d0leqtkm/gB44vmGEI7a9K9f72k5RPO6v1sasoB0Gk+VllUXW3R+M18wfaY28ZN
	 8+rGdkTYsuaPYK5oqXNou8SdN1SGJwtQicb0i7TMSrQwKMjiJQvFXRvtkcJnSu0IR6
	 O7t/SpmGnkSwumAoa/OksVtEd+ng0zV39Xq+suCVsXEorfRKTRgqwq7i4dy2sTabwD
	 CN2dpftuacXaC4cPaNPvGUqTlyI4cuo4QxeshJSCwge+cQrgHV+A+T3SXzqStCNn1I
	 /tZqfPilfvcU5KZoq1iMQx0MOvKb5qkAhFOuMyD5u8N69EA0hkQpM3SnKmv8yRde+/
	 rMNC8gxhmq9tw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YTnM61SDJz4wcZ;
	Fri, 10 Jan 2025 14:34:10 +1100 (AEDT)
Date: Fri, 10 Jan 2025 14:34:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Patrick =?UTF-8?B?SMO2aG4=?= <hoehnp@gmx.de>
Subject: linux-next: manual merge of the drivers-x86 tree with the i2c-host
 tree
Message-ID: <20250110143416.3b9d92af@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pRTxucWjx9pw14FLJSKYdaF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pRTxucWjx9pw14FLJSKYdaF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drivers-x86 tree got a conflict in:

  drivers/i2c/busses/i2c-i801.c

between commit:

  fd4e93083129 ("i2c: i801: Add lis3lv02d for Dell Precision M6800")

from the i2c-host tree and commit:

  cc0809b752c7 ("platform/x86: dell-smo8800: Move instantiation of lis3lv02=
d i2c_client from i2c-i801 to dell-lis3lv02d")

from the drivers-x86 tree.

I fixed it up (I used the latter version of this file and applied the
following merge fix patch) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

rom: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 10 Jan 2025 14:29:46 +1100
Subject: [PATCH] fix up for "platform/x86: dell-smo8800: Move instantiation=
 of
 lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d"

interacting with "i2c: i801: Add lis3lv02d for Dell Precision M6800"
from hte i2c-host tree

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/platform/x86/dell/dell-lis3lv02d.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/=
x86/dell/dell-lis3lv02d.c
index d2b34e10c5eb..48a937c90ea9 100644
--- a/drivers/platform/x86/dell/dell-lis3lv02d.c
+++ b/drivers/platform/x86/dell/dell-lis3lv02d.c
@@ -46,6 +46,7 @@ static const struct dmi_system_id lis3lv02d_devices[] __i=
nitconst =3D {
 	DELL_LIS3LV02D_DMI_ENTRY("Latitude E6330",     0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("Latitude E6430",     0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("Precision 3540",     0x29),
+	DELL_LIS3LV02D_DMI_ENTRY("Precision M6800",    0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("Vostro V131",        0x1d),
 	DELL_LIS3LV02D_DMI_ENTRY("Vostro 5568",        0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("XPS 15 7590",        0x29),
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/pRTxucWjx9pw14FLJSKYdaF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeAlTgACgkQAVBC80lX
0GxNGAf/ZBzVu1rSfIkj40eC/XgEUvkBpnaQyNv+2h8n2lUz6GaMhFIqho9xthN8
UesfRB+ugqbZ6OG1Jji5hfcmTTeWQ2Nheo3CXLCWRuYt8fOb1Ib0DG1/6O5skDgW
1E+cfrgaM3P9V7AykmWACh4lKeUz/Am5VI2fvEgITtwxkBhBzzxYgTVwz9CVNiLb
jg6jqOOzqrMSla0iLMh7ce/ATeUmsLHID0HJYbHvpnP1KYEQ9AyBjW8WhWMUweWR
KwQDnKlKpe0g7h8guE/stNyGSoQv9V96pEjyJISZ9Z33L/zqny9Y/0yrvZE4BAOO
Y6ar4EOXo9+S018lrk+ylpvlZRNlnQ==
=y9y9
-----END PGP SIGNATURE-----

--Sig_/pRTxucWjx9pw14FLJSKYdaF--

