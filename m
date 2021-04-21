Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357383675D1
	for <lists+linux-next@lfdr.de>; Thu, 22 Apr 2021 01:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343728AbhDUXkL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Apr 2021 19:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240975AbhDUXkL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Apr 2021 19:40:11 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935CCC06174A;
        Wed, 21 Apr 2021 16:39:37 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQcTd0htvz9sSC;
        Thu, 22 Apr 2021 09:39:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619048374;
        bh=qJoGTGye6paMArGsdMr9r00+gDOyhQrqidc2GC/7au4=;
        h=Date:From:To:Cc:Subject:From;
        b=Sij2kZHz/kmk5NrWcCyFuDehImtKyic8Gj2S7VWO6ccqhG9TOcPOvowPTdfsU67ug
         sjLWQ9AjRGCxfus1rl8cBV8bvSHzWgLllgSFKHUgSCS+dmbmwIkYviheaE3tlAw3ml
         pIqE4Sc468/S+DFdCw/M2V82uuBTSE/s9MK2lyjgyyGL+rfuqMYc1hW1W0pCW3imPs
         479jmAfz47+TtU9++VxGcHD157dY4cBzjqq0TscsObzEuwD6I+qabIe+rK69QobIV6
         KE+NUqGUek6tTfFT3lJE+gHFHfZtroGhsG9TFtBzPP7dOjXvHgLcKWdYco0C0aBCAm
         zjgf+52xman/A==
Date:   Thu, 22 Apr 2021 09:39:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>, Guo Ren <ren_guo@c-sky.com>
Cc:     Guo Ren <guoren@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs tree with the csky tree
Message-ID: <20210422093931.620a6a05@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cSembKQCKlscaq7IaoEc54r";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cSembKQCKlscaq7IaoEc54r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  arch/csky/include/asm/uaccess.h

between commit:

  d3900e8d918f ("csky: uaccess.h: Coding convention with asm generic")

from the csky tree and commit:

  a0d8d552783b ("whack-a-mole: kill strlen_user() (again)")

from the vfs tree.

I fixed it up (I just used the former version (which also removed
strlen_user) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/cSembKQCKlscaq7IaoEc54r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCAt7MACgkQAVBC80lX
0Gw7hwf+NX6uod2J+qFdTE/2Mw1lsF3b8hAbgOY8HmFsvEbvdt4XI2l0nck6/jiL
yJLiJ4KbIMYeStiO5l3zd0iHPzeJ4qMIbBmVIaAZ1xmrjqGoeCgCgeXxdzBv9SBy
0B70EXdZ8aPI6cXp/O6omAxLWOnZzvft0Kbr0CYva8oxGpi4iIRojDhG394/Izme
/knyxS5+e2YaIZhpkoTb9T8+jT/Ed4Iap+t4ksGllXdIOa7rvW7JD5pflL0kAyCz
cVIPz4PKdhQlkiBiDEgDxeSWL8r3bSb1+hDUf+OobFlsV/NS5bHGPVcipRb2MHqE
2X/IcC8Bl3y/yEJyHNvWxSYKWC+t0w==
=tz87
-----END PGP SIGNATURE-----

--Sig_/cSembKQCKlscaq7IaoEc54r--
