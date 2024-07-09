Return-Path: <linux-next+bounces-2862-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC1692B0B0
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 08:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3ABE2B20C55
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 06:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6794013C699;
	Tue,  9 Jul 2024 06:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RMKjUL6O"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A0213213A;
	Tue,  9 Jul 2024 06:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720508234; cv=none; b=q1+QQ54dwfQeQGfX21Gt5NwTHa1H2EThGmYnwUS3YTkb/Z+wkqMLGbu9K5kBOCuO7a6+fqq7KKgH2pGJsZR+bS1WLQyADvQMp5oiRnFfKH5wo2jhOoLn6eYzWQanfRtqXqztk0OVlBIvhYk5VX9bl2qYV8JqR3JIyfpX69wRIXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720508234; c=relaxed/simple;
	bh=F0TXOv4QIiWNQv5/1MDKa87gn1F+uJlb8g4IlmcRKj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DTgBmzZSZtKXALuxV0GwiRNk9utUFc4ReqhzNHqkZm/ZBqXrPQCFJZRIhvGSqKn+AxfcZNPTwUVjaofVDcsYgkF0q7OcPUzYJdz9ov1k81UvI5G6FNVycNzzhsyzjl+4020spcRooGyts0me1CG7FBikArrprkKwAvfrPRahIOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RMKjUL6O; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720508229;
	bh=w0JKAHyhllOFuwQHWSii+U9s89T8TLXYRaEghP1xmVM=;
	h=Date:From:To:Cc:Subject:From;
	b=RMKjUL6OkTuiqxlZ8YsUH4YeMOwFNYaGjOU6vnpSESHZzpnJVN6soo2eCVxRPfzY2
	 rxpCsf92dqib+ai8xzfFDP4OsPS7p3dneJJa8xpuYmpMUXN++oVOOPer2s+RF0SzJH
	 G9ExZrC4rsRVHBgAYsjVREtzXHH3fFyUsEMu9H4eiIyBlYXd4HmvEaa3cq510AewoE
	 imW3hCoPw+Pt/YuvhrNTOqKCt7FUcH+a3DVCo012HzgioXkwceuXv65WEbp9fNKTUs
	 hBsrF581uzHHa3P4F/f9HU5HXo5bsO/heWdCTUXBQKKwA0JYHNs1S64XFPkr49AOti
	 97+PAvRqy5e1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJBcj19PYz4w2R;
	Tue,  9 Jul 2024 16:57:08 +1000 (AEST)
Date: Tue, 9 Jul 2024 16:57:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Tomas Henzl <thenzl@redhat.com>
Subject: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Message-ID: <20240709165708.3f8e3498@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T511yx9uxaRgdDo9lMOp/sB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/T511yx9uxaRgdDo9lMOp/sB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/mpi3mr/mpi3mr_transport.c

between commit:

  9f365cb8bbd0 ("scsi: mpi3mr: Use proper format specifier in mpi3mr_sas_po=
rt_add()")

from Linus' tree and commit:

  de24085328c0 ("scsi: mpi3mr: Correct a test in mpi3mr_sas_port_add()")

from the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/mpi3mr/mpi3mr_transport.c
index 82aa4e418c5a,27865ee896d7..000000000000
--- a/drivers/scsi/mpi3mr/mpi3mr_transport.c
+++ b/drivers/scsi/mpi3mr/mpi3mr_transport.c
@@@ -1363,8 -1377,8 +1377,8 @@@ static struct mpi3mr_sas_port *mpi3mr_s
  		    (mr_sas_node->phy[i].hba_port !=3D hba_port))
  			continue;
 =20
- 		if (i > sizeof(mr_sas_port->phy_mask) * 8) {
+ 		if (i >=3D sizeof(mr_sas_port->phy_mask) * 8) {
 -			ioc_warn(mrioc, "skipping port %u, max allowed value is %lu\n",
 +			ioc_warn(mrioc, "skipping port %u, max allowed value is %zu\n",
  			    i, sizeof(mr_sas_port->phy_mask) * 8);
  			goto out_fail;
  		}

--Sig_/T511yx9uxaRgdDo9lMOp/sB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaM30QACgkQAVBC80lX
0GwVmQgAk9XUPMw49w+zT9uAmQ4spf44yUxg5HEswz1XMAx+mTzzMyU7wAZhm+v2
meWwhq8erwgXVEgNDbnzBeOGzlsOtRljpPyNk1P3qhcBD7gsVh/TUkYdEhjzHr07
UKCxmeSd9u0rU4yfkOU4Ju5tBkcOPwY5C7acYEgnx3bFq9alrKsH67kitYXLgCwP
A/GgMf2MYrU+qDJJmlhMKXahbDZM8Oj8MvrMSEd1CLwZ7mawZDotSxDx0IH9UvTS
BHhKZeLM21uiNhRY6sErAGOd0Gnw3lUJvTDKI1de1xzvVnRJg60MxRuCrKtxA6eP
wX4fvBk0eyCxnh+w5JestFo570oeiQ==
=xk5+
-----END PGP SIGNATURE-----

--Sig_/T511yx9uxaRgdDo9lMOp/sB--

