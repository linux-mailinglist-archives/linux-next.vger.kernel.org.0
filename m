Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A334438C68
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 00:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhJXWkh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Oct 2021 18:40:37 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:48153 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbhJXWkh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Oct 2021 18:40:37 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HctK264Prz4xbq;
        Mon, 25 Oct 2021 09:38:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635115095;
        bh=5iZRxm9m7KKCNHMgdbd+SSNHi4HFhNBkGWU4Bz/Oiaw=;
        h=Date:From:To:Cc:Subject:From;
        b=K/VT6KCbHRJE3czFELyRJoTRXcMmG1u7LF3FhJ1bLAnSsCl0cYaa5JMM5rvTbbO5y
         I8PZoovtJK+mXOHllEiGai3rZ2lpK7tzAs3cZ4rpq/bGPhaScc9TDuyfKy6frQHJiH
         UflkH1dGdFmJyKPQagfTIFI3rjOz4EhTIe2IAiULRZfkt5Sb4wRD7oJjO+9cNHYcAq
         1s10mAatYQhzP0Lh6bVr3gU6GHHEmNSnN5VGPYqJeM59YrNnxMdBj7ESZVTWP1WhQd
         gcM9Jg4f/Xy38H1u98jy4lLZiFAJUAy5nz1IcTnfNqO8B3lzLI7iCPD5UUiwIcPTEG
         TZp4s8Y87N+8A==
Date:   Mon, 25 Oct 2021 09:38:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greentime Hu <green.hu@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the nds32 tree with the kbuild tree
Message-ID: <20211025093813.2ebe9212@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Vzx/FKXUIe6PRUhvJznJGyJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Vzx/FKXUIe6PRUhvJznJGyJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nds32 tree got a conflict in:

  arch/nds32/Kbuild

between commit:

  8212f8986d31 ("kbuild: use more subdir- for visiting subdirectories while=
 cleaning")

from the kbuild tree and commit:

  37160f01e8ea ("nds32: move core-y in arch/nds32/Makefile to arch/nds32/Kb=
uild")

from the nds32 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/nds32/Kbuild
index 4e39f7abdeb6,565b9bc3c9db..000000000000
--- a/arch/nds32/Kbuild
+++ b/arch/nds32/Kbuild
@@@ -1,4 -1,4 +1,7 @@@
  # SPDX-License-Identifier: GPL-2.0-only
+ obj-y			+=3D kernel/ mm/
+ obj-$(CONFIG_FPU)	+=3D math-emu/
+ obj-y			+=3D boot/dts/
 +
 +# for cleaning
 +subdir- +=3D boot

--Sig_/Vzx/FKXUIe6PRUhvJznJGyJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF14FYACgkQAVBC80lX
0Gwb3ggAoydPISnxwJTSLvh6g+BseXmuHVJhX530073sS+XqIGMvVTcN4lJ1vvbL
VH2Gb3bom/HdJqWBhZQfum2TsJLozQliQJHr8OVZG6o6DSVLEQIZlhP+uvGsQOii
JNavKG8b/UVbb6k07JR8kL1Pa/+OfdE8aTmKH8enLvMWduaoXHfeP16/ykTJmr2H
1+BoPK0TZX6t5G8AK50xm4uSCZewMLPw0vQR1eMlvWaujxFWAocvoJ1zDi9jF9ln
qB38StT/8nsnKBMZhB5SO35r3xK5/L6XqmDMxsmXI/38fUGuyJa08FiB4+2fMxOp
b9yR0oTZZpSjBe3MNNOOeO5sDQCWgg==
=JaUe
-----END PGP SIGNATURE-----

--Sig_/Vzx/FKXUIe6PRUhvJznJGyJ--
