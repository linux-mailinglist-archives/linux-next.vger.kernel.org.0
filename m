Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B696B28FA6D
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 23:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404902AbgJOVLK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 17:11:10 -0400
Received: from ozlabs.org ([203.11.71.1]:42139 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404899AbgJOVLK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Oct 2020 17:11:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CC2545Z67z9sTD;
        Fri, 16 Oct 2020 08:11:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602796266;
        bh=44fxF+oYrK483Ri1cbruRSDb4FKtT/C1VuszkiRraRw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=J3zl6ox/h0n5QOD/mq3UcOmC213znPOBCHQ70JvBgPFvgIC7SobRR0uZVoExq8wB0
         HJRBRL0HosYpUBwI8BAiIcITx1RO97vlTx9XOuhAGPcRuUNOh0ZwE4fArEBnw1Er/t
         s4IfvRseq/cvv9QJFPLvB+/eEyLQoaXMhWbz9SkzJQnXQuxqpqd/pW0XfXeJPFhndx
         vfUGJFeSvRGVuZrunSkXqsO60GNXygxMwrujsrftwfPqTeKjS7DSB7PzyV2t0ZUDow
         qX6W3rMhVhHBEcubckhG4mPbAE+8mURN+qy94VEVNn01R1t+JxFs+KSb6vqhEHykWj
         U1Rxml8E8rkMA==
Date:   Fri, 16 Oct 2020 08:11:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jason Gunthorpe <jgg@nvidia.com>,
        Doug Ledford <dledford@redhat.com>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Leon Romanovsky <leonro@nvidia.com>,
        Maor Gottlieb <maorg@nvidia.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the hmm tree
Message-ID: <20201016081103.797fa111@canb.auug.org.au>
In-Reply-To: <20201012151948.3a840c00@canb.auug.org.au>
References: <20201006203508.3cb3d0e3@canb.auug.org.au>
        <20201006164120.GI4734@nvidia.com>
        <20201012151948.3a840c00@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FBHmFb.fVVu/hjAcKh66QPz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/FBHmFb.fVVu/hjAcKh66QPz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 12 Oct 2020 15:19:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Tue, 6 Oct 2020 13:41:20 -0300 Jason Gunthorpe <jgg@nvidia.com> wrote:
> >
> > On Tue, Oct 06, 2020 at 08:35:08PM +1100, Stephen Rothwell wrote: =20
> > > Hi all,
> > >=20
> > > After merging the hmm tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> > >=20
> > >=20
> > > Caused by commit
> > >=20
> > >   07da1223ec93 ("lib/scatterlist: Add support in dynamic allocation o=
f SG table from pages")
> > >=20
> > > interacting with commit
> > >=20
> > >   707d561f77b5 ("drm: allow limiting the scatter list size.")
> > >=20
> > > from the drm tree.
> > >=20
> > > I have added the following merge fix patch
> > >=20
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Tue, 6 Oct 2020 20:22:51 +1100
> > > Subject: [PATCH] lib/scatterlist: merge fix for "drm: allow limiting =
the
> > >  scatter list size."
> > >=20
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > >  drivers/gpu/drm/drm_prime.c | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> > > index 11fe9ff76fd5..83ac901b65a2 100644
> > > +++ b/drivers/gpu/drm/drm_prime.c
> > > @@ -807,6 +807,7 @@ struct sg_table *drm_prime_pages_to_sg(struct drm=
_device *dev,
> > >  				       struct page **pages, unsigned int nr_pages)
> > >  {
> > >  	struct sg_table *sg =3D NULL;
> > > +	struct scatterlist *sl;
> > >  	size_t max_segment =3D 0;
> > >  	int ret;
> > > =20
> > > @@ -820,11 +821,13 @@ struct sg_table *drm_prime_pages_to_sg(struct d=
rm_device *dev,
> > >  		max_segment =3D dma_max_mapping_size(dev->dev);
> > >  	if (max_segment =3D=3D 0 || max_segment > SCATTERLIST_MAX_SEGMENT)
> > >  		max_segment =3D SCATTERLIST_MAX_SEGMENT;
> > > -	ret =3D __sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
> > > +	sl =3D __sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
> > >  					  nr_pages << PAGE_SHIFT,
> > > -					  max_segment, GFP_KERNEL);
> > > -	if (ret)
> > > +					  max_segment, NULL, 0, GFP_KERNEL);
> > > +	if (IS_ERR(sl)) {
> > > +		ret =3D PTR_ERR(sl);
> > >  		goto out;
> > > +	}
> > > =20
> > >  	return sg;
> > >  out:   =20
> >=20
> > This looks OK to me, thanks =20
>=20
> This merge fix patch is now being applied to the merge of the drm tree
> since the rdma tree (that is merged before the drm tree) has merged the
> hmm tree.

This merge fix patch is now being applied to the merge of the rdma tree
since the Linus has merged the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/FBHmFb.fVVu/hjAcKh66QPz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+IuucACgkQAVBC80lX
0Gximgf/f130z0WkHFE2Pb4vbcxFGAbA0iZNvgwg7M5P+skaaEmYFsqjkryS5DVH
OH4CKxDm/tyjfJC4jyq3t6mRiNudTQzMyop/lUZVnIZVve7yYwv7dMm8cnZYFrzO
aAmnCvGZdEyQAmoXIQWdCQkIWP64OxQ4ZpEoqLJ9r5dUaZuw3wdKv5HB4iA1JSzz
+Vr0dwanRdZkF4SGLf8cMKTW4NulRSSwO8Ubt8mZwJV8fv1TMUGu97ManyEvKvPv
vKTUCcwKyVknjFPKCMsn4mQm2MyjVVlt36MY2ltCrQsq79vUeY7AIfi4wb2hbloP
PCPVYSaFFfutD7XfCoWtHDqRbXAMAA==
=C3tT
-----END PGP SIGNATURE-----

--Sig_/FBHmFb.fVVu/hjAcKh66QPz--
