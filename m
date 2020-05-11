Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF131CD129
	for <lists+linux-next@lfdr.de>; Mon, 11 May 2020 06:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgEKE7V (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 May 2020 00:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725884AbgEKE7V (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 May 2020 00:59:21 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75121C061A0C;
        Sun, 10 May 2020 21:59:20 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49L7yF3Khqz9sRY;
        Mon, 11 May 2020 14:59:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589173157;
        bh=WUujOLimoeAvDljYiMPixtckD8vaBObKHQz9F4iBiWI=;
        h=Date:From:To:Cc:Subject:From;
        b=ruGIkzzcPER0x91jO8wyv+BvsFONC/afbQjoAwXnuYwbkBMRxyBxO2hnlYxa6XPUX
         gJw5BecasERj0DgD0NJjovW7kHqRnt6P6sDdHVSoCL5x4o+xyPCScSSYsvhQOB8WMO
         Q1/VahqcFdiB/hoAR9ZCQh5VG5qNHcKxJi+W1s17iTEVTw7op7HL/ls//p7i6xS4Yl
         LrQmsxFT+79lj4uzAFl/EdXqZSATf73spFUpt5bhjrVFc6yTwTUznLle0xTl5Bs6Rx
         4HvfsWTwV7f/S30T8jUzNWHJzczTXApQWqGXrGlFfxTr4I9IeR5F6hamHkU94T8zOp
         jziGuffJQ5gpA==
Date:   Mon, 11 May 2020 14:59:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pavel Begunkov <asml.silence@gmail.com>,
        Jens Axboe <axboe@kernel.dk>
Subject: linux-next: manual merge of the keys tree with Linus' tree
Message-ID: <20200511145915.3bef0c16@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I=eeMJ48ut2BBgMwtYzMluM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/I=eeMJ48ut2BBgMwtYzMluM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the keys tree got a conflict in:

  fs/splice.c

between commit:

  90da2e3f25c8 ("splice: move f_mode checks to do_{splice,tee}()")

from Linus' tree and commit:

  549d46d3827d ("pipe: Add general notification queue support")

from the keys tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/splice.c
index fd0a1e7e5959,6e6ea30c72b4..000000000000
--- a/fs/splice.c
+++ b/fs/splice.c
@@@ -1118,12 -1118,8 +1118,12 @@@ long do_splice(struct file *in, loff_t=20
  	loff_t offset;
  	long ret;
 =20
 +	if (unlikely(!(in->f_mode & FMODE_READ) ||
 +		     !(out->f_mode & FMODE_WRITE)))
 +		return -EBADF;
 +
- 	ipipe =3D get_pipe_info(in);
- 	opipe =3D get_pipe_info(out);
+ 	ipipe =3D get_pipe_info(in, true);
+ 	opipe =3D get_pipe_info(out, true);
 =20
  	if (ipipe && opipe) {
  		if (off_in || off_out)
@@@ -1757,14 -1766,10 +1757,17 @@@ static int link_pipe(struct pipe_inode_
  static long do_tee(struct file *in, struct file *out, size_t len,
  		   unsigned int flags)
  {
- 	struct pipe_inode_info *ipipe =3D get_pipe_info(in);
- 	struct pipe_inode_info *opipe =3D get_pipe_info(out);
 -	struct pipe_inode_info *ipipe =3D get_pipe_info(in, true);
 -	struct pipe_inode_info *opipe =3D get_pipe_info(out, true);
++	struct pipe_inode_info *ipipe;
++	struct pipe_inode_info *opipe;
  	int ret =3D -EINVAL;
 =20
 +	if (unlikely(!(in->f_mode & FMODE_READ) ||
 +		     !(out->f_mode & FMODE_WRITE)))
 +		return -EBADF;
 +
++	ipipe =3D get_pipe_info(in, true);
++	opipe =3D get_pipe_info(out, true);
++
  	/*
  	 * Duplicate the contents of ipipe to opipe without actually
  	 * copying the data.

--Sig_/I=eeMJ48ut2BBgMwtYzMluM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6426MACgkQAVBC80lX
0GxirQf7B4Vg54aYUZcBzIKxcaUnOBzTEgcQVt9XNG80kzwBY+OtrrmLA5ENve7f
luO2RKNfTNwhO2nfVPmYSUZtccORDNHd9w4xaLOJD+FCwSewhIvpj1VtLvEOGTVn
2Rgo57CmvlDc9gdxZlCSSv/SBT9IHvsJ2e0cWIAZuvRlmd25Y5o1r3xSW5fjlcfV
DPjhZGUOaSd9wvFDocOjgWbKGOrWlhRRd+L3ovnzL8ZCR51KQhg4MYDUdJnRLsFz
BaJfJesaQoUdFTR0e2eUuCKa9uDzKrL0F3x79LD8UM7ONaVV0H508HodW8vykenJ
mBf4osiyoG0iJpR8pu8bQqZJ1Kx1Ng==
=ZAJP
-----END PGP SIGNATURE-----

--Sig_/I=eeMJ48ut2BBgMwtYzMluM--
