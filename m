Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADBBB2D923B
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 05:19:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438550AbgLNESr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 13 Dec 2020 23:18:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgLNESr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 13 Dec 2020 23:18:47 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9555C0613CF;
        Sun, 13 Dec 2020 20:18:06 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvSmX4mstz9sT6;
        Mon, 14 Dec 2020 15:18:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607919484;
        bh=Ap4veYE6g8S6YKlenbtrX+KmmgQamRiHcRuH1VqFN+s=;
        h=Date:From:To:Cc:Subject:From;
        b=V1vNNohqhMdlrFbS4ZZYvngSMFee7gyh97cqz97pWhDiVPHQ3W+37m+OicYCvzBNs
         35VbiBgIa3+H60yTvjMsoCIiVHvSTKHJAcmG9uJ8PpHA8bwQCYXW+IjLbB4AbdsjLm
         QknQECl8GNvV+myaxH/3ynDOt84b/mqtmGNx2mqCXF0Za7CEKE8hoKOxW6rCr8GACg
         ClQLit/z1Q9nsseSvLo0/nqHxrWTW+0zZ+bqIDKARFShx3dWmSqppmiFQhyuesnW64
         URNx8PH32Zdhk0GhODELBUFxdWyUjxXWG0pcGTo5c3vZxgJoorV0SU3F1OQJyhFaWx
         e0pnOjUbqO0Sw==
