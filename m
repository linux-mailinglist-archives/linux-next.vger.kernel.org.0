Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECC62C4F20
	for <lists+linux-next@lfdr.de>; Thu, 26 Nov 2020 08:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388270AbgKZHGG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Nov 2020 02:06:06 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:56805 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388266AbgKZHGG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Nov 2020 02:06:06 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ChTLg4sPPz9sRK;
        Thu, 26 Nov 2020 18:06:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606374364;
        bh=RSw8f9gnygzj81ImNkvKDJ+GoE5urlFQ5Kg7cRV/RCI=;
        h=Date:From:To:Cc:Subject:From;
        b=m6/1fwVn0zvZoq7YOd00OFSR9pgggYWBEvRWWLK4XfeuhYHX05kbvWkiB47DI5Ygj
         D0+UTCYsNL1DlcyHKfFl+vfU44gYCHJ9s0Pl0EkAl2OGGTpaI6/vkKvl3PkgHv/HUm
         2JYJRHym4iVNS1esb2D/2zp6u5hnkxsLaotWxjdjw+55IGAj7kOlDTWbu5DyDTiMvP
         l5WpceFqi9+nyLRezTILV3uPIk3Lw1QV8BV1OP85x4ezZD1txTOtgo9ciA2s2aM1iX
         nZCmp4QscJJe0+7fuzM3FNeoj1iH4+zReImhQj+2Qznr7Dh9rhpiY/Pyqngz4k1qZ9
         i6R9F7NnUwtbg==
Date:   Thu, 26 Nov 2020 18:06:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Peter Collingbourne <pcc@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: linux-next: manual merge of the akpm tree with the arm64 tree
Message-ID: <20201126180602.002588dd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/90nwctSvEorm8C=pwjepCv.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/90nwctSvEorm8C=pwjepCv.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/arm64/mm/proc.S

between commit:

  49b3cf035edc ("kasan: arm64: set TCR_EL1.TBID1 when enabled")

from the arm64 tree and commit:

  68cd215d6529 ("arm64: kasan: allow enabling in-kernel MTE")

from the akpm tree.

I fixed it up (I think, see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/mm/proc.S
index a0831bf8a018,0d85e6df42bc..000000000000
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@@ -40,9 -40,15 +40,15 @@@
  #define TCR_CACHE_FLAGS	TCR_IRGN_WBWA | TCR_ORGN_WBWA
 =20
  #ifdef CONFIG_KASAN_SW_TAGS
- #define TCR_KASAN_FLAGS TCR_TBI1 | TCR_TBID1
 -#define TCR_KASAN_SW_FLAGS TCR_TBI1
++#define TCR_KASAN_SW_FLAGS TCR_TBI1 | TCR_TBID1
  #else
- #define TCR_KASAN_FLAGS 0
+ #define TCR_KASAN_SW_FLAGS 0
+ #endif
+=20
+ #ifdef CONFIG_KASAN_HW_TAGS
 -#define TCR_KASAN_HW_FLAGS SYS_TCR_EL1_TCMA1 | TCR_TBI1
++#define TCR_KASAN_HW_FLAGS SYS_TCR_EL1_TCMA1 | TCR_TBI1 | TCR_TBID1
+ #else
+ #define TCR_KASAN_HW_FLAGS 0
  #endif
 =20
  /*

--Sig_/90nwctSvEorm8C=pwjepCv.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+/U9sACgkQAVBC80lX
0Gx1MQgAgOqIBQ9YXWNRs54LfH56EHpGUS4SoL2ALUXmrgtqdzgZAvGQuX4DQy1/
8UMnraNVKQgLR1c5wcxS2sgP9YT8X4dSkI5C2DmQlDsMt2WLlU+Oi/WcdICQZW2P
GxMBypxoKRMfQAD96P2gJKkp2zi0s2+Rnb0s041d3Z+ei/EsiPqxVMK0ZRs0hzyD
eyQt2+Kal1SakUI9/fF7SIWpRFf9LsIV3cmU1cgaho4OVW0OBkYISAWijgyPgaT/
MY5zn7EHQh87wQbtOam5C19fPENDsRrBUKjc3p5lJkiUst2QAeGOLBz2kx0ig0ED
tMil9WVCPTjVKBIwUnZJo8gLzifVuA==
=DgvC
-----END PGP SIGNATURE-----

--Sig_/90nwctSvEorm8C=pwjepCv.--
