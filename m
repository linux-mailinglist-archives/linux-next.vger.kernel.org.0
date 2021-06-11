Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E7B3A3BF7
	for <lists+linux-next@lfdr.de>; Fri, 11 Jun 2021 08:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbhFKGTt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Jun 2021 02:19:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbhFKGTt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Jun 2021 02:19:49 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B00AC061574;
        Thu, 10 Jun 2021 23:17:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G1Vy34ScNz9sW4;
        Fri, 11 Jun 2021 16:17:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623392268;
        bh=Yo5Vkbo33rtG6roA++0tsbsOo20NRqEYs5gRrbRJpvc=;
        h=Date:From:To:Cc:Subject:From;
        b=TUzLsmQgAeqtfrF1WCJtisr83IagMvV+6wTPp0ooVpkO4qXgrGrU8Naq7RLkyTzF6
         OZWbpe9KtnsglwfGiBj2NRvbQnstNV2eXmedsjczv2c6Z1GfoJhTcF47KYyIzNuKO7
         fJwmjz6DILK95ju6GyqSDx/nmqtrvyn16Gv876qIQHGbrhTrp2CHXU8f/PSclqQC0/
         zLVVzcYjRGpwy8Ic0sgD7t2gnGQVR4cZvhDn+142c9NE0g5G2Ag3ftBo4GhS2i8Vmc
         DE0aAhGMSj+TGicId1IpDGeTVZWDJqswwywLw3ho60qEJ3v+MM/VaqTqAgbDL4//cf
         KqsS/P3tRSkIQ==
Date:   Fri, 11 Jun 2021 16:17:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>
Cc:     Ingo Molnar <mingo@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Tor Vic <torvic9@mailbox.org>
Subject: linux-next: manual merge of the kspp tree with Linus' tree
Message-ID: <20210611161746.7d326188@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IBjZ889dAVPehqRLWk77N3h";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IBjZ889dAVPehqRLWk77N3h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  arch/x86/Makefile

between commit:

  0024430e920f ("x86/build: Fix location of '-plugin-opt=3D' flags")

from Linus' tree and commit:

  095f63b94205 ("x86, lto: Pass -stack-alignment only on LLD < 13.0.0")

from the kspp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/Makefile
index 2cea1ef283e3,84743ec97c05..000000000000
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@@ -197,12 -203,7 +197,13 @@@ ifdef CONFIG_RETPOLIN
    endif
  endif
 =20
 -KBUILD_LDFLAGS :=3D -m elf_$(UTS_MACHINE)
 +KBUILD_LDFLAGS +=3D -m elf_$(UTS_MACHINE)
 +
 +ifdef CONFIG_LTO_CLANG
- KBUILD_LDFLAGS	+=3D -plugin-opt=3D-code-model=3Dkernel \
- 		   -plugin-opt=3D-stack-alignment=3D$(if $(CONFIG_X86_32),4,8)
++ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 130000; echo $$?),0)
++KBUILD_LDFLAGS	+=3D -plugin-opt=3D-stack-alignment=3D$(if $(CONFIG_X86_32=
),4,8)
++endif
 +endif
 =20
  ifdef CONFIG_X86_NEED_RELOCS
  LDFLAGS_vmlinux :=3D --emit-relocs --discard-none

--Sig_/IBjZ889dAVPehqRLWk77N3h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDDAAoACgkQAVBC80lX
0GzSCwf+Ky06FBVNBr+7PPgFapsHqFfaG8h0Xtot4XR4/uufdD3RafBov8m5Pfop
XhmMNLlhkxlOd4PXF4QZx+sPsYprkkP6Thp0Sui9ECSHGJpnwRqnvAWeANoSwxj8
G7aKlmdWfo2wywKTUERg6GhMVkR5FxhRbYxhzedRHP1PpI0IP4k9xkrmUCP5EVvV
Y3CaVslSHatcQLLAHWTjCRJy3PHXiQwoTBk8u/isbGjNM0w9KW+jzTgnvvUgRjlw
0iO4Z1tnKrfXrYQlFPgYLjdlkOI1CfMJJbcfBjZa9lbm8xuwSL+dBG3Yn+HbuiGU
2RbS7hG/no6CoFBGRIbpYxSECvoDmw==
=m7dK
-----END PGP SIGNATURE-----

--Sig_/IBjZ889dAVPehqRLWk77N3h--
