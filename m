Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E3472B12DF
	for <lists+linux-next@lfdr.de>; Fri, 13 Nov 2020 00:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgKLXrl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Nov 2020 18:47:41 -0500
Received: from ozlabs.org ([203.11.71.1]:56441 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbgKLXrk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Nov 2020 18:47:40 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CXJDn6N2tz9sSn;
        Fri, 13 Nov 2020 10:47:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605224858;
        bh=YgirdeSpCk/2ef+l+i0o+4fXCM26fJou7/3/XMXIETk=;
        h=Date:From:To:Cc:Subject:From;
        b=OPTy/eX4vRXcpxyLDnAizbYChvdqUGmjCP1hgRVjmg5oyyJPNiTOwYCVZCWj0ldZq
         98x903KI6YuvxDOjCT9jpGxfz2/n2E53Uovn/CFtvkiDZknw75pfOj1u8LZG0SF4KJ
         htWypebF2AWOqcaEFPDCp2O8S9hr/59mLQspKJa+6/EOw1yJVl0fMjlY7uaU6Ye4nz
         Ks3ZqmF23rIE6Ri5PrOTi3SEhlPuSKfr/jFJbbKu+aNQpfpl0V2jwMl22/8fIihuOE
         5EcGdZyZcsJhz+APkiXqjQM1twsUnLsZiwpEo8xdHzP5lo3wU+TvJKkIRDe38Vr1cz
         6pQfqpuPfHdQg==
Date:   Fri, 13 Nov 2020 10:47:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jan Kara <jack@suse.cz>
Cc:     Ira Weiny <ira.weiny@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ext3 tree
Message-ID: <20201113104736.0d6ea84e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gItWAFBWgJ_=3hCeD6U2tez";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gItWAFBWgJ_=3hCeD6U2tez
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ext3 tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from fs/ext2/file.c:28:
fs/ext2/ext2.h: In function 'ext2_get_page':
fs/ext2/ext2.h:764:28: error: implicit declaration of function 'ext2_check_=
page'; did you mean 'ext2_get_page'? [-Werror=3Dimplicit-function-declarati=
on]
  764 |    if (PageError(page) || !ext2_check_page(page, quiet))
      |                            ^~~~~~~~~~~~~~~
      |                            ext2_get_page
In file included from fs/ext2/balloc.c:15:
fs/ext2/ext2.h: In function 'ext2_get_page':
fs/ext2/ext2.h:760:22: error: implicit declaration of function 'read_mappin=
g_page'; did you mean 'unmap_mapping_pages'? [-Werror=3Dimplicit-function-d=
eclaration]
  760 |  struct page *page =3D read_mapping_page(mapping, n, NULL);
      |                      ^~~~~~~~~~~~~~~~~
      |                      unmap_mapping_pages
fs/ext2/ext2.h:760:22: warning: initialization of 'struct page *' from 'int=
' makes pointer from integer without a cast [-Wint-conversion]
fs/ext2/ext2.h:764:28: error: implicit declaration of function 'ext2_check_=
page'; did you mean 'ext2_get_page'? [-Werror=3Dimplicit-function-declarati=
on]
  764 |    if (PageError(page) || !ext2_check_page(page, quiet))
      |                            ^~~~~~~~~~~~~~~
      |                            ext2_get_page
In file included from include/linux/buffer_head.h:14,
                 from fs/ext2/balloc.c:20:
include/linux/pagemap.h: At top level:
include/linux/pagemap.h:497:28: error: conflicting types for 'read_mapping_=
page'
  497 | static inline struct page *read_mapping_page(struct address_space *=
mapping,
      |                            ^~~~~~~~~~~~~~~~~
In file included from fs/ext2/balloc.c:15:
fs/ext2/ext2.h:760:22: note: previous implicit declaration of 'read_mapping=
_page' was here
  760 |  struct page *page =3D read_mapping_page(mapping, n, NULL);
      |                      ^~~~~~~~~~~~~~~~~
In file included from fs/ext2/dir.c:25:
fs/ext2/ext2.h: In function 'ext2_get_page':
fs/ext2/ext2.h:760:22: error: implicit declaration of function 'read_mappin=
g_page'; did you mean 'unmap_mapping_pages'? [-Werror=3Dimplicit-function-d=
eclaration]
  760 |  struct page *page =3D read_mapping_page(mapping, n, NULL);
      |                      ^~~~~~~~~~~~~~~~~
      |                      unmap_mapping_pages
fs/ext2/ext2.h:760:22: warning: initialization of 'struct page *' from 'int=
' makes pointer from integer without a cast [-Wint-conversion]
fs/ext2/ext2.h:764:28: error: implicit declaration of function 'ext2_check_=
page'; did you mean 'ext2_get_page'? [-Werror=3Dimplicit-function-declarati=
on]
  764 |    if (PageError(page) || !ext2_check_page(page, quiet))
      |                            ^~~~~~~~~~~~~~~
      |                            ext2_get_page
In file included from include/linux/buffer_head.h:14,
                 from fs/ext2/dir.c:26:
include/linux/pagemap.h: At top level:
include/linux/pagemap.h:497:28: error: conflicting types for 'read_mapping_=
page'
  497 | static inline struct page *read_mapping_page(struct address_space *=
mapping,
      |                            ^~~~~~~~~~~~~~~~~
In file included from fs/ext2/dir.c:25:
fs/ext2/ext2.h:760:22: note: previous implicit declaration of 'read_mapping=
_page' was here
  760 |  struct page *page =3D read_mapping_page(mapping, n, NULL);
      |                      ^~~~~~~~~~~~~~~~~
fs/ext2/dir.c:109:13: error: conflicting types for 'ext2_check_page'
  109 | static bool ext2_check_page(struct page *page, int quiet)
      |             ^~~~~~~~~~~~~~~
In file included from fs/ext2/dir.c:25:
fs/ext2/ext2.h:764:28: note: previous implicit declaration of 'ext2_check_p=
age' was here
  764 |    if (PageError(page) || !ext2_check_page(page, quiet))
      |                            ^~~~~~~~~~~~~~~
fs/ext2/dir.c:109:13: warning: 'ext2_check_page' defined but not used [-Wun=
used-function]
  109 | static bool ext2_check_page(struct page *page, int quiet)
      |             ^~~~~~~~~~~~~~~


Caused by commit

  32559cea1f55 ("fs/ext2: Use ext2_put_page")

Presumably some missing includes :-(

I have used the ext3 tree from next-20201112 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/gItWAFBWgJ_=3hCeD6U2tez
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+tyZkACgkQAVBC80lX
0GyHbwf/VqAx7m9rvPZHLnalGGZzRVtH12CspxiP5MyVnA3yMAUamCLE6VxHd5YI
ZjNgVzCCDrTWt3WOuvNJe/fyN6u/9qDFn7gBiNzZY9yAcBXggNaqwnRlRkB+xZAp
qj7T7jlG+BCk0wWc6yyyk1tWQLcVs+cYhSwQ8ryhFs7Ie42+g5zKdPzCiLpLslsr
qZr0QdU2PCBGiUbKM+8c69N9OkDVouRPY7TEyg/BpA4mJ9oBI+eHZTKWEvozTNcx
6UhFET3b+iMRPXt76y0qmoH/KyiL860hKAHLmS8+nULVljuJfvaxuAfWaeRoL8y+
7/3zvZxBuCp9ahFpRcZJC+RjPptXwQ==
=OksF
-----END PGP SIGNATURE-----

--Sig_/gItWAFBWgJ_=3hCeD6U2tez--
