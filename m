Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88EFF3B1028
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 00:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhFVWlV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 18:41:21 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37641 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229800AbhFVWlV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Jun 2021 18:41:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G8hCB45DZz9sVp;
        Wed, 23 Jun 2021 08:39:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624401543;
        bh=q4xI+kLRvQ+w2SAaQQUUTdCOiWB2e9OLTjjbFloEIFk=;
        h=Date:From:To:Cc:Subject:From;
        b=UDdK1Vy0KVEwb6wvbFKtTY8frusD7sK2UUPkTd4WppiWhLnMsStayOtnQARnYqdqe
         kMUMcT8oHYg7F2zC97lvI+9awFbtcDXyRkn3CWHeQ81uMX5I3riltO70RXDJw0xucI
         pXruszKIKuAwFFXDJSzJZxf0Vi9fgYqbfo3AKeXFc2FOobdtuildWe7WIKXoDWznvh
         6gnUjfXgcRJWd3SWVMhahwM3FLtjYLzgt7XOX8BdrUe1We/GKQkoA7zx7zklxmrpup
         UgTSnjyjIe4sIseaToXUXblQTKtk2jdxAMBe9d+b+w9lT6Q2cdi9pgc6lLZED8ho7a
         T9vlTPJoveC2g==
Date:   Wed, 23 Jun 2021 08:39:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        David Sterba <dsterba@suse.cz>
Subject: linux-next: build warning after merge of the kspp-gustavo tree
Message-ID: <20210623083901.1d49d19d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZYMtYl+EaQ81t.y/0T093tr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZYMtYl+EaQ81t.y/0T093tr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp-gustavo tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

In file included from fs/btrfs/ctree.h:9,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/struct-funcs.c: In function 'btrfs_get_token_16':
fs/btrfs/struct-funcs.c:80:46: warning: array subscript 1 is above array bo=
unds of 'struct page *[1]' [-Warray-bounds]
   80 |  token->kaddr =3D page_address(token->eb->pages[idx + 1]);  \
      |                              ~~~~~~~~~~~~~~~~^~~~~~~~~
include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
 1627 | #define page_address(page) lowmem_page_address(page)
      |                                                ^~~~
fs/btrfs/struct-funcs.c:161:1: note: in expansion of macro 'DEFINE_BTRFS_SE=
TGET_BITS'
  161 | DEFINE_BTRFS_SETGET_BITS(16)
      | ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from fs/btrfs/ctree.h:32,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
   97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
      |               ^~~~~
In file included from fs/btrfs/ctree.h:9,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/struct-funcs.c: In function 'btrfs_get_16':
fs/btrfs/struct-funcs.c:101:32: warning: array subscript 1 is above array b=
ounds of 'struct page * const[1]' [-Warray-bounds]
  101 |  kaddr =3D page_address(eb->pages[idx + 1]);   \
      |                       ~~~~~~~~~^~~~~~~~~
include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
 1627 | #define page_address(page) lowmem_page_address(page)
      |                                                ^~~~
fs/btrfs/struct-funcs.c:161:1: note: in expansion of macro 'DEFINE_BTRFS_SE=
TGET_BITS'
  161 | DEFINE_BTRFS_SETGET_BITS(16)
      | ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from fs/btrfs/ctree.h:32,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
   97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
      |               ^~~~~
In file included from fs/btrfs/ctree.h:9,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/struct-funcs.c: In function 'btrfs_set_token_16':
fs/btrfs/struct-funcs.c:133:46: warning: array subscript 1 is above array b=
ounds of 'struct page *[1]' [-Warray-bounds]
  133 |  token->kaddr =3D page_address(token->eb->pages[idx + 1]);  \
      |                              ~~~~~~~~~~~~~~~~^~~~~~~~~
include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
 1627 | #define page_address(page) lowmem_page_address(page)
      |                                                ^~~~
fs/btrfs/struct-funcs.c:161:1: note: in expansion of macro 'DEFINE_BTRFS_SE=
TGET_BITS'
  161 | DEFINE_BTRFS_SETGET_BITS(16)
      | ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from fs/btrfs/ctree.h:32,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
   97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
      |               ^~~~~
In file included from fs/btrfs/ctree.h:9,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/struct-funcs.c: In function 'btrfs_set_16':
fs/btrfs/struct-funcs.c:156:32: warning: array subscript 1 is above array b=
ounds of 'struct page * const[1]' [-Warray-bounds]
  156 |  kaddr =3D page_address(eb->pages[idx + 1]);   \
      |                       ~~~~~~~~~^~~~~~~~~
