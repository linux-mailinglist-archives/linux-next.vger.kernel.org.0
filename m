Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2F13E9D02
	for <lists+linux-next@lfdr.de>; Thu, 12 Aug 2021 05:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234038AbhHLDen (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Aug 2021 23:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233686AbhHLDeb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Aug 2021 23:34:31 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB47C0617A2;
        Wed, 11 Aug 2021 20:34:02 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GlXNQ2CNxz9t1s;
        Thu, 12 Aug 2021 13:33:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628739239;
        bh=MDW5JG3QUepMTkkbws2wR/QLbVdmmzCINThfadO3/Mo=;
        h=Date:From:To:Cc:Subject:From;
        b=c+OAikLP81pwKkGaIR/ALoJY/aBEimgvSYUtYdJBODdfrN4wRh6Z8c3+5MerQkLtZ
         +tfH8L0rDfbkexDnld87DhxX5/97Jk9NR1IufFwCLRPJl9lkFbzfW1y42nLkY/EOHv
         kzjTHMIOm0e6ndYXqWf2rX3k9Dq25OFGPYG9kHwG06xBwTmyXCR+ANNpmm+aZUioM5
         3VzPlxc7dXTL8nVKt+M/hTpegKgdXOizCxKAjiXVJqFSVW07d27uM1CcymsVmSDdL9
         341hqbxmCCegG7DXSOLKuWAlttQosF2/iGYkcOCWTZ7nw4B2iqzSCfSeeZ1xDZpJvq
         xaJhmvgfO586A==
Date:   Thu, 12 Aug 2021 13:33:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoffer Dall <cdall@cs.columbia.edu>,
        Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <20210812133356.68d2afb8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d==gHFVtmTCLz_3V0TC_yyy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/d==gHFVtmTCLz_3V0TC_yyy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/include/asm/sysreg.h

between commit:

  79d82cbcbb3d ("arm64/kexec: Test page size support with new TGRAN range v=
alues")

from the arm64 tree and commit:

  b31578f62717 ("arm64/mm: Define ID_AA64MMFR0_TGRAN_2_SHIFT")

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

diff --cc arch/arm64/include/asm/sysreg.h
index f2e06e7c0a31,943d31d92b5b..000000000000
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@@ -1032,16 -1028,19 +1032,19 @@@
 =20
  #if defined(CONFIG_ARM64_4K_PAGES)
  #define ID_AA64MMFR0_TGRAN_SHIFT		ID_AA64MMFR0_TGRAN4_SHIFT
+ #define ID_AA64MMFR0_TGRAN_2_SHIFT		ID_AA64MMFR0_TGRAN4_2_SHIFT
 -#define ID_AA64MMFR0_TGRAN_SUPPORTED_MIN	ID_AA64MMFR0_TGRAN4_SUPPORTED
 -#define ID_AA64MMFR0_TGRAN_SUPPORTED_MAX	0x7
 +#define ID_AA64MMFR0_TGRAN_SUPPORTED_MIN	ID_AA64MMFR0_TGRAN4_SUPPORTED_MIN
 +#define ID_AA64MMFR0_TGRAN_SUPPORTED_MAX	ID_AA64MMFR0_TGRAN4_SUPPORTED_MAX
  #elif defined(CONFIG_ARM64_16K_PAGES)
  #define ID_AA64MMFR0_TGRAN_SHIFT		ID_AA64MMFR0_TGRAN16_SHIFT
+ #define ID_AA64MMFR0_TGRAN_2_SHIFT		ID_AA64MMFR0_TGRAN16_2_SHIFT
 -#define ID_AA64MMFR0_TGRAN_SUPPORTED_MIN	ID_AA64MMFR0_TGRAN16_SUPPORTED
 -#define ID_AA64MMFR0_TGRAN_SUPPORTED_MAX	0xF
 +#define ID_AA64MMFR0_TGRAN_SUPPORTED_MIN	ID_AA64MMFR0_TGRAN16_SUPPORTED_M=
IN
 +#define ID_AA64MMFR0_TGRAN_SUPPORTED_MAX	ID_AA64MMFR0_TGRAN16_SUPPORTED_M=
AX
  #elif defined(CONFIG_ARM64_64K_PAGES)
  #define ID_AA64MMFR0_TGRAN_SHIFT		ID_AA64MMFR0_TGRAN64_SHIFT
+ #define ID_AA64MMFR0_TGRAN_2_SHIFT		ID_AA64MMFR0_TGRAN64_2_SHIFT
 -#define ID_AA64MMFR0_TGRAN_SUPPORTED_MIN	ID_AA64MMFR0_TGRAN64_SUPPORTED
 -#define ID_AA64MMFR0_TGRAN_SUPPORTED_MAX	0x7
 +#define ID_AA64MMFR0_TGRAN_SUPPORTED_MIN	ID_AA64MMFR0_TGRAN64_SUPPORTED_M=
IN
 +#define ID_AA64MMFR0_TGRAN_SUPPORTED_MAX	ID_AA64MMFR0_TGRAN64_SUPPORTED_M=
AX
  #endif
 =20
  #define MVFR2_FPMISC_SHIFT		4

--Sig_/d==gHFVtmTCLz_3V0TC_yyy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEUlqQACgkQAVBC80lX
0GyVxgf/fJ9uXPweJsnBnyaEsG4sazx6/DylK5XbU8EVBcBMuHxniADviFdojVf0
+jO2Bi7VDGXoEgOeSwuGrY8THbGBxITjR1i6FrY/ou0MOoVUtATGcDJ6JYOixC0e
FnjDM+5Le6NYWU/m3yZQUY1LgzC3ZzzgQ11K0TOQOLuXKFAWmkWtU52oGvIEw/Ub
oYJRxhTBCvHGGsnIHGozSufWUkLB7dSWHDkD19xS5rUNrQPsh4SJzCS5R8KCwIgt
97PqhWXEzD5ObgYQ2GgURou5oNW/fVi9biNHKb+AYtYtPqvywLXbXwiMGU8Rkyr1
NZCWwYiZhN5UOcZgYOjP+pcb8n+2gA==
=CEQG
-----END PGP SIGNATURE-----

--Sig_/d==gHFVtmTCLz_3V0TC_yyy--
