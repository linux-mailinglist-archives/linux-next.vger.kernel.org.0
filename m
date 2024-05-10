Return-Path: <linux-next+bounces-2253-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CD38C1CCE
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 05:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E546E282014
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 03:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB30148846;
	Fri, 10 May 2024 03:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AzjyrkUZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B467C14882B;
	Fri, 10 May 2024 03:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715310610; cv=none; b=mzCDeagMKd+MqJVYZMGCpcK5loMWsLwnPiDVzxxTncHkPcYl5BmUD1Y2+lxj2FOAmJMurQKKmAqA+xKXLTftIgxMd/HJrBwaKjoOPPUUNKBhv3A4Y1iDWPuKYf2GgQvFxs8/5DrnC6K3nklAVSbB2NtXi+N+qlozP/FXJPr2jY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715310610; c=relaxed/simple;
	bh=QuOINjcFX6oWWss922e1TM2DKRD7Tn6ri+SmvpyWv9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rXIY3l6OdZYwTNs59sHyUc4ARV64PFoEkZJJPnQG/wB6dv1Mc+OLBOxD4pofnNnACUXfsVsxw72vUlkanw91B8o5dNDWqkr/u6nVv2GLsVgxCevaRYQjcJ+IMcyF5QpMibPGhCXelE7Yg5tq5XXbL3VDZ1ZU+qPZKmn/6g9e31I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AzjyrkUZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715310604;
	bh=zIu1WBLBpuAIUz5eXi4REEW5GA6h3Sk+aWeTT7FQQbo=;
	h=Date:From:To:Cc:Subject:From;
	b=AzjyrkUZMufbbbS3P8/BHIg/lSSxVqoTOahyzqyV3UQxwoyy0rjrfm7A/Ivx2jXl4
	 qxWBheElFEegldRXjat/x0eyQIdDvvnUb2CvcqqobVLUTCRY0hGPNI/tEraqSE8SGD
	 6EPTu5rvhioYR9w77yS0yvVb+GzWpLTy/LGOehHkfqz96bdGzvfGKMXYjpSvaP/IfQ
	 L08jctxC7tp+WVHtsL8QrMGthM8dqsxe5umwCS7pG3V/BZmH7mCYEFAgAHgDLsLxP1
	 QsJVyqlqy2hDhVfuOzUQQfD1DtqRh08CIJIRHgxYGPchidbcz0uuIMYRZupMtKCJYn
	 ARQ3FEHZ7jncQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VbDQM6G7dz4wc5;
	Fri, 10 May 2024 13:10:03 +1000 (AEST)
Date: Fri, 10 May 2024 13:10:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Damien Le Moal <dlemoal@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20240510131003.70f46881@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CA8QBtHjdZ7LNPB0JHKF2Uf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CA8QBtHjdZ7LNPB0JHKF2Uf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (x86_64
allmodconfig) failed like this:

block/blk-zoned.c: In function 'blk_zone_write_plug_bio_endio':
block/blk-zoned.c:1260:25: error: 'struct block_device' has no member named=
 'bd_has_submit_bio'
 1260 |         if (bio->bi_bdev->bd_has_submit_bio)
      |                         ^~
block/blk-zoned.c: In function 'blk_zone_wplug_bio_work':
block/blk-zoned.c:1329:17: error: 'struct block_device' has no member named=
 'bd_has_submit_bio'
 1329 |         if (bdev->bd_has_submit_bio)
      |                 ^~

Caused by commit

  dd291d77cc90 ("block: Introduce zone write plugging")

interacting with commit

  ac2b6f9dee8f ("bdev: move ->bd_has_subit_bio to ->__bd_flags")

from the vfs tree.

I have applied the following merge resolution patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 10 May 2024 12:59:09 +1000
Subject: [PATCH] fix up for "bdev: move ->bd_has_subit_bio to ->__bd_flags"

interacting with "block: Introduce zone write plugging".

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 block/blk-zoned.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 57d367ada1f2..03aa4eead39e 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -1257,7 +1257,7 @@ void blk_zone_write_plug_bio_endio(struct bio *bio)
 	 * is not called. So we need to schedule execution of the next
 	 * plugged BIO here.
 	 */
-	if (bio->bi_bdev->bd_has_submit_bio)
+	if (bdev_test_flag(bio->bi_bdev, BD_HAS_SUBMIT_BIO))
 		disk_zone_wplug_unplug_bio(disk, zwplug);
=20
 	/* Drop the reference we took when entering this function. */
@@ -1326,7 +1326,7 @@ static void blk_zone_wplug_bio_work(struct work_struc=
t *work)
 	 * path for BIO-based devices will not do that. So drop this extra
 	 * reference here.
 	 */
-	if (bdev->bd_has_submit_bio)
+	if (bdev_test_flag(bdev, BD_HAS_SUBMIT_BIO))
 		blk_queue_exit(bdev->bd_disk->queue);
=20
 put_zwplug:
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/CA8QBtHjdZ7LNPB0JHKF2Uf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY9kAsACgkQAVBC80lX
0GwbEAf/adypU03m99zkCNZ0GBjnS+iK2E9ZNM04woxhPKQMknfgOkLaQLyfaFHD
oL9n2SIzPZ+sh44ulM9QSh+XO2zjSMtbpB4pQMBxc+OOMHVJZxwJlo82iupPldZF
wt8xut7Cstu+gu44o2YBKV4C0zVgf0jnMCgJKCO7eIAcvbZONAE8kELVmszYkRUZ
JfuDqfmUVFDYsxLp7mWtPpusLCo8Whbw4YXMcSmCVjgQaO6GMDFw/+0jwedoRiBj
jHNMcQ8bFt2dIrUciIXJBklnqVIBQ6aqEOvhIsgQpOtvLZaJdZnSz7ju9Z86yCf/
km+Nzq5AR+Uo23Z6IJGqtPkLMqxvHQ==
=oZHg
-----END PGP SIGNATURE-----

--Sig_/CA8QBtHjdZ7LNPB0JHKF2Uf--

