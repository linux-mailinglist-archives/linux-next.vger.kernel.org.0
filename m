Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6DD43C1AE
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 06:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239493AbhJ0EkZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 00:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237990AbhJ0EkJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Oct 2021 00:40:09 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B145C061229;
        Tue, 26 Oct 2021 21:37:44 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfGBs1qtgz4xc9;
        Wed, 27 Oct 2021 15:37:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635309462;
        bh=hh3VvxHq5dZ8pYRaakduAV7z8X1ys9krtw6qsV8c8sQ=;
        h=Date:From:To:Cc:Subject:From;
        b=Paj7JWHnn2X1p/UXLXCmN5eBOmnrhtcLk13Qo+ZRymrRfVrxJ8Tg5hqzDPA34AK3p
         TpZzM9qdwnkxzeU/EsEpQwIPXHDMdPPeckdYZ4TH/ngpFclPaVrPqFe0Pyk7c4RCn1
         SX63WTJ/ZuqIDtQHM0be322aETX+Rm32AtkoODZ0xN/Ql2siprt9ejsi38M5tcLnHy
         OLdnuR539q34AwQa8ppZZK/WaQrIkpeYGZMmeeU4eeGjWElswZdZQLvF5tyoRZq7l8
         3VnBeUQtgVAqhi5v2LoCZEsFJ2dLlBwAhhVRIvxy0TVoWuQ9RrwyuJlVagOChCAKKM
         uBByk1UlWzUiQ==
Date:   Wed, 27 Oct 2021 15:37:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>
Subject: linux-next: manual merge of the char-misc tree with the drm-tegra
 tree
Message-ID: <20211027153739.0cc2e5f2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7JtOJC_cRlt/GupTahQ1RG4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7JtOJC_cRlt/GupTahQ1RG4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/gpu/drm/tegra/gem.c

between commit:

  1c4d17a5267b ("drm/tegra: Implement correct DMA-BUF semantics")

