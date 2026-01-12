Return-Path: <linux-next+bounces-9614-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BB3D15BD1
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 00:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38C51301F7C5
	for <lists+linux-next@lfdr.de>; Mon, 12 Jan 2026 23:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16406283FE3;
	Mon, 12 Jan 2026 23:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="W8v6uSN7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2942857EA;
	Mon, 12 Jan 2026 23:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768259324; cv=none; b=k2MCggV3EFtMwACISe8iGU8t6FmXFUAmquA5LLJiV1tst82vObwscMW/1OOL5mjR3cM7fzKT4KULoo3qScwX0LlptAvIapvSkiod00RFzKN3qL2OVxV1JEtwMBhNG8BnZIiP3NDQAdDfWMZGI635Cr6deMb7zVbFd3RQ/2D0bU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768259324; c=relaxed/simple;
	bh=CaEug1YOiEq3JxLrd6Qm/HOiQAAc+rP9D7RJUcl0Jeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=q3CHt//5sNZtKt7R4ZIMBDmkALgqm+cyguFqXmbNd2Y/lHrDoHuXSSnXfVjq58kniOteGF8KhRnHfnw4Zzmt83RJr07HjimoPSVnNPntIQnJ9JL9TFZrLsF/AyxtYSN2WtS+lBPrPQrMmVvLq86XBmKyMNwvvmL2LNUqQIVnLrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=W8v6uSN7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768259320;
	bh=Ha394QUoDr/Ts/VqqT79tyHgJT/kYU1uSsGTj8CiZsU=;
	h=Date:From:To:Cc:Subject:From;
	b=W8v6uSN7CIO/wGpTRKAYnqaXoRI8QROFk8TQG5cmctJDf3gxYExFQi4kuNv5kjeQq
	 +ltSY+0T421vZOE8rDiMDSSiOUAMjom7pX95jR468yMchgrcfaMu2nqtb5DlBfdK8o
	 tnVIFxpuTCmmi2tx54iqEbNLZkjDUk0WSWPw4ZVDnGxFDm+YUjA92ox9KApm9vNapY
	 dJxasxdqj32ZRyf1dnyk+51WowgorCU3VCTlpXBiHX8mxVoJ85N8UFvi2g97AmvnzZ
	 6gyd5agyQ/fFwpJ/ZQaP71ll9BZ3GEcFiqkXoJZNeyWM1JUkWtyrsp5XCsZGC34YQU
	 GyC83v1p/ig7g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dqp2w0G83z4wCG;
	Tue, 13 Jan 2026 10:08:39 +1100 (AEDT)
Date: Tue, 13 Jan 2026 10:08:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>, Konstantin Komarov
 <almaz.alexandrovich@paragon-software.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs tree with the ntfs3 tree
Message-ID: <20260113100838.613f8519@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7LGT_mIxMLWff68UrRWubLb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7LGT_mIxMLWff68UrRWubLb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/ntfs3/dir.c

between commit:

  dffc7f2f177b ("fs/ntfs3: allow readdir() to finish after directory mutati=
ons without rewinddir()")

from the ntfs3 tree and commit:

  0c071146080a ("ntfs: ->d_compare() must not block")

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

diff --cc fs/ntfs3/dir.c
index 385cd806d32e,cf038d713f50..000000000000
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@@ -544,13 -498,13 +543,13 @@@ static int ntfs_readdir(struct file *fi
  	}
 =20
  out:
- 	__putname(name);
 -
+ 	kfree(name);
  	put_indx_node(node);
 =20
 -	if (err =3D=3D 1) {
 +	if (!err) {
 +		/* End of directory. */
 +		ctx->pos =3D eod;
 +	} else if (err =3D=3D 1) {
  		/* 'ctx' is full. */
  		err =3D 0;
  	} else if (err =3D=3D -ENOENT) {

--Sig_/7LGT_mIxMLWff68UrRWubLb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmllfvYACgkQAVBC80lX
0GxElQf9HH36HNRvk6ZZgmSF1ReJvLESz/04Xf3HMAsJ6kAPMv0awmL0PRS2jfNT
qXt4j0MQUmTa5PsuUEYiiNcbIrjXYF6Ne/cqoCsNToo6LafiCIdabtVH/ArvYuSp
Xq8SLnsHLoiIzlAJ76Ko5EXGEma6bOmLvaGSzXplQaOhfc3Y0a0DpKGG0ly8aEhN
/r4RWsEIT24UMxKcOgVfhkOLLuR0hF3tvuJGA2ymEUMKJJuDMZr7/a62CPZeFqUg
q9BJBaXBZuGFf6iOZ+qUDUshb2T+gEvAJcKFUhIaFMLNcNp/6tqNg0JW4jNMgv9X
nKulCwFIIVDlTONS6HzseGQYI5Nlgg==
=HAMM
-----END PGP SIGNATURE-----

--Sig_/7LGT_mIxMLWff68UrRWubLb--

