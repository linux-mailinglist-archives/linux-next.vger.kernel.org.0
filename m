Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0288E396D59
	for <lists+linux-next@lfdr.de>; Tue,  1 Jun 2021 08:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbhFAG3p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Jun 2021 02:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbhFAG3o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Jun 2021 02:29:44 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E792C061574;
        Mon, 31 May 2021 23:28:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FvMfN1l0Yz9sX2;
        Tue,  1 Jun 2021 16:27:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622528880;
        bh=ymDImV4zv2Er8XJEcPufPATDBMYqC4ae7DxwdFrIOmM=;
        h=Date:From:To:Cc:Subject:From;
        b=eco7BSj1t8RkqAxSrVX5b61O1QgXZkIi+OLS3WpKwDX1LFnKtiGyAUmiiSkb0oSYN
         jRAEvi9KQksWwytchvDSBOGUuOHX8Mvzg4i01xYB8tbs0Zuluo5Ez8EXRwkB1D6MPi
         1YIIIIzfBsHiMCZwN3k9SfyMgJbWGjeSO1FX8Dn9NC/1e9oMjWv55tD/PLTlOmA7kY
         vTLhhzvJsiFdNwieO4Z1P6/3yBviA1vy7KGDyTgegD5Ts6WCgqmwc7+byhuZLneefz
         eMzlt8YCnIBFgZFcgmIwAORp45w9bbbEI8xZnvnOaPF0hBUN4yzNJtZvm4z9sB5s7r
         LYbg91fNF/3pg==
Date:   Tue, 1 Jun 2021 16:27:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>
Cc:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: linux-next: manual merge of the akpm-current tree with the risc-v
 tree
Message-ID: <20210601162752.642129c2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QS=aojrS+w2H9tjeWzE7ztJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QS=aojrS+w2H9tjeWzE7ztJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/riscv/Kconfig

between commit:

  7fa865f5640a ("riscv: TRANSPARENT_HUGEPAGE: depends on MMU")

from the risc-v tree and commit:

  f36992ff3525 ("mm: generalize ZONE_[DMA|DMA32]")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I did the minimal fixup, but really, these selects should remain sorted.
--=20
Cheers,
Stephen Rothwell

diff --cc arch/riscv/Kconfig
index 2eedaf621bc7,6ee11ca998b2..000000000000
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@@ -106,7 -104,7 +106,8 @@@ config RISC
  	select SYSCTL_EXCEPTION_TRACE
  	select THREAD_INFO_IN_TASK
  	select UACCESS_MEMCPY if !MMU
 +	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
+ 	select ZONE_DMA32 if 64BIT
 =20
  config ARCH_MMAP_RND_BITS_MIN
  	default 18 if 64BIT

--Sig_/QS=aojrS+w2H9tjeWzE7ztJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC102gACgkQAVBC80lX
0GwgvggAgJsNIIghxw7Lm5+no+1RZCrE/vnBhMATuSSYCvf8/nA8YP8rFin22B1i
YEQnosoM0FEi3WY5mwCUB9PGcHH4hC7R99gQ6OAlYywaNWZKOeV1jXosqohgxb5r
IjveRwj4B/UJj4iaZDHFLKpQtP50d9EWugM9MyZ1pxjd72AJZUW7E1fIFUTO3ZTC
jSWdOEZPd6wEnSaW/rMr7qUWl3MI8I6Ku8lgVwwJJCKFp6LXMjFeLMvp4F5ImLU8
FDtdTNWq4no1kvVfFeR05GvtNAbBZYxifxEPK+JmfPLVvd4VaxokBVw5Xgn4rLat
R5LS/wWOl2jHeXvkSGHodI8LXSqYQg==
=/R85
-----END PGP SIGNATURE-----

--Sig_/QS=aojrS+w2H9tjeWzE7ztJ--
