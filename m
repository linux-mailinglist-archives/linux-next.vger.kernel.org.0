Return-Path: <linux-next+bounces-3629-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 013AB96E660
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 01:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66F65B22720
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 23:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF341B12D6;
	Thu,  5 Sep 2024 23:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iY4uZdU9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBC31A727D;
	Thu,  5 Sep 2024 23:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725579512; cv=none; b=YShxIfDKer6dK0rxblskt6MyLza+MNlVfdXTiTGpU2epdik0YtSjeL6F/uhL3N6xam2H+X+BKwfc/TxLcJHn9glJeadjfVNlKKDTqg96ZQUCT0ZkGK104GkEhMPFcExKVPFak8/65PuUys9Rw0Xu4Tm/nHdmtb9ctAbRtYkn7uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725579512; c=relaxed/simple;
	bh=iTi2JOz97bESOWj8nglttwZgx4x5PfAFi5U36iG7s18=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KIpdAmbE48powI1s4DWPHa31b+ym67B+EDTiGPFjoIunlNvmeX9i8wA9zTFM8gCX6DdMG/ACZW0lJhCv1P9UoXqdvWj1p91zJjzbPqshSuNLIHHtnTGJkQob75QsWMHrZkWsbx1DbInDbCP65sUV9gsisM75y8pCtQUqi73hIfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iY4uZdU9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725579502;
	bh=Wi/Q4FQqesbnU7Dq4vvMsfLMKI1LTv2tLmn82wfHoWs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iY4uZdU9z/DMryGACyowZOqJ6ylV7hiEwC57rglzKHh5A7ysWHO6PwJJrGxlFuVRs
	 wOpihwyhRpmdbyAdjZ/h28kfiPuhI4qTQi1jBy4mRF/5AfRbbG0iC3tN2IUFsCpvZ5
	 TTiZwTpAl9H+ZJyRtAaX7MFQi82oPJ3b9p/32gAQXB4vQpLHGMEf84fcvgvoJOEedz
	 9OzERIxdTsHWfdgdzQKd8kvw2vA7P0qaSJnrnDYdcOxjNILb6tJK4nIJK9pzTo+myr
	 t34V6zzXhnDtB2YbeVr4wjBPq6kdXdY2FH2GBZVNyC1EjkrJHS/V6ht9LUIAASddaE
	 xW1QRUyyj8JxA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0G5B1VKFz4w2Q;
	Fri,  6 Sep 2024 09:38:22 +1000 (AEST)
Date: Fri, 6 Sep 2024 09:38:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Steve French
 <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, David Howells <dhowells@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Steve French
 <stfrench@microsoft.com>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the cifs
 tree
Message-ID: <20240906093821.30c5114e@canb.auug.org.au>
In-Reply-To: <20240906084637.295241d1@canb.auug.org.au>
References: <20240906084637.295241d1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+Plm9A1xqUabYckT13.4P=L";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+Plm9A1xqUabYckT13.4P=L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 6 Sep 2024 08:46:37 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the vfs-brauner tree got a conflict in:
>=20
>   fs/smb/client/cifssmb.c
>=20
> between commit:
>=20
>   a68c74865f51 ("cifs: Fix SMB1 readv/writev callback in the same way as =
SMB2/3")
>=20
> from the cifs tree and commit:
>=20
>   0fda1f8c6bf8 ("netfs: Speed up buffered reading")
>=20
> from the vfs-brauner tree.
>=20
> I fixed it up (I used the former as it is (supposedly) a much newer patch)
> and can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

The fixup ended up being as below.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/smb/client/cifssmb.c
index cfae2e918209,04f2a5441a89..790b3f5ea64b
--- a/fs/smb/client/cifssmb.c
+++ b/fs/smb/client/cifssmb.c
@@@ -1261,16 -1261,6 +1261,15 @@@ openRetry
  	return rc;
  }
 =20
 +static void cifs_readv_worker(struct work_struct *work)
 +{
 +	struct cifs_io_subrequest *rdata =3D
 +		container_of(work, struct cifs_io_subrequest, subreq.work);
 +
- 	netfs_subreq_terminated(&rdata->subreq,
- 				(rdata->result =3D=3D 0 || rdata->result =3D=3D -EAGAIN) ?
- 				rdata->got_bytes : rdata->result, true);
++	rdata->subreq.transferred +=3D rdata->got_bytes;
++	netfs_read_subreq_terminated(&rdata->subreq, rdata->result, true);
 +}
 +
  static void
  cifs_readv_callback(struct mid_q_entry *mid)
  {

--Sig_/+Plm9A1xqUabYckT13.4P=L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbaQO0ACgkQAVBC80lX
0Gwc6wf/SD+cCKYhktm1h9tl1N6HWkP584MpHEr4u9jwHyn8totB5OkAYhdWWZh9
Nu245wl7YZgs33j931BCHMyzSFOZTLN+Z8AcepASnDCQZG9ik2v9TRZ30spBzImm
3JXKw6AI5LsHtiXMxbToQh2CKbJTlzK3GB1S0k0S/Mapl5A3ziMVjzq25qEKQLq5
C/gCnramFoVULqsDcLFCKGfBlxamR2WcyMUvJ+ueTS5598AvjigRt/5ko+IPMVQV
Fn0Ocpz2QagRjuIX8cqKHW9qHpNHAjCYvSNdqmtY1L0R4FTh5Hn2Auh9kVRMKraM
AkbqVQDWLWRRSwZr8+d+4nUC1fTiEQ==
=tlCG
-----END PGP SIGNATURE-----

--Sig_/+Plm9A1xqUabYckT13.4P=L--