include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
 1627 | #define page_address(page) lowmem_page_address(page)
      |                                                ^~~~
fs/btrfs/struct-funcs.c:161:1: note: in expansion of macro 'DEFINE_BTRFS_SE=
TGET_BITS'
  161 | DEFINE_BTRFS_SETGET_BITS(16)
      | ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from fs/btrfs/ctree.h:32,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
   97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
      |               ^~~~~
In file included from fs/btrfs/ctree.h:9,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/struct-funcs.c: In function 'btrfs_get_token_32':
fs/btrfs/struct-funcs.c:80:46: warning: array subscript 1 is above array bo=
unds of 'struct page *[1]' [-Warray-bounds]
   80 |  token->kaddr =3D page_address(token->eb->pages[idx + 1]);  \
      |                              ~~~~~~~~~~~~~~~~^~~~~~~~~
include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
 1627 | #define page_address(page) lowmem_page_address(page)
      |                                                ^~~~
fs/btrfs/struct-funcs.c:162:1: note: in expansion of macro 'DEFINE_BTRFS_SE=
TGET_BITS'
  162 | DEFINE_BTRFS_SETGET_BITS(32)
      | ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from fs/btrfs/ctree.h:32,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
   97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
      |               ^~~~~
In file included from fs/btrfs/ctree.h:9,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/struct-funcs.c: In function 'btrfs_get_32':
fs/btrfs/struct-funcs.c:101:32: warning: array subscript 1 is above array b=
ounds of 'struct page * const[1]' [-Warray-bounds]
  101 |  kaddr =3D page_address(eb->pages[idx + 1]);   \
      |                       ~~~~~~~~~^~~~~~~~~
include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
 1627 | #define page_address(page) lowmem_page_address(page)
      |                                                ^~~~
fs/btrfs/struct-funcs.c:162:1: note: in expansion of macro 'DEFINE_BTRFS_SE=
TGET_BITS'
  162 | DEFINE_BTRFS_SETGET_BITS(32)
      | ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from fs/btrfs/ctree.h:32,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
   97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
      |               ^~~~~
In file included from fs/btrfs/ctree.h:9,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/struct-funcs.c: In function 'btrfs_set_token_32':
fs/btrfs/struct-funcs.c:133:46: warning: array subscript 1 is above array b=
ounds of 'struct page *[1]' [-Warray-bounds]
  133 |  token->kaddr =3D page_address(token->eb->pages[idx + 1]);  \
      |                              ~~~~~~~~~~~~~~~~^~~~~~~~~
include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
 1627 | #define page_address(page) lowmem_page_address(page)
      |                                                ^~~~
fs/btrfs/struct-funcs.c:162:1: note: in expansion of macro 'DEFINE_BTRFS_SE=
TGET_BITS'
  162 | DEFINE_BTRFS_SETGET_BITS(32)
      | ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from fs/btrfs/ctree.h:32,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
   97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
      |               ^~~~~
In file included from fs/btrfs/ctree.h:9,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/struct-funcs.c: In function 'btrfs_set_32':
fs/btrfs/struct-funcs.c:156:32: warning: array subscript 1 is above array b=
ounds of 'struct page * const[1]' [-Warray-bounds]
  156 |  kaddr =3D page_address(eb->pages[idx + 1]);   \
      |                       ~~~~~~~~~^~~~~~~~~
include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
 1627 | #define page_address(page) lowmem_page_address(page)
      |                                                ^~~~
fs/btrfs/struct-funcs.c:162:1: note: in expansion of macro 'DEFINE_BTRFS_SE=
TGET_BITS'
  162 | DEFINE_BTRFS_SETGET_BITS(32)
      | ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from fs/btrfs/ctree.h:32,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
   97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
      |               ^~~~~
In file included from fs/btrfs/ctree.h:9,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/struct-funcs.c: In function 'btrfs_get_token_64':
fs/btrfs/struct-funcs.c:80:46: warning: array subscript 1 is above array bo=
unds of 'struct page *[1]' [-Warray-bounds]
   80 |  token->kaddr =3D page_address(token->eb->pages[idx + 1]);  \
      |                              ~~~~~~~~~~~~~~~~^~~~~~~~~
include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
 1627 | #define page_address(page) lowmem_page_address(page)
      |                                                ^~~~
fs/btrfs/struct-funcs.c:163:1: note: in expansion of macro 'DEFINE_BTRFS_SE=
TGET_BITS'
  163 | DEFINE_BTRFS_SETGET_BITS(64)
      | ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from fs/btrfs/ctree.h:32,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
   97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
      |               ^~~~~
