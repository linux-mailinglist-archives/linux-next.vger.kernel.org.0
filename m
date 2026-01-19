Return-Path: <linux-next+bounces-9696-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D198D3ACA2
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 15:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E33E5300BFA8
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 14:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777D31E5B63;
	Mon, 19 Jan 2026 14:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ieqYhTey"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540E44317D;
	Mon, 19 Jan 2026 14:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768833053; cv=none; b=e1l97Lm52PyFwqqsrFQ3RawJiM58AfDSP5Vks244c7OXUpXKluFTWSYwz5xHtZadBudOHQmCnakxfANzYp/LZakUrfJiiOo6hNTC8r5p7xrQbKW7KSpUR/d6AdAxMcIL0FdslzKP7nMRbRhnJbCTsXwcXg2TbjWXx1aWtYElvPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768833053; c=relaxed/simple;
	bh=BM50kbfUY67ww14DP7NuwOEp67oVhdZyFzOFUdFlVzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kne+o5foK6dl8d1PYQn+jtVSLPggtfFbbmlJGOeiR2M1zlnxRCGTPrw/7a5YholFjPtiJnyiTICQHJfZxyP0ds0n33lQA88F1a1ZUoloEO5ivYBFvyrDRbjyf4k4htwwj6MqnJpWTAfFW/dspnKdt4a4tHKgG0YjmiifHAAbpNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ieqYhTey; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF70C19423;
	Mon, 19 Jan 2026 14:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768833053;
	bh=BM50kbfUY67ww14DP7NuwOEp67oVhdZyFzOFUdFlVzU=;
	h=Date:From:To:Cc:Subject:From;
	b=ieqYhTeygYK8RNZibI86jFEQe0SmXwEcfF7YiQQn1cUZKFdvAysjgFLD1IWKHV//+
	 NLSgqC5jggY9bakS//acwHsrtUTjuPOEprXGqqegD2+la802dnV6S6rQN1Gd6gMQFz
	 JyIrg9OAokRQ58qGUCUZgJooNsnl9AIRceIcpkT9yQ/508WcpAxWf3WO3InW+pJxbj
	 qWZFf1zGL46NXC0FjWmOpsgw6GIIMDtw3uOtohbNPV+r35ca3xD0fgA9omJhz99Zcc
	 YserlAdRe4JSJsmUFdAy6YDYvmnTTj3W6pE+cm177IAz3rzSJPr0ttoAOgGJbQBD52
	 8bdFDqlo7XCDg==
Date: Mon, 19 Jan 2026 14:30:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <aW5AGPFq0HPi440m@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ucEbWkcaTk/nV2k"
Content-Disposition: inline


--4ucEbWkcaTk/nV2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build
(arm multi_v7_defconfig) failed like this:

/tmp/next/build/fs/ntfs3/inode.c: In function 'ntfs_read_folio':
/tmp/next/build/fs/ntfs3/inode.c:678:9: error: too few arguments to functio=
n 'iomap_read_folio'
  678 |         iomap_read_folio(&ntfs_iomap_ops, &ctx);
      |         ^~~~~~~~~~~~~~~~
In file included from /tmp/next/build/fs/ntfs3/inode.c:15:
/tmp/next/build/include/linux/iomap.h:347:6: note: declared here
  347 | void iomap_read_folio(const struct iomap_ops *ops,
      |      ^~~~~~~~~~~~~~~~
/tmp/next/build/fs/ntfs3/inode.c: In function 'ntfs_readahead':
/tmp/next/build/fs/ntfs3/inode.c:702:9: error: too few arguments to functio=
n 'iomap_readahead'
  702 |         iomap_readahead(&ntfs_iomap_ops, &ctx);
      |         ^~~~~~~~~~~~~~~
/tmp/next/build/include/linux/iomap.h:349:6: note: declared here
  349 | void iomap_readahead(const struct iomap_ops *ops,
      |      ^~~~~~~~~~~~~~~

Caused by commit

   8806f279244bf (iomap: stash iomap read ctx in the private field of iomap=
_iter)

interacting with

   099ef9ab9203d (fs/ntfs3: implement iomap-based file operations)

=66rom the ntfs3 tree.  I have applied the below fixup and will carry:

=46rom f7872b478d46a5bfecf385fe87fd3a5894ac8254 Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Mon, 19 Jan 2026 14:10:04 +0000
Subject: [PATCH] ntfs3: Fix merge issue with ntfs3

/tmp/next/build/fs/ntfs3/inode.c: In function 'ntfs_read_folio':
/tmp/next/build/fs/ntfs3/inode.c:678:9: error: too few arguments to functio=
n 'iomap_read_folio'
  678 |         iomap_read_folio(&ntfs_iomap_ops, &ctx);
      |         ^~~~~~~~~~~~~~~~
In file included from /tmp/next/build/fs/ntfs3/inode.c:15:
/tmp/next/build/include/linux/iomap.h:347:6: note: declared here
  347 | void iomap_read_folio(const struct iomap_ops *ops,
      |      ^~~~~~~~~~~~~~~~
/tmp/next/build/fs/ntfs3/inode.c: In function 'ntfs_readahead':
/tmp/next/build/fs/ntfs3/inode.c:702:9: error: too few arguments to functio=
n 'iomap_readahead'
  702 |         iomap_readahead(&ntfs_iomap_ops, &ctx);
      |         ^~~~~~~~~~~~~~~
/tmp/next/build/include/linux/iomap.h:349:6: note: declared here
  349 | void iomap_readahead(const struct iomap_ops *ops,
      |      ^~~~~~~~~~~~~~~

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 fs/ntfs3/inode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 2147fce8e0b2a..8959e2f367c07 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -675,7 +675,7 @@ static int ntfs_read_folio(struct file *file, struct fo=
lio *folio)
 		return err;
 	}
=20
-	iomap_read_folio(&ntfs_iomap_ops, &ctx);
+	iomap_read_folio(&ntfs_iomap_ops, &ctx, NULL);
 	return 0;
 }
=20
@@ -699,7 +699,7 @@ static void ntfs_readahead(struct readahead_control *ra=
c)
 		return;
 	}
=20
-	iomap_readahead(&ntfs_iomap_ops, &ctx);
+	iomap_readahead(&ntfs_iomap_ops, &ctx, NULL);
 }
=20
 int ntfs_set_size(struct inode *inode, u64 new_size)
--=20
2.47.3

--4ucEbWkcaTk/nV2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmluQBgACgkQJNaLcl1U
h9AEiAf9FrqUvnl4GbHjKZNxSjpsRcV+g98Z3Cc6n4RW0/4RXxm7Ij8WANvSg4rB
a2jtOZW2UNNmZXWU4dpfWRO1lIX1RgaCNLQahz1NjLIWUosjTi8yy+0btPVga/cj
oeqjhhArur9kkJu84wNslZc3AKNx/8ZKYqRHEZGZHhU2lVTWWqHNqQXWZvx+YzL6
zSIG3JKr9+xRvR1FC6Wo6vAu6m/EcDq0i/4c4Nt/Vn3PFBFn+Oc/GS27nfeIgJ0j
SFOmNX044VxU0clKj8ZJ+mHXUzAldAj+eEcVPFZ3wCEyxl27h0Umnuh34FlPK5zl
f7qt4AB8cIpvXHbSP3AH4bLZL9Jgqw==
=A0tw
-----END PGP SIGNATURE-----

--4ucEbWkcaTk/nV2k--

