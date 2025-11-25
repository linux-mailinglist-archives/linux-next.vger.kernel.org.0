Return-Path: <linux-next+bounces-9200-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AADB0C836F5
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 07:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C9363AEBDA
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 06:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0681D72617;
	Tue, 25 Nov 2025 06:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CkBeqRLN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F45870808;
	Tue, 25 Nov 2025 06:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764051098; cv=none; b=RUblN4yEpoM8+NF2aYLcCSop/hqhDee00bfufpl5eEXMkJjjVsrS1sD6m/yQi6LEYyP56SErui+Eu4jlFC0O/cYySDAXqdHnTM11WwMJj6QjHzAN8Wvu9/L6PVtLzwNZRwuZgop5FNxrI2DQpSOPspq43eQgo1apg7fxl8sZp1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764051098; c=relaxed/simple;
	bh=tFZqcWmEgtjuy5HDTfR719Ja18iAM/hwwONs7XDDt/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BIuEncnmR7eI9bNJR7dLBlxsxhuLJ4LMDW2Y+wDnO7d8p73XBtPODNU4TQXrbyCI7+RUIBShT9e+tQaKgzve+NwW40HX8zSS9C6H9zvH8+x3BIZ/8s9iGvKyUbUW5nzF/0+a+sNPe9KfiZYW3upQPYyEx+9bm++fcgMIZq16ljM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CkBeqRLN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764051091;
	bh=nO+w+gwCRnFgC0Psl2rI2A5PuUhGJPMjHFLLKoctrMM=;
	h=Date:From:To:Cc:Subject:From;
	b=CkBeqRLNabgpqa7Z2WNaMhulg9kveOWGH6hy+Yty5UVCk24zr3mrAmu8gPRDRCHaQ
	 kz/LEWh60yQZlIj4/F3PKA0Oe44T+1fGROEZSO1DV2WB7yrQFn5sNPZnt1M2ah8/ib
	 bW+2SSCVNixPyw1prCmf0fi5ZQcsLp0GVtFSX/PRWNSF/HQ2jc0WeBRT0rN7fT0oZc
	 ZpSoQz5vXTyRiJQ1YlXOEEFYfZlaOdg3ktC1uT8FvcSWHFWzQlzt4yOeCDaoVyy9cS
	 9rgllYbZKXMGzR3r1UNkZVSFm5Jf19ynaesm9UP1zi6Zqh/0z2zN6VSqGba4QtSVdh
	 LMDFFpcobUhzA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dFslR3mB0z4w8x;
	Tue, 25 Nov 2025 17:11:31 +1100 (AEDT)
Date: Tue, 25 Nov 2025 17:11:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wei Liu <wei.liu@kernel.org>, Christian Brauner <brauner@kernel.org>
Cc: Jinank Jain <jinankjain@microsoft.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Muminul Islam <muislam@microsoft.com>, Nuno
 Das Neves <nunodasneves@linux.microsoft.com>
Subject: linux-next: manual merge of the hyperv tree with the vfs-brauner
 tree
Message-ID: <20251125171130.67ba74e1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pp3PsW1na.Lt9kdajcMBGeT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pp3PsW1na.Lt9kdajcMBGeT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hyperv tree got a conflict in:

  drivers/hv/mshv_root_main.c

between commit:

  12692f6b7689 ("hv: convert mshv_ioctl_create_partition() to FD_ADD()")

from the vfs-brauner tree and commit:

  c91fe5f162f2 ("mshv: Extend create partition ioctl to support cpu feature=
s")

from the hyperv tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/hv/mshv_root_main.c
index 1d8d8d00e4e0,bc15d6f6922f..000000000000
--- a/drivers/hv/mshv_root_main.c
+++ b/drivers/hv/mshv_root_main.c
@@@ -1900,6 -1974,26 +1977,24 @@@ static long mshv_ioctl_process_pt_flags
  		break;
  	}
 =20
+ 	return 0;
+ }
+=20
+ static long
+ mshv_ioctl_create_partition(void __user *user_arg, struct device *module_=
dev)
+ {
+ 	u64 creation_flags;
+ 	struct hv_partition_creation_properties creation_properties;
+ 	union hv_partition_isolation_properties isolation_properties;
+ 	struct mshv_partition *partition;
 -	struct file *file;
 -	int fd;
+ 	long ret;
+=20
+ 	ret =3D mshv_ioctl_process_pt_flags(user_arg, &creation_flags,
+ 					  &creation_properties,
+ 					  &isolation_properties);
+ 	if (ret)
+ 		return ret;
+=20
  	partition =3D kzalloc(sizeof(*partition), GFP_KERNEL);
  	if (!partition)
  		return -ENOMEM;

--Sig_/pp3PsW1na.Lt9kdajcMBGeT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmklSJIACgkQAVBC80lX
0GzDLAf/Ywr+5pfpk2RYDxjoAYwfVcSKEzkCY4Tbiy1kztbhQQCbZMk2XZE3RQwU
b/eFuhmjVbiIgdY7pl84IEMMG48SBlf1DbElzx2PZlQOgyO4SqDLHnG6F24H7QiC
96E+Db/vJbnKJl4eJaiqfOi+gtbPVyx0GAC3fqjiHu2Qx7wNoq2vPKnk0KOMp6u/
T4+edGtE5fSTbiRRVC3XfPP8R+eVs5bx3RGie39tGr8ORlhC13J/w6IvwcxIp9i+
9acXB1m+wK5jQcei2e9/H8ttuH+gejwaU+UXJwWlNfNfdztemBEF4kjo6t7xJOva
EGISrujLSXfZDfxj4wEGsdEfRwilKw==
=qOKO
-----END PGP SIGNATURE-----

--Sig_/pp3PsW1na.Lt9kdajcMBGeT--

