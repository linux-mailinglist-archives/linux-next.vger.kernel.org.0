Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7351838BEAF
	for <lists+linux-next@lfdr.de>; Fri, 21 May 2021 07:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbhEUFz3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 May 2021 01:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232901AbhEUFz3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 May 2021 01:55:29 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D3EC061574;
        Thu, 20 May 2021 22:54:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FmbQJ47VDz9sW4;
        Fri, 21 May 2021 15:54:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621576442;
        bh=1p/g3esLUbcvdLnzE2tozxtLFTwXslBVpqrNvl8pxsI=;
        h=Date:From:To:Cc:Subject:From;
        b=NHmNYL6h0OsJLgBuVZ+CFU4WlOO5tfLzqAYpS9a6wrn9ijiF1PebQvRbdXR3CUs6D
         Jagc7/5sBkKmwsL10X36rxE/p5/F9XecMjLsO8xZMAPN2vFHYzibCqQwg9LSao9l0x
         5AcW6wVOxIMSRFGL3ePyuSg0rFU9iZvoB0yy00yHu9YrnPefwub/596uvIyQXZz2nZ
         VR3YEPdiXNW+TZkhXLU3LEeohqoIxMOOwmuRJUcjKsUq6V+KfejtwVUjiyhnwDFgs+
         I0Pk2UsR98J5c4MSR5k53ALBzNZ1mz2oUY6g/QpltfDU65VDB5nsdxbLc22l2lIxr3
         feNqrkPr861Ug==
Date:   Fri, 21 May 2021 15:53:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Matthew Wilcox <willy@infradead.org>,
        Xiongchun Duan <duanxiongchun@bytedance.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20210521155359.13b023ff@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9dchpohPRgL++mVnmDhoiDb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9dchpohPRgL++mVnmDhoiDb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

mm/migrate.c: In function 'unmap_and_move_huge_page':
mm/migrate.c:1295:6: error: implicit declaration of function 'hugetlb_page_=
subpool' [-Werror=3Dimplicit-function-declaration]
 1295 |  if (hugetlb_page_subpool(hpage) && !page_mapping(hpage)) {
      |      ^~~~~~~~~~~~~~~~~~~~

Caused by commit

  b63794a67ae2 ("mm: migrate: fix missing update page_private to hugetlb_pa=
ge_subpool")

CONFIG_HUGETLB_PAGE is not defined for this build.

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/9dchpohPRgL++mVnmDhoiDb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCnSvcACgkQAVBC80lX
0GxGIwf/dgD3N3pEjxcvmuBD/TB3ECQ2iorgEorKLDXbskl2qJs8A3zw7QBaKGIv
hF0ayFLFJXgCMBt17h/NLGMEbLqOflcyrBkbU1ZV9+or8FPGsIozoG4H/Z9dIp+b
pRMu5G7tnt8HTgTQmmx75gqIdo7w85ypoPjUfD5XzMgeuwpXUFHecGaUgue9UWZd
BysYAghM+ckviciGFZC5aI30OezCzJ4sHDNYs492kpm3vi72hDhQdgvzo7Ba4UZn
bYWTyDVEtoe4KyTBBDDRpBepsDPYK/791oyvU8GfSoggBM8WisVvnAdnmUy7JMZo
aEU0DQNv9l7uWeZ6YbYnMjjMMffv5A==
=skJw
-----END PGP SIGNATURE-----

--Sig_/9dchpohPRgL++mVnmDhoiDb--
