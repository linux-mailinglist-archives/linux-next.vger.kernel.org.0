Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1216142031
	for <lists+linux-next@lfdr.de>; Sun, 19 Jan 2020 22:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728900AbgASVbl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Jan 2020 16:31:41 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:42557 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728797AbgASVbl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Jan 2020 16:31:41 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4817KR4Llbz9sR0;
        Mon, 20 Jan 2020 08:31:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579469499;
        bh=HrKARG+Nx/6d2ZPeK+akskvwbflADfwiRnJqqIjTYYE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VLgnFwqeJuLh9UVzYBDe4ic/6bUQ5jz/fCC38w/rfy0/+FnpiNAnqgP0STcqiSzUz
         0MDTKj9FXuCumh+3wqMXjEAKrMd9DSh2n34X7wA6IhdrIjXdk85jnKy69NmCxq7Gpj
         ItKVYW1jUfXVxVNWM7mybwc3dDDUkt7U2YuqB/vmvz6ngNIut8/D5i7p4p8uLmcXuX
         Q7Ws6jLimZ+674YXAxvMKKqW39lVmS+2VbDOFdY5zXCHg/0B+PCsZrENVVema3KYyn
         KfukQ2ZRe0RS5Gmi26KZ6lod9Y4tLZORYK+4C1v1pi7QcGr3+0ZmJGIc4IWEQt9I+0
         7k1DS/45orEnA==
Date:   Mon, 20 Jan 2020 08:31:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Russell King <linux@armlinux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: linux-next: build failure after merge of the arm tree
Message-ID: <20200120083135.5d90d410@canb.auug.org.au>
In-Reply-To: <20200120082447.7fea4d55@canb.auug.org.au>
References: <20200120082447.7fea4d55@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FeYr3_G2l2NG0hLi2v2lER6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/FeYr3_G2l2NG0hLi2v2lER6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 20 Jan 2020 08:24:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the arm tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:

In file included from scripts/dtc/libfdt/libfdt_env.h:12,
                 from arch/arm/boot/compressed/fdt_rw.c:6:
/usr/lib/gcc-cross/arm-linux-gnueabi/9/include/stdint.h:9:26: error: no inc=
lude path in which to search for stdint.h
    9 | # include_next <stdint.h>
      |                          ^
In file included from arch/arm/boot/compressed/fdt_rw.c:6:
scripts/dtc/libfdt/libfdt_env.h:13:10: fatal error: stdlib.h: No such file =
or directory
   13 | #include <stdlib.h>
      |          ^~~~~~~~~~
compilation terminated.
In file included from scripts/dtc/libfdt/libfdt_env.h:12,
                 from arch/arm/boot/compressed/fdt_ro.c:6:
/usr/lib/gcc-cross/arm-linux-gnueabi/9/include/stdint.h:9:26: error: no inc=
lude path in which to search for stdint.h
    9 | # include_next <stdint.h>
      |                          ^
In file included from arch/arm/boot/compressed/fdt_ro.c:6:
scripts/dtc/libfdt/libfdt_env.h:13:10: fatal error: stdlib.h: No such file =
or directory
   13 | #include <stdlib.h>
      |          ^~~~~~~~~~

> Caused by commit
>=20
>   e3a0e1427dcb ("ARM: 8953/1: decompressor: simplify libfdt builds")
>=20
> My arm builds are ppc64le hosted cross compiles using Debian's cross
> gcc package.
>=20
> I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/FeYr3_G2l2NG0hLi2v2lER6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4kyrcACgkQAVBC80lX
0GxF0wf+JppMiUxwSbMBZZPQwZi3ZN8e3RD0qoAISfasi+SEsrwnSEIC7gnMnBLB
t9xq0p/2FvHx4puhgm5AyqubdrAocxFLPxiNuPYjL9lzl1SZea9SJa2ArTFpE6Vl
mVTnWfPrDbAVNSpRUowtnteGJpQ3YS18V2zAIAc8yMfE7oK6woxreKnKzKJL0hf1
7u5U09jrJISSCLPqX1xPZnel02bde8EzQXnYSIWrFjqNDUSkFl4mNoKN/XM1a3Rk
M38ZKv4lQ+8IA5Ki+fDf/7AssxNBWzxJ+tAh/0yRHAgQu1oh1ytvlL3b2Ca3eXJh
qb+auoQdP50QVC59c028h931XcT/fg==
=vMIz
-----END PGP SIGNATURE-----

--Sig_/FeYr3_G2l2NG0hLi2v2lER6--