from the drm-tegra tree and commit:

  16b0314aa746 ("dma-buf: move dma-buf symbols into the DMA_BUF module name=
space")

from the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/tegra/gem.c
index 62fc7e8429d4,d38fd7e12b57..000000000000
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@@ -20,78 -21,60 +21,80 @@@
  #include "drm.h"
  #include "gem.h"
 =20
+ MODULE_IMPORT_NS(DMA_BUF);
+=20
 -static void tegra_bo_put(struct host1x_bo *bo)
 +static unsigned int sg_dma_count_chunks(struct scatterlist *sgl, unsigned=
 int nents)
  {
 -	struct tegra_bo *obj =3D host1x_to_tegra_bo(bo);
 +	dma_addr_t next =3D ~(dma_addr_t)0;
 +	unsigned int count =3D 0, i;
 +	struct scatterlist *s;
 +
 +	for_each_sg(sgl, s, nents, i) {
 +		/* sg_dma_address(s) is only valid for entries that have sg_dma_len(s) =
!=3D 0. */
 +		if (!sg_dma_len(s))
 +			continue;
 +
 +		if (sg_dma_address(s) !=3D next) {
 +			next =3D sg_dma_address(s) + sg_dma_len(s);
 +			count++;
 +		}
 +	}
 =20
 -	drm_gem_object_put(&obj->gem);
 +	return count;
  }
 =20
 -/* XXX move this into lib/scatterlist.c? */
 -static int sg_alloc_table_from_sg(struct sg_table *sgt, struct scatterlis=
t *sg,
 -				  unsigned int nents, gfp_t gfp_mask)
 +static inline unsigned int sgt_dma_count_chunks(struct sg_table *sgt)
  {
 -	struct scatterlist *dst;
 -	unsigned int i;
 -	int err;
 -
 -	err =3D sg_alloc_table(sgt, nents, gfp_mask);
 -	if (err < 0)
 -		return err;
 -
 -	dst =3D sgt->sgl;
 +	return sg_dma_count_chunks(sgt->sgl, sgt->nents);
 +}
 =20
 -	for (i =3D 0; i < nents; i++) {
 -		sg_set_page(dst, sg_page(sg), sg->length, 0);
 -		dst =3D sg_next(dst);
 -		sg =3D sg_next(sg);
 -	}
 +static void tegra_bo_put(struct host1x_bo *bo)
 +{
 +	struct tegra_bo *obj =3D host1x_to_tegra_bo(bo);
 =20
 -	return 0;
 +	drm_gem_object_put(&obj->gem);
  }
 =20
 -static struct sg_table *tegra_bo_pin(struct device *dev, struct host1x_bo=
 *bo,
 -				     dma_addr_t *phys)
 +static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct =
host1x_bo *bo,
 +					      enum dma_data_direction direction)
  {
  	struct tegra_bo *obj =3D host1x_to_tegra_bo(bo);
 -	struct sg_table *sgt;
 +	struct drm_gem_object *gem =3D &obj->gem;
 +	struct host1x_bo_mapping *map;
  	int err;
 =20
 +	map =3D kzalloc(sizeof(*map), GFP_KERNEL);
 +	if (!map)
 +		return ERR_PTR(-ENOMEM);
 +
 +	kref_init(&map->ref);
 +	map->bo =3D host1x_bo_get(bo);
 +	map->direction =3D direction;
 +	map->dev =3D dev;
 +
  	/*
 -	 * If we've manually mapped the buffer object through the IOMMU, make
 -	 * sure to return the IOVA address of our mapping.
 -	 *
 -	 * Similarly, for buffers that have been allocated by the DMA API the
 -	 * physical address can be used for devices that are not attached to
 -	 * an IOMMU. For these devices, callers must pass a valid pointer via
 -	 * the @phys argument.
 -	 *
 -	 * Imported buffers were also already mapped at import time, so the
 -	 * existing mapping can be reused.
 +	 * Imported buffers need special treatment to satisfy the semantics of D=
MA-BUF.
  	 */
 -	if (phys) {
 -		*phys =3D obj->iova;
 -		return NULL;
 +	if (gem->import_attach) {
 +		struct dma_buf *buf =3D gem->import_attach->dmabuf;
 +
 +		map->attach =3D dma_buf_attach(buf, dev);
 +		if (IS_ERR(map->attach)) {
 +			err =3D PTR_ERR(map->attach);
 +			goto free;
 +		}
 +
 +		map->sgt =3D dma_buf_map_attachment(map->attach, direction);
 +		if (IS_ERR(map->sgt)) {
 +			dma_buf_detach(buf, map->attach);
 +			err =3D PTR_ERR(map->sgt);
 +			goto free;
 +		}
 +
 +		err =3D sgt_dma_count_chunks(map->sgt);
 +		map->size =3D gem->size;
 +
 +		goto out;
  	}
 =20
  	/*

--Sig_/7JtOJC_cRlt/GupTahQ1RG4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF415MACgkQAVBC80lX
0GwxNgf+NkpLCXsp4GHoO7DGtcNslbHtkoMdCGzOWy1VflUoWeOTIBSgNhoDVDp7
ScmFYoklU4kw1yKQHO4iLKEjhX3Le/Om2ZkUY+PC0IKIZaBhw/NsqtehiP9bzhty
jCWdGnIC5eD1DHxIhljT72xsBA2lehmfjLm5GOKMWpCNLIEoD6PYAyl6zueL+/EU
vZBdQAzmRJWJR9cye/1GTxv4DXmsm+7wzfxFQkY6P9mI6DSeUPuvAujonJJp3XFA
4b4BztP0HG7YrFxvK7f4VmvjcH5e/SuEgdhKaQgcUlzyhSjRRRyYLuo346eBppNb
f79iP/GWy53BFgl5Lh8sqpulaSKynQ==
=x/4K
-----END PGP SIGNATURE-----

--Sig_/7JtOJC_cRlt/GupTahQ1RG4--
