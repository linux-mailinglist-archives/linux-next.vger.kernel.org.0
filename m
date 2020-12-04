Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 933D92CE752
	for <lists+linux-next@lfdr.de>; Fri,  4 Dec 2020 06:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgLDFSP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Dec 2020 00:18:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgLDFSP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Dec 2020 00:18:15 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E707EC061A4F;
        Thu,  3 Dec 2020 21:17:34 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CnLYl4Cfyz9sPB;
        Fri,  4 Dec 2020 16:17:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607059052;
        bh=8cfPdF9psi32VwV6lAAR4FUe7G1K/Kdbte1Thz/xWCI=;
        h=Date:From:To:Cc:Subject:From;
        b=Wpwjy0+LtkrUMzyXDO9tk/XW+ntIMOhSUFLOrArHfnavTkVkHph4h14bixz+OJaNo
         HL79E/qAbrNlfIBiKlD3DTo+VTS5z9kmZzo4vreGunxos3o+fiiYSJepOVdUqFbnAN
         nrQzJRrmEe3oECTIAXUNIJQeMiKEjW7zof27KzqyX6VYDQSjsHhzCXWdoygbVKLId4
         E6aXJv4Lwxx2DVzsQhniOWYDUGggdbz7lod0ZYlVORnfQgZogtCq77crGcapg+cZvR
         pVRyR6IWM1A7stbMu6AwICosKLTzLuYFuAWUi2KJEsQG56rWbVrltxEa+eiWoqAPyn
         MkxRLo8eNyRcg==
Date:   Fri, 4 Dec 2020 16:17:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoffer Dall <cdall@cs.columbia.edu>,
        Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     David Brazdil <dbrazdil@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <20201204161730.5c0661b6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O/5a2+pxpSXKX_Ux3i_lKie";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/O/5a2+pxpSXKX_Ux3i_lKie
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/include/asm/cpucaps.h

between commit:

  364a5a8ae8dc ("arm64: cpufeatures: Add capability for LDAPR instruction")

from the arm64 tree and commit:

  44e88d43c442 ("KVM: arm64: Add ARM64_KVM_PROTECTED_MODE CPU capability")

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

diff --cc arch/arm64/include/asm/cpucaps.h
index a7242ef2a2cd,42f850718d4b..000000000000
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@@ -64,8 -66,8 +64,9 @@@
  #define ARM64_HAS_TLB_RANGE			56
  #define ARM64_MTE				57
  #define ARM64_WORKAROUND_1508412		58
 -#define ARM64_KVM_PROTECTED_MODE		59
 +#define ARM64_HAS_LDAPR				59
++#define ARM64_KVM_PROTECTED_MODE		60
 =20
--#define ARM64_NCAPS				60
++#define ARM64_NCAPS				61
 =20
  #endif /* __ASM_CPUCAPS_H */

--Sig_/O/5a2+pxpSXKX_Ux3i_lKie
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/JxmoACgkQAVBC80lX
0GzAGwgAnLHxi6ck+y/cYX+rcjnwGuQtOpmVK+lLmANmxW3b8CaiPeX5Zx8xEMdV
SkH/Y1vBnjrqZz7meNfwynMU3u0jV2IbXggwCX6n/Mgj28GlYE+yBk+07thPBJVs
X1l036CaktmfphQwqRNGv9QUMGjebzV6GQ7zARnNV4NSiFxpU4KqpQzLJOikKE4o
4+HT9MLKi9kIBlfmtDWhx9mrGOKXaUMTzwnSo862nOXNYcXtjkb2uPgC3LxCDyU/
ftCmyJH5jkYqvfh4ABxHZxqX0fWxMkFj+1R9y2iUpZqsoF8aYnpg/OsQswxvz0oU
rUYZdZjd68hUi+gY2mESd5Oyr9egYg==
=eaDo
-----END PGP SIGNATURE-----

--Sig_/O/5a2+pxpSXKX_Ux3i_lKie--
