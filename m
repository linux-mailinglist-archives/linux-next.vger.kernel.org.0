Return-Path: <linux-next+bounces-6588-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF48AAF1D8
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 05:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A1624685D4
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 03:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A82C1DB34C;
	Thu,  8 May 2025 03:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CSS8yJGh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974B617D2;
	Thu,  8 May 2025 03:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746676222; cv=none; b=oyhh8SjOpyqqNTCUPKlXDO2ViVeqE4g9arXkH5KRoX1E5d/3kYHH1/67JWfGG7meWWMRtwj9NB/C/6fG9dWpN+KqoxoD+BBiqlit6IIJBccjnf1ccWUk2CY4EQX1/1QAnrsOnXctcNgxDKqWq5iZmBK8R2evFF4agtCBd0UUvR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746676222; c=relaxed/simple;
	bh=tuNZiVFrwQrm+x7n5iUKHGo+ld7F8+llunOxXqMNHMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HRpJ5payx72R3YrBKuncqB0J7sgW/tuf35pygDJ6V2XVDtc7qz0xlEMcpAoxmMTWkt7fi1GPwsfcBhJ4N1Cmz0EYzQeaq7X/240By6j8cjBaocJDb+SJNqeqnqOK890PBkis08QN4qCLVGadGzvYs19i6heCoiur3OQKuyzDJFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CSS8yJGh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746676216;
	bh=I5tNE+h+Y/B7N8FRyCLg+H/v71ZNT6/GHqmi6l34iTA=;
	h=Date:From:To:Cc:Subject:From;
	b=CSS8yJGhnvgbR6GSqNOSkh+Vq8n1js47FgVi23+yyzFRjBVFQgtufANsY89+4Zn4q
	 yfEdIOctXWY8j8raX6ja6XEGl1L1+G4ASFFRegdG8RScU3lH8/WrdJQFRC/X1nCJOI
	 0v0jtNJyOOXjLsD4rhbODZXuOYvSMpkRP+FdJ9cv+S9SDD5nT5wG9862/Y4Iwxsjbb
	 FOjl9QEg9kr+4CjQxq5qegMZLPt22Pwik4C1zVXkaptiI5DwZwUKCsZZoAwnn7u3gT
	 VhOnP+TW4WHoQF4W/wuSzhf5v6zR1yrE39y7Hg/6mnadVOlVQVz99KgZx1bmXLKWuW
	 pXMTJIoHvdd4Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZtJ7C5G5mz4x0L;
	Thu,  8 May 2025 13:50:14 +1000 (AEST)
Date: Thu, 8 May 2025 13:50:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>, Andreas Gruenbacher <agruenba@redhat.com>,
 Steven Whitehouse <swhiteho@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the block tree with the gfs2 tree
Message-ID: <20250508135014.408d6713@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.w.3x=nVCdyL91RDnEzQKEG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.w.3x=nVCdyL91RDnEzQKEG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  fs/gfs2/ops_fstype.c

between commit:

  2abc01ae2685 ("gfs2: Use SECTOR_SIZE and SECTOR_SHIFT")

from the gfs2 tree and commit:

  65f8e62593e6 ("gfs2: use bdev_rw_virt in gfs2_read_super")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/gfs2/ops_fstype.c
index 4856188c0dfe,7c1014ba7ac7..000000000000
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@@ -214,28 -226,22 +214,22 @@@ static void gfs2_sb_in(struct gfs2_sbd=20
 =20
  static int gfs2_read_super(struct gfs2_sbd *sdp, sector_t sector, int sil=
ent)
  {
- 	struct super_block *sb =3D sdp->sd_vfs;
- 	struct page *page;
- 	struct bio_vec bvec;
- 	struct bio bio;
+ 	struct gfs2_sb *sb;
  	int err;
 =20
- 	page =3D alloc_page(GFP_KERNEL);
- 	if (unlikely(!page))
+ 	sb =3D kmalloc(PAGE_SIZE, GFP_KERNEL);
+ 	if (unlikely(!sb))
  		return -ENOMEM;
-=20
- 	bio_init(&bio, sb->s_bdev, &bvec, 1, REQ_OP_READ | REQ_META);
- 	bio.bi_iter.bi_sector =3D sector * (sb->s_blocksize >> SECTOR_SHIFT);
- 	__bio_add_page(&bio, page, PAGE_SIZE, 0);
-=20
- 	err =3D submit_bio_wait(&bio);
+ 	err =3D bdev_rw_virt(sdp->sd_vfs->s_bdev,
 -			sector * (sdp->sd_vfs->s_blocksize >> 9), sb, PAGE_SIZE,
 -			REQ_OP_READ | REQ_META);
++			sector * (sdp->sd_vfs->s_blocksize >> SECTOR_SHIFT),
++			sb, PAGE_SIZE, REQ_OP_READ | REQ_META);
  	if (err) {
  		pr_warn("error %d reading superblock\n", err);
- 		__free_page(page);
+ 		kfree(sb);
  		return err;
  	}
- 	gfs2_sb_in(sdp, page_address(page));
- 	__free_page(page);
+ 	gfs2_sb_in(sdp, sb);
+ 	kfree(sb);
  	return gfs2_check_sb(sdp, silent);
  }
 =20

--Sig_/.w.3x=nVCdyL91RDnEzQKEG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgcKfYACgkQAVBC80lX
0GzrXQf+LBvsvAYhK7EcMQwzE1ClhPpKPMJCkEfQRY+Kj1m6w8HRJd1ewjtXmWaD
cKttEmb4eyKAHu5+uyQ97hphfdT5QJiWYfHlPlZlDH460vQh3tKDYYMGjwQZaKi3
3eBUpi3SBCoShKWwzpwyaP1EyKB8kh0ZDJjMBU192FbKyfbhMw9CfcruO31f8blv
uh2uhPcK0rEjpTo6ATa1WGDcBvifQoisRl0zVEKaYyw8p1uABB5KaPEi4GODFedR
6si/36biRAITqaQBeSAzMAW69oNHBABtVVd7hQFq4ezpC7cXxT2mds+ZD9wGXev4
b3tnXZtrMICDUT3LfheXXInVgYehew==
=UBnQ
-----END PGP SIGNATURE-----

--Sig_/.w.3x=nVCdyL91RDnEzQKEG--