In file included from fs/btrfs/ctree.h:9,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/struct-funcs.c: In function 'btrfs_get_64':
fs/btrfs/struct-funcs.c:101:32: warning: array subscript 1 is above array b=
ounds of 'struct page * const[1]' [-Warray-bounds]
  101 |  kaddr =3D page_address(eb->pages[idx + 1]);   \
      |                       ~~~~~~~~~^~~~~~~~~
include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
 1627 | #define page_address(page) lowmem_page_address(page)
      |                                                ^~~~
fs/btrfs/struct-funcs.c:163:1: note: in expansion of macro 'DEFINE_BTRFS_SE=
TGET_BITS'
  163 | DEFINE_BTRFS_SETGET_BITS(64)
      | ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from fs/btrfs/ctree.h:32,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
   97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
      |               ^~~~~
In file included from fs/btrfs/ctree.h:9,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/struct-funcs.c: In function 'btrfs_set_token_64':
fs/btrfs/struct-funcs.c:133:46: warning: array subscript 1 is above array b=
ounds of 'struct page *[1]' [-Warray-bounds]
  133 |  token->kaddr =3D page_address(token->eb->pages[idx + 1]);  \
      |                              ~~~~~~~~~~~~~~~~^~~~~~~~~
include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
 1627 | #define page_address(page) lowmem_page_address(page)
      |                                                ^~~~
fs/btrfs/struct-funcs.c:163:1: note: in expansion of macro 'DEFINE_BTRFS_SE=
TGET_BITS'
  163 | DEFINE_BTRFS_SETGET_BITS(64)
      | ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from fs/btrfs/ctree.h:32,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
   97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
      |               ^~~~~
In file included from fs/btrfs/ctree.h:9,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/struct-funcs.c: In function 'btrfs_set_64':
fs/btrfs/struct-funcs.c:156:32: warning: array subscript 1 is above array b=
ounds of 'struct page * const[1]' [-Warray-bounds]
  156 |  kaddr =3D page_address(eb->pages[idx + 1]);   \
      |                       ~~~~~~~~~^~~~~~~~~
include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
 1627 | #define page_address(page) lowmem_page_address(page)
      |                                                ^~~~
fs/btrfs/struct-funcs.c:163:1: note: in expansion of macro 'DEFINE_BTRFS_SE=
TGET_BITS'
  163 | DEFINE_BTRFS_SETGET_BITS(64)
      | ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from fs/btrfs/ctree.h:32,
                 from fs/btrfs/struct-funcs.c:8:
fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
   97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
      |               ^~~~~
In file included from include/linux/bvec.h:14,
                 from include/linux/blk_types.h:10,
                 from include/linux/genhd.h:19,
                 from include/linux/blkdev.h:8,
                 from fs/btrfs/disk-io.c:7:
fs/btrfs/disk-io.c: In function 'csum_tree_block':
fs/btrfs/disk-io.c:225:34: warning: array subscript 1 is above array bounds=
 of 'struct page *[1]' [-Warray-bounds]
  225 |   kaddr =3D page_address(buf->pages[i]);
      |                        ~~~~~~~~~~^~~
include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
 1627 | #define page_address(page) lowmem_page_address(page)
      |                                                ^~~~
In file included from fs/btrfs/ctree.h:32,
                 from fs/btrfs/disk-io.c:22:
fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
   97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
      |               ^~~~~

Introduced by commit

  8d7900f545f1 ("Makefile: Enable -Warray-bounds")

--=20
Cheers,
Stephen Rothwell

--Sig_/ZYMtYl+EaQ81t.y/0T093tr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDSZoUACgkQAVBC80lX
0Gyx3Qf+OfjsNPJXQRPtHo/tXL4MeLKOzhgDB+vJB6VlTo5JbfNPqoN74xv+owW4
Ov9zncHlTwekQzEfCcIOyDKE/hotaD7A9l69cAhkkqyhvmFzxK9jLv3WD9MVn797
DXL+DTBHTjvbHBFu2jRJ1E0qAPBJGUmIEkfxQrhA4IOtVSClFSoN6amqpk6wpFoV
sPVw/+c7iwIG7aBgPQ7FkgUDfqAqt1J2DKJWrLfhBcBk4WdLurwP7a83CTHpT2uS
ukZ77RWyKtdkCpRjEFllA4U20OuWiMHvn0uV/0C6r0ZjaS4A3lYRV9PenwgMujqS
VZkwfwN53nwQ/Cw61wu/O7DuuwpFWA==
=J+Ls
-----END PGP SIGNATURE-----

--Sig_/ZYMtYl+EaQ81t.y/0T093tr--
