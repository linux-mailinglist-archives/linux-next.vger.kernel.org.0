Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 247682DA501
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 01:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726919AbgLOAmf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 19:42:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726662AbgLOAme (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 19:42:34 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82035C061793;
        Mon, 14 Dec 2020 16:41:54 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cvzwb3cX5z9sS8;
        Tue, 15 Dec 2020 11:41:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607992912;
        bh=tFsLCWwh3QzSl5KeZYlYwup8Yu2gSsI2i52/STkGCgk=;
        h=Date:From:To:Cc:Subject:From;
        b=Lw1XfjDAaUdRsaQdV0atep4cSMmu+1kqRpZgblFHWxmxXfx16fVFWlvhSKildFXvs
         D/FgCSofOSij64MOYuR0mYFW15N88t8Syw2IKZ5798EML57NKNztEf50wtbV9MiFPc
         jegbAA1hRfM2op3UXWoFmLnydia+vUlqwWdZc2RsF12+saPSYcIzuP5FYnEaQ5rMHd
         oGYmA9sfOyvpjrim5tXpRAKzG072zAAIUvilr7rJxloAew7TSQ5EKosuZELeH8heNH
         tfRiS0JJGXXjLqls2vfhF0Jyi444qhJPMc+Oct0vFh4lIDxi3d9A8DbTHa5SnWkORw
         cFwgSoG7SmYgw==
Date:   Tue, 15 Dec 2020 11:41:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Chuck Lever <chuck.lever@oracle.com>,
        Trond Myklebust <trondmy@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: linux-next: manual merge of the cel tree with the nfs tree
Message-ID: <20201215114150.61178713@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MIfDz=mEtixrl8pMHI/nfeA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MIfDz=mEtixrl8pMHI/nfeA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cel tree got a conflict in:

  include/linux/sunrpc/xdr.h

between commits:

  9a20f6f4e6ba ("SUNRPC: Fixes for xdr_align_data()")
  c4f2f591f02c ("SUNRPC: Fix xdr_expand_hole()")
  f8d0e60f1056 ("SUNRPC: Cleanup - constify a number of xdr_buf helpers")

from the nfs tree and commits:

  5a7e702670ad ("SUNRPC: Adjust synopsis of xdr_buf_subsegment()")
  c1346a1216ab ("NFSD: Replace the internals of the READ_BUF() macro")

from the cel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/sunrpc/xdr.h
index 68d49fdc4ee9,9b35ce50cf2b..000000000000
--- a/include/linux/sunrpc/xdr.h
+++ b/include/linux/sunrpc/xdr.h
@@@ -182,14 -182,15 +182,15 @@@ xdr_adjust_iovec(struct kvec *iov, __be
   * XDR buffer helper functions
   */
  extern void xdr_shift_buf(struct xdr_buf *, size_t);
 -extern void xdr_buf_from_iov(struct kvec *, struct xdr_buf *);
 +extern void xdr_buf_from_iov(const struct kvec *, struct xdr_buf *);
- extern int xdr_buf_subsegment(const struct xdr_buf *, struct xdr_buf *, u=
nsigned int, unsigned int);
+ extern int xdr_buf_subsegment(const struct xdr_buf *buf, struct xdr_buf *=
subbuf,
+ 			      unsigned int base, unsigned int len);
  extern void xdr_buf_trim(struct xdr_buf *, unsigned int);
 -extern int read_bytes_from_xdr_buf(struct xdr_buf *, unsigned int, void *=
, unsigned int);
 -extern int write_bytes_to_xdr_buf(struct xdr_buf *, unsigned int, void *,=
 unsigned int);
 +extern int read_bytes_from_xdr_buf(const struct xdr_buf *, unsigned int, =
void *, unsigned int);
 +extern int write_bytes_to_xdr_buf(const struct xdr_buf *, unsigned int, v=
oid *, unsigned int);
 =20
 -extern int xdr_encode_word(struct xdr_buf *, unsigned int, u32);
 -extern int xdr_decode_word(struct xdr_buf *, unsigned int, u32 *);
 +extern int xdr_encode_word(const struct xdr_buf *, unsigned int, u32);
 +extern int xdr_decode_word(const struct xdr_buf *, unsigned int, u32 *);
 =20
  struct xdr_array2_desc;
  typedef int (*xdr_xcode_elem_t)(struct xdr_array2_desc *desc, void *elem);
@@@ -250,10 -251,54 +251,54 @@@ extern void xdr_init_decode_pages(struc
  extern __be32 *xdr_inline_decode(struct xdr_stream *xdr, size_t nbytes);
  extern unsigned int xdr_read_pages(struct xdr_stream *xdr, unsigned int l=
en);
  extern void xdr_enter_page(struct xdr_stream *xdr, unsigned int len);
 -extern int xdr_process_buf(struct xdr_buf *buf, unsigned int offset, unsi=
gned int len, int (*actor)(struct scatterlist *, void *), void *data);
 -extern uint64_t xdr_align_data(struct xdr_stream *, uint64_t, uint32_t);
 -extern uint64_t xdr_expand_hole(struct xdr_stream *, uint64_t, uint64_t);
 +extern int xdr_process_buf(const struct xdr_buf *buf, unsigned int offset=
, unsigned int len, int (*actor)(struct scatterlist *, void *), void *data);
 +extern unsigned int xdr_align_data(struct xdr_stream *, unsigned int offs=
et, unsigned int length);
 +extern unsigned int xdr_expand_hole(struct xdr_stream *, unsigned int off=
set, unsigned int length);
+ extern bool xdr_stream_subsegment(struct xdr_stream *xdr, struct xdr_buf =
*subbuf,
+ 				  unsigned int len);
+=20
+ /**
+  * xdr_set_scratch_buffer - Attach a scratch buffer for decoding data.
+  * @xdr: pointer to xdr_stream struct
+  * @buf: pointer to an empty buffer
+  * @buflen: size of 'buf'
+  *
+  * The scratch buffer is used when decoding from an array of pages.
+  * If an xdr_inline_decode() call spans across page boundaries, then
+  * we copy the data into the scratch buffer in order to allow linear
+  * access.
+  */
+ static inline void
+ xdr_set_scratch_buffer(struct xdr_stream *xdr, void *buf, size_t buflen)
+ {
+ 	xdr->scratch.iov_base =3D buf;
+ 	xdr->scratch.iov_len =3D buflen;
+ }
+=20
+ /**
+  * xdr_set_scratch_page - Attach a scratch buffer for decoding data
+  * @xdr: pointer to xdr_stream struct
+  * @page: an anonymous page
+  *
+  * See xdr_set_scratch_buffer().
+  */
+ static inline void
+ xdr_set_scratch_page(struct xdr_stream *xdr, struct page *page)
+ {
+ 	xdr_set_scratch_buffer(xdr, page_address(page), PAGE_SIZE);
+ }
+=20
+ /**
+  * xdr_reset_scratch_buffer - Clear scratch buffer information
+  * @xdr: pointer to xdr_stream struct
+  *
+  * See xdr_set_scratch_buffer().
+  */
+ static inline void
+ xdr_reset_scratch_buffer(struct xdr_stream *xdr)
+ {
+ 	xdr_set_scratch_buffer(xdr, NULL, 0);
+ }
 =20
  /**
   * xdr_stream_remaining - Return the number of bytes remaining in the str=
eam

--Sig_/MIfDz=mEtixrl8pMHI/nfeA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/YBk4ACgkQAVBC80lX
0GywNgf+MLBf4WVGaRXl/xQRYrxL7YLs2N/zac9iWsJAiJ1olDsvToAqtLiVLK+k
q9AnN3syswawVeJZxe2K+T5fs7aooNQTD+BGbAxQKN94VHzT0rzIPsAs72ccmw++
6pGEW7orjuK0gpufV8mjGIO08IdA6x+4h4KsT4INrMXqDfbvr97P5Z714+ArBigK
cKWww2Fud+65vHEgzYUPclfO026Q25UAqI/DNLOEPHaWUTMfwusH7opm5o53cuJ1
ldz2nZJwLC2wRU/j+diA2dwqNzmMsCl9yDSCGYplCIW95oaqAvpu8X3sVvpk28o1
Z8EShzmYFGLd/mxgxAKxb0fkiqV7cw==
=G2vE
-----END PGP SIGNATURE-----

--Sig_/MIfDz=mEtixrl8pMHI/nfeA--
