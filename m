Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE171E79F6
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 11:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgE2J6k (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 05:58:40 -0400
Received: from ozlabs.org ([203.11.71.1]:40153 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbgE2J6j (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 May 2020 05:58:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49YKlJ0rqZz9sSm;
        Fri, 29 May 2020 19:58:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590746317;
        bh=BLtw5zWwlgdDwY91og71zPcXFeb40B71+4+UqmVvzaw=;
        h=Date:From:To:Cc:Subject:From;
        b=ihz3oXOh0d03FDjIqnZ/pH4jPfTAarqkMWPblIWIQxncv7LIn25sPdx8u5Ib9CmEr
         ctzsksAU6Tsl0fGeVBfNkne16Mic9paLg42fUjHpnhJxZY1LuE2Nms+7L+qLkrdwu6
         CCFN5IBBU3H/NWEr5AcThs+fFp+6XHV3JlpV9SAN8XyFWFpuwJg0dGvq672W5rQ2NM
         eIPD9BJ1ewcBAvjYavceWLEOph3alXCBIYK/mO9msZE/bpLejq6G4CuJSKUbgY1JZ7
         lemFBTSj26P3CT958bqtJu2u1OEsCFhgipYA8yx6YlzWagycX/hCaEksCLMQl5ZlOG
         sZsflIsT6PxFg==
Date:   Fri, 29 May 2020 19:58:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Julia Cartwright <julia@ni.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Message-ID: <20200529195834.168ccc1f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5uH3JGl/U/tTW8krx5/PCeh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5uH3JGl/U/tTW8krx5/PCeh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/squashfs/decompressor_multi_percpu.c

between commit:

  fd56200a16c7 ("squashfs: Make use of local lock in multi_cpu decompressor=
")

from the tip tree and commit:

  5697b27554f3 ("squashfs-migrate-from-ll_rw_block-usage-to-bio-fix")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/squashfs/decompressor_multi_percpu.c
index e206ebfe003c,d93e12d9b712..000000000000
--- a/fs/squashfs/decompressor_multi_percpu.c
+++ b/fs/squashfs/decompressor_multi_percpu.c
@@@ -75,19 -72,18 +75,18 @@@ void squashfs_decompressor_destroy(stru
  	}
  }
 =20
- int squashfs_decompress(struct squashfs_sb_info *msblk, struct buffer_hea=
d **bh,
- 	int b, int offset, int length, struct squashfs_page_actor *output)
+ int squashfs_decompress(struct squashfs_sb_info *msblk, struct bio *bio,
+ 	int offset, int length, struct squashfs_page_actor *output)
  {
 -	struct squashfs_stream __percpu *percpu;
  	struct squashfs_stream *stream;
  	int res;
 =20
 -	percpu =3D (struct squashfs_stream __percpu *)msblk->stream;
 -	stream =3D get_cpu_ptr(percpu);
 +	local_lock(&msblk->stream->lock);
 +	stream =3D this_cpu_ptr(msblk->stream);
 +
- 	res =3D msblk->decompressor->decompress(msblk, stream->stream, bh, b,
- 			offset, length, output);
-=20
+ 	res =3D msblk->decompressor->decompress(msblk, stream->stream, bio,
+ 					      offset, length, output);
 -	put_cpu_ptr(stream);
 +	local_unlock(&msblk->stream->lock);
 =20
  	if (res < 0)
  		ERROR("%s decompression failed, data probably corrupt\n",

--Sig_/5uH3JGl/U/tTW8krx5/PCeh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Q3MoACgkQAVBC80lX
0GwLdwf/bdV5Jnxj4ZZ9uaFc9511IzcivrZaAFI5TMYEUuguePYAvBKF21pA5FoT
f9cLyfhrkySey5gXGrxN19SZRuegL/EK7/3rUrKEOLeTcsLCzOAqRLV3JhrFcYLC
87vGx4p0Ji9o79/4NVYmZ79WUBedJwGmgk3JxTL1FG6wwCnh1OJ++72zaU5ydd7P
WxRd5nQC1gAY7Gbfhztq3+zSh445oIhao/c/9gQdkrIUZFt/2GR8fT8g78Eo1DWj
ppR1dFEVV1hZ0JCTNfX8q6fR0/QVGJJ5s8p5cEG3vtoNs15fbJRQt6514BmjIWk8
b+rlK6B752B5MO5OYLsmdnIzEtnADw==
=52rz
-----END PGP SIGNATURE-----

--Sig_/5uH3JGl/U/tTW8krx5/PCeh--
