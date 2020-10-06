Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E445285443
	for <lists+linux-next@lfdr.de>; Wed,  7 Oct 2020 00:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgJFWDb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 18:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgJFWDb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2020 18:03:31 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23CEAC061755;
        Tue,  6 Oct 2020 15:03:31 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C5Wgh37qVz9sTD;
        Wed,  7 Oct 2020 09:03:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602021808;
        bh=mg3T9cV8jdHGfP7/OEcMxvzD4sIGx9j3xvzZQoBvCgc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=IUuA7pxy39OmAGcc/2OD7ae5sTVdPrNMzU8G01ugu+hh/uS5/1QCrrih/S+G70ORp
         S5dU8+Pyqov94r+LGUNDgNVM7HX15WT8JlYSLsyEwMF6N8L7yLfy8o+LFxi0IFsvWD
         mFR0XRPCGehhWzJgU4SEtVExmYXTPHxEiEzBHtLPmfiBZGl5eyNsSkFoKXK7Tdbtwh
         /+Lf0s/XXPb5l6021yJ8iwlt7f3D12onIL132sLcSXUpAh+xp/R/5rk84+fGjNd2f5
         XD0U2G1y6fA4cfk2Jv/AFZjgeVRGheF86Chk5OnPOQ6Kp51x6yzNiqcwjSyjD1JTor
         PGbaL9dcEO5tw==
Date:   Wed, 7 Oct 2020 09:03:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Peter Xu <peterx@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the akpm-current tree
Message-ID: <20201007090327.385f443e@canb.auug.org.au>
In-Reply-To: <20201006200138.GA6026@xz-x1>
References: <20201006230516.64f7b17f@canb.auug.org.au>
        <20201006200138.GA6026@xz-x1>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CX8rxtIBjdnP8mlq+gMIVx2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CX8rxtIBjdnP8mlq+gMIVx2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 6 Oct 2020 16:01:38 -0400 Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Oct 06, 2020 at 11:05:16PM +1100, Stephen Rothwell wrote:
> >=20
> > After merging the akpm-current tree, today's linux-next build (sparc
> > defconfig) produced this warning:
> >=20
> > mm/memory.c: In function 'copy_present_page':
> > mm/memory.c:800:20: warning: unused variable 'dst_mm' [-Wunused-variabl=
e]
> >   struct mm_struct *dst_mm =3D dst_vma->vm_mm;
> >                     ^~~~~~
> > mm/memory.c: In function 'copy_present_pte':
> > mm/memory.c:889:20: warning: unused variable 'dst_mm' [-Wunused-variabl=
e]
> >   struct mm_struct *dst_mm =3D dst_vma->vm_mm;
> >                     ^~~~~~
> >=20
> > Maybe introduced by commit
> >=20
> >   7e6cdccef3df ("mm-remove-src-dst-mm-parameter-in-copy_page_range-v2")=
 =20
>=20
> Yes it is.  The mm pointer is only used by set_pte_at(), while I just not=
iced
> that some of the archs do not use the mm pointer at all, hence this warni=
ng.
>=20
> The required change attached; this is quite special that we only referenc=
ed the
> mm once in each of the function, so that temp variable can actually be av=
oided.
> Ideally there should be some way to only define the variable on archs tha=
t need
> this mm pointer (e.g., when set_pte_at() or some similar function is call=
ed
> multiple times in some function, it should still be helpful to introduce a
> local variable to keep dst_vma->vm_mm).  However I don't know a good way =
to do
> this...
>=20
> Thanks,
>=20
> ------------8<------------
> diff --git a/mm/memory.c b/mm/memory.c
> index 8ade87e8600a..d9b16136014c 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -798,7 +798,6 @@ copy_present_page(struct vm_area_struct *dst_vma, str=
uct vm_area_struct *src_vma
>                   pte_t *dst_pte, pte_t *src_pte, unsigned long addr, int=
 *rss,
>                   struct page **prealloc, pte_t pte, struct page *page)
>  {
> -       struct mm_struct *dst_mm =3D dst_vma->vm_mm;
>         struct mm_struct *src_mm =3D src_vma->vm_mm;
>         struct page *new_page;
>=20
> @@ -874,7 +873,7 @@ copy_present_page(struct vm_area_struct *dst_vma, str=
uct vm_area_struct *src_vma
>         /* All done, just insert the new page copy in the child */
>         pte =3D mk_pte(new_page, dst_vma->vm_page_prot);
>         pte =3D maybe_mkwrite(pte_mkdirty(pte), dst_vma);
> -       set_pte_at(dst_mm, addr, dst_pte, pte);
> +       set_pte_at(dst_vma->vm_mm, addr, dst_pte, pte);
>         return 0;
>  }
>=20
> @@ -887,7 +886,6 @@ copy_present_pte(struct vm_area_struct *dst_vma, stru=
ct vm_area_struct *src_vma,
>                  pte_t *dst_pte, pte_t *src_pte, unsigned long addr, int =
*rss,
>                  struct page **prealloc)
>  {
> -       struct mm_struct *dst_mm =3D dst_vma->vm_mm;
>         struct mm_struct *src_mm =3D src_vma->vm_mm;
>         unsigned long vm_flags =3D src_vma->vm_flags;
>         pte_t pte =3D *src_pte;
> @@ -932,7 +930,7 @@ copy_present_pte(struct vm_area_struct *dst_vma, stru=
ct vm_area_struct *src_vma,
>         if (!(vm_flags & VM_UFFD_WP))
>                 pte =3D pte_clear_uffd_wp(pte);
>=20
> -       set_pte_at(dst_mm, addr, dst_pte, pte);
> +       set_pte_at(dst_vma->vm_mm, addr, dst_pte, pte);
>         return 0;
>  }

Thanks, I have applied that to linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/CX8rxtIBjdnP8mlq+gMIVx2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl986a8ACgkQAVBC80lX
0GxNfgf+OU1a1pGyrEI7rmI6HLpsmbL+paHM95IVROyUpvWh1sp/Lmjy0agY0TDG
zEzU2AlKftSh5vwU2wS7QEi5bmdQ3t8m+ZLrqJrEVuM6UJb1Eh88fNonK47Xw1I4
YCz3dbpp0uXvrzND2ImxzDVsSEB5bqt59uoliZaICGxHbIJOYs0pKA8qviyzeu42
gdt2pTaw0PPY9MNg1c+IdPeJ49+lY8c8huXuKkhA/MZ3ZnAYUjWKRa728D+u7nre
YWG63sBorhG7BwmNfEOuExM4DjqjXSLenOBikwpWtTBR+NSe2C8pUVYYmjR8hxQ7
2HeaoLAOyYHze7VlYC0e36bJwPt5ng==
=XHmT
-----END PGP SIGNATURE-----

--Sig_/CX8rxtIBjdnP8mlq+gMIVx2--
