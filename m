Return-Path: <linux-next+bounces-3414-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EC495E767
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 05:44:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 863BB281574
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 03:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68C7374C3;
	Mon, 26 Aug 2024 03:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VcK+uAA9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CB022071;
	Mon, 26 Aug 2024 03:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724643850; cv=none; b=c79yZFCBJ0NziWC8En3qJLbYR9l0r1v3dxcTEtMDFb8QM9dZ+TFj/PHDy8RS237NTd9RP+H3hMWxgxGkNJs1z4GgU7m4XkHoLXTyI8uXKTRG9fqtWpGarV1VMfz90+B95f5XW73Hm2t2kAPe/vAAIe5xGzwMkbV475amYIrF/f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724643850; c=relaxed/simple;
	bh=wq1+06h/2U+aYgsDNv8HtuFWV7/urcHq16tWke3R3tI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=u1O4NXiWduoy2biMRDsDde8AhPNDhXQmp5mFMe3WR1tHMgIIMkOLfxLp/BN1jh8w4cuQEAFvWVeAOJv2ebBEblfiSb/TGoCwGHJjU47NTDv/wlm70DMBU7zQ26ZHQsAjl+b94wn3P/kM/q+p4U6Skae9QRe4depsqjYABaZ3PMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VcK+uAA9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724643845;
	bh=Ya3MPHYHe6oVN7OXY5da0L9DlLiJ//IBQcVi1P4oL8I=;
	h=Date:From:To:Cc:Subject:From;
	b=VcK+uAA9JVhgR2WpsoyHcnKRw0ZedbZPf450LwV7bze9y9aq53xt1Yu+CENwtPDnT
	 jbgr+qsqbdpffHjCTrrKB2AZGLWBtSU5riK8+LzvelwC6BfRAwzUfzNNlEqJcFrnsX
	 7v+LXR6Awl/Ejx5yiLDryyiyuCXdDPkpz+hv1zcXuoHnMhZ6tOju+r6e+oSi0Tc9GX
	 Cgimb890MUj0A8gRVhGJ4rzFDLc/+SpPErINeSlwmnIQEj/LR4KS5joyEoyqJs/sic
	 RvnxUiLENe8K0BSEA/mbxm8aC1ND4C9eA/LbdmbaIb/8Hem8VeA2cvHpZxU0ggw4iF
	 +5bgTlkbo23+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wsc3m1NXTz4x81;
	Mon, 26 Aug 2024 13:44:04 +1000 (AEST)
Date: Mon, 26 Aug 2024 13:44:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>
Cc: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Konrad
 Dybcio <quic_kdybcio@quicinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>
Subject: linux-next: manual merge of the drivers-x86 tree with Linus' tree
Message-ID: <20240826134403.5177f7c6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2EBkEkixnqJsqf4LX8J.Pu9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2EBkEkixnqJsqf4LX8J.Pu9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drivers-x86 tree got a conflict in:

  drivers/platform/surface/surface_aggregator_registry.c

between commits:

  28d04b4a2cc2 ("platform/surface: aggregator_registry: Add support for Sur=
face Laptop Studio 2")
  99ae7b9ba047 ("platform/surface: aggregator_registry: Add support for Sur=
face Laptop 6")

from Linus' tree and commit:

  b27622f13172 ("platform/surface: Add OF support")

from the drivers-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/platform/surface/surface_aggregator_registry.c
index a23dff35f8ca,ac96e883cb57..000000000000
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@@ -275,24 -274,20 +276,36 @@@ static const struct software_node *ssam
  	NULL,
  };
 =20
 +/* Devices for Surface Laptop 6. */
 +static const struct software_node *ssam_node_group_sl6[] =3D {
 +	&ssam_node_root,
 +	&ssam_node_bat_ac,
 +	&ssam_node_bat_main,
 +	&ssam_node_tmp_perf_profile_with_fan,
 +	&ssam_node_tmp_sensors,
 +	&ssam_node_fan_speed,
 +	&ssam_node_hid_main_keyboard,
 +	&ssam_node_hid_main_touchpad,
 +	&ssam_node_hid_main_iid5,
 +	&ssam_node_hid_sam_sensors,
 +	&ssam_node_hid_sam_ucm_ucsi,
 +	NULL,
 +};
 +
+ /* Devices for Surface Laptop 7. */
+ static const struct software_node *ssam_node_group_sl7[] =3D {
+ 	&ssam_node_root,
+ 	&ssam_node_bat_ac,
+ 	&ssam_node_bat_main,
+ 	&ssam_node_tmp_perf_profile_with_fan,
+ 	&ssam_node_fan_speed,
+ 	&ssam_node_hid_sam_keyboard,
+ 	/* TODO: evaluate thermal sensors devices when we get a driver for that =
*/
+ 	NULL,
+ };
+=20
 -/* Devices for Surface Laptop Studio. */
 -static const struct software_node *ssam_node_group_sls[] =3D {
 +/* Devices for Surface Laptop Studio 1. */
 +static const struct software_node *ssam_node_group_sls1[] =3D {
  	&ssam_node_root,
  	&ssam_node_bat_ac,
  	&ssam_node_bat_main,

--Sig_/2EBkEkixnqJsqf4LX8J.Pu9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbL+gMACgkQAVBC80lX
0GxyBgf9ETWTD9YHp1wpWXWYyBR75GHbBW9/SnwN0fOIYi7hurDzW4Pt+Zb3osed
khtaM5OzkT+jyleErj9YZXnOwP23pWbgtNRn0mfbcJ2ub+gBD5+jmJIZUU8bUMb0
d0fZ/ifUbUh0LcEoS/8KwtaUISA/PEwztjFD9pUaBNlGGY8nQZQSAYFFouaMEzo6
IH7MyJUSZGJpg2qz3bOVHOKeTCjANEB1dQ+d52S8snrGjU3YVqLvnPwop98hOa6f
66xywuJ//dh3GhWJAwZaCSLGWgwNnePLgkMiCvJ4Bt1lTPMrlZo/7c8YNRKuphfD
PQuTkqV43iOiauodpHfmtQJ6iUOUdQ==
=sX4t
-----END PGP SIGNATURE-----

--Sig_/2EBkEkixnqJsqf4LX8J.Pu9--

