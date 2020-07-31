Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0C7233E15
	for <lists+linux-next@lfdr.de>; Fri, 31 Jul 2020 06:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgGaEIr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 31 Jul 2020 00:08:47 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39795 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725800AbgGaEIq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 31 Jul 2020 00:08:46 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHv0W6WxYz9sT6;
        Fri, 31 Jul 2020 14:08:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596168524;
        bh=uZwB7cpno5aYy/Lsh0yh9DPvAz94bXB5ET6Cu6Xj7Aw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rpiunZ1PjFCOeawWBhnTF8wgHD2oEDlHD4H+UYoK9GLNi6wA3zggNCaKZrG2gyvvc
         /forncdGrvIbrdyObNLJHRX72+9xB/ps4BfYbpCsw1+UaibdEH5jdcaN6NGXnHTJW6
         Yhx45C8lNSzL1HsMR68p2TNIRZSb5IqFQAR+dyA5Z/+PnXivxuLcBnbRovVmT9SFx4
         bS5vL8PUlIk62Bjkt/ahQW2kliHwvXZCxWitcs8Fz1lPyHDMz+AY5DCIADOyOKK93d
         0X+1wEA5OtQ1Y3vRBkCQpy7aAI1UV8WdJ3T+o9Z/Fr0g55W9VCxIlfefOguOIk7Doy
         K/nPm8R/a/Y5A==
Date:   Fri, 31 Jul 2020 14:08:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shaokun Zhang <zhangshaokun@hisilicon.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: linux-next: Tree for Jul 30 [build failure on arm64]
Message-ID: <20200731140842.46abe589@canb.auug.org.au>
In-Reply-To: <72b073ba-ee41-1a1c-ce6c-ffd8b5936b09@hisilicon.com>
References: <20200730214659.0fbfdfc4@canb.auug.org.au>
        <72b073ba-ee41-1a1c-ce6c-ffd8b5936b09@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1sV7_S0uZ6QJUDIPXYW/iz1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1sV7_S0uZ6QJUDIPXYW/iz1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 31 Jul 2020 10:46:52 +0800 Shaokun Zhang <zhangshaokun@hisilicon.co=
m> wrote:
>
> There's a build failure on arm64:
>=20
> In file included from ./include/linux/compat.h:17:0,
>                  from ./arch/arm64/include/asm/stat.h:13,
>                  from ./include/linux/stat.h:6,
>                  from ./include/linux/sysfs.h:22,
>                  from ./include/linux/kobject.h:20,
>                  from ./include/linux/of.h:17,
>                  from ./include/linux/irqdomain.h:35,
>                  from ./include/linux/acpi.h:13,
>                  from ./include/acpi/apei.h:9,
>                  from ./include/acpi/ghes.h:5,
>                  from ./include/linux/arm_sdei.h:8,
>                  from arch/arm64/kernel/asm-offsets.c:10:
> ./include/linux/fs.h: In function =E2=80=98vfs_whiteout=E2=80=99:
> ./include/linux/fs.h:1709:32: error: =E2=80=98S_IFCHR=E2=80=99 undeclared=
 (first use in this function)
>   return vfs_mknod(dir, dentry, S_IFCHR | WHITEOUT_MODE, WHITEOUT_DEV);
>                                 ^
> ./include/linux/fs.h:1709:32: note: each undeclared identifier is reporte=
d only once for each
> function it appears in
> ./include/linux/fs.h: At top level:
> ./include/linux/fs.h:1855:46: warning: =E2=80=98struct kstat=E2=80=99 dec=
lared inside parameter list
>   int (*getattr) (const struct path *, struct kstat *, u32, unsigned int);
>                                               ^
> ./include/linux/fs.h:1855:46: warning: its scope is only this definition =
or declaration, which is
> probably not what you want
> ./include/linux/fs.h: In function =E2=80=98__mandatory_lock=E2=80=99:
> ./include/linux/fs.h:2325:25: error: =E2=80=98S_ISGID=E2=80=99 undeclared=
 (first use in this function)
>   return (ino->i_mode & (S_ISGID | S_IXGRP)) =3D=3D S_ISGID;
>                          ^
> ./include/linux/fs.h:2325:35: error: =E2=80=98S_IXGRP=E2=80=99 undeclared=
 (first use in this function)
>   return (ino->i_mode & (S_ISGID | S_IXGRP)) =3D=3D S_ISGID;
>                                    ^
> ./include/linux/fs.h: In function =E2=80=98invalidate_remote_inode=E2=80=
=99:
> ./include/linux/fs.h:2588:6: error: implicit declaration of function =E2=
=80=98S_ISREG=E2=80=99
> [-Werror=3Dimplicit-function-declaration]
>   if (S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode) ||
>       ^
> ./include/linux/fs.h:2588:32: error: implicit declaration of function =E2=
=80=98S_ISDIR=E2=80=99
> [-Werror=3Dimplicit-function-declaration]
>   if (S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode) ||
>                                 ^
> ./include/linux/fs.h:2589:6: error: implicit declaration of function =E2=
=80=98S_ISLNK=E2=80=99
> [-Werror=3Dimplicit-function-declaration]
>       S_ISLNK(inode->i_mode))
>       ^
> ./include/linux/fs.h: In function =E2=80=98execute_ok=E2=80=99:
> ./include/linux/fs.h:2768:26: error: =E2=80=98S_IXUGO=E2=80=99 undeclared=
 (first use in this function)
>   return (inode->i_mode & S_IXUGO) || S_ISDIR(inode->i_mode);

Presumably caused by commit

  b902bfb3f0e9 ("arm64: stop using <asm/compat.h> directly")

--=20
Cheers,
Stephen Rothwell

--Sig_/1sV7_S0uZ6QJUDIPXYW/iz1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8jmUoACgkQAVBC80lX
0Gxu6wf/a6ZYNxY/5WSq7usFT3Yb8PAd4e3R+k2APABluKXQn8dts9wrL3vMVUvk
HIjjuIYkDhmWad7P+Yuq7R2dFb2Z6DWL8GYfKWjT/aEGSoVE4gr8Gwry7/HZQnHx
mY+wfOAGs7fFKxmkPKSdFJeJ0wX/On7ogIH49Mo2V9VQ57IEpspQbclE6LFFwk4l
yLJbvYV86FnGNCIHmB3nZiarPZzAQNFfImBbIDmXq/FIgXH+XkuIj7JMHAD0P/dC
cJPK1/bbiMKEj/dP8NqQjkmfSUsk29Ob7/UFTcVVo83PCbv7MSl4Okic14Q+Whqj
YRoqxbE27JfCy/5hBK+vkQoxS3pZiA==
=xJ8k
-----END PGP SIGNATURE-----

--Sig_/1sV7_S0uZ6QJUDIPXYW/iz1--