Date:   Mon, 14 Dec 2020 15:18:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>, Song Liu <songliubraving@fb.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20201214151803.411b3b41@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rgN3xbXPFOB5eCTLP4HJp/x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rgN3xbXPFOB5eCTLP4HJp/x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/md/raid0.c: In function 'raid0_handle_discard':
drivers/md/raid0.c:511:26: error: passing argument 1 of 'trace_block_bio_re=
map' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
  511 |    trace_block_bio_remap(bdev_get_queue(rdev->bdev),
      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |                          |
      |                          struct request_queue *
In file included from include/trace/events/block.h:11,
                 from drivers/md/raid0.c:17:
include/trace/events/block.h:458:23: note: expected 'struct bio *' but argu=
ment is of type 'struct request_queue *'
  458 |  TP_PROTO(struct bio *bio, dev_t dev, sector_t from),
      |           ~~~~~~~~~~~~^~~
include/linux/tracepoint.h:238:34: note: in definition of macro '__DECLARE_=
TRACE'
  238 |  static inline void trace_##name(proto)    \
      |                                  ^~~~~
include/linux/tracepoint.h:411:24: note: in expansion of macro 'PARAMS'
  411 |  __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
      |                        ^~~~~~
include/linux/tracepoint.h:547:2: note: in expansion of macro 'DECLARE_TRAC=
E'
  547 |  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
      |  ^~~~~~~~~~~~~
include/linux/tracepoint.h:547:22: note: in expansion of macro 'PARAMS'
  547 |  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
      |                      ^~~~~~
include/trace/events/block.h:456:1: note: in expansion of macro 'TRACE_EVEN=
T'
  456 | TRACE_EVENT(block_bio_remap,
      | ^~~~~~~~~~~
include/trace/events/block.h:458:2: note: in expansion of macro 'TP_PROTO'
  458 |  TP_PROTO(struct bio *bio, dev_t dev, sector_t from),
      |  ^~~~~~~~
drivers/md/raid0.c:512:5: warning: passing argument 2 of 'trace_block_bio_r=
emap' makes integer from pointer without a cast [-Wint-conversion]
  512 |     discard_bio, disk_devt(mddev->gendisk),
      |     ^~~~~~~~~~~
      |     |
      |     struct bio *
In file included from include/trace/events/block.h:11,
                 from drivers/md/raid0.c:17:
include/trace/events/block.h:458:34: note: expected 'dev_t' {aka 'unsigned =
int'} but argument is of type 'struct bio *'
  458 |  TP_PROTO(struct bio *bio, dev_t dev, sector_t from),
      |                            ~~~~~~^~~
include/linux/tracepoint.h:238:34: note: in definition of macro '__DECLARE_=
TRACE'
  238 |  static inline void trace_##name(proto)    \
      |                                  ^~~~~
include/linux/tracepoint.h:411:24: note: in expansion of macro 'PARAMS'
  411 |  __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
      |                        ^~~~~~
include/linux/tracepoint.h:547:2: note: in expansion of macro 'DECLARE_TRAC=
E'
  547 |  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
      |  ^~~~~~~~~~~~~
include/linux/tracepoint.h:547:22: note: in expansion of macro 'PARAMS'
  547 |  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
      |                      ^~~~~~
include/trace/events/block.h:456:1: note: in expansion of macro 'TRACE_EVEN=
T'
  456 | TRACE_EVENT(block_bio_remap,
      | ^~~~~~~~~~~
include/trace/events/block.h:458:2: note: in expansion of macro 'TP_PROTO'
  458 |  TP_PROTO(struct bio *bio, dev_t dev, sector_t from),
      |  ^~~~~~~~
drivers/md/raid0.c:511:4: error: too many arguments to function 'trace_bloc=
k_bio_remap'
  511 |    trace_block_bio_remap(bdev_get_queue(rdev->bdev),
      |    ^~~~~~~~~~~~~~~~~~~~~
In file included from include/trace/events/block.h:11,
                 from drivers/md/raid0.c:17:
include/linux/tracepoint.h:238:21: note: declared here
  238 |  static inline void trace_##name(proto)    \
      |                     ^~~~~~
include/linux/tracepoint.h:411:2: note: in expansion of macro '__DECLARE_TR=
ACE'
  411 |  __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
      |  ^~~~~~~~~~~~~~~
include/linux/tracepoint.h:547:2: note: in expansion of macro 'DECLARE_TRAC=
E'
  547 |  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
      |  ^~~~~~~~~~~~~
include/trace/events/block.h:456:1: note: in expansion of macro 'TRACE_EVEN=
T'
  456 | TRACE_EVENT(block_bio_remap,
      | ^~~~~~~~~~~

Caused by commit

  1c02fca620f7 ("block: remove the request_queue argument to the block_bio_=
remap tracepoint")

interacting with commit

  57a0f3a81ef2 ("Revert "md: add md_submit_discard_bio() for submitting dis=
card bio"")

from Linus' tree.

I have applied the following merge fix:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 14 Dec 2020 15:14:26 +1100
Subject: [PATCH] fixup for "block: remove the request_queue argument to the=
 block_bio_remap tracepoint"

conflicting with

"Revert "md: add md_submit_discard_bio() for submitting discard bio""

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/md/raid0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index 8f5b0143d8c6..67f157f2525d 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -508,8 +508,8 @@ static void raid0_handle_discard(struct mddev *mddev, s=
truct bio *bio)
 		bio_chain(discard_bio, bio);
 		bio_clone_blkg_association(discard_bio, bio);
 		if (mddev->gendisk)
-			trace_block_bio_remap(bdev_get_queue(rdev->bdev),
-				discard_bio, disk_devt(mddev->gendisk),
+			trace_block_bio_remap(discard_bio,
+				disk_devt(mddev->gendisk),
 				bio->bi_iter.bi_sector);
 		submit_bio_noacct(discard_bio);
 	}
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/rgN3xbXPFOB5eCTLP4HJp/x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/W53sACgkQAVBC80lX
0GwR3wf/VaRztQkjmysC3E5kSROkNLTnSAoLIAi6it6wcBMXe0I+SK5E+DJK/pOt
QMVrL2Xx235qjTU3Zuqjr470XVtvrTX8PfBZnLOeiIqZ0IpyZ8xdbWyyQLWwc2O/
t621f+alBHBW0Q9F+YwuL6CQY0PV3S9Pw+9OJ+Q12VQ9niyRQXecrNfr9yJnJJxj
Msp0KdhKuNRqzGZmtjn+gFUkmIDyAVVCboKgr5CwnwQsdqzyfScuwnJiKWiCGtqm
ewdk2HwlqgA6PuKoeTGTbJ66x7bSQ7sPt6uRpeQmaXnaWSH5N9XUX4S1v91OtSvs
ZUdg+A6TMqMZXmFncMjaW88mPf7f9A==
=QpF7
-----END PGP SIGNATURE-----

--Sig_/rgN3xbXPFOB5eCTLP4HJp/x--
