Return-Path: <linux-next+bounces-4472-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5794F9B285B
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 08:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 061091F216C4
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 07:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C65A18FDBC;
	Mon, 28 Oct 2024 07:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hQnhcfcf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C13156960;
	Mon, 28 Oct 2024 07:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730099118; cv=none; b=V40zx4MWVbD4HvRo49ClxZRve1tk2IGZAI5QlODVPJPA1Xtv1JBRt7AtSxPdEJtsAaJNE937+M/qHK71iMnK+U2/IrZIosDTJ69bbO96VHZ3wROd6ML23EHA/9GY5EWSWlp7TlJe0UfoOAy+R8XgalpaNglO4CK24z2EvYMwXIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730099118; c=relaxed/simple;
	bh=LDgFDbWbrvmdtGWzpkzZuhjnlSV+9x/PwmMyj+8klfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=I9RYFfCMcYGVvJKwoqh6nBUbt03ujpqtPbpmRMHZtwGeQnIOo3jDASPUr06qRvWMEh5sgGmOwM/HpI9LW2e37vBRy9fXyB2Ie4mZEhR0PgNvqPjKbbrr5XxZq67/+PeBrq0b1Z18WnrfjxFT7ma0hs6+CwCMhl5LmsNGqF3HBkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hQnhcfcf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730099106;
	bh=WSlg3RBs3pgZnbbgr7QK7apsg302HA4Unp2DymCiax4=;
	h=Date:From:To:Cc:Subject:From;
	b=hQnhcfcfn3uKwi/IZ4EiqUS9/WA3F3msJbowBtrHXDYsAoCvqF8WZR/MSyxSOdNw9
	 nHgaXvANsmo+dmJP7JZfR7eBvzxkTCTkwb+wRAOgvjXYd4qlHGytYzqT1B/vrQgdwq
	 MYbSeWjoYAV8IflATPoBIFwO/JcFTrzcaYZWFZuaqdndUTUvWf2EFNomHjsS0Gm2cF
	 dQhCPVt/vpd16HlFnb7gX+wKsdm26eNDlanYCfLNG92l730bQo9t/9VXqRgNIx5q0v
	 z5eRqL7lXMBUVSRDa0kg5BqKVx95bxmDcO3M8CqxLxB784wpdE50GohFusvII+bJmv
	 lH0gaeVBPajGg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcPXd4sNXz4x8H;
	Mon, 28 Oct 2024 18:05:05 +1100 (AEDT)
Date: Mon, 28 Oct 2024 18:05:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Peter Wang <peter.wang@mediatek.com>
Subject: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Message-ID: <20241028180506.0ec4d6fc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vib9vbDQ2O61Xr9SXn_pPql";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vib9vbDQ2O61Xr9SXn_pPql
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/ufs/core/ufs-mcq.c

between commit:

  bf0c6cc73f7f ("scsi: ufs: core: Fix the issue of ICU failure")

from Linus' tree and commit:

  2c73fb138da5 ("scsi: ufs: core: Improve ufshcd_mcq_sq_cleanup()")

from the scsi-mkp tree.

I fixed it up (see below - I used the former version of the logging
change) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/ufs/core/ufs-mcq.c
index dba935c712d6,988400500560..000000000000
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@@ -569,11 -569,10 +569,11 @@@ int ufshcd_mcq_sq_cleanup(struct ufs_hb
  	opr_sqd_base =3D mcq_opr_base(hba, OPR_SQD, id);
  	writel(nexus, opr_sqd_base + REG_SQCTI);
 =20
 -	/* SQRTCy.ICU =3D 1 */
 -	writel(SQ_ICU, opr_sqd_base + REG_SQRTC);
 +	/* Initiate Cleanup */
 +	writel(readl(opr_sqd_base + REG_SQRTC) | SQ_ICU,
 +		opr_sqd_base + REG_SQRTC);
 =20
- 	/* Poll SQRTSy.CUS =3D 1. Return result from SQRTSy.RTC */
+ 	/* Wait until SQRTSy.CUS =3D 1. Report SQRTSy.RTC. */
  	reg =3D opr_sqd_base + REG_SQRTS;
  	err =3D read_poll_timeout(readl, val, val & SQ_CUS, 20,
  				MCQ_POLL_US, false, reg);

--Sig_/vib9vbDQ2O61Xr9SXn_pPql
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcfN6IACgkQAVBC80lX
0Gz2Dgf/ZIdT8FICGCsngnXi3C7C621sfFMq/AOGRViCF9FDAvbhjlch49DOiuex
fys4zYSD9udkU6hJ0MEBT1GOCfwsjfT63g4AewnrqQcj5Irn18zx9BZpwRHbJhff
FxqCMoyfwX+uVD1ToOKXjSKeCzO2ppVCPVgnPiFVznrICkea9lZJqOMZpRWx3nqB
ETdIbtflKWOAnbYg3M7yZYqAz+i3BTj2HnD7ReKMHFko2f56IYuGgLz3EGvALoXS
fE+NFUuOWa19+nbtIGJBFSdr1aga9YqqkGT8bKH/lnvX/TAxssDEmG64i8xztjbA
Zt8SNqW2kd1j7+Hk1GZcgsoSLibTZQ==
=cNp5
-----END PGP SIGNATURE-----

--Sig_/vib9vbDQ2O61Xr9SXn_pPql--

