Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8416A21632C
	for <lists+linux-next@lfdr.de>; Tue,  7 Jul 2020 02:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgGGAxX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jul 2020 20:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgGGAxX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jul 2020 20:53:23 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C87C061755;
        Mon,  6 Jul 2020 17:53:22 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B13p84yj7z9s1x;
        Tue,  7 Jul 2020 10:53:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594083200;
        bh=Q5Lf1YVW9NL+ZBJd5oxrN55AJbts6RvhRBUwzhHNCcs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hp7gP/hQIaIxePjQlddrYQ5zTVGLrKxmKzubCKW/Zs85RtL9G61QrFriZvkJl5bLm
         uFVN6ZhlOxCzq0TF0uKkdnIQF5krRUGUu9jJqK131JKsa854MNEJoflhclJovI/iCd
         9pRJirDRHfbgR/Mdgtwt//TaZGr9OZcdnuUh/rvREpYmjVD4pOlroKhavLrhhWGvm7
         D70fTc0ry4Wf3vnp/WxTvuB2vmRPZJuRSGyjNVLzIuyQrW86PwcUCWGtiO1G56fQ8D
         W8+wDKIBCpP/Ig6eOUna/a8WQR3muepFsUfcywCA9CZr6Uy1XhmNAc2o0PShjZ4Ptt
         ao1tw8UaOjG6Q==
Date:   Tue, 7 Jul 2020 10:53:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joonsoo Kim <js1304@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for Jul 6 (mm/memory_failure.c)
Message-ID: <20200707105319.217409ab@canb.auug.org.au>
In-Reply-To: <20200707003500.GA27886@js1304-desktop>
References: <20200706174001.2d316826@canb.auug.org.au>
        <d458c18d-9c5e-9c45-0d65-e317571b6d56@infradead.org>
        <20200707003500.GA27886@js1304-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Bt80v1CvXV=K6Q+g4oLKLfr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Bt80v1CvXV=K6Q+g4oLKLfr
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 7 Jul 2020 09:35:15 +0900 Joonsoo Kim <js1304@gmail.com> wrote:
>
> On Mon, Jul 06, 2020 at 09:59:06AM -0700, Randy Dunlap wrote:
> >=20
> > on i386:
> >=20
> > when CONFIG_MIGRATION is not set/enabled:
> >=20
> > ../mm/memory-failure.c: In function =E2=80=98new_page=E2=80=99:
> > ../mm/memory-failure.c:1688:9: error: implicit declaration of function =
=E2=80=98alloc_migration_target=E2=80=99; did you mean =E2=80=98alloc_migra=
te_target=E2=80=99? [-Werror=3Dimplicit-function-declaration]
> >   return alloc_migration_target(p, (unsigned long)&mtc);
> >          ^~~~~~~~~~~~~~~~~~~~~~
>=20
> Thanks for reporting.
>=20
> Below is the fix for this error.
> Andrew, Could you squash this fix into the patch,
> "mm-migrate-make-a-standard-target-allocation-function.patch"?
>=20
> Thanks.
>=20
>=20
> ------------------->8------------------- =20
> From 5fac269125dfb2d03e38a75319305e0e70b23a4b Mon Sep 17 00:00:00 2001
> From: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> Date: Tue, 7 Jul 2020 09:16:58 +0900
> Subject: [PATCH] mm/migrate: fix for
>  mm-migrate-make-a-standard-target-allocation-function.patch in mm tree
>=20
> new_page_nodemask() is renamed to alloc_migration_target in
> mm-migrate-make-a-standard-target-allocation-function.patch, but,
> one declaration for !CONFIG_MIGRATION case is missed. This patch fixes it.
>=20
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> ---
>  include/linux/migrate.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 5e9c866..cc56f0d 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -60,8 +60,8 @@ static inline int migrate_pages(struct list_head *l, ne=
w_page_t new,
>  		free_page_t free, unsigned long private, enum migrate_mode mode,
>  		int reason)
>  	{ return -ENOSYS; }
> -static inline struct page *new_page_nodemask(struct page *page,
> -		int preferred_nid, nodemask_t *nodemask)
> +static inline struct page *alloc_migration_target(struct page *page,
> +		unsigned long private)
>  	{ return NULL; }
>  static inline int isolate_movable_page(struct page *page, isolate_mode_t=
 mode)
>  	{ return -EBUSY; }
> --=20
> 2.7.4
>=20

I have added that to linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Bt80v1CvXV=K6Q+g4oLKLfr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8Dx38ACgkQAVBC80lX
0GzBpwf/TGUIgs/Kd6fLMDYUq2Jne1llwy+V11XxKr0qjCuBLGV66Jq64I2QsjsB
AwiAyQRWaS7MWWom4k0OU3ulFCCYyFDC4ojD/kx+9VFbZyWvaWGhgM7yC1n4LPu0
XlyDxkBZDGm0IwBvSRI4BHzM61a6VF1dueUrwpgnTDyU2sJrNzTRwlqm5GEuy2yv
doV9z55KFAoo2W14t+mVlvfeESJrUts+cNttK5Cn5NlU/a/d6jfe5ipRlDxeI5vt
aNz/Odg8qAVr3FkHKwnHlYq1Vj6qcY/FzwKSo/lOA0fYXpJZehY1HsGyzZxFl8o2
njmdZCi65cnEqXvbgr507B/Yabc/3A==
=oiE+
-----END PGP SIGNATURE-----

--Sig_/Bt80v1CvXV=K6Q+g4oLKLfr--
