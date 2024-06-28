Return-Path: <linux-next+bounces-2710-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AC491C54B
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 20:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3FF11C23727
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 18:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF2B1CCCBB;
	Fri, 28 Jun 2024 18:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faPin302"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FE61CCCBA;
	Fri, 28 Jun 2024 18:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719597601; cv=none; b=PE+EQIyD++RbQrJg9WZE6qqd2fuFC8ZLEIFc3GYvYt6TXcSA0DFsqXvqu/Z9SpxyDTbZ5vinZIZ3//clOYg7KqkHwCeBGAwWSyfPHlHRV0gMl06ywEncxbszFAGW17CYEkjIA3HrRxerh/6WhITilcLwO1QOY1K/MZ38jSr9tUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719597601; c=relaxed/simple;
	bh=qS1mPRIr/PiphTKH5MZ89qSALgvycl+qarSEWReAbPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q/mL5vyk7aBokEQuRBth7EHiIULacKWQAm/m3yehVihyxh2kFqYrJsuHPY6vuHyp2X59gtPS7HotIYOeUqbU2C6leHvdG6CUmqppoWVGyBxLTLm2Kh5DcZzEk44bVBq3P1G15KzwXGLnSMSrLzranehwMo0HOEZ1U2c3n/r+3yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faPin302; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2ABC116B1;
	Fri, 28 Jun 2024 17:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719597600;
	bh=qS1mPRIr/PiphTKH5MZ89qSALgvycl+qarSEWReAbPY=;
	h=Date:From:To:Cc:Subject:From;
	b=faPin302UP/DSe3/NvfXzH6TIBQjtehzCHRXf5cJ5bt4y1Qq+LKgg6jcnJGjA9G3I
	 W7Rncr3CI/xJYzdb6DN9yR8NKp5PtTMXobZr+tHjMOwLf+ChtGWgY2r9PXkDCSANqD
	 m0IO7boZNp0DhMv4fHBnu+SX+Jy2HUi7KSDhkgIIZxzqNCqW9PoWmR1xXg4DioRZB0
	 HBs7pViFqxphE6GylJ2w9iW5oqJfM5yA6uJxmxemrD/t//WCG9dSVTIjzh/kVfYo6/
	 A/SdBo87C7270TlcMlNX/5JqHjP6sNekVHIQUaaSvuhnxmm6s5bHlDY734Rfi351Nz
	 dqkPiurffua9A==
Date: Fri, 28 Jun 2024 18:59:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christian Brauner <brauner@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Prasad Singamsetty <prasad.singamsetty@oracle.com>
Subject: linux-next: manual merge of the block tree with the vfs-brauner tree
Message-ID: <Zn76HPyBbHbnmGmw@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n3BU1z4wNyjl3BaP"
Content-Disposition: inline


--n3BU1z4wNyjl3BaP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  include/linux/fs.h

between commit:

  1bc6d4452d5c9 ("fs: new helper vfs_empty_path()")

=66rom the vfs-brauner tree and commit:

  c34fc6f26ab86 ("fs: Initial atomic write support")

=66rom the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/linux/fs.h
index dc9f9c4b2572d,db26b4a70c628..0000000000000
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@@ -3626,21 -3627,6 +3640,23 @@@ extern int vfs_fadvise(struct file *fil
  extern int generic_fadvise(struct file *file, loff_t offset, loff_t len,
  			   int advice);
 =20
 +static inline bool vfs_empty_path(int dfd, const char __user *path)
 +{
 +	char c;
 +
 +	if (dfd < 0)
 +		return false;
 +
 +	/* We now allow NULL to be used for empty path. */
 +	if (!path)
 +		return true;
 +
 +	if (unlikely(get_user(c, path)))
 +		return false;
 +
 +	return !c;
 +}
 +
+ bool generic_atomic_write_valid(struct iov_iter *iter, loff_t pos);
+=20
  #endif /* _LINUX_FS_H */

--n3BU1z4wNyjl3BaP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ++hsACgkQJNaLcl1U
h9BnqQgAgyvWDFwnlTNylsbsdCoJjHuCdavJNWNKo06nTjlFHdIn5wAHt0AwB2pl
VdLnDgvAGTa30hnIb98ECrXgfMIVpuq9+o5rK2RRBn4IFZejjd4YGheSaA1k8XUL
NjmGLRFeXA5cMYeZ3NzD6a1npR6dtNmlAVt12bBXeATRcwcMd96m6sUi+aID0Yqn
XBECOHDUquq3eRA16FxetiuK9RFv4ALWQ5icc1iPo56ZgOIwmHJGZzGiCzVnCYvi
QLPbLYcmrvW1erDxvqyoQBP9wsyNAUoVYnlm51L8b9KEmyIizAE6bCvjDYx24EWk
0E5va1OyEc1sNA+p+QlFQqYDNw9Kiw==
=nwt1
-----END PGP SIGNATURE-----

--n3BU1z4wNyjl3BaP--

