Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78DBE44A4FF
	for <lists+linux-next@lfdr.de>; Tue,  9 Nov 2021 03:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241962AbhKIC5h (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Nov 2021 21:57:37 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:44615 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241851AbhKIC5h (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Nov 2021 21:57:37 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HpCJB5xLfz4xbc;
        Tue,  9 Nov 2021 13:54:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636426491;
        bh=m3n4SZ2AeXrmHfnoBmehErFqI2ep2xaDpWSaCp85/NQ=;
        h=Date:From:To:Cc:Subject:From;
        b=W2PRUdgjLSQXUUEr5dltFKjJx62L+JT2qVX4ONIM0cZK8jYwaUN6ds/ziQvbJygW7
         2yT+XoRDE113WdRPwi4YAInnCN9ZWTfS2k4uY5mOFb1UkPYM86S74GGF5M+SObT5b8
         CZfjaJFQuhNr4mY/k1Xl8azIaJv48HsKoKQ0mJghcgc24mzuB/Gm73TpD5434M68Jr
         SFhBITfEsQkEC9xIzHFvoqVJqA8JfEbU2zWDM0wCDmG2uZYQMInSgpdC1T6AHBZegv
         WcPFGMzNVS55Q5/7uMCrm+YLUOhFpVn2MnjTTxHJQ1rmTlwoRPDsbKoVCbPhfRb8uT
         uso8cdJmhC9pg==
Date:   Tue, 9 Nov 2021 13:54:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 9
Message-ID: <20211109135449.7850eac3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.SpnMY001_+kG4vrK2tn7jp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.SpnMY001_+kG4vrK2tn7jp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20211108:

I have disabled the ntfs file system write capabaility for now as it
fails for builds with 64k pages.

Non-merge commits (relative to Linus' tree): 1449
 1738 files changed, 88873 insertions(+), 34366 deletions(-)

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

I am currently merging 343 trees (counting Linus' and 92 trees of bug
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

--Sig_/.SpnMY001_+kG4vrK2tn7jp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGJ4vkACgkQAVBC80lX
0GwbFQf+M7sy/wgbgJ5hUZ7pc+p492GqgEvlLqoT6i30elXi37C2Qdtgrx6kt5nM
Q4ZQq84u/LwF0FLvwkvGKVMVQ41aQk1N5/fyF2+gAHxa87zmdZPHFNfc3KBUTsYK
h9u/iHjqh9hVtC9VBd7P0ERJqGY9hsbBmKk+F+fbVGNFEFYdP9xX/HUPcYi3HZ3x
6anVwYxIEQqc2G/ZLaYYTTlQk9mU6htqgHuj62hMkR+b2W78Zs2VhBT3NFlcAXax
yjPm472svQX3QivfhpcFs5VyzMrv8xAwHZ5amV/+mwqIhH5AsdnwIySYSF+18Uy1
OyUaCz+QzvPzS2tjk50fuPeFDLWQDA==
=/iWi
-----END PGP SIGNATURE-----

--Sig_/.SpnMY001_+kG4vrK2tn7jp--
