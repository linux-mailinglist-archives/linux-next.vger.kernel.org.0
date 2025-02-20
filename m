Return-Path: <linux-next+bounces-5512-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDA4A3CFFE
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2025 04:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3763D18953AD
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2025 03:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF1014AD29;
	Thu, 20 Feb 2025 03:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DChuayI8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608A535958;
	Thu, 20 Feb 2025 03:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740021368; cv=none; b=ueYixDDtNKpLzYkDuir48pDbQVLGh/BdniODIjpiNI+XikNVROmycnygQImSudFSwZXhGtdt4KaZbSTfb8ix2KkOwpP2RaWVk5JLQzAJ0/adkuBBUTv/VyxVp1963nNhdyZKvRLCHWFVlJ1MFUvHEopZd1iYBYYtV7igqZs3L6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740021368; c=relaxed/simple;
	bh=nPGMhUWYIpks9e6EFpGHLY29CxqRvzdWGksM9NHzd5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jZXQZ5Rt2wc5V2XmDxWlgxpnXXYQJ7KzMfyu6uRAG4PElz3Dt9diqe76mzVvIppaBwwj1ntUn1MZLFuGqGf69HvdG4b9fP97hx2RSSSbh22KQjD7Fn+M/tMxx0TQOuMO/0UXu8gpKtJ5b3nPvCRJ1zMr2mBk3ZiIFPvPOr7fUNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DChuayI8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740021361;
	bh=/yXepqxGrxwJecrbe8Vndr28izqVsiN8I1cu2CtsYw8=;
	h=Date:From:To:Cc:Subject:From;
	b=DChuayI8AHvlNgki5zjdX16WaRo0VHcmn+QLmlpgw+xoMS66UwFi29Vwkczfl8VPM
	 KZPweJZod63+aHXPCeb27rnHKD35bpb9QLipUZaOY+cY+1zw0JKO3OWn+cY3u8yLpc
	 Bvw9/UPGUs0juc+1lksVmm9O5BXMs9CC+7H43Jowwg1QdfnjJF1tab6vTUmc3lGX8b
	 E92ey9ftFglboRDwl5/8xGNWvkA/WCRcxvrou6UGz8CawaL+W33llgJVlCbQ7ukHIB
	 P87isOFGiS6Qb2KmKQe0VEM1iY+xugUc7HY5/6UtQ1Ek59KZuxNFwnoz/QDf/RWOIf
	 XRIOyBpKsOIoA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yyz1D4Yr2z4wyk;
	Thu, 20 Feb 2025 14:16:00 +1100 (AEDT)
Date: Thu, 20 Feb 2025 14:15:59 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: "Christian A. Ehrhardt" <lk@c--e.de>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Fedor Pchelkin <boddah8794@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the usb tree with the usb.current tree
Message-ID: <20250220141559.71d7db7c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/56WW9O0FjtZFH7h00Xb79xW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/56WW9O0FjtZFH7h00Xb79xW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/usb/typec/ucsi/ucsi_acpi.c

between commit:

  976e7e9bdc77 ("acpi: typec: ucsi: Introduce a ->poll_cci method")

from the usb.current tree and commit:

  f9cf5401526c ("usb: typec: ucsi: acpi: move LG Gram quirk to ucsi_gram_sy=
nc_control()")

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

diff --cc drivers/usb/typec/ucsi/ucsi_acpi.c
index ac1ebb5d9527,ada5d0d21ee6..000000000000
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@@ -131,25 -131,7 +137,8 @@@ static int ucsi_gram_sync_control(struc
  static const struct ucsi_operations ucsi_gram_ops =3D {
  	.read_version =3D ucsi_acpi_read_version,
  	.read_cci =3D ucsi_acpi_read_cci,
 +	.poll_cci =3D ucsi_acpi_poll_cci,
- 	.read_message_in =3D ucsi_gram_read_message_in,
+ 	.read_message_in =3D ucsi_acpi_read_message_in,
  	.sync_control =3D ucsi_gram_sync_control,
  	.async_control =3D ucsi_acpi_async_control
  };

--Sig_/56WW9O0FjtZFH7h00Xb79xW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme2nm8ACgkQAVBC80lX
0Gwyxwf9HpCikWafXgbbEUMxUiX20jElj4UWbs+Byar5e0P96fTBj26twq08YOI8
gRJFG0U6FgAIBUpnOUN097bgKgMtOJA8mUsiConMJvaQzPXNhdX3hliLrJtSGghz
25OfEdXRB6oF2OadVbWVS6gYicMZDyTBH233J8nWfo3B+NO1eJYtDfmicxq4DYiI
QwtC3PxWlgiDZpfhyKTEQAtCzhorJUlGqyYH5CtmyNsuN6Q6Vmbg0qk8LA1ULrZ0
SPHWKvzCkPNO631rvv5pBNu2KXHb5k3HHC10wwDNQCNJ1TaIWF3JYZlHVPSZii+O
SJQK4CmI/V7QqWe3T4cwQo1toameMQ==
=ba5A
-----END PGP SIGNATURE-----

--Sig_/56WW9O0FjtZFH7h00Xb79xW--

