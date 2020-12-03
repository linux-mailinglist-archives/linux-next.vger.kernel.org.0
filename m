Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA8032CD0C8
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 09:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgLCIGq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 03:06:46 -0500
Received: from ozlabs.org ([203.11.71.1]:34547 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387609AbgLCIGq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Dec 2020 03:06:46 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CmpLg21srz9s0b;
        Thu,  3 Dec 2020 19:06:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606982763;
        bh=xGYzUa8N9aV4gF00C4v79MReDpaoluhaxU2yKgsMMdc=;
        h=Date:From:To:Cc:Subject:From;
        b=K4CcJweMlGN9NvMrN8jajo6OuLZPcmlqkgdpj7//BMDN9sSUL49UFISsUVF2JcEHE
         LdOj3Tl1OprG/k8EqNZEoo9sY8RRZNnIzebZPYlcTBO1E/DxlTGj98LfZ30aunC8t5
         /PVdeQFGTaTiq0kUWfiuQJc6ha4oMdwaSOM/JklwiHpN6bx44jBpoOQRPhA5i5cugp
         8wtIAz2VfK+BsT/dR+zd1nQxpMoqXQPkmmRIU0J4lzURfVwqwxDkPv0Pixmea+/e1g
         XtluPI3q0eLdet8rZKZW4s/MS60jHfeif8AAiWdlMvj0EnFn2CESoNu4sBULSbwXSk
         4lOdufy0XaAKg==
Date:   Thu, 3 Dec 2020 19:06:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Message-ID: <20201203190426.5a2cc067@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3rzT+mr9BPpMcHeNjiP8dJL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3rzT+mr9BPpMcHeNjiP8dJL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/arm64/include/asm/uaccess.h

between commits:

  923e1e7d8223 ("arm64: uaccess: rename privileged uaccess routines")
  7cf283c7bd62 ("arm64: uaccess: remove redundant PAN toggling")

from the arm64 tree and commit:

  9bc0016cc21a ("arm64: mte: add in-kernel tag fault handler")

from the akpm-current tree.

I fixed it up (as specified by Catalin (thanks) see below) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/uaccess.h
index d841a560fae7,abb31aa1f8ca..000000000000
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@@ -186,64 -159,20 +159,43 @@@ static inline void __uaccess_enable_hw_
  			CONFIG_ARM64_PAN));
  }
 =20
- #define __uaccess_disable(alt)						\
- do {									\
- 	if (!uaccess_ttbr0_disable())					\
- 		asm(ALTERNATIVE("nop", SET_PSTATE_PAN(1), alt,		\
- 				CONFIG_ARM64_PAN));			\
- } while (0)
-=20
- #define __uaccess_enable(alt)						\
- do {									\
- 	if (!uaccess_ttbr0_enable())					\
- 		asm(ALTERNATIVE("nop", SET_PSTATE_PAN(0), alt,		\
- 				CONFIG_ARM64_PAN));			\
- } while (0)
-=20
 +/*
 + * The Tag Check Flag (TCF) mode for MTE is per EL, hence TCF0
 + * affects EL0 and TCF affects EL1 irrespective of which TTBR is
 + * used.
 + * The kernel accesses TTBR0 usually with LDTR/STTR instructions
 + * when UAO is available, so these would act as EL0 accesses using
 + * TCF0.
 + * However futex.h code uses exclusives which would be executed as
 + * EL1, this can potentially cause a tag check fault even if the
 + * user disables TCF0.
 + *
 + * To address the problem we set the PSTATE.TCO bit in uaccess_enable()
 + * and reset it in uaccess_disable().
 + *
 + * The Tag check override (TCO) bit disables temporarily the tag checking
 + * preventing the issue.
 + */
- static inline void uaccess_disable(void)
+ static inline void uaccess_disable_privileged(void)
  {
 +	asm volatile(ALTERNATIVE("nop", SET_PSTATE_TCO(0),
 +				 ARM64_MTE, CONFIG_KASAN_HW_TAGS));
 +
- 	__uaccess_disable(ARM64_HAS_PAN);
+ 	if (uaccess_ttbr0_disable())
+ 		return;
+=20
+ 	__uaccess_enable_hw_pan();
  }
 =20
- static inline void uaccess_enable(void)
+ static inline void uaccess_enable_privileged(void)
  {
 +	asm volatile(ALTERNATIVE("nop", SET_PSTATE_TCO(1),
 +				 ARM64_MTE, CONFIG_KASAN_HW_TAGS));
 +
- 	__uaccess_enable(ARM64_HAS_PAN);
- }
-=20
- /*
-  * These functions are no-ops when UAO is present.
-  */
- static inline void uaccess_disable_not_uao(void)
- {
- 	__uaccess_disable(ARM64_ALT_PAN_NOT_UAO);
- }
+ 	if (uaccess_ttbr0_enable())
+ 		return;
 =20
- static inline void uaccess_enable_not_uao(void)
- {
- 	__uaccess_enable(ARM64_ALT_PAN_NOT_UAO);
+ 	__uaccess_disable_hw_pan();
  }
 =20
  /*

--Sig_/3rzT+mr9BPpMcHeNjiP8dJL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/InGkACgkQAVBC80lX
0Gxzdwf9GANeltJT1osZOEfCQJKiPr1joH9pI5wkbid6kHvhgQEh5+WBwcnOEDkr
ds+Zm2632L7Vs8hpkbRmfCpmicJLFhUc+PwzA1QT/lfz6lCQ3QyqZbtbgXZyBP+Z
QsfnKEkhdPknJrzqKlp3HSbEMnVbEJLTopBN5VT+hIOT985MsxQB5V99UJDzPdeF
yLh4g/zbzqo4/EjJ/Ky3YoQavJGHSdB2h+SzmvchJ0KwRYAEYDkSbduJGMyvRXJZ
EqEe63fGUk7HgdHYDJYJbhm2g9cdPZkq8O8Q/bHRmF8OjIiZSKR8ePs6mURr6YW5
8Tluxg2mkO1YJEhAU1qeVwgHy6gVwA==
=VwDD
-----END PGP SIGNATURE-----

--Sig_/3rzT+mr9BPpMcHeNjiP8dJL--
