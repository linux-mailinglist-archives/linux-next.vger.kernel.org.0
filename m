Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13CEF36D1FF
	for <lists+linux-next@lfdr.de>; Wed, 28 Apr 2021 08:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235964AbhD1GGP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Apr 2021 02:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbhD1GGO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Apr 2021 02:06:14 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1483C061574;
        Tue, 27 Apr 2021 23:05:25 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FVSm22Z10z9sRf;
        Wed, 28 Apr 2021 16:05:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619589922;
        bh=06hnP6Imq2yF0KGgC487R8DM2rO28hw2Z0y+q5/X1FY=;
        h=Date:From:To:Cc:Subject:From;
        b=MNHQaixPqX5uwoeoVz+3tHKHGiq0Genz3l/QLcKebMXtNtIGtabSVbAcZ9e8Sbmfg
         1dS7LwgRQ9rDz157Hp1Wy8881eHNLZYOsQYuN8Wm7LruCajY7k4SMGdRiM8GDXt+TB
         onMiohI+KQILetBvRh/Lqj3PPMZvOK5GCHhWQ6OvQIV1SgboZ+XseBpsGXDaKHwZmB
         iImFxXUsVycmYrx95KZAchAwrBwtA/D1F6ueFPDfKyBoSVRcwEN6lvhWidGw+J8f9x
         auYhb2a88p9sCZ+K9QxPxqLeJKpw9+HAiMhr3r0viNPvLEWTqj6bc1oFDODLLM6HS8
         kJ02CJmdKQQOQ==
Date:   Wed, 28 Apr 2021 16:05:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 28
Message-ID: <20210428160519.4e964078@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l0Z8WQ49e8nyfZpwJxiy+bc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/l0Z8WQ49e8nyfZpwJxiy+bc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Please do not add any v5.14 material to your linux-next included branches
until after v5.13-rc1 has been released.

Hi all,

Changes since 20210427:

Non-merge commits (relative to Linus' tree): 9924
 8404 files changed, 536975 insertions(+), 201587 deletions(-)

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

--Sig_/l0Z8WQ49e8nyfZpwJxiy+bc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCI+x8ACgkQAVBC80lX
0GwBwwf/QB48UYa4S5vtKJwDsVxWiAtSJhna+eMPjoTQvGmXjes0w6BEDRri9fCo
CJyNd0B42Ce9hjnEjvVHjBMAiDLCGXRLBlc+OeKicR4w1pffQwE07yjOoFeci6qs
STYXZYAxC2cErDQ+RVEnFZRbMgRaOSIhbY/UACJICjzQ2wHmQj9zEf8dW8Yq0jso
LlPOGqM6JA4xRdHxpTJge9ZWL8dhDbqs5PImNzx+06PEtTl2FfUCk0moB5IaR4HT
xbp3mCegjXyRr5SuHDvs2zOe1iqeiCBRj1VnEMV76cle1ZOdK7eZVtbAwjkusoQc
N1hj/b1v02xBlMSEala7qaf6hi8AEg==
=9kg+
-----END PGP SIGNATURE-----

--Sig_/l0Z8WQ49e8nyfZpwJxiy+bc--
