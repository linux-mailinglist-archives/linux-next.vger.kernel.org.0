Return-Path: <linux-next+bounces-5598-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A500FA48B94
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 23:29:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13BDB16E1AA
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 22:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65BF2777F4;
	Thu, 27 Feb 2025 22:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="b56IiBLK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE932777EF;
	Thu, 27 Feb 2025 22:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740695313; cv=none; b=sMKNzDsWkuJBjmGpCwrOAnORBW83OoffSHs3WjbGbKFZD81gjJ1lLAdAWxTJtWSBlrcS1eAArYJADSJmluFvtNlP0e9orXId+vEWqhIts1w4w6qfrxBDWE0U3tQzV+9HF2dqVHzscTtEOERsef89XL8r7oRPL/iqFtkrQPv1nw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740695313; c=relaxed/simple;
	bh=G+R19zA2mZY26AFFznsKsclDdalHv5+OwDlT2J+5/DI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rEN+A9MBI0zBaCpV3jM0KUcwdNje0aAp9TsGB1ZjRY+AZ+d9zOtJQvYs0OmYmU9JH70eKeH0q+wq/yQEvEJ78HHrH4YNrZqN6y9kDIe44UEty88BIlXLry/BCD8ubDfLQriddfRf6mPvVeD7vrGAbtkTp0jyNzqTAYBvCOMc4Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=b56IiBLK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740695307;
	bh=gcLgbk68LRVHN4P06IKc6hXQzPJSLKXWEyW0JZrnV64=;
	h=Date:From:To:Cc:Subject:From;
	b=b56IiBLKW3Cj031YvgaO2gzoBCMOVF6p1GRpf8v4bMjc6ueAW1j8GbtUb0p360fDS
	 zS+DWWDNCn+4EZmY/cA6EvBMVmdR5V9S/1LdWFf1zKTpfT+9F4bj9/7rcedO/WJSra
	 XLEr/rTOgvuYopO7R7r45tv1QweU6dLAMLB25s9f94pjVZBj5MlYdvF7EBeo5swfR+
	 3xFHq/Ry/6tKXXcRh7m2PnX9hZvNFSRn07Tr+DGXbwFPgc1I0E+eug9gLvcSA49cax
	 P1BuvVmaSFd5vYrhmWLOiAB7m+XHWhmwaT2BP+2zHjmSu//2JnpahAsRIE19HOYjor
	 ty2qa+x4n3KvA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z3mFl38Trz4wy6;
	Fri, 28 Feb 2025 09:28:27 +1100 (AEDT)
Date: Fri, 28 Feb 2025 09:28:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Joshua Ashton <joshua@froggi.es>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the bcachefs tree with Linus tree
Message-ID: <20250228092826.255fec8a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4SruOqN4_oQNzBpxT3aMzAV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4SruOqN4_oQNzBpxT3aMzAV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bcachefs tree got conflicts in:

  fs/bcachefs/dirent.h
  fs/bcachefs/fs-common.c
  fs/bcachefs/sb-downgrade.c

between commit:

  4804f3ac2649 ("bcachefs: Revert directory i_size")

from Linus tree and commits:

  1afdbf54cda5 ("bcachefs: bcachefs_metadata_version_cached_backpointers")
  713d0639b9f7 ("bcachefs: bcachefs_metadata_version_stripe_backpointers")
  3e97fc2b1bb1 ("bcachefs: Kill dirent_occupied_size()")
  bb13a9d96daa ("bcachefs: bcachefs_metadata_version_casefolding")

from the bcachefs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/bcachefs/dirent.h
index 362b3b2f2f2e,a6e15a012936..000000000000
--- a/fs/bcachefs/dirent.h
+++ b/fs/bcachefs/dirent.h
diff --cc fs/bcachefs/fs-common.c
index 2c3d46ac70c6,ca70a3de805c..000000000000
--- a/fs/bcachefs/fs-common.c
+++ b/fs/bcachefs/fs-common.c
diff --cc fs/bcachefs/sb-downgrade.c
index 051214fdc735,21130eadaf32..000000000000
--- a/fs/bcachefs/sb-downgrade.c
+++ b/fs/bcachefs/sb-downgrade.c
@@@ -90,7 -90,16 +90,13 @@@
  	  BIT_ULL(BCH_RECOVERY_PASS_check_allocations),		\
  	  BCH_FSCK_ERR_accounting_mismatch,			\
  	  BCH_FSCK_ERR_accounting_key_replicas_nr_devs_0,	\
- 	  BCH_FSCK_ERR_accounting_key_junk_at_end)
+ 	  BCH_FSCK_ERR_accounting_key_junk_at_end)		\
 -	x(directory_size,					\
 -	  BIT_ULL(BCH_RECOVERY_PASS_check_dirents),		\
 -	  BCH_FSCK_ERR_directory_size_mismatch)			\
+ 	x(cached_backpointers,					\
+ 	  BIT_ULL(BCH_RECOVERY_PASS_check_extents_to_backpointers),\
+ 	  BCH_FSCK_ERR_ptr_to_missing_backpointer)		\
+ 	x(stripe_backpointers,					\
+ 	  BIT_ULL(BCH_RECOVERY_PASS_check_extents_to_backpointers),\
+ 	  BCH_FSCK_ERR_ptr_to_missing_backpointer)
 =20
  #define DOWNGRADE_TABLE()					\
  	x(bucket_stripe_sectors,				\

--Sig_/4SruOqN4_oQNzBpxT3aMzAV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfA5woACgkQAVBC80lX
0Gwzfgf8DbToHSzKXL+RWgT+jDZ3R0zJqExvSpMFryMbRVZYD3XQwSDJsDyLowZ9
DdFgBY+FJcYGxzs/3Id7I76pnCb5H++nM8l3m5BKBzgKQon9lhypOmPZToYjI3qH
+mHjldRzsIgcuybk/sz0fQ5xm/8PFQsdHzBhLVt2A2CIV72uqhKEwA/KmWkGT3vJ
j8WCBw6JPuep5KN3uTLAY+YfAs2e8w0YTEYzvDODwm6P2+3Acol7b0Y5N+YctiLQ
0TPbIq7NU1vD9TpG6dBTxXFthnhMC8m9FoDGEOQk7En1CoRf6zKuaSLhvKBVW82B
xsSH2ynK5vcWhyIgA3nQAOdjd/n9aQ==
=t64n
-----END PGP SIGNATURE-----

--Sig_/4SruOqN4_oQNzBpxT3aMzAV--

