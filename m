Return-Path: <linux-next+bounces-2694-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC01991ACAB
	for <lists+linux-next@lfdr.de>; Thu, 27 Jun 2024 18:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CAEFB256FF
	for <lists+linux-next@lfdr.de>; Thu, 27 Jun 2024 16:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695A8199399;
	Thu, 27 Jun 2024 16:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xd/yMpP1"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42459199395;
	Thu, 27 Jun 2024 16:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719505593; cv=none; b=MAui0UY4cS7eGqlfdLe1Z963GrrbvoY0ZIE8GPC8kCVYX5Wq9qqFMN7qoZePDLYnkf/ej68sutwEkkADJ1gMafFHeFKcqtJ4Qwp6J00w2OBZ3G6a0p7O6QkxYuoUiWQDiw30oh28ajlaMZPdP3uiX80nX5X7l+QiUiZiYA1eiKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719505593; c=relaxed/simple;
	bh=sU1Cb0L0FCKuWzazLB1vKSGcm3JPWOspMJs1Q1aG5cs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KwVmaJ406YBLmjSBw7GQPiYoBSLmuHAdyK4uiNkJdG/m0XbuP9dThYkOvWK0CQO3i1ru5Vhls0Wxa/td69Di+MKcRG70hRaCJcHMJRcGJcWqZg4wMujET3roLuRhB+OzQAZSUrixyPFtPM4DVFJmZ2lvtX/SoLXbq+yxj4vvaN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xd/yMpP1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D5CC2BBFC;
	Thu, 27 Jun 2024 16:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719505592;
	bh=sU1Cb0L0FCKuWzazLB1vKSGcm3JPWOspMJs1Q1aG5cs=;
	h=Date:From:To:Cc:Subject:From;
	b=Xd/yMpP1kRcpk/Z9V7wO9L6s8r7idpNbBIpV0lSl8Enmh+krhFIT28ZNo4+fy3eC/
	 TuMwruJsP4gZVeSqmx2cFhzTJqiSFtimZovb3QNwY+Re50eQCKk/Av+W0urr+9eoWb
	 a7A5pNqWWtQrk/XicjJcVwpzfbQBiij1uSr13yBRWdMJKviy7mHojy/pGmAhhW+i3a
	 liBgQrLOvQcx89mRYsXJkUbcVsg3wMv1xGOiLBoONpfy9A4QFR1hCGrb4ZiFrz8KVl
	 6FuowdM3D+gjFEArEEOiAq+ZuglIXguLfz9U0a9g+31L3tT/KfPztbngMWwuVJXAsv
	 76+vW12R1q3AA==
Date: Thu, 27 Jun 2024 17:26:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: linux-next: manual merge of the leds-lj tree with the
 chrome-platform tree
Message-ID: <Zn2StETOCb26F3I5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hh9JSyXiINCq6YZM"
Content-Disposition: inline


--Hh9JSyXiINCq6YZM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the leds-lj tree got a conflict in:

  MAINTAINERS

between commit:

  bc3e45258096f ("hwmon: add ChromeOS EC driver")

=66rom the chrome-platform tree and commit:

  8d6ce6f3ec9d5 ("leds: Add ChromeOS EC driver")

=66rom the leds-lj tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc MAINTAINERS
index de839b7c4ac2a,a7deb8fa20cac..0000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -5197,14 -5135,11 +5197,19 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
  F:	sound/soc/codecs/cros_ec_codec.*
 =20
 +CHROMEOS EC HARDWARE MONITORING
 +M:	Thomas Wei=DFschuh <thomas@weissschuh.net>
 +L:	chrome-platform@lists.linux.dev
 +L:	linux-hwmon@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/hwmon/cros_ec_hwmon.rst
 +F:	drivers/hwmon/cros_ec_hwmon.c
 +
+ CHROMEOS EC LED DRIVER
+ M:	Thomas Wei=DFschuh <thomas@weissschuh.net>
+ S:	Maintained
+ F:	drivers/leds/leds-cros_ec.c
+=20
  CHROMEOS EC SUBDRIVERS
  M:	Benson Leung <bleung@chromium.org>
  R:	Guenter Roeck <groeck@chromium.org>

--Hh9JSyXiINCq6YZM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ9krMACgkQJNaLcl1U
h9DAPwf+PdxHGqQdzW8qZldQ7mjUbiEmigrLHXulGhaZVJsySdDJS53MLqGOFKOr
qs3TTZw6mdMLsAjCV0xcKFS8/R0TcVmK8n5nmIJxx8qXAtI1DGrVbCeCBQDjAsn6
d4HBDgtowSniQYNchdpF599hh6Jz2b+6b2swNZduEOyOiWBKMQLMICd62T6/jl5a
xlG1ZkMQwxF74vsErHIBz3UeTXNsnO496v9Z2GePJAWz6g2MrHuH7zQaV88T8cIb
2v+RV1chI3YBXorXd1xw8O5KSEQVb803M8PohSZOnRpBSruKYQOITCmj/jYN3G+v
pddfvj+LPArZyFqu0ruHUWWFlM8peQ==
=JHu7
-----END PGP SIGNATURE-----

--Hh9JSyXiINCq6YZM--

