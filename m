Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31747B327E
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 00:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727602AbfIOWoV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Sep 2019 18:44:21 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:40290 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbfIOWoV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Sep 2019 18:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=DSyxuxhs8LGN1qg1j05Nij6jVwM5W1QMiXcPsby4PA8=; b=HgrUw6yVyZCgOJceDE9BK5mfJ
        Z0eTmRIj9rrroET8v5g5Q5KEQhKGYRDrHS+bK4cWGdDVWTZF6o/7WM+cH+6QnyjR4bE3Qg3imcoO4
        b0jYZJBC476Qg0o4KCaePG6YWNFsryFmGETkoYtCtMNbBa1E43gGbtTYFhEswhIkq7rvY=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9dFY-0001XP-FV; Sun, 15 Sep 2019 22:44:08 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id E9BE527415FF; Sun, 15 Sep 2019 23:44:07 +0100 (BST)
Date:   Sun, 15 Sep 2019 23:44:07 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Johannes Thumshirn <jthumshirn@suse.de>,
        Ming Lei <ming.lei@redhat.com>,
        Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the block tree with the dma-mapping tree
Message-ID: <20190915224407.GN4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wmhq21yAGFMoSpeN"
Content-Disposition: inline
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--wmhq21yAGFMoSpeN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  block/blk-settings.c
  include/linux/blkdev.h

between commit:

  45147fb522bb459e7 ("block: add a helper function to merge the segments")

=66rom the dma-mapping tree and commit:

  68c43f133a754cbf5 ("block: Introduce elevator features")

=66rom the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc block/blk-settings.c
index c3632fc6d5404,6bd1e3b082d8e..0000000000000
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@@ -833,28 -832,22 +833,44 @@@ void blk_queue_write_cache(struct reque
  }
  EXPORT_SYMBOL_GPL(blk_queue_write_cache);
 =20
 +/**
 + * blk_queue_can_use_dma_map_merging - configure queue for merging segmen=
ts.
 + * @q:		the request queue for the device
 + * @dev:	the device pointer for dma
 + *
 + * Tell the block layer about merging the segments by dma map of @q.
 + */
 +bool blk_queue_can_use_dma_map_merging(struct request_queue *q,
 +				       struct device *dev)
 +{
 +	unsigned long boundary =3D dma_get_merge_boundary(dev);
 +
 +	if (!boundary)
 +		return false;
 +
 +	/* No need to update max_segment_size. see blk_queue_virt_boundary() */
 +	blk_queue_virt_boundary(q, boundary);
 +
 +	return true;
 +}
 +EXPORT_SYMBOL_GPL(blk_queue_can_use_dma_map_merging);
 +
+ /**
+  * blk_queue_required_elevator_features - Set a queue required elevator f=
eatures
+  * @q:		the request queue for the target device
+  * @features:	Required elevator features OR'ed together
+  *
+  * Tell the block layer that for the device controlled through @q, only t=
he
+  * only elevators that can be used are those that implement at least the =
set of
+  * features specified by @features.
+  */
+ void blk_queue_required_elevator_features(struct request_queue *q,
+ 					  unsigned int features)
+ {
+ 	q->required_elevator_features =3D features;
+ }
+ EXPORT_SYMBOL_GPL(blk_queue_required_elevator_features);
+=20
  static int __init blk_settings_init(void)
  {
  	blk_max_low_pfn =3D max_low_pfn - 1;
diff --cc include/linux/blkdev.h
index f6d55e2490dcf,b196124e32408..0000000000000
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@@ -1085,8 -1099,8 +1099,10 @@@ extern void blk_queue_dma_alignment(str
  extern void blk_queue_update_dma_alignment(struct request_queue *, int);
  extern void blk_queue_rq_timeout(struct request_queue *, unsigned int);
  extern void blk_queue_write_cache(struct request_queue *q, bool enabled, =
bool fua);
 +extern bool blk_queue_can_use_dma_map_merging(struct request_queue *q,
 +					      struct device *dev);
+ extern void blk_queue_required_elevator_features(struct request_queue *q,
+ 						 unsigned int features);
 =20
  /*
   * Number of physical segments as sent to the device.

--wmhq21yAGFMoSpeN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1+vrYACgkQJNaLcl1U
h9AT/wf/Scmg1GGKoDYQ81amj+Wp9quUfyYxatUaNwhc+NyQ2v69p5PbrxciVZsV
SY5nD+W/emKAEmZs8I+2CNMeeuVbDpzfv7POVlJXiDG2xrPvKP20OksWTudDGhPy
2ByLJXIrNYwhzuV5kFY02NAmVhP40sfEmlqv8EAp4v2prCezmv8eZqZ/j1eN43fh
PzAVltYQEGei1UOEQ2Nulp1PPlCIu+vOEPKmczrTiHxqw/yiFh1711KT9tYPR5fO
yoa5UVFNjXX3lY2cv3rJywyuOnTVqkqPQOibXvvE8uH5WhlST+EhSm1qYbwILYa9
jOO2eOnEsOWU1zeDlvOXrsG/ecpY7w==
=EtXb
-----END PGP SIGNATURE-----

--wmhq21yAGFMoSpeN--
