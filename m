Return-Path: <linux-next+bounces-3000-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7928C930CC2
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 04:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34C3E28123B
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 02:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EF7522A;
	Mon, 15 Jul 2024 02:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PfYmxYM4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BA6D2EE;
	Mon, 15 Jul 2024 02:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721010730; cv=none; b=m6TeRX5iOU5tamE5yP183QelSaGqEyma5iz+rY8AfiZtPtu+KcG2qwT+B/nvr9d8vF5BTOxPfROVkL9O8XeK49bL+LzMpl/WY3TRMELw3VacqciKcwOByf71W36hIW3l0WSjvZaQhOisZaW6fDNs6aWa7h7qSZC6IMgSctG915U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721010730; c=relaxed/simple;
	bh=fzR/p95q2086VGkqYnPwCfEzaAzY++RI2K823kku07U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=h9djFgqibZStMy0K/v+7bpOnew2zbjBnaAIjhuPsV6axKuorFM7buDzOpsTfEc2AKjuxS7FeYu7Dr4cg42y413uadqXHEbZL6YI75Yd53R2nYkZGRwzHzdS9GTVNVJO5gkw8xce2CwQR1rN5VnIwwWK8GxmwpqkmFimW7L1d5YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PfYmxYM4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721010726;
	bh=KAPolTv3Xg1geLGQx/RurTDhQBE7h29WNswPdwJUBBI=;
	h=Date:From:To:Cc:Subject:From;
	b=PfYmxYM4bvVIzILFo0hzTJ3A3dzYFRn4ZfPPuEFtHBXWoYWXEyHL4QfwVr/1QUSxK
	 xGx1nOg7nL/bLZ0AYiXvWuL4iNgGbIg1NLhq3Vg5PcEOStkyUi1NNF8sG6mgsv2Ss5
	 SrfZd7AyVPLEBZzZlDWcppJtuT5rN2+rwKKPG1dg9DyjQGQ8Yvv0qPKIjHKijXvFI5
	 SKVIVb334NNaTQJ8tDCQyUaqetwonRrme+sWabQ/SHScEvF3kvt+joTuUddtEcbrTm
	 K6LjvJM4CtSFsAKuVhtmZ4NnvRk5k7gbI+pl/fRX4f6YfhYC/cI7M2Vem46l+2pbKl
	 fB0BwfRBysvNg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMmS53GPYz4w2R;
	Mon, 15 Jul 2024 12:32:04 +1000 (AEST)
Date: Mon, 15 Jul 2024 12:32:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, "Kory Maincent (Dent Project)"
 <kory.maincent@bootlin.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20240715123204.623520bb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q.5VMWPI.Hy2VZwII.5Qerr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/q.5VMWPI.Hy2VZwII.5Qerr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/ethtool/pse-pd.c

between commits:

  93c3a96c301f ("net: pse-pd: Do not return EOPNOSUPP if config is null")
  4cddb0f15ea9 ("net: ethtool: pse-pd: Fix possible null-deref")

from the net tree and commit:

  30d7b6727724 ("net: ethtool: Add new power limit get and set features")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc net/ethtool/pse-pd.c
index 776ac96cdadc,ba46c9c8b12d..000000000000
--- a/net/ethtool/pse-pd.c
+++ b/net/ethtool/pse-pd.c
@@@ -172,21 -256,39 +256,39 @@@ static in
  ethnl_set_pse(struct ethnl_req_info *req_info, struct genl_info *info)
  {
  	struct net_device *dev =3D req_info->dev;
- 	struct pse_control_config config =3D {};
  	struct nlattr **tb =3D info->attrs;
  	struct phy_device *phydev;
+ 	int ret =3D 0;
 =20
  	phydev =3D dev->phydev;
- 	/* These values are already validated by the ethnl_pse_set_policy */
- 	if (tb[ETHTOOL_A_PODL_PSE_ADMIN_CONTROL])
- 		config.podl_admin_control =3D nla_get_u32(tb[ETHTOOL_A_PODL_PSE_ADMIN_C=
ONTROL]);
- 	if (tb[ETHTOOL_A_C33_PSE_ADMIN_CONTROL])
- 		config.c33_admin_control =3D nla_get_u32(tb[ETHTOOL_A_C33_PSE_ADMIN_CON=
TROL]);
 =20
- 	/* Return errno directly - PSE has no notification
- 	 * pse_ethtool_set_config() will do nothing if the config is null
- 	 */
- 	return pse_ethtool_set_config(phydev->psec, info->extack, &config);
+ 	if (tb[ETHTOOL_A_C33_PSE_AVAIL_PW_LIMIT]) {
+ 		unsigned int pw_limit;
+=20
+ 		pw_limit =3D nla_get_u32(tb[ETHTOOL_A_C33_PSE_AVAIL_PW_LIMIT]);
+ 		ret =3D pse_ethtool_set_pw_limit(phydev->psec, info->extack,
+ 					       pw_limit);
+ 		if (ret)
+ 			return ret;
+ 	}
+=20
+ 	/* These values are already validated by the ethnl_pse_set_policy */
+ 	if (tb[ETHTOOL_A_PODL_PSE_ADMIN_CONTROL] ||
+ 	    tb[ETHTOOL_A_C33_PSE_ADMIN_CONTROL]) {
+ 		struct pse_control_config config =3D {};
+=20
 -		if (pse_has_podl(phydev->psec))
++		if (tb[ETHTOOL_A_PODL_PSE_ADMIN_CONTROL])
+ 			config.podl_admin_control =3D nla_get_u32(tb[ETHTOOL_A_PODL_PSE_ADMIN_=
CONTROL]);
 -		if (pse_has_c33(phydev->psec))
++		if (tb[ETHTOOL_A_C33_PSE_ADMIN_CONTROL])
+ 			config.c33_admin_control =3D nla_get_u32(tb[ETHTOOL_A_C33_PSE_ADMIN_CO=
NTROL]);
+=20
+ 		ret =3D pse_ethtool_set_config(phydev->psec, info->extack,
+ 					     &config);
+ 		if (ret)
+ 			return ret;
+ 	}
+=20
+ 	return ret;
  }
 =20
  const struct ethnl_request_ops ethnl_pse_request_ops =3D {

--Sig_/q.5VMWPI.Hy2VZwII.5Qerr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaUiiQACgkQAVBC80lX
0GxNRAf/d6V6b1DZWRxA6myvC+YUaSJUhf/Tjg5UZ1eE76/DNiWb6LrXpmt16A+x
wERDIg5ObaKmyaDz/peUSzZYjJmWtaMZdUNGXV8tCrggpmfPi98BmJYluvq5r97H
jDDR2DLCGOo3XhMU4hC7F0bK5VH7+xVYZpUlBZN7D0QGrjcBHCPQKd8h9AO7NWDX
h8a6bXdUvYJrNBbirfCbSbac1q92rddyIXTzVico+D5+dYGa9YkkZhU11peE+lqW
ap+6HteVPElsL7PCLOJ38WtLwkukNv/2fyAk5Ch0H1dYTJKBORzI8QhzY/RN4EB9
MStWyaxAncHQrAnU8knTocsRkCOkFQ==
=NlhN
-----END PGP SIGNATURE-----

--Sig_/q.5VMWPI.Hy2VZwII.5Qerr--

