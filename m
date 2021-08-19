Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 325793F122F
	for <lists+linux-next@lfdr.de>; Thu, 19 Aug 2021 06:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhHSEG1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Aug 2021 00:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbhHSEG1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Aug 2021 00:06:27 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E3CC061764;
        Wed, 18 Aug 2021 21:05:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gqrlt6mn7z9t0T;
        Thu, 19 Aug 2021 14:05:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629345947;
        bh=oHNkM81S5CrlSrOU/9DU4r+0TWJTGhKDC6cl+R4nFfE=;
        h=Date:From:To:Cc:Subject:From;
        b=h0TWi4KDudbGqZ8bsUfMlTuuyRmV6jjBdxENTn9m3IuwxYGfiLmeJY61PpHAzSC84
         egb9m+8n+saRYaJ9Fjbc4e92mj5pbU1nelwrIpyz1R2hNVsigum1i+A8UsCGuBueHz
         +1lWBy9j5Ec5yndVJbhtzt6xAWc3WtqkO4AtWEL4WyRiQP7+r9CSDxGNRH2qilhPNa
         G8ecIgbU5fvr7ZYPwg/ciKpvU3D/R+lgb1oxP56T0nm5Q4bBi1ku0wy5+6LzTw6S6w
         VB/zgyGF9utk4xwEQsB9JlDaxtBo++oskXYqF5OMGozGWcCEuOSav1UROPqex012jG
         0ydErujLGr/aw==
Date:   Thu, 19 Aug 2021 14:05:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoffer Dall <cdall@cs.columbia.edu>,
        Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <20210819140544.5acbcf21@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PbL=j7Q/zeiTsu6TxWLYGSB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PbL=j7Q/zeiTsu6TxWLYGSB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/include/asm/sysreg.h

between commit:

  79d82cbcbb3d ("arm64/kexec: Test page size support with new TGRAN range v=
alues")

from the arm64 tree and commit:

  504c6295b998 ("arm64/mm: Add remaining ID_AA64MMFR0_PARANGE_ macros")

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
index f2e06e7c0a31,1972e4b9be5c..000000000000
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@@ -847,16 -847,17 +847,21 @@@
  #define ID_AA64MMFR0_ASID_SHIFT		4
  #define ID_AA64MMFR0_PARANGE_SHIFT	0
 =20
 -#define ID_AA64MMFR0_TGRAN4_NI		0xf
 -#define ID_AA64MMFR0_TGRAN4_SUPPORTED	0x0
 -#define ID_AA64MMFR0_TGRAN64_NI		0xf
 -#define ID_AA64MMFR0_TGRAN64_SUPPORTED	0x0
 -#define ID_AA64MMFR0_TGRAN16_NI		0x0
 -#define ID_AA64MMFR0_TGRAN16_SUPPORTED	0x1
 +#define ID_AA64MMFR0_TGRAN4_NI			0xf
 +#define ID_AA64MMFR0_TGRAN4_SUPPORTED_MIN	0x0
 +#define ID_AA64MMFR0_TGRAN4_SUPPORTED_MAX	0x7
 +#define ID_AA64MMFR0_TGRAN64_NI			0xf
 +#define ID_AA64MMFR0_TGRAN64_SUPPORTED_MIN	0x0
 +#define ID_AA64MMFR0_TGRAN64_SUPPORTED_MAX	0x7
 +#define ID_AA64MMFR0_TGRAN16_NI			0x0
 +#define ID_AA64MMFR0_TGRAN16_SUPPORTED_MIN	0x1
 +#define ID_AA64MMFR0_TGRAN16_SUPPORTED_MAX	0xf
 +
+ #define ID_AA64MMFR0_PARANGE_32		0x0
+ #define ID_AA64MMFR0_PARANGE_36		0x1
+ #define ID_AA64MMFR0_PARANGE_40		0x2
+ #define ID_AA64MMFR0_PARANGE_42		0x3
+ #define ID_AA64MMFR0_PARANGE_44		0x4
  #define ID_AA64MMFR0_PARANGE_48		0x5
  #define ID_AA64MMFR0_PARANGE_52		0x6
 =20
@@@ -1032,16 -1035,19 +1039,19 @@@
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

--Sig_/PbL=j7Q/zeiTsu6TxWLYGSB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEd2JgACgkQAVBC80lX
0Gzhcwf/SBHnPK6B2Wq94Fijm9hFMC58ketUiOw8GD0EwRgd+UbD5S3UPiTl7ww8
+FsT0yr+V3fmCKoBEK2ev9jXzZfbd3C+IjAJh0SGrgmeFFLBMbTI3jQddcCLJt0P
qbILQpE7utGj7XJJlCTOvszkAflmO344KShsbEUg/Ou5/xdpw5TWPy5DDZSVhrDp
VsEc6hwsxBDKr+mrljRQ3M2XQF5Lg0BA0bsikWaC5jVPbRc7vBHXkSP9x5ZOuEik
uCkbcUz4wMLTOEqK0LcbkJKGf9rUpiNPjK8LRueewjDiFAn25l9a8afFZaseXIGO
KAKl2Kk5n1Oc6XrCyE5Vpy/jAozhDw==
=Clcn
-----END PGP SIGNATURE-----

--Sig_/PbL=j7Q/zeiTsu6TxWLYGSB--
