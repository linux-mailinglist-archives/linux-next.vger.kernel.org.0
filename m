Return-Path: <linux-next+bounces-2294-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 610E58C4BA8
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 06:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 880001C2142B
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 04:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134F4F9F5;
	Tue, 14 May 2024 04:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cXpF7Y3q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E8B1879;
	Tue, 14 May 2024 04:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715660572; cv=none; b=WrQCFhGyYnwSEk3heve/2SLPN6GExEcR6vFPwD9QyAB279hz4aSIJI3e0j1Paaot+lxcLyZf3biemtn9ZojvjY+6nGjPBzycN51bko1J/Yd28bKFp1eGmHhPR/5dypqtvi7iqXNpf2ATbL5P0g4a25QnXLyHfye0fezNFGHBPj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715660572; c=relaxed/simple;
	bh=QoKsGdXZS0B6Nj7Jvxwcoscgt7kWUmbSCYPw2leGIak=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gYpOUbWXvgXgkr1GU4VkHx1GBcS8ODOPlw2oRNQ4ynGxF6H/JJ1DaUzqogE3TnarfHB0CgallIv8gu/hR8qFs7QVdvXdvR1CZ1DiDJ5IVh73D2RVMW1gfGVe9MTmJaeuGE2oUyBNERfsvdi22/Y2ooRAKfuIWUdSBSpVvUndw4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cXpF7Y3q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715660567;
	bh=iAOCyJKi+2/8125nMqNtr3l6ARg/uQFutn/P4zyso2I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cXpF7Y3q+Q+2FzTk7LPuoeiKOJ10iS6kahIUSYOm4GcI964ijpkTWKYKrJvjmiGx8
	 06TrgBJEqTMWQNuMBxbmgeMn9oRURRqmL4oVWFwFyrC6nGb+ZgcphV+wL21JgbRxnl
	 eWFeQP+PeLe2ND60nlya1mvWGWT3mBRYImxp56p3bzPP16cNjIUmBCbgwubboxtYv+
	 E3Sbm6lpXD12cE4fLK3WTMIbrXB3a+NLZZ+1ntpgFaVw9bMB0+86KbqftcjJncjUaE
	 gaiSftcAtIpT3R18lebrabpBcM8UgZerX92GqYVOpYg7AKs/car5YusfNQhb0RE05v
	 TWbvYZaRzDR5w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VdjrP2N8Fz4wby;
	Tue, 14 May 2024 14:22:45 +1000 (AEST)
Date: Tue, 14 May 2024 14:22:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Alexandre
 Torgue <alexandre.torgue@st.com>
Cc: Networking <netdev@vger.kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Gatien Chevallier
 <gatien.chevallier@foss.st.com>, "Kory Maincent (Dent Project)"
 <kory.maincent@bootlin.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Saravana Kannan <saravanak@google.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the
 net-next, stm32 trees
Message-ID: <20240514142244.26010149@canb.auug.org.au>
In-Reply-To: <20240424134038.28532f2f@canb.auug.org.au>
References: <20240424134038.28532f2f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wR5ZyYnSJ+GNMNmf.=HWaa4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wR5ZyYnSJ+GNMNmf.=HWaa4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 24 Apr 2024 13:40:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the devicetree tree got a conflict in:
>=20
>   drivers/of/property.c
>=20
> between commits:
>=20
>   6a15368c1c6d ("of: property: fw_devlink: Add support for "access-contro=
ller"")
>   93c0d8c0ac30 ("of: property: Add fw_devlink support for pse parent")
>=20
> from the net-next, stm32 trees and commit:
>=20
>   669430b183fc ("of: property: fw_devlink: Add support for "power-supplie=
s" binding")
>=20
> from the devicetree tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Due to the addition of commit

  d976c6f4b32c ("of: property: Add fw_devlink support for interrupt-map pro=
perty")

to the devicetree tree, the resolution now looks like below.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/of/property.c
index 0320f1ae9b4d,21f59e3cd6aa..000000000000
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@@ -1252,8 -1241,7 +1241,9 @@@ DEFINE_SIMPLE_PROP(backlight, "backligh
  DEFINE_SIMPLE_PROP(panel, "panel", NULL)
  DEFINE_SIMPLE_PROP(msi_parent, "msi-parent", "#msi-cells")
  DEFINE_SIMPLE_PROP(post_init_providers, "post-init-providers", NULL)
 +DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-con=
troller-cells")
 +DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
+ DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 =20
@@@ -1359,10 -1398,10 +1400,12 @@@ static const struct supplier_bindings o
  	{ .parse_prop =3D parse_backlight, },
  	{ .parse_prop =3D parse_panel, },
  	{ .parse_prop =3D parse_msi_parent, },
 +	{ .parse_prop =3D parse_pses, },
+ 	{ .parse_prop =3D parse_power_supplies, },
  	{ .parse_prop =3D parse_gpio_compat, },
  	{ .parse_prop =3D parse_interrupts, },
+ 	{ .parse_prop =3D parse_interrupt_map, },
 +	{ .parse_prop =3D parse_access_controllers, },
  	{ .parse_prop =3D parse_regulators, },
  	{ .parse_prop =3D parse_gpio, },
  	{ .parse_prop =3D parse_gpios, },

--Sig_/wR5ZyYnSJ+GNMNmf.=HWaa4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZC5xQACgkQAVBC80lX
0Gzv1Qf+PrVZES3IAyzKbzajZbZJC4kEgAdW2nCeyMfcsTOFMIDIhoX6qbSmtM5c
lqzjU5G6HcJp3xmNLRHpnckQteCdDYqbcfL+dhKp8b2tlwX5v/FiRir1uTZI9xe7
tiioiReCopq2niygDmn7ZlBIppbGCEmcDM5OOAP34Z51J2iAp3lSY18ms2fx01Of
rvLGTEVEL52rKFRUWiqqvSCkpErVl/WdBj+gD8YiBQpeW1/eJk472JV78ojoVN0+
V4BC8SaeboYgErtn8i+m6pBIEuVuavkF9ZCPAINIZ9rHrZzvsGBb8fZmev/NS3ql
m502uxAcP3c+SMLNDB5xfMTyfphx3Q==
=Ts1P
-----END PGP SIGNATURE-----

--Sig_/wR5ZyYnSJ+GNMNmf.=HWaa4--

