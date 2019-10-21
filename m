Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDFEBDF80D
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2019 00:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730203AbfJUWf1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 18:35:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41833 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729620AbfJUWf1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Oct 2019 18:35:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46xs0P6DhKz9sNx;
        Tue, 22 Oct 2019 09:35:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571697324;
        bh=mWwMU/9afAxY94ma+WI7D78i4ILv7tb5kzG4pD4tg5I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NSXU+gzwt+tayzDS06y1MWmNgE5tcmk8TyT6woIw7h4dXu+3PSdvC7PlM1uVjD6sn
         gWIeJOjcjJbPAB7Bbdjlev4l6oIKaMwEpg0VrSLFKH1qhyL/BkOclSWMlFdkJnO4SZ
         hEzlIkF9p86Ot8ZcxxpEwW7KhEhrspuiLDOJGm08SLB1b8poL4CjmvfptBUeqHcBM1
         TgBlMS70rNzVwtWTmiYx0O2lPpAGDw7ZsgGtrLF1/n3DdsX/49rRPuw4QDr8wR2rxt
         H9SN+iyuH5GxSIyrSI/qR5QAKd1i7KkjpatoSjNg+unc+RLTm66eb+NAbB/LGFL7nv
         ttOsJuu1xMOQw==
Date:   Tue, 22 Oct 2019 09:35:12 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guillem Jover <guillem@hadrons.org>
Subject: linux-next: build warning after merge of the vfs-fixes tree
Message-ID: <20191022093512.4317a715@canb.auug.org.au>
In-Reply-To: <20191022080734.41955464@canb.auug.org.au>
References: <20191022080734.41955464@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+MnaRVg7=hrPm6q/bC3wrLW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+MnaRVg7=hrPm6q/bC3wrLW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[Some people didn't get this due to a typo]

This should have been reported against the vfs-fixes tree, sorry.

On Tue, 22 Oct 2019 08:07:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm-misc-fixes tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
>=20
> In file included from include/uapi/linux/posix_types.h:5,
>                  from include/uapi/linux/types.h:14,
>                  from include/linux/types.h:6,
>                  from include/linux/limits.h:6,
>                  from include/linux/kernel.h:7,
>                  from fs/aio.c:14:
> fs/aio.c: In function '__do_compat_sys_io_pgetevents':
> include/linux/stddef.h:8:14: warning: initialization of 'unsigned int' fr=
om 'void *' makes integer from pointer without a cast [-Wint-conversion]
>     8 | #define NULL ((void *)0)
>       |              ^
> fs/aio.c:2196:38: note: in expansion of macro 'NULL'
>  2196 |  struct __compat_aio_sigset ksig =3D { NULL, };
>       |                                      ^~~~
> include/linux/stddef.h:8:14: note: (near initialization for 'ksig.sigmask=
')
>     8 | #define NULL ((void *)0)
>       |              ^
> fs/aio.c:2196:38: note: in expansion of macro 'NULL'
>  2196 |  struct __compat_aio_sigset ksig =3D { NULL, };
>       |                                      ^~~~
> fs/aio.c: In function '__do_compat_sys_io_pgetevents_time64':
> include/linux/stddef.h:8:14: warning: initialization of 'unsigned int' fr=
om 'void *' makes integer from pointer without a cast [-Wint-conversion]
>     8 | #define NULL ((void *)0)
>       |              ^
> fs/aio.c:2231:38: note: in expansion of macro 'NULL'
>  2231 |  struct __compat_aio_sigset ksig =3D { NULL, };
>       |                                      ^~~~
> include/linux/stddef.h:8:14: note: (near initialization for 'ksig.sigmask=
')
>     8 | #define NULL ((void *)0)
>       |              ^
> fs/aio.c:2231:38: note: in expansion of macro 'NULL'
>  2231 |  struct __compat_aio_sigset ksig =3D { NULL, };
>       |                                      ^~~~
>=20
> Introduced by commit
>=20
>   de80166a573d ("aio: Fix io_pgetevents() struct __compat_aio_sigset layo=
ut")

--=20
Cheers,
Stephen Rothwell

--Sig_/+MnaRVg7=hrPm6q/bC3wrLW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2uMqAACgkQAVBC80lX
0GzBEgf/QWY36zyJyHAo2qQe3OGW0vXOK8hxxdovUAtn32TYMjpgSpYEj3mcMY3z
5Y1LiS5m6Z59wE2Jmlf853f4iNqCgncILtBPEpfG8aZ617hjzkEVmAc6PuWsPPfi
/xfghH6wX4803L2gAXZxfLkw/8fvtteJ+Ol7btC9ZZVHRjc/duYF66qdRcmjxNn/
a7t8VJyw7fj0KYHp2sKfDl8adFeWT74ZrfoXnIkfCvRB7sGj69NDW6KxjPL/CTa5
n4oa57uL2ACZsbmmRrVUzMjKaMBKbzN4X4x2s+9qT6be1a9xTzEOSiVS1655yXTh
/4nteu4PV9+hJO7ACTKRv/Qdc07A8Q==
=edIx
-----END PGP SIGNATURE-----

--Sig_/+MnaRVg7=hrPm6q/bC3wrLW--
