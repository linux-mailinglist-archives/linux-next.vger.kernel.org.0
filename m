Return-Path: <linux-next+bounces-3571-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C5B96ACAD
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 01:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74BF0B21313
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2024 23:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9098317A93C;
	Tue,  3 Sep 2024 23:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YCUdzmvs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7E4126C07;
	Tue,  3 Sep 2024 23:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725405346; cv=none; b=idf3T2+IWzMF5jB1uK9V7HUJmAZubHq/JOaMtJjnWcffebTEmkYSxxbCP4BBVmnWf34kq+SVglU9RUi+z/f8A/npPUkCn1/hGqVru+T1V+5gdxhNf2bm0I9UQ9hmKACEDfmdVZ6idpT/9SCMHOHgBAQ0NN9fCoG5V5a2Zkjh/sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725405346; c=relaxed/simple;
	bh=nlzGJwG6MEtf4Ehj/7YU/hrNJR25e2bBN2UyHJLyqkE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ASMc5hZsewNu6YDBdL7DofVvnevUchjvKOvkKKQ8oAadN7PeMwywyF/AAEU6oG2KeZX4hKC5Jlo7+A58RRq4zXB99Y6kspVXN6dsc5D+TxR0XQWB0msB+EV6mvoXqLd1joAu3rWECJGPpA1XNW1vc1MUKKqch7pgsXlOQbXXJYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YCUdzmvs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725405333;
	bh=1uIJ8L2JeFJsHNtUykzZeS4hanrKMKNkZJ11cMEne/I=;
	h=Date:From:To:Cc:Subject:From;
	b=YCUdzmvshtxxQZn97lATxYrWoqfsyyUpmqVpL3zeIZrUC1Z4r7kC+vz8kj1BdtfqP
	 SigfYndtS8pRkmBNwL9Mjg6L7YvMQ3y7U3yCB/pxOW9IEchQ/7Lwulv/gb8bNdkjIe
	 vbWPqoQATW4MfNk8/rfR9tWhE2pSx2HrLJWmAQWiFmyI18ltIbRYwRwjjSOdwiWpC1
	 WdXmZ2V26gvzYGr/KlGRKjK/+NqMmJNNuI57MWfHVS4L0nl4agFrehWKNMRulJhzGD
	 B/03H06wW37wqGLM6y5sAeGPUYE1MgL1IjEuHQnTqPyIfdabX7ZanGurbUxWI8/Dvb
	 FTDstBRo6Z9gw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wz1gm6Bnfz4x1V;
	Wed,  4 Sep 2024 09:15:32 +1000 (AEST)
Date: Wed, 4 Sep 2024 09:15:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Shida Zhang <zhangshida@kylinos.cn>
Subject: linux-next: manual merge of the vfs-brauner tree with the ext4 tree
Message-ID: <20240904091532.4b0dee26@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LHhksKkETJrzjm369uiu.R8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LHhksKkETJrzjm369uiu.R8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got conflicts in:

  fs/ext4/inline.c
  fs/ext4/inode.c

between commits:

  a256c25ef1b1 ("ext4: hoist ext4_block_write_begin and replace the __block=
_write_begin")
  64f2355d7f8a ("ext4: fix a potential assertion failure due to improperly =
dirtied buffer")

from the ext4 tree and commit:

  9f04609f74ec ("buffer: Convert __block_write_begin() to take a folio")

from the vfs-brauner tree.

I fixed it up (I used the former) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/LHhksKkETJrzjm369uiu.R8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbXmJQACgkQAVBC80lX
0GzB2wf8D0BjloPQhNvVH0gQK0VqS056gDYv3rHbuaOgnY3UlUuX3aBrLHSZby+K
zkN9JGpYRTBmstB2F4nnevWEYqEgFD+5iPZ/EmP35iqz5XFmS3QZgktZ/EmdrW0P
5IVFHpnYm+oXf1qkA54b7w37W6KiQndN53Bt04MVITcQ0CxypEO+xk5yK9LZzjjm
CrI+KYNCuhB940njxT3TF7WyD2aYYvry9/ldVSyDxWdaGsYpNBarm6fmEGr4EDC5
WSCZIudwYr5Q5F6frqqnA5FUKCnuyE2LMuRXYULHQYiRuY6cnAeQUkw3PETuQ1sP
0w7nAzYFHL/7sOlX5qfrodtCcffZKA==
=7Wzj
-----END PGP SIGNATURE-----

--Sig_/LHhksKkETJrzjm369uiu.R8--

