Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC4F3156CDD
	for <lists+linux-next@lfdr.de>; Sun,  9 Feb 2020 23:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgBIWee (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Feb 2020 17:34:34 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:53601 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726798AbgBIWee (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 9 Feb 2020 17:34:34 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48G3kG36G4z9s3x;
        Mon, 10 Feb 2020 09:34:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581287670;
        bh=ffXjd4VhSrlkpb235rHpNxHYAPKFxOrUGZz38tgar7c=;
        h=Date:From:To:Cc:Subject:From;
        b=c5axue+oz0IuR/8w1alPVvIhpTMn4LBt/PPrlL5TC884UDT4AxxR8wOeH+tvFdXyU
         ChaULgpJ6e01XZJMK1NYFfOYD2ZbiD2xLUISloJJEC6h0of9WH9SgonYgiKKaZwm/t
         cBjoX+UuyBPaJX52+388T7eORahGgGaf8Srp5DincTW57c6mUiYs7wprpqquqe3AlN
         oroRNJ0wlyDXSrgTJmUMZmG9sQCp4XBv3/aiai66ioNoyRLGl3rjcSbnSfWbR1umC4
         ckoXRJ0v4vIPSsEmY/LLGPeqZye/ZLqtdksfJSLcVSPN4TXXh2IHs57k7n06tG6Tz7
         6oJIBVHQJRNDg==
Date:   Mon, 10 Feb 2020 09:34:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the keys tree with Linus' tree
Message-ID: <20200210093423.3041c316@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ye78Ofs234F6BRPSMl8quaT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ye78Ofs234F6BRPSMl8quaT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the keys tree got a conflict in:

  fs/pipe.c

between commit:

  0ddad21d3e99 ("pipe: use exclusive waits when reading or writing")

from Linus' tree and commits:

  57421d0685a3 ("pipe: Add general notification queue support")
  95e0a8b2f657 ("pipe: Add notification lossage handling")

from the keys tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/pipe.c
index 5a34d6c22d4c,423aafca4338..000000000000
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@@ -347,10 -375,14 +378,14 @@@ pipe_read(struct kiocb *iocb, struct io
 =20
  			if (!buf->len) {
  				pipe_buf_release(pipe, buf);
 -				spin_lock_irq(&pipe->wait.lock);
 +				spin_lock_irq(&pipe->rd_wait.lock);
+ #ifdef CONFIG_WATCH_QUEUE
+ 				if (buf->flags & PIPE_BUF_FLAG_LOSS)
+ 					pipe->note_loss =3D true;
+ #endif
  				tail++;
  				pipe->tail =3D tail;
 -				spin_unlock_irq(&pipe->wait.lock);
 +				spin_unlock_irq(&pipe->rd_wait.lock);
  			}
  			total_len -=3D chars;
  			if (!total_len)
@@@ -1268,11 -1290,62 +1310,63 @@@ int pipe_resize_ring(struct pipe_inode_
  	kfree(pipe->bufs);
  	pipe->bufs =3D bufs;
  	pipe->ring_size =3D nr_slots;
- 	pipe->max_usage =3D nr_slots;
+ 	if (pipe->max_usage > nr_slots)
+ 		pipe->max_usage =3D nr_slots;
  	pipe->tail =3D tail;
  	pipe->head =3D head;
 -	wake_up_interruptible_all(&pipe->wait);
 +	wake_up_interruptible_all(&pipe->rd_wait);
 +	wake_up_interruptible_all(&pipe->wr_wait);
+ 	return 0;
+ }
+=20
+ /*
+  * Allocate a new array of pipe buffers and copy the info over. Returns t=
he
+  * pipe size if successful, or return -ERROR on error.
+  */
+ static long pipe_set_size(struct pipe_inode_info *pipe, unsigned long arg)
+ {
+ 	unsigned long user_bufs;
+ 	unsigned int nr_slots, size;
+ 	long ret =3D 0;
+=20
+ #ifdef CONFIG_WATCH_QUEUE
+ 	if (pipe->watch_queue)
+ 		return -EBUSY;
+ #endif
+=20
+ 	size =3D round_pipe_size(arg);
+ 	nr_slots =3D size >> PAGE_SHIFT;
+=20
+ 	if (!nr_slots)
+ 		return -EINVAL;
+=20
+ 	/*
+ 	 * If trying to increase the pipe capacity, check that an
+ 	 * unprivileged user is not trying to exceed various limits
+ 	 * (soft limit check here, hard limit check just below).
+ 	 * Decreasing the pipe capacity is always permitted, even
+ 	 * if the user is currently over a limit.
+ 	 */
+ 	if (nr_slots > pipe->max_usage &&
+ 			size > pipe_max_size && !capable(CAP_SYS_RESOURCE))
+ 		return -EPERM;
+=20
+ 	user_bufs =3D account_pipe_buffers(pipe->user, pipe->nr_accounted, nr_sl=
ots);
+=20
+ 	if (nr_slots > pipe->max_usage &&
+ 			(too_many_pipe_buffers_hard(user_bufs) ||
+ 			 too_many_pipe_buffers_soft(user_bufs)) &&
+ 			pipe_is_unprivileged_user()) {
+ 		ret =3D -EPERM;
+ 		goto out_revert_acct;
+ 	}
+=20
+ 	ret =3D pipe_resize_ring(pipe, nr_slots);
+ 	if (ret < 0)
+ 		goto out_revert_acct;
+=20
+ 	pipe->max_usage =3D nr_slots;
+ 	pipe->nr_accounted =3D nr_slots;
  	return pipe->max_usage * PAGE_SIZE;
 =20
  out_revert_acct:

--Sig_/ye78Ofs234F6BRPSMl8quaT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5AiO8ACgkQAVBC80lX
0GzyBwgAg/02d9Gyqto/e0Xu5M3VmRwSWBB748F9kvTaftxEEnEwu0L1L4jr97em
BnvEi4uBN1EQI8qRxZ/hWCY6Db1MSAl56m2HpHhrzMI11J+ZmkewqjMgI5FeTUwR
t7BlUlo+WETBZL7UTK/RVeeLViZ0cYv3/l35UA+kZj/ptoao+o4GpILnRFLtBNI9
Vx6Ner/4XnIR3GmfoVhj4gSIY+tCsoPoRg72Ofb5bIwBl30Hgh/UbXH6p4ugi7cS
ZwYCYom9f7oFPPzB0dAttuCIvwU+2t0r0Q7b7WnmrJDV8LAeFtLAG6M5MmFRIEJ3
CHCTtV+D698eHGqjLCzBY3G1dcD7qQ==
=uZZf
-----END PGP SIGNATURE-----

--Sig_/ye78Ofs234F6BRPSMl8quaT--
