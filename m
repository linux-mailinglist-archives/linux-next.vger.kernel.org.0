Return-Path: <linux-next+bounces-3281-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B6E94E3A4
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2024 00:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A9ABB213BF
	for <lists+linux-next@lfdr.de>; Sun, 11 Aug 2024 22:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17C715C150;
	Sun, 11 Aug 2024 22:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="t6dfPEG+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF5A41C75;
	Sun, 11 Aug 2024 22:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723414252; cv=none; b=Btd75AEGqUtLc0qaUNIaC4cd2R3fFk4Y6DBKluIk5rEQ0QQzXp/4Ed8azqUtpVNizeP4FMQSAIS1K1rUL/rpO9IrbMFZ+rZGzaSOQXn/PjIVL2VzsUNzDU0si4JcunxONdBBFt1eMT/4FNW57UlfrfyC8DW6qxQwhSNgisl2Gw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723414252; c=relaxed/simple;
	bh=llJ0nBQ3a8YJjWgU+YyU/PZa1LAUju9dQvr5S9GOOxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ltR0SbiLPcmJA7sHkBSY4qqM+dR9CY0TCTm3uLRAzGYMcZW1vaO9plJ8ZKTxr3+68rLSWwrZqmypOd68qmF7JTjfMIS3P/WReCKANWdtkRuR7qh0dEGeZqd/HpNrY3ynR6wiPN1Isnd/0LFM+sOaYpU17eQxdRJUND3k38rCWIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=t6dfPEG+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723414247;
	bh=updplUf/T/ZiyhfUJfBUOBIfKbqdsymCwLeJTp9KXdY=;
	h=Date:From:To:Cc:Subject:From;
	b=t6dfPEG+s7m/a09jodcxwNVN/lZJCP9mGl/5+L3gQVb0mPDsFhL4iKB2/8CZ0Y4Uj
	 pZ3JUHErDe242aBMO5y9xixfIdsfzrvJJgN3eZler8943gdOVI1QoQwo2vv8rfMGFC
	 8GZQrh83wXPFLLriXSxwJL7n3Lqg1BTeSRW8gC2TU4XnFBz4ruy0Hxhi5+05Mm/2w4
	 utxd5RpCPIzLdW+oBjy/b0pzHvmvvglAh72EeqVcebqYk5MTmTiKCet2RtpdA9PERP
	 2ZU0hVSJHzDrz2KKkWrhD6rU6vQeTaFXbFrfen2rFQeYqRlU+xa8p/3PUhwKBJtZp/
	 F8arpqI1t4BxA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WhsKf6VKjz4x8C;
	Mon, 12 Aug 2024 08:10:46 +1000 (AEST)
Date: Mon, 12 Aug 2024 08:10:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Namjae Jeon
 <linkinjeon@kernel.org>
Cc: Dongliang Cui <dongliang.cui@unisoc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Yuezhang Mo <Yuezhang.Mo@sony.com>, Zhiguo Niu
 <zhiguo.niu@unisoc.com>
Subject: linux-next: manual merge of the vfs-brauner tree with the exfat
 tree
Message-ID: <20240812081046.369bbba5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3/8_tH_IGSMCLFm6LiHEaxL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3/8_tH_IGSMCLFm6LiHEaxL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/exfat/inode.c

between commits:

  3e491faa7648 ("exfat: do not fallback to buffered write")
  98ad7b9012b5 ("exfat: Implement sops->shutdown and ioctl")

from the exfat tree and commits:

  a225800f322a ("fs: Convert aops->write_end to take a folio")
  1da86618bdce ("fs: Convert aops->write_begin to take a folio")

from the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/exfat/inode.c
index 7d43a0942911,05f0e07b01d0..000000000000
--- a/fs/exfat/inode.c
+++ b/fs/exfat/inode.c
@@@ -428,11 -452,7 +428,10 @@@ static int exfat_write_begin(struct fil
  {
  	int ret;
 =20
 +	if (unlikely(exfat_forced_shutdown(mapping->host->i_sb)))
 +		return -EIO;
 +
- 	*pagep =3D NULL;
- 	ret =3D block_write_begin(mapping, pos, len, pagep, exfat_get_block);
+ 	ret =3D block_write_begin(mapping, pos, len, foliop, exfat_get_block);
 =20
  	if (ret < 0)
  		exfat_write_failed(mapping, pos+len);
@@@ -448,7 -468,15 +447,7 @@@ static int exfat_write_end(struct file=20
  	struct exfat_inode_info *ei =3D EXFAT_I(inode);
  	int err;
 =20
- 	err =3D generic_write_end(file, mapping, pos, len, copied, pagep, fsdata=
);
+ 	err =3D generic_write_end(file, mapping, pos, len, copied, folio, fsdata=
);
 -
 -	if (ei->i_size_aligned < i_size_read(inode)) {
 -		exfat_fs_error(inode->i_sb,
 -			"invalid size(size(%llu) > aligned(%llu)\n",
 -			i_size_read(inode), ei->i_size_aligned);
 -		return -EIO;
 -	}
 -
  	if (err < len)
  		exfat_write_failed(mapping, pos+len);
 =20

--Sig_/3/8_tH_IGSMCLFm6LiHEaxL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma5NuYACgkQAVBC80lX
0Gx+8ggApfMyAfs7ASI5jkF/gSJcdksjYbp0mTmJUhpcpYImqkwnL3TTyFyu3Tyc
ZkdMqtJcigaD3eQruGzL/jDqfXGrV6X8Fp9W9t334sSACxVEPdvl/DBPgRlcBCMt
Blcf/eKT/jWJcw7jHWgBAnpT6Gzeb5iDFSgOU1Qy5nGslihL7y6AJdqeUHlON1qN
ib+X1Nj3tvfnUvGkfy65BuEBKn5sicQmbtbdU85WjqFb8wjuAaPP3oE91QJFsuzI
mI370ddmEvK1jp+Z22xVBALvduS2HQJSq3WcWNVz408AIYISmhlg+WZUS8m6V7mw
qDzeUuoDkydCFKtkk4xx6UDzO9sE2g==
=mY3z
-----END PGP SIGNATURE-----

--Sig_/3/8_tH_IGSMCLFm6LiHEaxL--

