Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF01F3070CA
	for <lists+linux-next@lfdr.de>; Thu, 28 Jan 2021 09:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231704AbhA1IM7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Jan 2021 03:12:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbhA1IJc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Jan 2021 03:09:32 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8A1C061573;
        Thu, 28 Jan 2021 00:08:47 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DRClw12Rjz9sBy;
        Thu, 28 Jan 2021 19:08:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611821324;
        bh=fJPiRFgyiabLdeqqjnnR/3xPw7FBcnEqi5dlpoEIdbA=;
        h=Date:From:To:Cc:Subject:From;
        b=r5OZbvw7zJ62iDdGzBcyi4ZHsWnFN4gGUBaoxack1l26Fzv6u1Ea+eL8XTMzbuO0x
         6tvwXTp73ssJ8PONZHvLIgAQlfUBjB0eX9C4f2NVOucKSHK3PIkhv/0cdeL3oYsNVn
         w6B7GZP3FxRlXhnFLt8l7bg3YEdvX41Hq8FKCa0TedssZ+dvfXvwKvFAffbXaXMamb
         XyK+IIMOPqutVxlTPULWnPF4VnJQKo4JNakZQ0qoKgm/HRpNA/IJyxp5UmnIacoQQf
         I9gVQcziICQAfeuK8Zx5YCN4LsJL0FblcsHD7KMvPpbauhWqrPBDH6jn4g4sSA9y8h
         ljpSXrT5mGx4w==
Date:   Thu, 28 Jan 2021 19:08:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: manual merge of the akpm tree with the arm64 tree
Message-ID: <20210128190843.0d2bf730@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n61/3m4ITPZwTvL73rOd6un";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/n61/3m4ITPZwTvL73rOd6un
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  mm/filemap.c

between commit:

  f9ce0be71d1f ("mm: Cleanup faultaround and finish_fault() codepaths")

from the arm64 tree and patch:

  "secretmem: add memcg accounting"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/filemap.c
index 4d0b7a122850,4417fd15d633..000000000000
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@@ -42,7 -42,7 +42,8 @@@
  #include <linux/psi.h>
  #include <linux/ramfs.h>
  #include <linux/page_idle.h>
 +#include <asm/pgalloc.h>
+ #include <linux/secretmem.h>
  #include "internal.h"
 =20
  #define CREATE_TRACE_POINTS

--Sig_/n61/3m4ITPZwTvL73rOd6un
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAScQsACgkQAVBC80lX
0GyZcwf+MC6Ks3iQ6txweeYwUP47Mz3qaqiSJi8m7nMRfogMynSgkeSTn8Xmma07
y0eFTxBJsZgRZZdA6tmspSd9s3QVzYZyGaZV5hxRbo8N4WeUFnrMy226XVd5Ii0a
orJQzKKpZQRNOboSobm9AFwJGdx23m/pgNRi+e/wxme5x5Axd3uY32++NlOS7xK0
OpAe2nc/DZGUpZ6p86dPDCxZ1h9vL84zIVTqjB7hgdDeyRyr4NzsTHBRTjd/9vSY
aPIgjbOavvJMNeZq+lrq68Hv1kgXlVCFk1ZEjeMaIoYl6/e8mv2qDAdjsjFkQz7Y
JP4wP+xduQ0AYXi2Du3nW1Tb8MMYfA==
=FSXG
-----END PGP SIGNATURE-----

--Sig_/n61/3m4ITPZwTvL73rOd6un--
