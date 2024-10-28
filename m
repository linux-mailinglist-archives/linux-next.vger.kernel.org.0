Return-Path: <linux-next+bounces-4469-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A55FA9B24B5
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 06:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D79051C20C50
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 05:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4605F18CBE1;
	Mon, 28 Oct 2024 05:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="avwbCJyf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D3F18DF71;
	Mon, 28 Oct 2024 05:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730094825; cv=none; b=CtV2NAdGV3vwGqVjQzdpqjtQLZ+pwUjM6scCLp3S7M3F6jtgPOjLcMrza7zwBcTX24H+drnMONBtW9fpjuL9MTjrJCWL1vRKoIWYoaTHkJLH2qjqMiwtDmA6bnUc8rzZgqdPc3pIyL9T5NKJOQE1w6VS33jhIFKxdgcFlxqkgF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730094825; c=relaxed/simple;
	bh=rhCAryFbARbugCTN8KIRFGGBFfR/gteFgNj5llYw3dw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QqqO7IMdWGGrS17I7t3DYoPQCl9DerGek1/lsuObdKI+KsSh2adsWvTxbRCEj+x4/lpMytQ6/D+wQADXQIxFInw7BZ6pgaFICKHztbBLnlTyiiuljM1y5PGskh4e76ATWsIWJNS5DCq5e66hxIt4jdrxMyrAsp0ousgZMvAiP6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=avwbCJyf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730094816;
	bh=nUcg8oV8gwkO1fNWusvM6ib0bCbmsoYFngaS/uXoum4=;
	h=Date:From:To:Cc:Subject:From;
	b=avwbCJyfug+LXYzyycyT+kORzM0GNM1kZZncxCo69nXLPs+bMub03oaWWnrkzBNMz
	 ciP+DRCbNqXNSqEql6BbuRPZun+bV2Zoyty2mLqdH2sOrH4lEFDB0Mldbop/y5FuNd
	 hVXigx1hOdoxcJI2uV0iXNGCs6toqR/KH4dhitJVxipLMm4ZS6LZyD2MxUqS+2/uF9
	 fncP4a/Z2iiYtjpqDh3G5nNzPR5BwS19UTgD9qjOjf7b6CDZqfEc3beuGtoYZYyQkq
	 B2Hg2eIqfxZjLSVIvCEM8k1t+jx6djaK5WbcT+c8rEIA9luG9qAhpLxvJ113OjPsNu
	 Ysd0fKHQWX11Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcMy81hMqz4wbR;
	Mon, 28 Oct 2024 16:53:36 +1100 (AEDT)
Date: Mon, 28 Oct 2024 16:53:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20241028165336.7b46ce25@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yYVO9r_NglM5bcap3ZpYVdT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yYVO9r_NglM5bcap3ZpYVdT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/iio/magnetometer/af8133j.c: In function 'af8133j_set_scale':
drivers/iio/magnetometer/af8133j.c:315:12: error: suggest explicit braces t=
o avoid ambiguous 'else' [-Werror=3Ddangling-else]
  315 |         if (!pm_runtime_status_suspended(dev))
      |            ^
cc1: all warnings being treated as errors

Probably caused by commit

  fcc22ac5baf0 ("cleanup: Adjust scoped_guard() macros to avoid potential w=
arning")

I have applied the following for today but I wonder if there may be
others.

=46rom 93183168618777d573cd809a971c4db59a8dc800 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 28 Oct 2024 16:01:15 +1100
Subject: [PATCH] fix up for "cleanup: Adjust scoped_guard() macros to avoid
 potential warning"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/iio/magnetometer/af8133j.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/magnetometer/af8133j.c b/drivers/iio/magnetometer/=
af8133j.c
index d81d89af6283..acd291f3e792 100644
--- a/drivers/iio/magnetometer/af8133j.c
+++ b/drivers/iio/magnetometer/af8133j.c
@@ -312,10 +312,11 @@ static int af8133j_set_scale(struct af8133j_data *dat=
a,
 	 * When suspended, just store the new range to data->range to be
 	 * applied later during power up.
 	 */
-	if (!pm_runtime_status_suspended(dev))
+	if (!pm_runtime_status_suspended(dev)) {
 		scoped_guard(mutex, &data->mutex)
 			ret =3D regmap_write(data->regmap,
 					   AF8133J_REG_RANGE, range);
+	}
=20
 	pm_runtime_enable(dev);
=20
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/yYVO9r_NglM5bcap3ZpYVdT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcfJuAACgkQAVBC80lX
0Gz4yggAkDqtFNdqC99ftr6usXN/bxYZGW4QT53BjFJPJv910B59vVbn/dsx2M9V
7HUyha+DW+6WOAOVi4DjwJZwki8RKJUFEd7F4Ev4VXrQJZlZtv0KhyigN1/vvKJO
YPFTkNqp0CSlKjifrxNRf4OunSPgioqb493KrNjRqvmXAcJjn5Ra3WlVAhuxuIJ7
OlDbZBXtMM5VOPIahmkGno6/bCBvjzc8f5f/a85fDjfbo95kd31VOs+5WDevbMoe
WreUxfpMjTgguV2mbs89pAn9J8Kpixxtdr5UW0NuurliFANSlL6zGvz6lMseyFNN
4eyq3zKHigq9Cg14ESr8mGd97ihWxA==
=lT4I
-----END PGP SIGNATURE-----

--Sig_/yYVO9r_NglM5bcap3ZpYVdT--

