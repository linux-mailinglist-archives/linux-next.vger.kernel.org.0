Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B975736AC51
	for <lists+linux-next@lfdr.de>; Mon, 26 Apr 2021 08:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231907AbhDZGmR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 02:42:17 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55367 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231982AbhDZGl7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Apr 2021 02:41:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FTFfN533Lz9rx6;
        Mon, 26 Apr 2021 16:41:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619419276;
        bh=0AxOggHXHiGbD7v1yfy2QAepkHj0cG22i3F0yBkVduw=;
        h=Date:From:To:Cc:Subject:From;
        b=FyeYh3dgm3fulGcgogKYSm0BRiZATiPrv0PfoJyynmyU61W3uAW09svrCDxS95Mp4
         a4NagP9GmT7jKNUL+x332coFWK86QWxQNk2LdnGMNvNUoVCchalw8zCwxJAR9Z9X7l
         GPW7yiRwFRa94VuKIzkQ/VFU7onDgCRO70cU73DRrdRXXryg7rLySXs03WJuS4WNs6
         qpHCswfTxdtyyRoO6EaRlzXdIofYPT1eshj7xXPPGbLjtz0ezF8SGA+F9JqPHVaCp0
         kvrgMVvHOKAXUdp+Yrw1FrIP8KPoU6TX7avdiJYB4J4lC/kCTg65Blri4wpAigTfFG
         FitNGsgBf7P8w==
Date:   Mon, 26 Apr 2021 16:41:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 26
Message-ID: <20210426164115.25b9fe5b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8gQI1vqel/W=A5ivvS4jl=o";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8gQI1vqel/W=A5ivvS4jl=o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210423:

This tree fails a qemu boot test of the Powerpc pseries_le_defconfig
build.

I skipped the inter tree build test today, so there may be some
undetected build failures if the trees are interdependent.

The net-next tree gained a conflict against the kbuild tree.

The kspp tree gained a conflict against the arm64 tree.

Non-merge commits (relative to Linus' tree): 13879
 11788 files changed, 658252 insertions(+), 288053 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log
files in the Next directory.  Between each merge, the tree was built
with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
multi_v7_defconfig for arm and a native build of tools/perf. After
the final fixups (if any), I do an x86_64 modules_install followed by
builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
and sparc64 defconfig and htmldocs. And finally, a simple boot test
of the powerpc pseries_le_defconfig kernel in qemu (with and without
kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 341 trees (counting Linus' and 89 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.



--=20
Cheers,
Stephen Rothwell

--Sig_/8gQI1vqel/W=A5ivvS4jl=o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCGYIsACgkQAVBC80lX
0Gz4MAgAlZbzj3ACwEEHwQp/CkP+3Pl0ViDyy8X7AGlUrrF3Zc++P4g2IbSWmCbp
ckGy3TlchfpBeXJTA4cBomtL2IbgwKnsxnpSOSELdzLxEoorejQbOw2E7spr+mqq
CPM8jlqLY1g3y2B7x0wPApjzn+ZG8Ku9Lopja77iqcb617y8BKIWhsKpeJW3JP3c
X1uhb4XmCWKoLAJEbP7KioWwCiEUMADtZ+jIG3r/hPXi1N/xxACzZYQlf7ocOU+8
kbhE3DnsDMYwP+/4s5j6lrfr95tfizJt9fSp9jnUVIZcq0wlxzTmw5VTnYRsPR1a
ixW1SF/VzGNUiAQHSKpM1YND/OzvFA==
=/vFN
-----END PGP SIGNATURE-----

--Sig_/8gQI1vqel/W=A5ivvS4jl=o--
