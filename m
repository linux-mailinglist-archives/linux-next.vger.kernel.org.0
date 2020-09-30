Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0474427E103
	for <lists+linux-next@lfdr.de>; Wed, 30 Sep 2020 08:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725798AbgI3G0T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 02:26:19 -0400
Received: from ozlabs.org ([203.11.71.1]:40469 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725320AbgI3G0S (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Sep 2020 02:26:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C1R941KJQz9sPB;
        Wed, 30 Sep 2020 16:26:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601447176;
        bh=LftkZ/m8oZW3Npf0tEoMzEu//RKVOrunMVWCyKL6JgA=;
        h=Date:From:To:Cc:Subject:From;
        b=kh05fbeGlAFGJ+GDVKioNo+KLvQU7aOeLj31HErdNgahbPwy74IQRkw7hNmOjsjp2
         VdQgqcHlgzkLYMZqXdhKNAYnWZk3LukLvLNfYbI8+SAslpjGDMC+UmJ/zSaC5B8JaV
         H96Cve9QRTqn50L4UxsCsyger0m2ZoqhKOo45G9MXHTDQ2kwf9nD3Kash3LkA9nFf5
         AdGvR5itJudAWkdxcc9qtfu+aKUIv3pZkwgFUoJm+0VUYE7ELHVs/AbvLQb8YMgU9P
         jDGLx3GULg7qCK948vwm4ucIoCRALhF2IvmFjEzjlolf0zC9VkvUcClh5JzjzpMBKL
         VHT5D0365j7Rw==
Date:   Wed, 30 Sep 2020 16:26:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoffer Dall <cdall@cs.columbia.edu>,
        Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <20200930162613.28d0b620@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DpZ/QBqO7QnhHll2hS5Zh_+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DpZ/QBqO7QnhHll2hS5Zh_+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/kvm/hyp/Makefile

between commit:

  5359a87d5bda ("KVM: arm64: Replace CONFIG_KVM_INDIRECT_VECTORS with CONFI=
G_RANDOMIZE_BASE")
  9ef2b48be9bb ("KVM: arm64: Allow patching EL2 vectors even with KASLR is =
not enabled")

from the arm64 tree and commit:

  b1e57de62cfb ("KVM: arm64: Add stand-alone page-table walker infrastructu=
re")

from the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/kvm/hyp/Makefile
index d898f0da5802,607b8a898826..000000000000
--- a/arch/arm64/kvm/hyp/Makefile
+++ b/arch/arm64/kvm/hyp/Makefile
@@@ -10,4 -10,5 +10,4 @@@ subdir-ccflags-y :=3D -I$(incdir)			=09
  		    -DDISABLE_BRANCH_PROFILING		\
  		    $(DISABLE_STACKLEAK_PLUGIN)
 =20
- obj-$(CONFIG_KVM) +=3D vhe/ nvhe/ smccc_wa.o
 -obj-$(CONFIG_KVM) +=3D vhe/ nvhe/ pgtable.o
 -obj-$(CONFIG_KVM_INDIRECT_VECTORS) +=3D smccc_wa.o
++obj-$(CONFIG_KVM) +=3D vhe/ nvhe/ smccc_wa.o pgtable.o

--Sig_/DpZ/QBqO7QnhHll2hS5Zh_+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl90JQUACgkQAVBC80lX
0GzxAgf9Hoxb5CRB4ss0W2b1WmZb59p1g4xMaLzx9f3Cx4HN8VJhIOe+DAkxiP5+
tlTySmvuvrPMwLZ42sNJQlwXqstk2I7QpHz5Jr2FZJSQ23u8Kp9+7xcD3eBDWF4E
kgznTOp3je3KMRZnOpjXtc007TV145OqSm43VFf5I5Hrwino6NnoxOrQy6LxZ1v2
1vOqPusdB+kZC81Rf6J4GkClt93j4XIUAW9j/7KTnhPygVb4huTks4mcDwvHBGYy
GBV5y6CVaAcgXH3N2qXgeNFDDH07At+2PSJlH5cjNnVsf5HU6XYaTPMZX7EewNZA
R8dZfy4NTrwqkWZiVQtl5e410S5Mcg==
=PRR0
-----END PGP SIGNATURE-----

--Sig_/DpZ/QBqO7QnhHll2hS5Zh_+--
