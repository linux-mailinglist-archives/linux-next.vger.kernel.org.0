Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A87C614E6BE
	for <lists+linux-next@lfdr.de>; Fri, 31 Jan 2020 01:53:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727614AbgAaAxI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jan 2020 19:53:08 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:34397 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727610AbgAaAxI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Jan 2020 19:53:08 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 487zGn5383z9sPJ;
        Fri, 31 Jan 2020 11:53:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580431985;
        bh=tQpCwkuTsBT6GX2RXLpR6mTgUiYzF/1t2PDjxgVBBUw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YtIFHFD4ijouM5KgWvPoY9hTWlP7Ea972yTMRB2y1N0O3wTDiJqFNNgpmrmvItVmv
         b2MgAYly507OhhwrPiH1ydbR3+yTOazAT4oN1ySCG/27ufSYas/Khbh2/IgOXRR/7C
         x5px6qol24XipIyyfcKv1jnn7sOSyiPcno048YhCxXK0xFYoyy8IXfD4FvWXxwoJUR
         y1zF7Zn3XN0LWczlxVbUPGbHbBCu+hdG/txo5vJyd3AANQcP/+0yExEwX04DRjYKTE
         M3hD5PXMN39NWatSTFLY9Ub93tHuL9h4jmKVSyFpc5RhFM4605FyXqO5xhk2kh/qmd
         drT/Ps7ksKtSQ==
Date:   Fri, 31 Jan 2020 11:53:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Christian Brauner <christian@brauner.io>,
        Al Viro <viro@ZenIV.linux.org.uk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sargun Dhillon <sargun@sargun.me>,
        Aleksa Sarai <cyphar@cyphar.com>,
        Kars de Jong <jongk@linux-m68k.org>
Subject: Re: linux-next: manual merge of the pidfd tree with the m68k, vfs
 and keys trees
Message-ID: <20200131115305.2e3bf8b1@canb.auug.org.au>
In-Reply-To: <20200131113422.12e4aabd@canb.auug.org.au>
References: <20200113160252.7003c102@canb.auug.org.au>
        <20200131113422.12e4aabd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KhTAWzuyVcpAAXHynZEi1G2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KhTAWzuyVcpAAXHynZEi1G2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 31 Jan 2020 11:34:22 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> On Mon, 13 Jan 2020 16:02:52 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the pidfd tree got conflicts in:
> >=20
> >   arch/alpha/kernel/syscalls/syscall.tbl
> >   arch/arm/tools/syscall.tbl
> >   arch/arm64/include/asm/unistd.h
> >   arch/arm64/include/asm/unistd32.h
> >   arch/ia64/kernel/syscalls/syscall.tbl
> >   arch/m68k/kernel/syscalls/syscall.tbl
> >   arch/microblaze/kernel/syscalls/syscall.tbl
> >   arch/mips/kernel/syscalls/syscall_n32.tbl
> >   arch/mips/kernel/syscalls/syscall_n64.tbl
> >   arch/mips/kernel/syscalls/syscall_o32.tbl
> >   arch/parisc/kernel/syscalls/syscall.tbl
> >   arch/powerpc/kernel/syscalls/syscall.tbl
> >   arch/s390/kernel/syscalls/syscall.tbl
> >   arch/sh/kernel/syscalls/syscall.tbl
> >   arch/sparc/kernel/syscalls/syscall.tbl
> >   arch/x86/entry/syscalls/syscall_32.tbl
> >   arch/x86/entry/syscalls/syscall_64.tbl
> >   arch/xtensa/kernel/syscalls/syscall.tbl
> >   include/linux/syscalls.h
> >   include/uapi/asm-generic/unistd.h
> >=20
> > between commits:
> >=20
> >   e8bb2a2a1d51 ("m68k: Wire up clone3() syscall")
> >   0a51692d49ec ("open: introduce openat2(2) syscall")
> >   3a92c6e49c47 ("Add a general, global device notification watch list")
> >=20
> > from the m68k, vfs and keys trees and commit:
> >=20
> >   27063d9f5fbf ("arch: wire up pidfd_getfd syscall")
> >=20
> > from the pidfd tree.
> >=20
>=20
> This is now a conflict between the vfs, keys and Linus' tree.

Actually, this is just a conflict between the keys tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/KhTAWzuyVcpAAXHynZEi1G2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4zenEACgkQAVBC80lX
0GwhbggAnPBJUFb/m0DyhFu+creq2+XC5IEcNYBncEMpFulSmryRIgUgbTUDa38A
dCN1+7bi//VOkspqYQwcpfJkL/gKSW/dKa6lsm6ij33DcA9CwOpcKDde337WulMZ
KY/F+iZzz+ZCkPxjU7dQBYa+Bq43gOcI0ywJC6P+bzpqzbhRpL1uBsiueVcblRiE
aPwePSp1lqlQBXnlkb1DgXbmKYvHZmLXJhaGzp9qQvyaUyvxYdsXbvjAGCfE8OXs
hBUWyoNhc8DjCzFJ2bgK/hnMkbx4/d2qiuCH3kEMdbVKBRU18r3fagf89Byb6Z9h
hG77geIwgFjBmIwHx2tsROzIUW4H/Q==
=zy3I
-----END PGP SIGNATURE-----

--Sig_/KhTAWzuyVcpAAXHynZEi1G2--
