Return-Path: <linux-next+bounces-4656-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB2D9C025D
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 11:30:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 081B71C21239
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 10:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1621EC00D;
	Thu,  7 Nov 2024 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D43XTnAb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D85C1EBFE4;
	Thu,  7 Nov 2024 10:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730975400; cv=none; b=jq3KWV455SSeSsmAiXQO1SATTgmuTbhSkGiWrUHt3cV69l+7S2NWBhGJ4AbwBtzuSQDFmgl90PdD/YhiOCCFUkJvLo0JeyIaHaGNrfUzm/OdetoaXv6bRPPxQEsamPZW7L17Ox4kGbKUhXLCVqvhZJOHvooNlFeudSaxS7DitFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730975400; c=relaxed/simple;
	bh=88kx15I9N++ufjc07ANmGyqlt+GZp1jTP2oNRgfI4C8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=arkHG9b6lPMK/NK+qcZNDtno+QyGZWlPyn4h5iUcBiwbAJGASFUePLFRZ1WOh1asclAjtiX9wGkolGHtNcvbfr95cRCx219ChKS4kUQjB99bU/JJzTAAX8A66ExOAtxZrhvKEP6zbLLj8yaGpz+q1oLUKI7opDkpeum9fSxkhSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=D43XTnAb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730975393;
	bh=Kt+ZN/aY4+hqs6IsnkxGJmU/NYZTgVYmalRrUQtKFfo=;
	h=Date:From:To:Cc:Subject:From;
	b=D43XTnAb2ZPndqox5EhUlczKhLTgUITnEUl/d0xngtlPx6eGop+5RrM6W3sbtzQOy
	 eUTJLngXvvbJbDm+KRZ4hG4m3rkwx/Dm3yPTx6q8BM8wO0AxK68j1vs5f873EJR8Fc
	 g/5VTDeFZZFYeqoiViIxUm7PKY4D739BQsLOahYVfOLVHR9TV4QPvlzJFVlOqg0xpk
	 9BNT84tXNyn0ISvzGES3QKfaVqFCb7n4LPoig/KBBs2mTrwSMbNFHx55ceC1Vwols6
	 pQCtx5oTLOr1uePrrmLPiVzd4Nst/aKkI4AiKPbdQ2wFed3I4oFRTaMXTjZmT9AE0M
	 npUGYebHHJ44A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkdcJ40S9z4wxx;
	Thu,  7 Nov 2024 21:29:52 +1100 (AEDT)
Date: Thu, 7 Nov 2024 21:29:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Martin K. Petersen" <martin.petersen@oracle.com>, James Bottomley
 <James.Bottomley@HansenPartnership.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the scsi-mkp tree
Message-ID: <20241107212954.4da462cf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MW/i7fdfDbWW5_BnyDBKQHx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MW/i7fdfDbWW5_BnyDBKQHx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi-mkp tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/ufs/core/ufs-mcq.c: In function 'ufshcd_mcq_sq_cleanup':
drivers/ufs/core/ufs-mcq.c:580:9: error: 'rtc' undeclared (first use in thi=
s function)
  580 |         rtc =3D FIELD_GET(SQ_ICU_ERR_CODE_MASK, readl(reg));
      |         ^~~
drivers/ufs/core/ufs-mcq.c:580:9: note: each undeclared identifier is repor=
ted only once for each function it appears in

Caused by commit

  bedea6f472ab ("Merge branch 'for-next' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/mkp/scsi.git")

The automatic merge resolution didn't work out right.

I have applied the following fix up patch (that may be needed when the
scsi and scsi-mkp trees are merged):=20

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 7 Nov 2024 21:21:01 +1100
Subject: [PATCH] bad automatic merge fixup for scsi-mkp merge

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/ufs/core/ufs-mcq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index fa25e9ac2804..18ca95e5b68c 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -539,7 +539,7 @@ int ufshcd_mcq_sq_cleanup(struct ufs_hba *hba, int task=
_tag)
 	struct scsi_cmnd *cmd =3D lrbp->cmd;
 	struct ufs_hw_queue *hwq;
 	void __iomem *reg, *opr_sqd_base;
-	u32 nexus, id, val;
+	u32 nexus, id, val, rtc;
 	int err;
=20
 	if (hba->quirks & UFSHCD_QUIRK_MCQ_BROKEN_RTC)
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/MW/i7fdfDbWW5_BnyDBKQHx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcslqIACgkQAVBC80lX
0GzI2Qf/eeM2Y3CdMRoj+nKe1Dw3DT9jG+9J7mSR16zzGIrEk6yRQuUmFEwBcYJL
arvqvYfvUosViSgDeuH/FvvbcQfzeGsQkR3rETpn6ZnxJlrtY/jzx4lp0T1gjbXa
WqD/To645S7ToXaykskiDyfQJQFfFoPV7hEqv5OhSZ4exUdslUwAMuZOjY6aBiNK
+OhEzy8eK+G3XhjptmP2bi3L9GFK5qr8rDoJiSSA/wUlFDQqruT9AmOiG6hEr0Rc
WGDGpbS0ahm/oIFGVT4Y6Tguqe9FVsyzDqdy8YEboJVKtYslEHAZ7oZVEp2xLs0p
yvlKEY50Z2JAwvAyHhTAyvK6/VG7dw==
=00bQ
-----END PGP SIGNATURE-----

--Sig_/MW/i7fdfDbWW5_BnyDBKQHx--

