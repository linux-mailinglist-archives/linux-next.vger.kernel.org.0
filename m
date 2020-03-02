Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 696C31752A0
	for <lists+linux-next@lfdr.de>; Mon,  2 Mar 2020 05:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgCBEXJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Mar 2020 23:23:09 -0500
Received: from ozlabs.org ([203.11.71.1]:43111 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726874AbgCBEXJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 1 Mar 2020 23:23:09 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48W6Sq00Gfz9sSL;
        Mon,  2 Mar 2020 15:23:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583122987;
        bh=WrY0QgoF/se4vTsljwQkp5MWu7uOMNQCFnVzmMD9laU=;
        h=Date:From:To:Cc:Subject:From;
        b=ApG3XI/oHDruKt3JV9EIBq89vQGPkjzvYLUMvMDHixFxKSzO60vIyiY/QnpRQAhcW
         bs8IufTIHsTLDUt6QXxXPSy23IZtqCnqvgcy3cxpxRVF028fLqepnPZ/MYW9IaA3Vy
         vyqEcoGNeYPZBZ6Y2cpt/tJR0lnHx6ZNjPOvpm+HkXB8i2pK82vOKwFbdQ2l03QzcV
         UlAx18FfV6dzBJ0ETsIsoW8qT8I3wAlBIjU+ZqDIPyy5k7dF6bKRx+fDU9tHA36FTg
         f3ATF72LsTsIkBZB4h2nYS4wnOJUgbGQYzpIw/vYVGdQm0TjSpRZg1hfbABy4iTYgx
         Kw2+UbjeBhe8w==
Date:   Mon, 2 Mar 2020 15:23:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Paul Mackerras <paulus@samba.org>
Subject: linux-next: build failure after merge of the akpm tree
Message-ID: <20200302152306.49cd866d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_Sqota=fc05cOGAqsikexaf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_Sqota=fc05cOGAqsikexaf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/kvm/book3s_64_mmu_radix.c: In function 'debugfs_radix_read':
arch/powerpc/kvm/book3s_64_mmu_radix.c:1226:8: error: unused variable 'pgd'=
 [-Werror=3Dunused-variable]
 1226 |  pgd_t pgd, *pgdp;
      |        ^~~
cc1: all warnings being treated as errors

Caused by commit

  cad54c147231 ("powerpc: add support for folded p4d page tables")

I applied the following fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 2 Mar 2020 15:19:40 +1100
Subject: [PATCH] fix for "powerpc: add support for folded p4d page tables"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book=
3s_64_mmu_radix.c
index beb694285100..3fb598659420 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -1223,7 +1223,7 @@ static ssize_t debugfs_radix_read(struct file *file, =
char __user *buf,
 	unsigned long gpa;
 	pgd_t *pgt;
 	struct kvm_nested_guest *nested;
-	pgd_t pgd, *pgdp;
+	pgd_t *pgdp;
 	p4d_t p4d, *p4dp;
 	pud_t pud, *pudp;
 	pmd_t pmd, *pmdp;
--=20
2.25.0

--=20
Cheers,
Stephen Rothwell

--Sig_/_Sqota=fc05cOGAqsikexaf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5ciioACgkQAVBC80lX
0GweSggApVPnl7cW33i4cT0zpCRIRBdaSEK2TmYVS+Gybb1wO8AqwwGOL7oGW1tU
UIZWB07f+/d0pN4OepxAst8ePlRomUzo+npdI+mEBMd1QQZv6CZMlX+paOWe+0HX
AIZSyz1ILdNhoKXZG1ZgwkHhIT6cROK6Y0iVgxEkqipXJ07LXkvXub8GcN8BagZe
2gIJQw5p2PfgQQwu7Z+t0yQZW6rXe8FmsXChoQ8MW1F0wMY7az6WwlrdOHQ+XzEU
OAkdcbbpjkU8bIuR92XKUdjZicgRE63BlPi5FHTaOaEkIXB17mdcbXFYMPhCuVLH
yVhybrgO4yE8ZAqfIWDxshUldnxNKA==
=mQPA
-----END PGP SIGNATURE-----

--Sig_/_Sqota=fc05cOGAqsikexaf--
