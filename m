Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3896165321
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2020 00:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgBSXnf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Feb 2020 18:43:35 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33261 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726680AbgBSXne (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 Feb 2020 18:43:34 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48NDnJ6Sh1z9sR4;
        Thu, 20 Feb 2020 10:43:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582155812;
        bh=J1MT0vnVy3FqSG8y1+q5/HB5wtrtdwp2BWYleYRHkb4=;
        h=Date:From:To:Cc:Subject:From;
        b=rn+clfMAT41tJ5eYT+PCmbb08y8h+QVP8nhwDZV4m4cRk/m+DJdTYwj01/64bP05c
         OTYS0SRP3iTGmiXsI4lrqFfRUSXZvInPhhIA/0WTEFtmyF5Wp9O250yv6nG/4ZRhri
         kU1U1CCc9AzPgznjzSEwyXmQMrGu77zIKhYaTMZvZJRD1D/1/Xh/zSzSA4v2tAMQ4A
         jjPNkSGLLv6LZoaoxN+X9zqejtRSDeM0RUBmHY7NFMwRrXmB4QvDPvmOaZxyxSZ/rD
         uk7tmTr0t+cks7WOARu5dwyhszRhcSZecMon57BJkOWM4csXYCqc6/6j0uJz0kbXxj
         HODrlVQ1iESvw==
Date:   Thu, 20 Feb 2020 10:43:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the keys tree with Linus' tree
Message-ID: <20200220104332.138b83f6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pjr+kxwCU2muUzxVJaFTYYv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Pjr+kxwCU2muUzxVJaFTYYv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the keys tree got a conflict in:

  fs/pipe.c

between commit:

  6551d5c56eb0 ("pipe: make sure to wake up everybody when the last reader/=
writer closes")

from Linus' tree and commit:

  549d46d3827d ("pipe: Add general notification queue support")

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
index 2144507447c5,238601a7ab24..000000000000
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@@ -1269,12 -1310,63 +1311,64 @@@ int pipe_resize_ring(struct pipe_inode_
  	kfree(pipe->bufs);
  	pipe->bufs =3D bufs;
  	pipe->ring_size =3D nr_slots;
- 	pipe->max_usage =3D nr_slots;
+ 	if (pipe->max_usage > nr_slots)
+ 		pipe->max_usage =3D nr_slots;
  	pipe->tail =3D tail;
  	pipe->head =3D head;
 -	wake_up_interruptible_all(&pipe->rd_wait);
 -	wake_up_interruptible_all(&pipe->wr_wait);
 +
 +	/* This might have made more room for writers */
 +	wake_up_interruptible(&pipe->wr_wait);
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

--Sig_/Pjr+kxwCU2muUzxVJaFTYYv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5NyCQACgkQAVBC80lX
0GyNMwf/Yh5fhQ8AdjDbKLjjhx/+fcET+DN2uoi0yttGNs6Kn214Nqfgvo2ZkgCu
XWcCthPLnN0Gj6SWc5uD6OprwEQ2sJ7RgnOGdrITFv8Ln+oUyVUMAbVgRvFl2hB1
C7/7+4WXGv50Uq99GfuooEy14B6l105dko/QP5Rsrb5Wh0wbdT4uEe7pdr8qw+l9
W3n6JTPzoSDKgNU+oIk23SbkE2nEqeosGpGR0yTD/yzim4+C9NCobE4fpukxfcHB
E5P3THhghmfvjyLyObtuVLpU0rQg5P/NMYEOu3fjiWRHUGxrh2GLzF3cvPDIeeHU
cqibqE2aG3vDKfOZbHranmagtYabdA==
=E+hk
-----END PGP SIGNATURE-----

--Sig_/Pjr+kxwCU2muUzxVJaFTYYv--
