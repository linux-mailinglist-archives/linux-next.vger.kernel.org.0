Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB381829C4
	for <lists+linux-next@lfdr.de>; Thu, 12 Mar 2020 08:31:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387958AbgCLHbp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 03:31:45 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45233 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387930AbgCLHbp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Mar 2020 03:31:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48dL9q2TQ8z9sP7;
        Thu, 12 Mar 2020 18:31:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583998303;
        bh=tr4pcdZrcg5CsFj28lSfbnVDXMuBw83K/m/0UMQaYEc=;
        h=Date:From:To:Cc:Subject:From;
        b=u7CsECuTYZHX2H/btk5IfjZ6RzQFQhucbNRB1/bBCvKW0qCy3SQaLWvw+eeur7KxO
         ycS7qF1E7816Eb8j74sb9CyhuvdlTF2/NflABFK9KfxKW4Jgt+Hd+H4afZgz+tyINt
         eic0bDlVqCWPpE+6vTwRvre9bl8uwVWd58JrfPCPIDCEXJRnQGDQ37TccQHxh42WJg
         aOGKrxiQyb9Qd3JPrmK8mOd1YsSCjOlUfIFTLSmaFyj3m0+D5/x8MKM6WvFXWwiWKK
         oSs0zF4FfJEj85ak/3iyaY+oGPgM2NWmU78KPtRaVT1oIuSyfVZf4UK0l4qjWTCfkh
         dR0xIo1nRX5yg==
Date:   Thu, 12 Mar 2020 18:31:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Kravetz <mike.kravetz@oracle.com>
Subject: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20200312183142.108df9ac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T0FSRC7ijNDTJtpHotdrX3G";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/T0FSRC7ijNDTJtpHotdrX3G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/hugetlbfs/inode.c: In function 'remove_inode_hugepages':
fs/hugetlbfs/inode.c:460:44: warning: 'hash' may be used uninitialized in t=
his function [-Wmaybe-uninitialized]
  460 |     mutex_unlock(&hugetlb_fault_mutex_table[hash]);
      |                                            ^
fs/hugetlbfs/inode.c:463:5: warning: 'index' may be used uninitialized in t=
his function [-Wmaybe-uninitialized]
  463 |     hugetlb_vmdelete_list(&mapping->i_mmap,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  464 |      index * pages_per_huge_page(h),
      |      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  465 |      (index + 1) * pages_per_huge_page(h));
      |      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  6fdc8f8d1781 ("hugetlbfs: use i_mmap_rwsem to address page fault/truncate=
 race")

--=20
Cheers,
Stephen Rothwell

--Sig_/T0FSRC7ijNDTJtpHotdrX3G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5p5V4ACgkQAVBC80lX
0GwuWAgAoEjRkTiMX28W5uTOc5rB63U0wSnJEEDEbmS5US18fI106fc3/sDaVYK+
315ePqdGhrLs6nWFx3e6ReGXljadSx504eZU1OYgGmprxxPmjzMylKAckeoyF4mf
/RufpuFReYXXKaNy57OAhcWaeVlU0GkWC5qtt6HMOm0TjLJZG1W/eggM0EHuDGO+
0FtegC1dUur+I/fpluDig2Nl4F1uOkt5/LJsN1TBZB5NazG3jXITi8zKs4oBOE1R
1nZNYeE2MrBbxCQ1Dz8cxvS+acZII2lgeuio8ACV6Qi2m8mhCvB8H+qiv9hkxRcy
L0KCpt/84+XfXIciGVBLfbQ1Z3SpWw==
=UrJz
-----END PGP SIGNATURE-----

--Sig_/T0FSRC7ijNDTJtpHotdrX3G--
