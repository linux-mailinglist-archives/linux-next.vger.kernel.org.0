Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3302643C067
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 04:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238620AbhJ0C6U (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 22:58:20 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:47377 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237738AbhJ0C6U (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 22:58:20 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfCxN508Bz4xbC;
        Wed, 27 Oct 2021 13:55:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635303354;
        bh=g5W+CO+WeiPTKymEKVkn4vlIKBKW1FoFJGu64rlrbaw=;
        h=Date:From:To:Cc:Subject:From;
        b=Rp44t2AbWF2WzbGgmsB0rt0hpQhpjBe79fYPi+EF3lTpiBr7Eew6RbDliTMwWsXk4
         2kO+lfVvBCc+BOnsc7GZQ7LigWWydVIx9g0U9DbjqgpKgtIppN8/f6LP9+Vjh1FBCV
         uY+cnuZ8Pp4cVxzge7eyyTCUxop7m0LNSkNozOArGsXYIXmqZ0Hv/1dQwbEhr84SDV
         y8ysGKAjA0cqTL/pAAf0uRx0liXlX0J/wy89JnGbBowjUcfiuO240Xu6b9JkXi59YE
         tRuznvCt4qgSstiSqCXY8P7aR3VfOMtf3oaQBmk1rnxZCsZJaIY/PU77V0MRu6UUvH
         bZAQEzzEHEh0Q==
Date:   Wed, 27 Oct 2021 13:55:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Tong Tiangen <tongtiangen@huawei.com>
Subject: linux-next: manual merge of the irqchip tree with the risc-v tree
Message-ID: <20211027135550.399f81b7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U_bNodLW6z.M_UjdKnrtZ7r";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/U_bNodLW6z.M_UjdKnrtZ7r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the irqchip tree got a conflict in:

  arch/riscv/Kconfig

between commit:

  dffe11e280a4 ("riscv/vdso: Add support for time namespaces")

from the risc-v tree and commit:

  0953fb263714 ("irq: remove handle_domain_{irq,nmi}()")

from the irqchip tree.

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
index 0050a2adf67b,353e28f5f849..000000000000
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@@ -62,8 -62,6 +62,7 @@@ config RISC
  	select GENERIC_SCHED_CLOCK
  	select GENERIC_SMP_IDLE_THREAD
  	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
 +	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
- 	select HANDLE_DOMAIN_IRQ
  	select HAVE_ARCH_AUDITSYSCALL
  	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
  	select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL

--Sig_/U_bNodLW6z.M_UjdKnrtZ7r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF4v7YACgkQAVBC80lX
0GwJ0Qf+J+jV+XDjvSicW5OM5NR5yyeOpRRaMb6Qf3arlJ9omvwv+cczlMDBIUe7
DFb9lmkrbUNN2PF/0x7HWyGhP1ge17ZKWjliUWv1Pydhrtf+iBFPSMuh5FYcHT41
WRZvXk0TbXa5L7J38N1bZzhSkk0LDyF1xudREvU9clkL1+LY5/bFsw0nboTR7Cwo
O1hDMtQDdKMwAh/Fq1CmHpg6nIhqIf3RRbXVJ3QYJnr8gCEYhB9dELlspvTdQOXd
w57DyXGPjLSbedkdI/NBjScxmaVXlrJr9OlJyxwLhoMpEpCEGPSeR2FeUAmwpyrU
QGWBiDvtKMuobpR0dB1A92/GvpA9BQ==
=samh
-----END PGP SIGNATURE-----

--Sig_/U_bNodLW6z.M_UjdKnrtZ7r--
