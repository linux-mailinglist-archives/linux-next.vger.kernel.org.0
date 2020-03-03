Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D79C176A1E
	for <lists+linux-next@lfdr.de>; Tue,  3 Mar 2020 02:41:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgCCBlk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Mar 2020 20:41:40 -0500
Received: from ozlabs.org ([203.11.71.1]:49307 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726773AbgCCBlj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Mar 2020 20:41:39 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48Wfr21PN1z9sRY;
        Tue,  3 Mar 2020 12:41:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583199698;
        bh=s2c3qjzt2cgMtofyjDXXR0eKGpCwrTmuZXTJn6aKR6M=;
        h=Date:From:To:Cc:Subject:From;
        b=MYCeF0bl6xpeqVr/yLhfzHio4KXOJbteAFnBF2YqtlbDE3Kp2APt+vv7/amzCCEFl
         BoRdQ4ytH3r5ahHX/NB2GrJ6oCM2OyRTAr+7zcRWqfiEmPEpymzd4imGiVdl4ymedq
         ZPy5Xaqob2e9JD6nRpM5sfcHerlc1fkacSucpZDOfbbqDgRoyFZhkv2QtMwTlWLgyv
         igtf5vZx0fAZdNDWaVaj5n7m4c0qNbGhF/ewIHzjB4o1k2at6A3y9s/m9nYVODY4t1
         1PB/N4E68NK3uMpNH63l0OrnjoiMs6wo3hhagRGhvJlVEMTj3YvVBorj+nJ7EowKJU
         ZefHYQQa56/RA==
Date:   Tue, 3 Mar 2020 12:41:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warnings after merge of the block tree
Message-ID: <20200303124133.13309249@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/62+ogEgEr2Z7c_./MZMW6hz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/62+ogEgEr2Z7c_./MZMW6hz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (arm
multi_v7_defconfig) produced these warnings:

fs/io_uring.c: In function 'io_put_kbuf':
fs/io_uring.c:1651:27: warning: cast to pointer from integer of different s=
ize [-Wint-to-pointer-cast]
 1651 |  struct io_buffer *kbuf =3D (struct io_buffer *) req->rw.addr;
      |                           ^
fs/io_uring.c: In function 'io_rw_buffer_select':
fs/io_uring.c:2209:27: warning: cast to pointer from integer of different s=
ize [-Wint-to-pointer-cast]
 2209 |  struct io_buffer *kbuf =3D (struct io_buffer *) req->rw.addr;
      |                           ^
fs/io_uring.c:2216:17: warning: cast from pointer to integer of different s=
ize [-Wpointer-to-int-cast]
 2216 |  req->rw.addr =3D (u64) kbuf;
      |                 ^
fs/io_uring.c: In function 'io_cleanup_req':
fs/io_uring.c:4897:10: warning: cast to pointer from integer of different s=
ize [-Wint-to-pointer-cast]
 4897 |    kfree((void *)req->rw.addr);
      |          ^

Introduced by commits

  7efcbb97deab ("io_uring: support buffer selection for OP_READ and OP_RECV=
")
  8cab19f460b6 ("io_uring: add IOSQE_BUFFER_SELECT support for IORING_OP_RE=
ADV")

--=20
Cheers,
Stephen Rothwell

--Sig_/62+ogEgEr2Z7c_./MZMW6hz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5dtc0ACgkQAVBC80lX
0GxZUQf+KT6vq+XHTDaAWKOwYyaOx78ckXgho3hoObDJzOwtqLphZawN86zewe77
TccQwMAMI2exWp+cCzCXzE1RVN9IoidJUqr3gLbzIXX07G5jNiG5pwtF0/hdinhx
U4NvT//EVLdQLkxwLSY2oE2ShhwNXG2tXnkZaEwgkvYqtMniYWLo5dC8SkvUmcwb
HtsT7I71lTS5t2SOD6KsdXKZBh3bGq8cv4SXJdEkEIxtK42FtIYlQ5enxcFoaekM
0Y0i5tx9VR9GryyJpvY/Bvz1oeyThIMDlOv9/BHKjCrrR5eLrOSVGAE4TgvnymQW
bm/cx35ouqOFUhbFSLnhKpxCc5YT6Q==
=wmUr
-----END PGP SIGNATURE-----

--Sig_/62+ogEgEr2Z7c_./MZMW6hz--
