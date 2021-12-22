Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9F2B47CFCB
	for <lists+linux-next@lfdr.de>; Wed, 22 Dec 2021 11:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244100AbhLVKPm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Dec 2021 05:15:42 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:42407 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234441AbhLVKPm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Dec 2021 05:15:42 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4JJq2z4B0Pz4xmt;
        Wed, 22 Dec 2021 21:15:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1640168140;
        bh=Iy0kQaeIrlbA27sqrIeuKB0/TbPLHjCeykNgE4axG4g=;
        h=Date:From:To:Cc:Subject:From;
        b=cB336Ov3umQO9C6jXPwwl2LdUZxMFxeIqMY+NDzVOFy4na/NH2WiCEa46EPsdXxX7
         Zi4mTD/C27NG5vlLzMQbt6heblKcea91wEGRATpyo8JbIvo1SyxCUBLIWbU7ytJFwH
         b5kVyihf361GFKm1WgSZchzKEbg/mw6sTfds7OgZDpGKdVGsjhg8hRgjV8CdiaGtwY
         JWvt3aKrGsD1sxM1L0R1+c/at8GU1iB6eR39HcU6qNytlxP5f1Bgc2chlaciPq+SyY
         fDh+R5QYoQaeDtCBQh4O08uTnRAtvuSGaTYEvDyLjJKIJpaEX5d9gmppXFa3Sqxlxz
         +ui1VrK4nndNA==
Date:   Wed, 22 Dec 2021 21:15:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the folio-iomap tree with the nvdimm
 tree
Message-ID: <20211222211536.2fed6e78@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+RrWS3FmzSeD/MKL0sdk3AX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+RrWS3FmzSeD/MKL0sdk3AX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

FIXME: Add owner of second tree to To:
       Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the folio-iomap tree got a conflict in:

  fs/iomap/buffered-io.c

between commit:

  de291b590286 ("iomap: turn the byte variable in iomap_zero_iter into a ss=
ize_t")

from the nvdimm tree and commits:

  a25def1fe568 ("iomap: Convert __iomap_zero_iter to use a folio")
  4d7bd0eb72e5 ("iomap: Inline __iomap_zero_iter into its caller")

from the folio-iomap tree.

I fixed it up (following Matthew's suggestion, I ended up with the
below) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/iomap/buffered-io.c
index ff541190fc73,c6b3a148e898..c938bbad075e
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@@ -888,21 -908,34 +907,25 @@@ static loff_t iomap_zero_iter(struct io
  		return length;
 =20
  	do {
- 		unsigned offset =3D offset_in_page(pos);
- 		ssize_t bytes =3D min_t(u64, PAGE_SIZE - offset, length);
- 		struct page *page;
+ 		struct folio *folio;
  		int status;
+ 		size_t offset;
+ 		size_t bytes =3D min_t(u64, SIZE_MAX, length);
 =20
- 		status =3D iomap_write_begin(iter, pos, bytes, &page);
 -		if (IS_DAX(iter->inode)) {
 -			s64 tmp =3D dax_iomap_zero(pos, bytes, iomap);
 -			if (tmp < 0)
 -				return tmp;
 -			bytes =3D tmp;
 -			goto good;
 -		}
 -
+ 		status =3D iomap_write_begin(iter, pos, bytes, &folio);
  		if (status)
  			return status;
 =20
- 		zero_user(page, offset, bytes);
- 		mark_page_accessed(page);
+ 		offset =3D offset_in_folio(folio, pos);
+ 		if (bytes > folio_size(folio) - offset)
+ 			bytes =3D folio_size(folio) - offset;
 =20
- 		bytes =3D iomap_write_end(iter, pos, bytes, bytes, page);
- 		if (bytes < 0)
- 			return bytes;
+ 		folio_zero_range(folio, offset, bytes);
+ 		folio_mark_accessed(folio);
+=20
+ 		bytes =3D iomap_write_end(iter, pos, bytes, bytes, folio);
 -good:
+ 		if (WARN_ON_ONCE(bytes =3D=3D 0))
+ 			return -EIO;
 =20
  		pos +=3D bytes;
  		length -=3D bytes;

--Sig_/+RrWS3FmzSeD/MKL0sdk3AX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmHC+sgACgkQAVBC80lX
0Gxyhwf9H0N+T5qsFMqN2aPn0swYCtoxH8k32IQeuNWKE6xEiYf7AJsiPMVmebEG
DdDbm3Wu0W7bUmCgkFWnXfAyxc5f/hW6D8Qcd2u3Mkdj6IyklLiBPSe1bjGzRyeb
cBrAnSK4/DhMnraqGPdTzLBy7QHPD6CmAysIzqFosjoCVgtOqm2Lf8ObfWqrjWS3
t8yBKV5z1rFNHy6W0qHzM78pWLXgeSn+G3PAwNQ6ulOCcFfLDNUlUodhHDHCUGyD
XdUO1BHVQtqxuAd97AFQmp+N0TK5PS1QLrYB5ByZO66NETVor+LDQs0OglCo7+mP
A38eJusDbhVFSyJeR+GYUG7f4rdegA==
=gfX8
-----END PGP SIGNATURE-----

--Sig_/+RrWS3FmzSeD/MKL0sdk3AX--
