Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 135C828EB47
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 04:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729356AbgJOCoE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 22:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgJOCoE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Oct 2020 22:44:04 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C0B0C061755;
        Wed, 14 Oct 2020 19:44:04 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CBYWf74z8z9sTD;
        Thu, 15 Oct 2020 13:43:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602729841;
        bh=m5cs0oNpOpTeIHBQHDd7CVYZ56+P5MGav+h5RLhk3xI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kKGQ4qOgPNoEQZSPks+uUrtyZLCSRJ6O67SwzmY6VVfySIfIRN31wjT/E3PK6Gunx
         lwvlJ+t4fvShXbIc+jqbMI3kySbB3bPQjkqACcagMc+0B6Plw1gLedM0BukJa3zcF4
         R5WnVUbDL3OzE6znCzGH5JhkTYNwE1TZsNlCYDoaVv1fi1CL96LTOjI9ouYTm8SYud
         TlFFInFgUUUuiIKZHylUIjULU5+Dsnw0gNYqJKYuOLUwhkTpdIMVhTMxrYpb70wah6
         fqrVV8vtqSXVoT+GGoWWkA6Wp6Vq9izTk1BLL/ehSL+70E1tQ/tqRW7r7Wjcw6wYYu
         NJff5+yc89yag==
Date:   Thu, 15 Oct 2020 13:43:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Tom Murphy <murphyt7@tcd.ie>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the iommu tree
Message-ID: <20201015134357.0a4e61b3@canb.auug.org.au>
In-Reply-To: <20201013183107.65c15fd5@canb.auug.org.au>
References: <20200921140901.16adf8c2@canb.auug.org.au>
        <20201013183107.65c15fd5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g+CJtaeZ+2OhcqY190MsVj5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/g+CJtaeZ+2OhcqY190MsVj5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 13 Oct 2020 18:31:07 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 21 Sep 2020 14:09:01 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the iommu tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >=20
> > drivers/gpu/drm/msm/msm_iommu.c: In function 'msm_iommu_pagetable_unmap=
':
> > drivers/gpu/drm/msm/msm_iommu.c:46:2: error: implicit declaration of fu=
nction 'iommu_flush_tlb_all'; did you mean 'iommu_flush_iotlb_all'? [-Werro=
r=3Dimplicit-function-declaration]
> >    46 |  iommu_flush_tlb_all(to_msm_iommu(pagetable->parent)->domain);
> >       |  ^~~~~~~~~~~~~~~~~~~
> >       |  iommu_flush_iotlb_all
> >=20
> > Caused by commit
> >=20
> >   aae4c8e27bd7 ("iommu: Rename iommu_tlb_* functions to iommu_iotlb_*")
> >=20
> > interacting with commit
> >=20
> >   b145c6e65eb0 ("drm/msm: Add support to create a local pagetable")
> >=20
> > from the drm-msm tree.
> >=20
> > I have applied the following merge fix patch.  Someone will need to tell
> > Linus about this fix up when the trees get merged.
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 21 Sep 2020 14:04:14 +1000
> > Subject: [PATCH] merge fix upt for iommu_flush_iotlb_all() rename
> >=20
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/gpu/drm/msm/msm_iommu.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_=
iommu.c
> > index 3a83ffdb3b90..22ac7c692a81 100644
> > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > @@ -43,7 +43,7 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *=
mmu, u64 iova,
> >  		size -=3D 4096;
> >  	}
> > =20
> > -	iommu_flush_tlb_all(to_msm_iommu(pagetable->parent)->domain);
> > +	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
> > =20
> >  	return (unmapped =3D=3D size) ? 0 : -EINVAL;
> >  }
> > @@ -199,7 +199,7 @@ struct msm_mmu *msm_iommu_pagetable_create(struct m=
sm_mmu *parent)
> > =20
> >  	/*
> >  	 * TODO we would like each set of page tables to have a unique ASID
> > -	 * to optimize TLB invalidation.  But iommu_flush_tlb_all() will
> > +	 * to optimize TLB invalidation.  But iommu_flush_iotlb_all() will
> >  	 * end up flushing the ASID used for TTBR1 pagetables, which is not
> >  	 * what we want.  So for now just use the same ASID as TTBR1.
> >  	 */
> > --=20
> > 2.28.0 =20
>=20
> This merge fix up is now needed when the iommu tree and the drm tree are =
merged.

This merge fix up is now needed when the drm tree is merged with Linus' tre=
e.

--=20
Cheers,
Stephen Rothwell

--Sig_/g+CJtaeZ+2OhcqY190MsVj5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+Ht24ACgkQAVBC80lX
0Gxw0AgApDz6ptrVcJejH6ge5V3fGIY2frQzMsaRMVsX3PDYms5GDDP62BWqHZ0w
rD7OJS1Ja63i2CIVDvtN9WW7vquGgDyRAlQlM4T7rSDBlsU2yZbYM3UNlnzxdIqa
B70JneSVV49fOO88DafNhHGGXmvd/jnMyKTsbqMjq0xZDAmi20SzE1x6FV25Nd2V
rCm7o1uoyB14dW0Y7tZewRtreLVKZ1nC7F22Nz3vHNercgrAbdosuUPLE6+hxF5g
16Bl8xn2oCGXCb+3CuMnF7QCgIZvvYSiVE2mieZvjFK4wUd6A83nNREYGBBkARQk
cqsFzyR0MYDAuf56/yuXHF2KCbfj+w==
=vWCx
-----END PGP SIGNATURE-----

--Sig_/g+CJtaeZ+2OhcqY190MsVj5--
