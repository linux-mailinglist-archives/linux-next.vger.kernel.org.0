Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 347B023C5DB
	for <lists+linux-next@lfdr.de>; Wed,  5 Aug 2020 08:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgHEGcu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Aug 2020 02:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbgHEGct (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 5 Aug 2020 02:32:49 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA5CC06174A;
        Tue,  4 Aug 2020 23:32:49 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BM1yR38vWz9sRK;
        Wed,  5 Aug 2020 16:32:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596609167;
        bh=pPI7gCgrBz7AyUXYoBTt1dPlJ+UPryDQtNyUOo0kzBE=;
        h=Date:From:To:Cc:Subject:From;
        b=V022I0oiNIdRxouV0DOkDZmA6kqsm6k9i41tuhjoYGvVnWDaYUfLxWWWbKGqqasZ8
         SpByg9VwBUTZ1xY0DZ905EleDGw4dleOqiYsT17S9Vg8pR0FREXG4QG68TFPZkCebI
         8bCN0I+U1K34gzJDYfcJXGQkXOMGefDkxViWBJ3gK9aUdV7xrxmvnq/oZtSuD/lFre
         nsbMnOk+X4qTWs19b45Z7I9KyGwx01GikcCtpHWaGEj5KnHQzbCsinpRwLCyeDMzGh
         wQPBN3OEENDAbHSseM5qt1ngG1fbaEVWI77avDRteAOTb6xfiG/NgUVP2iQkUSl4v4
         LfTbnBa0xaT6g==
Date:   Wed, 5 Aug 2020 16:32:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the fsinfo tree with the kbuid tree
Message-ID: <20200805163246.4df09c31@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AkSKNCgqLbvRaMW+eA8Jnfd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AkSKNCgqLbvRaMW+eA8Jnfd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fsinfo tree got a conflict in:

  samples/vfs/Makefile

between commit:

  2f95ada7fe22 ("kbuild: introduce hostprogs-always-y and userprogs-always-=
y")

from the kbuid tree and commits:

  7e786dee0b78 ("fsinfo: Add fsinfo() syscall to query filesystem informati=
on")
  96f310048fba ("fsinfo: sample: Mount listing program")

from the fsinfo tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc samples/vfs/Makefile
index 6377a678134a,7bcdd7a2829e..000000000000
--- a/samples/vfs/Makefile
+++ b/samples/vfs/Makefile
@@@ -1,4 -1,9 +1,4 @@@
  # SPDX-License-Identifier: GPL-2.0-only
- userprogs-always-y +=3D test-fsmount test-statx
 -userprogs :=3D \
 -	test-fsinfo \
 -	test-fsmount \
 -	test-mntinfo \
 -	test-statx
 -always-y :=3D $(userprogs)
++userprogs-always-y +=3D test-fsinfo test-fsmount test-mntinfo test-statx
 =20
  userccflags +=3D -I usr/include

--Sig_/AkSKNCgqLbvRaMW+eA8Jnfd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8qUo4ACgkQAVBC80lX
0Gwh1gf/XqiMggfMTJGmd3Qv/6RD36/5Bo/q2gzNsAWK5DTkvAj5bDIbh9SRxRa1
lAUaJ2f3knhAFeb60ocqVDjcgNMc7A/lJXl2RBl0WGfnf+ZWm1hlcZr0JG/A8Byj
JY5oNtGx0lcXL7farCYje7o05r16GDm/HO3JdncBkfrDwcOgMhRnO0gKFlQAP1ik
aSJMcQLrfd3Ri6DjTUnMYMSF6UlAlc+4ZR0W8lWiM+eF8/N+lvj9Hm6FkWIEBmuB
gs+aknwnvWrBBAMKHMFZcDgXXNVEbHbmwXo2nV+0kCrmj2mQICWS9MVG1rVdIHtw
s0613fru+DmECtRHvp/xAlBPfNwfaw==
=O7Ml
-----END PGP SIGNATURE-----

--Sig_/AkSKNCgqLbvRaMW+eA8Jnfd--
