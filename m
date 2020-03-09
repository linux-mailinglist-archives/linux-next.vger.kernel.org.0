Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5897317EC5D
	for <lists+linux-next@lfdr.de>; Mon,  9 Mar 2020 23:59:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgCIW7W (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Mar 2020 18:59:22 -0400
Received: from ozlabs.org ([203.11.71.1]:36845 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726536AbgCIW7W (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Mar 2020 18:59:22 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48btvW4YyRz9sPJ;
        Tue, 10 Mar 2020 09:59:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583794760;
        bh=206rIbkp0C/1Ogfui2ffVjFpvbdu0zvMFzur9BTxmis=;
        h=Date:From:To:Cc:Subject:From;
        b=KL0cHZS1CHJrnpydDUzSv+aZO234X7kPD9BBh4vKBn2nGlncweo5Fz0QTjScDjYnG
         st6l0WXtJWNVQWk/ri+oWWAu9EJ0arvZopaua3/XRZQlMUlXT78VbEWph+hezrT1aA
         byXy30GsiySgmsxBSwvRpyp2G6+IEqESd9Zfl/LF/+60ChIWPCb4Wk+vqwZfaeMYBB
         sTLlTLXy499jrUmwMTp/9OpXmZSPk1gneV+Dkbkl2pdAFSZsM3746Cry9UmqIjMW60
         5uze4UAw+ief5KjguJKTmG+J+DM5m7BljWLNrSlfMs+37/oqYuHtBh4qDP8h+Y1Odi
         vWEpwy+XEvUlg==
Date:   Tue, 10 Mar 2020 09:59:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Namjae Jeon <namjae.jeon@samsung.com>,
        Sungjong Seo <sj1557.seo@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: build warning after merge of the vfs tree
Message-ID: <20200310095918.3ea6432f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/knfUsg6=EcD246GvZQuo23u";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/knfUsg6=EcD246GvZQuo23u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

warning: same module names found:
  fs/exfat/exfat.ko
  drivers/staging/exfat/exfat.ko

Introduced by commit

  b9d1e2e6265f ("exfat: add Kconfig and Makefile")

and not fixed by commit

  1a3c0509ce83 ("staging: exfat: make staging/exfat and fs/exfat mutually e=
xclusive")

$ grep EXFAT .config
CONFIG_STAGING_EXFAT_FS=3Dm
CONFIG_STAGING_EXFAT_DISCARD=3Dy
CONFIG_STAGING_EXFAT_DELAYED_SYNC=3Dy
CONFIG_STAGING_EXFAT_KERNEL_DEBUG=3Dy
CONFIG_STAGING_EXFAT_DEBUG_MSG=3Dy
CONFIG_STAGING_EXFAT_DEFAULT_CODEPAGE=3D437
CONFIG_STAGING_EXFAT_DEFAULT_IOCHARSET=3D"utf8"
# DOS/FAT/EXFAT/NT Filesystems
CONFIG_EXFAT_FS=3Dm
CONFIG_EXFAT_DEFAULT_IOCHARSET=3D"utf8"
# end of DOS/FAT/EXFAT/NT Filesystems

--=20
Cheers,
Stephen Rothwell

--Sig_/knfUsg6=EcD246GvZQuo23u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5mykYACgkQAVBC80lX
0GzkhQf/exGVw+61mho1oNpxk0lkPhRIPu1I+ySRrOBDnt9vf3ltuv3S1ZTyQiA/
NAAp15Shp3oe99nvLX5Hr709QdTxdvjbEC74aekJtglpUNUfXyoP5fcwplGgAZ1Y
W9rNhapWVjcIozUnVrynTgp4joVv1MzvmjXDKH+pPHA6ndYe/4dw+VoApupldasE
08zMQ3wC7TWwjO7vjzp7L0M5Zkv2Mj9v2vX68ZErjGMkHDer2E46SIOXPu52lMhY
e2zi2VQdG0/kq679dB0kdnsnStXzdO+NonbCKfuk8bxLpTCfeAwpCqTwvXIkDG1A
54ax7ZOZ2c/L4EPt2GYbERvHeSEwmg==
=e7uC
-----END PGP SIGNATURE-----

--Sig_/knfUsg6=EcD246GvZQuo23u--
