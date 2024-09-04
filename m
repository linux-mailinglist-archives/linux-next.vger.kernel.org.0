Return-Path: <linux-next+bounces-3579-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C802396B043
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 07:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 556A5B21EEB
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 05:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D98C433A9;
	Wed,  4 Sep 2024 05:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fJumvytq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CADF82C60;
	Wed,  4 Sep 2024 05:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725426332; cv=none; b=PyQk0WlpOeJzQSqqmTQXx04/bxmtVZ+txjJyx+8RgrdM87GBqtNNf8iL3fh8LG934L3bFMGG1lNLIVPMoH1DlWzh2cJXQtItcrjFIJeUkYbPXjaiuHi/VSH8Axz0Xs6cwfN5hDqQjbDwIBuRJCiyzmdWmXORU6BFHrhsMVY72oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725426332; c=relaxed/simple;
	bh=PgdvbH11XmsZ5U7OHuKqSafP++l7ZXuPR2HUPocHO6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=onr40GweJoxW3mT5x5fyUvUubg7a0HfwO1Guxu8fmHzHKPhFkQi9xihcMCPpkFrRpKi/O7CkOFnswnpTqVpJPlk4m8NS0g0CO5MTvrGGwkVbkkNFHFqmknvGpOi3C/YvM8upIg2WecGbhir9QC8gT6fhPyFeozm2tnQC+zK9Des=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fJumvytq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725426324;
	bh=NAaMoxOCJ8yaps3swDHsqzPY7ywBTbwVbaYo0OgWZ/E=;
	h=Date:From:To:Cc:Subject:From;
	b=fJumvytqh33Kz6uM64mZdY+0QpLJ+4XesiwENASpCodUhR/lDWzGumdHwNVVLi0Dp
	 OAvCPunh+pQOTLsx11INh/RvK6qJd3U7s9Cq9yQmcSl5BmW2/2zzZICiwUQF95lztN
	 iHeGlVGNjhUhMh/0juGbmvPWmceD9weKmSINfiL3H5b4SxB6gQaS88cTHupQFwneti
	 ypnCFFhWKWW4A5iEkSjonVM+VVjoIAw0vX2CLu1CSVbCxuCETYq8h2MH7IvHPZvz45
	 kX3joeg0G8/aSrqOyKu9yA1915JR7vUVuwSM1l7U1ccYHEb+/JEinib+6c0lhMrT5x
	 qB48Pps8PGGXA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wz9RR5zjSz4wb7;
	Wed,  4 Sep 2024 15:05:23 +1000 (AEST)
Date: Wed, 4 Sep 2024 15:05:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the usb tree with the usb.current tree
Message-ID: <20240904150522.0410150f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DDjeWMXVs/vgKyeH8PMghzo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DDjeWMXVs/vgKyeH8PMghzo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/usb/typec/ucsi/ucsi.c

between commit:

  87eb3cb4ec61 ("usb: typec: ucsi: Fix cable registration")

from the usb.current tree and commit:

  73910c511b1a ("usb: typec: ucsi: Only assign the identity structure if th=
e PPM supports it")

from the usb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/usb/typec/ucsi/ucsi.c
index 17155ed17fdf,f0b5867048e2..000000000000
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@@ -993,11 -929,12 +939,12 @@@ static int ucsi_register_cable(struct u
  		break;
  	}
 =20
- 	desc.identity =3D &con->cable_identity;
+ 	if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
+ 		desc.identity =3D &con->cable_identity;
 -	desc.active =3D !!(UCSI_CABLE_PROP_FLAG_ACTIVE_CABLE &
 -			 con->cable_prop.flags);
 -	desc.pd_revision =3D UCSI_CABLE_PROP_FLAG_PD_MAJOR_REV_AS_BCD(
 -	    con->cable_prop.flags);
 +	desc.active =3D !!(UCSI_CABLE_PROP_FLAG_ACTIVE_CABLE & cable_prop.flags);
 +
 +	if (con->ucsi->version >=3D UCSI_VERSION_2_1)
 +		desc.pd_revision =3D UCSI_CABLE_PROP_FLAG_PD_MAJOR_REV_AS_BCD(cable_pro=
p.flags);
 =20
  	cable =3D typec_register_cable(con->port, &desc);
  	if (IS_ERR(cable)) {
@@@ -1094,8 -1009,10 +1041,9 @@@ static int ucsi_register_partner(struc
  	if (pwr_opmode =3D=3D UCSI_CONSTAT_PWR_OPMODE_PD)
  		ucsi_register_device_pdos(con);
 =20
- 	desc.identity =3D &con->partner_identity;
+ 	if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
+ 		desc.identity =3D &con->partner_identity;
  	desc.usb_pd =3D pwr_opmode =3D=3D UCSI_CONSTAT_PWR_OPMODE_PD;
 -	desc.pd_revision =3D UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV_AS_BCD(con->c=
ap.flags);
 =20
  	partner =3D typec_register_partner(con->port, &desc);
  	if (IS_ERR(partner)) {

--Sig_/DDjeWMXVs/vgKyeH8PMghzo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbX6pIACgkQAVBC80lX
0Gw48QgAnNbFLvzNKT3OZZbQntVMNnjWrDIxZoU4975Tv+dmb8UGwcAlpoJhkxr8
n8DcXopXedL28nvRpkl6mdWg0f7Qfed3gO/YB1oneWgNhvYePZAtHU9JrEe5Hh+E
95aOeg/odug/9iVgXP7FG0T8ltJ9UvUaSfuh4lwGDTuAq219TZsVZiEJxcNk4rZQ
nX/6xIwDjJLF+aVtfzSvqnnu5c2D1wbK+/Wg3rea4A90UUjhSxA6CYnqVsq1z6S5
lAt1KmyGS0yWRYJaZ4lLBAB3dk3hpLJpop5fX7W39y0wcWNwm0MmaUsxx+7c4FyD
G31l3kS8a9mc2B1aGc3UFI/MwEAcqA==
=JjGC
-----END PGP SIGNATURE-----

--Sig_/DDjeWMXVs/vgKyeH8PMghzo--

