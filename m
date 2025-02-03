Return-Path: <linux-next+bounces-5356-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A454A2512D
	for <lists+linux-next@lfdr.de>; Mon,  3 Feb 2025 02:59:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5460618841B9
	for <lists+linux-next@lfdr.de>; Mon,  3 Feb 2025 01:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A824128DB3;
	Mon,  3 Feb 2025 01:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Hyk7BZdh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF84111A8;
	Mon,  3 Feb 2025 01:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738547967; cv=none; b=LUZB+M4VZCX+R+2QcWi7ZnO1+ZS9M1pFpvwROLg5GdowZ9+GqfPkldzvRvQ+L02Z4bpdm5OUysJIjO17H7hc+5i5M8w/f7rFx9oa6Ta/4Zk0olOFTShG8SsrJuJ6DcIIC+kELjjdypPIIkdhgzkMAmd/acur+h7hYYkpbsGBXGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738547967; c=relaxed/simple;
	bh=Br9DCisr6RX8AgB2FdhE+BmfQLuaWkbZwg7fThfGaeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZjEbqATn9KGl+zi4wBc0DQtbZlI08Npo5T4DODhP0nvd9+nV2hTCBNUnvGgmJAl6PDJ0RPE0SDmsX+lF6B01yhdRZTXzR2okpdvZdPKUauuorUWc0dXVRSl9X0mPYo8qO9n1IclgcvYXaVucwM0vbCDJzPb6F+e3R9p0rEz3oaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Hyk7BZdh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738547948;
	bh=snENRT0lEZIJjhySX0UYb8FY2FurFVbekw30dejtRzk=;
	h=Date:From:To:Cc:Subject:From;
	b=Hyk7BZdhn2OGYmZkHUtb+R3cK8LOSCfCORf1+a+rsg4gQIHhPk7ju61QYU7swWNzR
	 6i8sd5vw/LAuWePLSRbyJ9gmaB4Tza9A0ir4cwYAXq6UZpQ0s+Rn7UoN7plnWcdnnd
	 5PMvD5DjcJcomodNatZB5hhtVR7fyW6l2ewa6nBNhAWuqfcJ5uuH1frscqqLtxR5MK
	 fOq3WBbcKFq0KXHrgRZhX0HnmUszqfBXrlJvVo7vGCIZONYuqwjQxO/dC5LvEk1Sp2
	 epM9EJk4Uvwf2A9zk6utgwtMZJjND9IDnu+zDMr/hhsvg9pVdkfjjTZvQvaaBkdFW9
	 fPz9zdaD0OvwA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YmV6M1QrDz4wcf;
	Mon,  3 Feb 2025 12:59:07 +1100 (AEDT)
Date: Mon, 3 Feb 2025 12:59:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of Linus' tree
Message-ID: <20250203125914.439f72fd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lxXUkxv0vftc0RvcxiPfPty";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lxXUkxv0vftc0RvcxiPfPty
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging Linus' tree, today's linux-next build (sparc64
defconfig) failed like this:

drivers/block/sunvdc.c: In function 'vdc_queue_drain':
drivers/block/sunvdc.c:1130:9: error: too many arguments to function 'blk_m=
q_unquiesce_queue'
 1130 |         blk_mq_unquiesce_queue(q, memflags);
      |         ^~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/block/sunvdc.c:10:
include/linux/blk-mq.h:895:6: note: declared here
  895 | void blk_mq_unquiesce_queue(struct request_queue *q);
      |      ^~~~~~~~~~~~~~~~~~~~~~
drivers/block/sunvdc.c:1131:9: error: too few arguments to function 'blk_mq=
_unfreeze_queue'
 1131 |         blk_mq_unfreeze_queue(q);
      |         ^~~~~~~~~~~~~~~~~~~~~
In file included from drivers/block/sunvdc.c:10:
include/linux/blk-mq.h:914:1: note: declared here
  914 | blk_mq_unfreeze_queue(struct request_queue *q, unsigned int memflag=
s)
      | ^~~~~~~~~~~~~~~~~~~~~

Caused by commit

  1e1a9cecfab3 ("block: force noio scope in blk_mq_freeze_queue")

I have applied the following fix:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 3 Feb 2025 12:47:17 +1100
Subject: [PATCH] drivers/block/sunvdc.c: update the correct AIP call

My sparc64 defconfig build failed like this:

drivers/block/sunvdc.c: In function 'vdc_queue_drain':
drivers/block/sunvdc.c:1130:9: error: too many arguments to function 'blk_m=
q_unquiesce_queue'
 1130 |         blk_mq_unquiesce_queue(q, memflags);
      |         ^~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/block/sunvdc.c:10:
include/linux/blk-mq.h:895:6: note: declared here
  895 | void blk_mq_unquiesce_queue(struct request_queue *q);
      |      ^~~~~~~~~~~~~~~~~~~~~~
drivers/block/sunvdc.c:1131:9: error: too few arguments to function 'blk_mq=
_unfreeze_queue'
 1131 |         blk_mq_unfreeze_queue(q);
      |         ^~~~~~~~~~~~~~~~~~~~~
In file included from drivers/block/sunvdc.c:10:
include/linux/blk-mq.h:914:1: note: declared here
  914 | blk_mq_unfreeze_queue(struct request_queue *q, unsigned int memflag=
s)
      | ^~~~~~~~~~~~~~~~~~~~~

Fixes: 1e1a9cecfab3 ("block: force noio scope in blk_mq_freeze_queue")
Cc: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/block/sunvdc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/sunvdc.c b/drivers/block/sunvdc.c
index 33b3bc99d532..282f81616a78 100644
--- a/drivers/block/sunvdc.c
+++ b/drivers/block/sunvdc.c
@@ -1127,8 +1127,8 @@ static void vdc_queue_drain(struct vdc_port *port)
=20
 	spin_lock_irq(&port->vio.lock);
 	port->drain =3D 0;
-	blk_mq_unquiesce_queue(q, memflags);
-	blk_mq_unfreeze_queue(q);
+	blk_mq_unquiesce_queue(q);
+	blk_mq_unfreeze_queue(q, memflags);
 }
=20
 static void vdc_ldc_reset_timer_work(struct work_struct *work)
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/lxXUkxv0vftc0RvcxiPfPty
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmegIvIACgkQAVBC80lX
0Gz7HQf/SMVY15Ls5EsRZrDlV1Sey740bAwe7sokBsTwj9hmNVYRclB0d0yC8DcK
2MfRch7CpCIqZSlOxb3Wq+99ME92FUB1xZko5xU9D5FmAmIzn0g8zlME/QLSYPXm
e5ob9f+JL4bjAWjyvU+yQI7xsIBQF+10DF2w6b1jUhmLZBAbumwfBGmJ7I5eUvnB
bMP/2VEi00xIjB7sURBV8MS/agYOVqMk713vxwikYcWmSLFzd74Sr1U728FKwaJD
AhQpGX9GHe2Sta5FxEayQipowMxid+8J0e3cqcl7kOjCw1KarD1ikKuWoDphheZ1
xWGLJ2nDL3QAtlFKPVRD644A/xm1gw==
=0jfZ
-----END PGP SIGNATURE-----

--Sig_/lxXUkxv0vftc0RvcxiPfPty--

