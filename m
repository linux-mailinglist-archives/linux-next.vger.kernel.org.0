Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 058101893C4
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 02:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgCRBkv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 21:40:51 -0400
Received: from ozlabs.org ([203.11.71.1]:40361 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726680AbgCRBku (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Mar 2020 21:40:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48ht666PH8z9sNg;
        Wed, 18 Mar 2020 12:40:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584495647;
        bh=anDP3nx12ruwkIJDh64jQV8DzkTYUP30jaeOxQMxsgY=;
        h=Date:From:To:Cc:Subject:From;
        b=mLJNxZyco2WMBPmJPM8uj5tOvbVITfxvKZHeIeby3yWz6h0nWWK+b5QGiSky8Drgt
         83qzpPqXpf8DLw0potVWfWHyeldo07AS3VykWPjVuY2lHjmkrQetzZsgfm+PWz5Znu
         iAFJKC2pFoc1n7XpL4VQiWWeLY/s4Llv8Zs5JrBLbAvlOmn2nM0x6I8y0FnvAKP3pg
         5jntUAoNItIR7mxv2DRu16cdGvKN5NcSNepW+0J6NBGUzQr4E5g7e53yd7HA0mxIyj
         /BkJ1GD/LXde7IE8HTCZyvd2Lg1PrDOSpg7Oz/f5YS+hk/kfTvHAxB9f5K+w6Pszsc
         jpz2vhFXS3y/w==
Date:   Wed, 18 Mar 2020 12:40:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Kiss <daniel.kiss@arm.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: linux-next: manual merge of the jc_docs tree with the arm64 tree
Message-ID: <20200318124033.6c523374@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uK=nKxU3a1Nu0GPtSHTU0E_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uK=nKxU3a1Nu0GPtSHTU0E_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/filesystems/proc.rst

between commit:

  424037b77519 ("mm: smaps: Report arm64 guarded pages in smaps")

from the arm64 tree and commit:

  c33e97efa9d9 ("docs: filesystems: convert proc.txt to ReST")

from the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/filesystems/proc.rst
index ed5465d0f435,38b606991065..000000000000
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@@ -489,37 -511,39 +511,40 @@@ does not take into account swapped out=20
  "THPeligible" indicates whether the mapping is eligible for allocating THP
  pages - 1 if true, 0 otherwise. It just shows the current status.
 =20
- "VmFlags" field deserves a separate description. This member represents t=
he kernel
- flags associated with the particular virtual memory area in two letter en=
coded
- manner. The codes are the following:
-     rd  - readable
-     wr  - writeable
-     ex  - executable
-     sh  - shared
-     mr  - may read
-     mw  - may write
-     me  - may execute
-     ms  - may share
-     gd  - stack segment growns down
-     pf  - pure PFN range
-     dw  - disabled write to the mapped file
-     lo  - pages are locked in memory
-     io  - memory mapped I/O area
-     sr  - sequential read advise provided
-     rr  - random read advise provided
-     dc  - do not copy area on fork
-     de  - do not expand area on remapping
-     ac  - area is accountable
-     nr  - swap space is not reserved for the area
-     ht  - area uses huge tlb pages
-     ar  - architecture specific flag
-     dd  - do not include area into core dump
-     sd  - soft-dirty flag
-     mm  - mixed map area
-     hg  - huge page advise flag
-     nh  - no-huge page advise flag
-     mg  - mergable advise flag
+ "VmFlags" field deserves a separate description. This member represents t=
he
+ kernel flags associated with the particular virtual memory area in two le=
tter
+ encoded manner. The codes are the following:
+=20
+     =3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+     rd    readable
+     wr    writeable
+     ex    executable
+     sh    shared
+     mr    may read
+     mw    may write
+     me    may execute
+     ms    may share
+     gd    stack segment growns down
+     pf    pure PFN range
+     dw    disabled write to the mapped file
+     lo    pages are locked in memory
+     io    memory mapped I/O area
+     sr    sequential read advise provided
+     rr    random read advise provided
+     dc    do not copy area on fork
+     de    do not expand area on remapping
+     ac    area is accountable
+     nr    swap space is not reserved for the area
+     ht    area uses huge tlb pages
+     ar    architecture specific flag
+     dd    do not include area into core dump
+     sd    soft dirty flag
+     mm    mixed map area
+     hg    huge page advise flag
+     nh    no huge page advise flag
+     mg    mergable advise flag
++    bt    arm64 BTI guarded page
+     =3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 =20
  Note that there is no guarantee that every flag and associated mnemonic w=
ill
  be present in all further kernel releases. Things get changed, the flags =
may

--Sig_/uK=nKxU3a1Nu0GPtSHTU0E_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5xfBIACgkQAVBC80lX
0GyOQgf/TwsXkd50WM3hZbWNlmomsyCOrJEg8CqVbiEyrF24ncfkxJ9OoBzBg+SM
rlJE73yy/Pcf6Qidaa2FOMl86UjNirH55xBZ1c4kY+yXMNpXIK+5DcsYmhoZghaj
nCZnTS/u5brQXyS6hTQbofMkLU3Qcw084LKa42cnKYTO+Y2NpPeB6k411kUJybuK
60/Is1QPKzYNxMHd3K6NtL6x3wk9ZTtqtH8moi/pyM/K9Eima1aE2q+8Ehp4bfFB
vQlE2LgazsCo90DB7a8MIZ717OG0nJhMntT8ISHYJKVIEMCJy7HhybkQdFoRvb9A
samJZL/kYIF0/JC0EJI0qEjc0VsflA==
=SM/t
-----END PGP SIGNATURE-----

--Sig_/uK=nKxU3a1Nu0GPtSHTU0E_--
