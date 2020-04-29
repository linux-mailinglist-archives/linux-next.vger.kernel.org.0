Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 333691BD523
	for <lists+linux-next@lfdr.de>; Wed, 29 Apr 2020 08:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgD2Gxd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Apr 2020 02:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbgD2Gxd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Apr 2020 02:53:33 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63D9C03C1AD;
        Tue, 28 Apr 2020 23:53:32 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Bq3Z11Qwz9sSb;
        Wed, 29 Apr 2020 16:53:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588143210;
        bh=hFHsmeY9uewYE8AQT4rn3OwaK6pdWVRGoOni88zSTPI=;
        h=Date:From:To:Cc:Subject:From;
        b=jNo8eq6IN7xMGwypND+3vleFimvTfGZr49ISn5xems6ILmil+Irj9Q8jHBFGxk8pq
         mpExJ7+XVXDuws6DppcfvfzJ3qN+VvZETRl5vkahWRIXjy7HjaK8vYocbc3SjcJYSb
         RRf6OeYEizoDPv7uTl5fdRYxt4LSuWhOSk9+ehbVhPfi0TeWoyogd8dMH2UQs+aSDN
         BOwghOTEZpktCB+Wi9NKYhnitAmukvq7Th4dAHAdzi+qMbH5KV/8prrEhatqcQTERy
         BVbPW8iQGA3IgNPlF0sYRsjjwvoob8wWDN+bqDpAETYlViPMF45iLsbA9tpxPmkbHE
         YI3f/O6lJ+f2A==
Date:   Wed, 29 Apr 2020 16:53:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gavin Shan <gshan@redhat.com>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Message-ID: <20200429165328.13619ca5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EI/XKWUZfTbl.V+lPB9bbVC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EI/XKWUZfTbl.V+lPB9bbVC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/arm64/include/asm/pgtable.h

between commit:

  68ecabd0e680 ("arm64/mm: Use phys_to_page() to access pgtable memory")

from the arm64 tree and commit:

  22998131ab33 ("arm64: add support for folded p4d page tables")

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

diff --cc arch/arm64/include/asm/pgtable.h
index 5caff09c6a3a,ef7145c3b96b..000000000000
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@@ -622,10 -632,10 +633,10 @@@ static inline phys_addr_t p4d_page_padd
  #define pud_offset(dir, addr)		((pud_t *)__va(pud_offset_phys((dir), (add=
r))))
 =20
  #define pud_set_fixmap(addr)		((pud_t *)set_fixmap_offset(FIX_PUD, addr))
- #define pud_set_fixmap_offset(pgd, addr)	pud_set_fixmap(pud_offset_phys(p=
gd, addr))
+ #define pud_set_fixmap_offset(p4d, addr)	pud_set_fixmap(pud_offset_phys(p=
4d, addr))
  #define pud_clear_fixmap()		clear_fixmap(FIX_PUD)
 =20
- #define pgd_page(pgd)			phys_to_page(__pgd_to_phys(pgd))
 -#define p4d_page(p4d)		pfn_to_page(__phys_to_pfn(__p4d_to_phys(p4d)))
++#define p4d_page(p4d)			phys_to_page(__p4d_to_phys(p4d))
 =20
  /* use ONLY for statically allocated translation tables */
  #define pud_offset_kimg(dir,addr)	((pud_t *)__phys_to_kimg(pud_offset_phy=
s((dir), (addr))))

--Sig_/EI/XKWUZfTbl.V+lPB9bbVC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6pJGgACgkQAVBC80lX
0GyO5wf+OLmU9E7qxpHRBu5+In4W7nQAzZebK8jk35wkQ9gtDYJJS4sNEKsXLY10
LidilguyAkN5pzk5CD8A1dxy7+rfKo6pdoy7gporviKIEPerwq3q+H7h6uPQdSFP
cxk08WSckZgrV4qbeeHzZWBUVCQZpdmFgFb8Q4+SYCp76tFn8sJGS5qFRNyxDiE2
MaBol/kYAz2LHsDSAdD7orOydM4J48VuSqE0cIEexjzhfeNJLmjlUYbBUcaOYcJw
uYj6mGBdHBkr3Yc5uVG7Ik/8hQuCoa6z36TTSJ8c7usJ10S2EH2bY7JAcWZVaLUK
SSRvo16DWo13RAXOkMzS+6LlGxG61Q==
=SjDB
-----END PGP SIGNATURE-----

--Sig_/EI/XKWUZfTbl.V+lPB9bbVC--
