Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 742FB438D76
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 04:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbhJYC3M (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Oct 2021 22:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbhJYC3M (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Oct 2021 22:29:12 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A5C9C061745;
        Sun, 24 Oct 2021 19:26:50 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HczNm6lKhz4xbM;
        Mon, 25 Oct 2021 13:26:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635128809;
        bh=TrM9APB2AGvQ5WsCyA/bZkd87C42PO0byLCrTUGQqE4=;
        h=Date:From:To:Cc:Subject:From;
        b=DnseFRv1HurZ3VZnGL3jDe2qzuCa7MDPtZNfY7KmfQ2I4IEr9kJSZqmmwuLSHVA2j
         se4KCUXtNINCnFq+zpU87O0DXSSVcxxqa0zn8K+UmXf7SrDOMlNXupjB2RMJqH66hw
         a4p0RYNpw+y/CKCoDd6aSKp1W/orkzdM/vs5jWQDLr2r8bWeqpdpiNLHkM/+F334df
         gQWP0gXBXtFNiU3AKL9dZvfIqpWsyC0QpMS9GPKjl5mGIrhCCb9XclRWLYG+q+fD5Y
         eCwRtwy4K8qf1RyQd7LuRFoAtAA5A3ocVZx7KX8N3575qCt0krSzg6Dgj8sw0yJH9E
         sKXjVcxAcwsFA==
Date:   Mon, 25 Oct 2021 13:26:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: linux-next: manual merge of the block tree with Linus' tree
Message-ID: <20211025132647.5e1c57b9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eN8zNdIHN1yb78UuNu75moN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eN8zNdIHN1yb78UuNu75moN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  fs/io_uring.c

between commits:

  4ea672ab694c ("io_uring: fix ltimeout unprep")
  b22fa62a35d7 ("io_uring: apply worker limits to previous users")

from Linus' tree and commit:

  d475a9a6226c ("io_uring: inline hot path of __io_queue_sqe()")
  c072481ded14 ("io_uring: mark cold functions")

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

diff --cc fs/io_uring.c
index bc18af5e0a93,c2176bf339e0..000000000000
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@@ -6947,7 -6906,33 +6903,33 @@@ static void io_queue_linked_timeout(str
  	io_put_req(req);
  }
 =20
- static void __io_queue_sqe(struct io_kiocb *req)
+ static void io_queue_sqe_arm_apoll(struct io_kiocb *req)
+ 	__must_hold(&req->ctx->uring_lock)
+ {
+ 	struct io_kiocb *linked_timeout =3D io_prep_linked_timeout(req);
+=20
+ 	switch (io_arm_poll_handler(req)) {
+ 	case IO_APOLL_READY:
+ 		if (linked_timeout) {
 -			io_unprep_linked_timeout(req);
++			io_queue_linked_timeout(linked_timeout);
+ 			linked_timeout =3D NULL;
+ 		}
+ 		io_req_task_queue(req);
+ 		break;
+ 	case IO_APOLL_ABORTED:
+ 		/*
+ 		 * Queued up for async execution, worker will release
+ 		 * submit reference when the iocb is actually submitted.
+ 		 */
+ 		io_queue_async_work(req, NULL);
+ 		break;
+ 	}
+=20
+ 	if (linked_timeout)
+ 		io_queue_linked_timeout(linked_timeout);
+ }
+=20
+ static inline void __io_queue_sqe(struct io_kiocb *req)
  	__must_hold(&req->ctx->uring_lock)
  {
  	struct io_kiocb *linked_timeout;
@@@ -10647,11 -10690,9 +10696,11 @@@ static __cold int io_unregister_iowq_af
  	return io_wq_cpu_affinity(tctx->io_wq, NULL);
  }
 =20
- static int io_register_iowq_max_workers(struct io_ring_ctx *ctx,
- 					void __user *arg)
+ static __cold int io_register_iowq_max_workers(struct io_ring_ctx *ctx,
+ 					       void __user *arg)
 +	__must_hold(&ctx->uring_lock)
  {
 +	struct io_tctx_node *node;
  	struct io_uring_task *tctx =3D NULL;
  	struct io_sq_data *sqd =3D NULL;
  	__u32 new_count[2];

--Sig_/eN8zNdIHN1yb78UuNu75moN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF2FecACgkQAVBC80lX
0Gwokwf/eTQ5En0HQoD/+lAad0rlypwAsws2zpgfb3KxzAzkmfI8BK03QjmGAoX7
wd5XFIlgjxHQSGC8xXgZdWSkeKIBRtXu5FDzTK90/EsvfZWehJVKEjGpEbVLbYoq
pZQCvn3pKhnMp6XbRkhlXCdOx4dTnQRyyOScDTxAMkjJcR2lHXLOACLNKBbN+GLR
XtPV2/WYbr7RXmZ/dt0McAWZfLHxVaKPkiAk9ylbbFkUE5NjFs6f/Qe7I/PMfPbI
Vphtvz4wj/9xw6uecqjAl1J+TXByGxqKX8khkzX/D/BAAeNjhslCRdJq7DPsPWK6
h61UvyXLB0bkCd5AdMZa1JfUvDgJlw==
=jVZ1
-----END PGP SIGNATURE-----

--Sig_/eN8zNdIHN1yb78UuNu75moN--
