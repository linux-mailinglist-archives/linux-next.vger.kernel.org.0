Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27AFC123CA9
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2019 02:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbfLRBtz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Dec 2019 20:49:55 -0500
Received: from ozlabs.org ([203.11.71.1]:55783 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbfLRBtz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Dec 2019 20:49:55 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47cycb3Cf5z9sRl;
        Wed, 18 Dec 2019 12:49:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576633792;
        bh=ZcJpEE/LW6yidBtEURZ9Qct9Sjqoy5Q5D49PzzegYYw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hn3nzRYq8lj9JWQawr871mfiZKSImBrOH13z3vrRieuxFf7cW08h6LyHFwMSJni/+
         d1c7/oqQKJdr3KlhQZuBxI67G6yctEhto4jSxta6Zs2ty+GW9a0YSO/Pyye4uqjFcK
         t9D4m7bKSEmlv61Y8SdOKTYoobgJ/04mQ49kuEzUe8MYfRN7ZvjOMmx/ndMwE2o5se
         HOguamfTohhbvy/0ejT5O1KPybRY5eGn7wDc8l6Yrh+NxLxigKHg+nYxaPBVhozZq4
         o6ylEVS+21zff9u1D3SvvQafU9sfArrTcXd1kcvQnrUaSMPh88IsCWxn74dzY5JWm4
         TM+YlIYR64myg==
Date:   Wed, 18 Dec 2019 12:49:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>,
        Dan Williams <dan.j.williams@intel.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the generic-ioremap tree with the
 nvdimm-fixes tree
Message-ID: <20191218124950.191d9df4@canb.auug.org.au>
In-Reply-To: <20191218123205.3fb9c793@canb.auug.org.au>
References: <20191218123205.3fb9c793@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4pMxf38BhyndScEGHZObhr0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4pMxf38BhyndScEGHZObhr0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 18 Dec 2019 12:32:05 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the generic-ioremap tree got a conflict in:
>=20
>   tools/testing/nvdimm/Kbuild
>=20
> between commit:
>=20
>   c14685547762 ("tools/testing/nvdimm: Fix mock support for ioremap")
>=20
> from the nvdimm-fixes tree and commit:
>=20
>   1188dd7d3fbd ("remove ioremap_nocache and devm_ioremap_nocache")
>=20
> from the generic-ioremap tree.
>=20
> I fixed it up (the latter is a superset of the former) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.

The merge also needed this fixup (since both trees logically added the
same small function):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 18 Dec 2019 12:46:03 +1100
Subject: [PATCH] generic_ioremap: merge fix for "tools/testing/nvdimm: Fix
 mock support for ioremap"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 tools/testing/nvdimm/test/iomap.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tools/testing/nvdimm/test/iomap.c b/tools/testing/nvdimm/test/=
iomap.c
index 27a9c5f3fcd0..03e40b3b0106 100644
--- a/tools/testing/nvdimm/test/iomap.c
+++ b/tools/testing/nvdimm/test/iomap.c
@@ -193,12 +193,6 @@ void __iomem *__wrap_ioremap(resource_size_t offset, u=
nsigned long size)
 }
 EXPORT_SYMBOL(__wrap_ioremap);
=20
-void __iomem *__wrap_ioremap(resource_size_t offset, unsigned long size)
-{
-	return __nfit_test_ioremap(offset, size, ioremap);
-}
-EXPORT_SYMBOL(__wrap_ioremap);
-
 void __iomem *__wrap_ioremap_wc(resource_size_t offset, unsigned long size)
 {
 	return __nfit_test_ioremap(offset, size, ioremap_wc);
--=20
2.24.0

--=20
Cheers,
Stephen Rothwell

--Sig_/4pMxf38BhyndScEGHZObhr0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl35hb4ACgkQAVBC80lX
0GzoXAgAoXbi+dWnJ7w0/CnZZwYttJZoV859vZFTpUZr1iJCVLNdZPiO8CLWhXeb
xHjYDypvgh9szRghT5zIL5YylWKVH71ArYoNrE97dwkUzIHkIeXk/KkxB6V5aM7a
dN8qxaTVE5v2BGtVxJmAs6wwqvXTDKpVNdbjK29wg8BQeJpwr8YL970jmSypVseQ
yxK8gWkZ/SNhSjayM6R93IqsZeKvu0pdUKTVnimrPBdQYYvupWm90+ejPuOX9QGl
g+iZSONCUSucuGdsIuWi3D1lTxNYb7asXhu5+Cv5YQoBECAurSNM0o4rGBMUFaGx
q4NhaA6z4Gj8gVlRX5UIJRNQm9jkWg==
=IKTW
-----END PGP SIGNATURE-----

--Sig_/4pMxf38BhyndScEGHZObhr0--
