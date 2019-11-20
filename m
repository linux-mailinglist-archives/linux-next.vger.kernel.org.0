Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A41531045B1
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2019 22:25:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbfKTVYx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Nov 2019 16:24:53 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55817 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727020AbfKTVYw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Nov 2019 16:24:52 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47JG1F3ZHSz9sPW;
        Thu, 21 Nov 2019 08:24:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574285090;
        bh=+x8bE3nVPcA/DrMj8QpmY45qJdIWBbexGZXsbk2N8bY=;
        h=Date:From:To:Cc:Subject:From;
        b=LaeFGW5GVInGyFjRdtIwLa1YPHHBPUTZdy8HYpRkCnKSbeH6z4Rb+/pE3nYvfDy62
         1kPs90TwLzeta1SxganA/CDaX3zAkXFAw4ZNtvBrKmWEFuiRjX/qd831zU+uICjeR/
         zQZVkKy7VJYKIjKEfXAXmlmqkGe+HHioThuSsG5ovNNwKDqgW4LNIbtju6o/xAj5Gu
         aoFqtj3uwM3kT1Edgy0kVdv53Na0xHkvVVaZBtPukviBUrPU68EzfDIt4sxHfioM6y
         RPfmK7w6sERwfbIDesbt7lu/u87irw4mzUoarlhbyVh6VVIueFOebQnXztSQvfuSLd
         KN+N4bUtPPFOQ==
Date:   Thu, 21 Nov 2019 08:24:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Mark Rutland <mark.rutland@arm.com>,
        James Morse <james.morse@arm.com>
Subject: linux-next: manual merge of the arm64 tree with the amr64-fixes
 tree
Message-ID: <20191121082446.28964cd4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jjkmO6.wECzU7TOS8BzDom5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jjkmO6.wECzU7TOS8BzDom5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/include/asm/asm-uaccess.h

between commit:

  e50be648aaa3 ("arm64: uaccess: Remove uaccess_*_not_uao asm macros")

from the amr64-fixes tree and commit:

  582f95835a8f ("arm64: entry: convert el0_sync to C")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/asm-uaccess.h
index c764cc8fb3b6,a70575edae8e..000000000000
--- a/arch/arm64/include/asm/asm-uaccess.h
+++ b/arch/arm64/include/asm/asm-uaccess.h
@@@ -57,13 -57,21 +57,4 @@@ alternative_else_nop_endi
  	.macro	uaccess_ttbr0_enable, tmp1, tmp2, tmp3
  	.endm
  #endif
--
--/*
-  * Remove the address tag from a virtual address, if present.
 - * These macros are no-ops when UAO is present.
-- */
- 	.macro	untagged_addr, dst, addr
- 	sbfx	\dst, \addr, #0, #56
- 	and	\dst, \dst, \addr
 -	.macro	uaccess_disable_not_uao, tmp1, tmp2
 -	uaccess_ttbr0_disable \tmp1, \tmp2
 -alternative_if ARM64_ALT_PAN_NOT_UAO
 -	SET_PSTATE_PAN(1)
 -alternative_else_nop_endif
--	.endm
--
 -	.macro	uaccess_enable_not_uao, tmp1, tmp2, tmp3
 -	uaccess_ttbr0_enable \tmp1, \tmp2, \tmp3
 -alternative_if ARM64_ALT_PAN_NOT_UAO
 -	SET_PSTATE_PAN(0)
 -alternative_else_nop_endif
 -	.endm
  #endif

--Sig_/jjkmO6.wECzU7TOS8BzDom5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3Vrx4ACgkQAVBC80lX
0GyKtgf/WjGD2tfOz6Tts4947NnnKvhiogjHFe5U5NWcKWt/V5Z2A72Br1xSynXe
GowI2fzZemKSOdt4Xf0XXAlwqVUOxB5bjbW8eaX42eQPtGl6v0MbboxpwzaTQPtN
wQ1B5kdbmvseg+jEcnMWycagk7JnJ0DqE/JBxS7Pm0HlxBfoOKKkwgBDAnumPE8y
yEs8O6N9A3pGNC00rDEkh75HOUNZmPHdoSVl9y6jJ0Cds31K0ga3Z3+PwJ5BHT8B
9ojU5srrzKTr0PQ9srlHIu1U1hfQ+5fVkEzCin4pXM6eSfykWkg2mtHoUb9qhzUL
H51TsCxAVTu03t74OMEa0OkPMYvglw==
=KtqW
-----END PGP SIGNATURE-----

--Sig_/jjkmO6.wECzU7TOS8BzDom5--
