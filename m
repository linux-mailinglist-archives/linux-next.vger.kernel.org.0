Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9CDFA5545
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 13:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729986AbfIBLsf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 07:48:35 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57051 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729690AbfIBLsf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 07:48:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46MSyj35rkz9s7T;
        Mon,  2 Sep 2019 21:48:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567424913;
        bh=RfRlld/uLGo2JdTLLuUxgj3kFdxGvnj6knbdWYv1y7Y=;
        h=Date:From:To:Cc:Subject:From;
        b=OJsk6o+KJfxrS0sd3aTCp6PWxC9Abs7I766QR7kqhVQt3KP7l0DRDTWtZFdCcrwTs
         169BULZ6N1lQpI3LLZPzBfc1w+VjGvzcU9vofjFkZBWvu0zB4We0doYeotTfVso1nC
         676gHKyuZs0fRFhAH4js+VBugIgITRX3v+iKpp77m1Kl3Enb3fUfO81393pzUOpwtp
         R0fcSR2ai6UFZFvdgJTd9L4+YtYkRhfXrigjOV9a2b07dtGu0yvP6tv9mMQIPu2Dvk
         es05LCA0gxQPUz4dCSrLtq1PvyptuyUAxwLDwk4DztPDEjw23A6emkMhPPTzkz101e
         MpydAX3ncrSbg==
Date:   Mon, 2 Sep 2019 21:48:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Logan Gunthorpe <logang@deltatee.com>,
        Greentime Hu <greentime.hu@sifive.com>,
        Alexandre Ghiti <alex@ghiti.fr>
Subject: linux-next: manual merge of the akpm-current tree with the risc-v
 tree
Message-ID: <20190902214828.1c6f27ac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b_xC9QUrPrrV6q/nNK=XH2G";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/b_xC9QUrPrrV6q/nNK=XH2G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/riscv/Kconfig

between commit:

  d95f1a542c3d ("RISC-V: Implement sparsemem")

from the risc-v tree and commit:

  f6a9089b8915 ("riscv: make mmap allocation top-down by default")

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

diff --cc arch/riscv/Kconfig
index 572599cbf750,87dc5370becb..000000000000
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@@ -56,7 -54,18 +56,19 @@@ config RISC
  	select EDAC_SUPPORT
  	select ARCH_HAS_GIGANTIC_PAGE
  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 +	select SPARSEMEM_STATIC if 32BIT
+ 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
+ 	select HAVE_ARCH_MMAP_RND_BITS
+=20
+ config ARCH_MMAP_RND_BITS_MIN
+ 	default 18 if 64BIT
+ 	default 8
+=20
+ # max bits determined by the following formula:
+ #  VA_BITS - PAGE_SHIFT - 3
+ config ARCH_MMAP_RND_BITS_MAX
+ 	default 24 if 64BIT # SV39 based
+ 	default 17
 =20
  config MMU
  	def_bool y

--Sig_/b_xC9QUrPrrV6q/nNK=XH2G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1tAYwACgkQAVBC80lX
0Gx4qAf/QOrNMD3q4Szf59s/KK8KkfnIgf++Sg+bgEutj90F79SdgjFwfDm5SvE3
FSYmJsu7/Oot7wWKxPXZh5ThdbPfOtEhRhkj7Co/7tB3M+3oLsM31nVRjUvfzEqn
5ct6ZW/fkJwjc8nn0dcVORT9oEahRx3nz3oAsFblH1oTmNEZb3KfBhCk2quSPP2q
r/mQsUmXmznJaWmQqjKlAxMFshw61rCP9YVoXkV5eaHh+FDndlv2WglyKnw0fA6m
antt6j4cRFdzvO8hd4CkRoo1/PIe+m1kMZaWN6Nug/zJIiCTFXA9EpWaJFuYe+jA
yJvgOfg2hBnaoYAQoUmhLRe1pqLLQA==
=UEcZ
-----END PGP SIGNATURE-----

--Sig_/b_xC9QUrPrrV6q/nNK=XH2G--
