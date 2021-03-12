Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD57338606
	for <lists+linux-next@lfdr.de>; Fri, 12 Mar 2021 07:38:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbhCLGhe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Mar 2021 01:37:34 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55127 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231214AbhCLGhJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 12 Mar 2021 01:37:09 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DxbhJ1lYJz9sVw;
        Fri, 12 Mar 2021 17:37:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615531025;
        bh=0LpKbVOy7mvuO4yAPGPBavg4LUjXDyjfuEDP6eZxyB4=;
        h=Date:From:To:Cc:Subject:From;
        b=QUiaiXqGIRKZQZW0XwAgMntF4ILGU8sVOLyeijrHlKvLEWXiLwcciODG0XaDp4+W+
         SB52dFfieqcbgCLkaiFJhXTNOybrMBxQeHIZvopvA7mDvvaFj/THHu/FmVLfFPVVFf
         O4nwUqXscZoMEi9DYOfkU//iPEyp14aWM/3Gc9UFpwnszpDTJXwZKEClfH53Rr6L4J
         qxMk6c/r1Q3XzFPvJ5JAmovwW9kk7x1QKn/3yY73/qwhxSeE95XWJSmbfBgqooZUj/
         C8xZNGwcUP64e81L0k74GiXlJ0yzmETFkgpkD3oNBTAsS0NHk62nUy3d2YKxJs/6Lt
         FoV1fOmBl3FrA==
Date:   Fri, 12 Mar 2021 17:37:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>
Cc:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Oscar Salvador <osalvador@suse.de>
Subject: linux-next: manual merge of the akpm-current tree with the risc-v
 tree
Message-ID: <20210312173702.18c4512a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A5EzAg3_rT.1_6pIHy=hRwN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/A5EzAg3_rT.1_6pIHy=hRwN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Tomorrow's linux-next merge of the akpm-current tree will get a
conflict in:

  Documentation/admin-guide/kernel-parameters.txt

between commit:

  f6e5aedf470b ("riscv: Add support for memtest")

from the risc-v tree and commit:

  6b8f5ba8661b ("mm,memory_hotplug: add kernel boot option to enable memmap=
_on_memory")

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

diff --cc Documentation/admin-guide/kernel-parameters.txt
index b816481dfaef,04b4e76be65b..000000000000
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@@ -2800,23 -2802,7 +2808,23 @@@
  			seconds.  Use this parameter to check at some
  			other rate.  0 disables periodic checking.
 =20
 +	memory_hotplug.memmap_on_memory
 +			[KNL,X86,ARM] Boolean flag to enable this feature.
 +			Format: {on | off (default)}
 +			When enabled, memory to build the pages tables for the
 +			memmap array describing the hot-added range will be taken
 +			from the range itself, so the memmap page tables will be
 +			self-hosted.
 +			Since only single memory device ranges are supported at
 +			the moment, this option is disabled by default because
 +			it might have an impact on workloads that needs large
 +			contiguous memory chunks.
 +			The state of the flag can be read in
 +			/sys/module/memory_hotplug/parameters/memmap_on_memory.
 +			Note that even when enabled, there are a few cases where
 +			the feature is not effective.
 +
- 	memtest=3D	[KNL,X86,ARM,PPC] Enable memtest
+ 	memtest=3D	[KNL,X86,ARM,PPC,RISCV] Enable memtest
  			Format: <integer>
  			default : 0 <disable>
  			Specifies the number of memtest passes to be

--Sig_/A5EzAg3_rT.1_6pIHy=hRwN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBLDA4ACgkQAVBC80lX
0GwzwAf/WpDphZDhJw/S07ZrBWsHHtiY3eVPVecjA9P/8NvTtmL1ciRa1sBe4w38
Gj8CEPIaqjIx7VQKdWzdZ7Hh48BQ1ur+2FcN0+09jJ7zCCj+e+NuchuqtmjxqvYr
dVCNJ0Ds+b2jL1PSibN3HdB/MAWgitbrZpAc7YfF8WlymnOV6Am514FiIWviAxYo
mTrDxQeySI494eudktr12GDWzcOjlExbvvt0dkH58bkzfqy3dOkaF6vutwuq5cFN
063Mo8Z9RPqj/tgF4Lgq+TsZXimHZjWzCYVoOtERVR0HGmzaKPG2IHzQX4AjyzMq
0HkKf+k6no82bWkS0IJPSbXC319I0Q==
=tv7Z
-----END PGP SIGNATURE-----

--Sig_/A5EzAg3_rT.1_6pIHy=hRwN--
