Return-Path: <linux-next+bounces-5316-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E4EA1AC91
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 23:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D8233AAEBE
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 22:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5511CF7A2;
	Thu, 23 Jan 2025 22:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="R4pqAtk0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E661C5D43;
	Thu, 23 Jan 2025 22:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737670612; cv=none; b=LR8mPbpL6MaObtAk4cxGXpAxHNFwWE5afHWUEDS2LBURdhZAcVckjlahp+Wz7LNNlEmno36mPXXAHiEhQ9d39ib+lMe2PuxdRLOe81UGzX32TFAxCHt2f5TfwXraDqhOzHyTi48qxfAYOSmHAVKuNuig4fWXsO8OCeDgZ4/HjyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737670612; c=relaxed/simple;
	bh=Srx69i6vcvTGAgk/GAUZPseOchbYof6WnSqh2S1tMr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=E5DmmgS6RozbDq8E/z2E26IFju/YH3WlT41O5JTNwrUNdALZkpWvGPMOPVBObMSrZcw6WMN9SMuTzlXOKQdv/lkiGN8D9q41bup1RXR4qDbGCzTMynkwfFp5WljfbmiQDHPuApzb2eWBibB56jG3RsZKp3JNRKOIVEoEYFdcEXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=R4pqAtk0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737670597;
	bh=3dyJHimM/25VVmjEkizUOYXyNWf1GGle7qq5XH3PPlw=;
	h=Date:From:To:Cc:Subject:From;
	b=R4pqAtk0PRBnZUh6+JrQbvckeXq+YZjkyO5gljJAwMkAVoDxGLd0V55M85tEiT61N
	 LRtdxLmKescvgEJCXtLc0P9ABRMGXTtj/CniAuTdXw2pMFTWtc09zYxlp1FN8r1jBN
	 533IZ6eXNiFBtA4Eg0oa5eWp9UuzZwpjnkLyIaCL4ac7zR6eO4c2CJShxb2D79KYx6
	 KVKOYv5kWqKcPUYqD4hrInvR4W+aFPtoQO6gsoUPVkDQfZCIqTW9DH3MHGungQg2iw
	 sRA9y6e//5TLC3muMD8T9LijPxtEbG+cIKS6ecIQusS0N6rv7y10kYqHlUHLYpg014
	 SeMZCf9074ZfA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YfFfD0XDkz4wcf;
	Fri, 24 Jan 2025 09:16:35 +1100 (AEDT)
Date: Fri, 24 Jan 2025 09:16:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bschubert@ddn.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Miklos Szeredi <mszeredi@redhat.com>
Subject: linux-next: manual merge of the vfs tree with the fuse tree
Message-ID: <20250124091643.108d1a02@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CCs..c3u+EsTvGiS53_McdD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CCs..c3u+EsTvGiS53_McdD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/fuse/dir.c

between commit:

  e24b7a3b70ae ("fuse: make args->in_args[0] to be always the header")

from the fuse tree and commit:

  d6726de37cbf ("fuse_dentry_revalidate(): use stable parent inode and name=
 passed by caller")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/fuse/dir.c
index be693a8a1010,3019bc1d9f9d..000000000000
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@@ -175,10 -175,11 +175,12 @@@ static void fuse_lookup_init(struct fus
  	memset(outarg, 0, sizeof(struct fuse_entry_out));
  	args->opcode =3D FUSE_LOOKUP;
  	args->nodeid =3D nodeid;
--	args->in_numargs =3D 2;
 -	args->in_args[0].size =3D name->len;
 -	args->in_args[0].value =3D name->name;
 -	args->in_args[1].size =3D 1;
 -	args->in_args[1].value =3D "";
++	args->in_numargs =3D 3;
 +	fuse_set_zero_arg0(args);
- 	args->in_args[1].size =3D name->len + 1;
++	args->in_args[1].size =3D name->len;
 +	args->in_args[1].value =3D name->name;
++	args->in_args[2].size =3D 1;
++	args->in_args[2].value =3D "";
  	args->out_numargs =3D 1;
  	args->out_args[0].size =3D sizeof(struct fuse_entry_out);
  	args->out_args[0].value =3D outarg;

--Sig_/CCs..c3u+EsTvGiS53_McdD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeSv8sACgkQAVBC80lX
0GzZswgAplOD397UHrkp3Q/cZEGa6LokUXp3+KK0nc9PZr0kNkfl/WAkmyMUIhir
Gl6y4yAoT+/YGnt84X0DYackK30Jdgj8yBx11kEFLg5di4sH0GQ5SP6LJffvbbj1
u3qRoeBmqCL7xyM73T7nK6a5IVWj5pdfwYA4WnfaHwhVv1MOSMWgwBAkuUQ8ktg0
stQ0Xjt9UmanJPEjhnGdT50mGO48FEPuuUFt4f2Lcf4WutRZ8k4ZclrDQWkDCoQw
CY6qyJXfRLsXkGCyofYcnpR/G7lVReRuGECv7OzReE41zuCsQDjkFo8SnBEIThy4
hW1QlRTYMvLvDbtRp0nyqU9wc1525w==
=cJbL
-----END PGP SIGNATURE-----

--Sig_/CCs..c3u+EsTvGiS53_McdD--

