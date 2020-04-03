Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B43919CEFB
	for <lists+linux-next@lfdr.de>; Fri,  3 Apr 2020 05:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390371AbgDCD7A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Apr 2020 23:59:00 -0400
Received: from ozlabs.org ([203.11.71.1]:39705 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388951AbgDCD7A (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Apr 2020 23:59:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48tmQ45Mckz9sRR;
        Fri,  3 Apr 2020 14:58:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585886335;
        bh=vPphFPznj7/OS2PTUNdEppBK08fIzt1JA7EYmLUD+7E=;
        h=Date:From:To:Cc:Subject:From;
        b=rbG//bSKRyT328C6M96TlOYdgplktlSwIPLUH6/1tUW1luCsAWdsvPppOYU5gK/K2
         9l3CYr6rt1mAOfkTheSmexlEDi6L9k/5/b/pUm9v+4fdA9qUbMcIzCs0oBx56+pMGp
         gvLWA1u4bBeXbw5yJ4AOJiC4psQibuLgsT2Pb5OrwV4L+3ctN9K8oLbpkr/AFjOGIR
         5LGHSeYeV9HD0hL2KjB2rHbAOsaaO2lvBEMpbh4Cq60cHMsgKdW629IPTnZBr7BeLk
         1O14eHU74t1o1QiZJQHDlb4U+CpN070qSYjqeai+ZyuCpwxsl+BmUQX3CwLrkE/1IG
         9/gUm2t15CqtQ==
Date:   Fri, 3 Apr 2020 14:58:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Thomas Hellstrom (VMware)" <thomas_os@shipmail.org>,
        Peter Xu <peterx@redhat.com>
Subject: linux-next: manual merge of the akpm-current tree with the drm tree
Message-ID: <20200403145851.65194562@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7OFIPXdXiiwXVCZCK_ELYvU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7OFIPXdXiiwXVCZCK_ELYvU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/huge_mm.h

between commit:

  9a9731b18c9b ("mm: Add vmf_insert_pfn_xxx_prot() for huge page-table entr=
ies")

from the drm tree and commit:

  7b6b88969e9d ("mm: merge parameters for change_protection()")

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

diff --cc include/linux/huge_mm.h
index f63b0882c1b3,e60c923e68c4..000000000000
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@@ -46,46 -46,9 +46,46 @@@ extern bool move_huge_pmd(struct vm_are
  			 pmd_t *old_pmd, pmd_t *new_pmd);
  extern int change_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
  			unsigned long addr, pgprot_t newprot,
- 			int prot_numa);
+ 			unsigned long cp_flags);
 -vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write=
);
 -vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write=
);
 +vm_fault_t vmf_insert_pfn_pmd_prot(struct vm_fault *vmf, pfn_t pfn,
 +				   pgprot_t pgprot, bool write);
 +
 +/**
 + * vmf_insert_pfn_pmd - insert a pmd size pfn
 + * @vmf: Structure describing the fault
 + * @pfn: pfn to insert
 + * @pgprot: page protection to use
 + * @write: whether it's a write fault
 + *
 + * Insert a pmd size pfn. See vmf_insert_pfn() for additional info.
 + *
 + * Return: vm_fault_t value.
 + */
 +static inline vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t p=
fn,
 +					    bool write)
 +{
 +	return vmf_insert_pfn_pmd_prot(vmf, pfn, vmf->vma->vm_page_prot, write);
 +}
 +vm_fault_t vmf_insert_pfn_pud_prot(struct vm_fault *vmf, pfn_t pfn,
 +				   pgprot_t pgprot, bool write);
 +
 +/**
 + * vmf_insert_pfn_pud - insert a pud size pfn
 + * @vmf: Structure describing the fault
 + * @pfn: pfn to insert
 + * @pgprot: page protection to use
 + * @write: whether it's a write fault
 + *
 + * Insert a pud size pfn. See vmf_insert_pfn() for additional info.
 + *
 + * Return: vm_fault_t value.
 + */
 +static inline vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t p=
fn,
 +					    bool write)
 +{
 +	return vmf_insert_pfn_pud_prot(vmf, pfn, vmf->vma->vm_page_prot, write);
 +}
 +
  enum transparent_hugepage_flag {
  	TRANSPARENT_HUGEPAGE_FLAG,
  	TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,

--Sig_/7OFIPXdXiiwXVCZCK_ELYvU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6GtHsACgkQAVBC80lX
0GzACAf+OlhGSD0Y1SN+jUwpHitH1sNnbDMd2UK+dzRWiQm1r8KaOmnx1eetS1rO
lut/8vNEJMkpqwU+hNsOY2TLEVxXpu+sA6Kw2uepqaf7XzrtDUlFAmaT2Bw3YaYq
DQFOGVufic3SDLcknPhvOk2+kBJOcf9hJRM6HXmEJI3NJS5qciiz24X6adckuHwh
20vgt20U4Aej3K6ZFOSkrjg7u6qCQI9h1Mty5ajsx7QK6MATBUetXjxhGUReOvG3
goU1cxyQQNc1aqOb6Wb4WZcp/cc+p0CMoj1cVS2QXC9QQWcIAJXkYNR42iq9hPee
U4qJki9t/svoRVCgyLJIQRnrMnu5bg==
=NhXR
-----END PGP SIGNATURE-----

--Sig_/7OFIPXdXiiwXVCZCK_ELYvU--
