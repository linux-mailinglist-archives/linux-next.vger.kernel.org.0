Return-Path: <linux-next+bounces-8445-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F08B9595D
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 13:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14E1919C2145
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 11:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38E3321266;
	Tue, 23 Sep 2025 11:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKrfdmBZ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA30730F545;
	Tue, 23 Sep 2025 11:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758625954; cv=none; b=nGuBhwkNRo6CpUljnnJ6H908aRjMSMw2AJC4tfVdF3fgxbtcjJJ/5ul4lKr43194BewRjuX8uc0tfIbAjdulAP0OS0A52yke7mcgriMj8dvp39lg23RwoR5csHu8B+jRNmqV7Q06tPodpZM0EykflJ5ebg6eSc04OOzANVafzbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758625954; c=relaxed/simple;
	bh=H+GZct5cSXZhW0sO9IwNI4/Cnpyj4hl9NrIATJDpM5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VF47/IOZ/OD88GPYf5Y1o5IE4qylI/S+gbbVTQRNG+PlKw/ZHONPt19V1mJWLC8LA6CYywm2Xt8HIxlhuFItb9TobXH7SUzNB+s9r5pIMPwSunAsyXlBpJFtjM8d27DpnguW5bXjyX37fp39hJjqLTee8NprDt0jskPoWRB1q5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKrfdmBZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B302EC4CEF5;
	Tue, 23 Sep 2025 11:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758625954;
	bh=H+GZct5cSXZhW0sO9IwNI4/Cnpyj4hl9NrIATJDpM5k=;
	h=Date:From:To:Cc:Subject:From;
	b=BKrfdmBZkNvdXS8w2xM/Ig4BE53vV+W/D8jYyAj6Io+7w4bmaqspiE70LN5kDd9mO
	 BOIXlyAve7SERU6STfyiIMzizmqffgKsk3iWQttatY6S8iYPOFFKyG8FMhHC4v1yzH
	 W09CLMAY+EEbow3RvgC5sn0CKDzWuQxl/DQ7f8/MhmHueJkWuWcai+U1SuyuOZNqbU
	 yIISytRfU5zS3O+HrNyb+dYjeJbEsRbKpEyUaDdmhVj6Y8UZb4XckNtu0nxsqC8A0t
	 iFoDrCldaT8Aio3/mAXaLsxf3GEmhekk2CemyvfEmPlYWFSkFKkzvxT+12vAFAa4ps
	 bOCjNUWkz6/3g==
Date: Tue, 23 Sep 2025 13:12:29 +0200
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: linux-next: manual merge of the bluetooth tree with the net tree
Message-ID: <aNKAnfV3XcvY2dhZ@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VeaPFBbprUcFGXes"
Content-Disposition: inline


--VeaPFBbprUcFGXes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got conflicts in:

  net/bluetooth/mgmt.c
  net/bluetooth/mgmt_util.c
  net/bluetooth/mgmt_util.h

between commit:

  302a1f674c00d ("Bluetooth: MGMT: Fix possible UAFs")

=66rom the net tree and commit:

  3b3eb857d5ab6 ("Bluetooth: MGMT: Fix possible UAFs")

=66rom the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc net/bluetooth/mgmt.c
index 225140fcb3d6c,ee7068fb9fb59..0000000000000
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
diff --cc net/bluetooth/mgmt_util.c
index aa7b5585cb268,258c22d38809a..0000000000000
--- a/net/bluetooth/mgmt_util.c
+++ b/net/bluetooth/mgmt_util.c
diff --cc net/bluetooth/mgmt_util.h
index bcba8c9d89528,e94738d992900..0000000000000
--- a/net/bluetooth/mgmt_util.h
+++ b/net/bluetooth/mgmt_util.h

--VeaPFBbprUcFGXes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjSgJ0ACgkQJNaLcl1U
h9B1gAf/aKyL+IY2KNUFZnHrjdYjSxe9e9r2qFn9BIFdHBzsR34bl7+oNFuc5rr9
cJue5kNhRG+1PHzaCPMv/wK8gHNihHXa++S4ZdIwe2xbhli0XFxEg5G2C6NtRVOQ
EGxZdDnBUwizOSJDCcthhuGg1+/zG+o/aFZR40cLSNrcOt3/QO4hIAGjuc+NhnO6
d3iuyC7u8mVaktnhVm92U5Hu0oLWGxaHMSIVS6WMC9Mk++Xeroq4HpPnzts2+ueC
mHxXt0wETVj/NS2Rvk1IHIFyaI2sCTKTemWkaprkMG2I9Rzqx/f9nqz/zPhS0f8T
siTXR4XB+u1lR1fdnX3lKyrFY0HNfQ==
=DIWd
-----END PGP SIGNATURE-----

--VeaPFBbprUcFGXes--

