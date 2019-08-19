Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36D4B91B6C
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2019 05:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbfHSDTE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 18 Aug 2019 23:19:04 -0400
Received: from ozlabs.org ([203.11.71.1]:52507 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726186AbfHSDTE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 18 Aug 2019 23:19:04 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46BfKG0rpHz9sMr;
        Mon, 19 Aug 2019 13:18:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566184741;
        bh=OTrmXf0uOG0N7D6X7l9rKsQkO1sx2kT2BAzJVGYG2wE=;
        h=Date:From:To:Cc:Subject:From;
        b=HHrKn+MhkE3vkrpJ7/YEyrwSmN79jYmc6PRcesSlI/yUMawmQTs/o+Rzhy9Yn3adf
         7W8vNUCI7leFnsxcqvB3y3q7qoAvHlWcFKs2YBSWZgv+MGznkHrnkg4UmYUluV9AZP
         2kpd8ZetSGvVTD+GclIphNbLczS0s0Je0plMdHKRRdYVJYD8X06KIvaTbjO8wJyIxb
         Gg7ufTnRlcXZ32+7DRIH50Qw/u+uWeQNJVZFsiogew8fKGVhwrWOfGvvPo4td/ijFu
         qdaXlBXL8urgCoVmiNlPBqIPpQ2fkJqO546S5AWzJP2fLIbaxxHi+v9QMGSdzPWp+N
         FvK+2ulfJkhzA==
Date:   Mon, 19 Aug 2019 13:18:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Dave Airlie <airlied@linux.ie>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Thomas Hellstrom <thellstrom@vmware.com>
Subject: linux-next: manual merge of the drm-misc tree with the drm tree
Message-ID: <20190819131856.68011dc5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FOF.KFeJWSV=W1SNSHyzZ.S";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/FOF.KFeJWSV=W1SNSHyzZ.S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c

between commit:

  a0a63940b0c9 ("drm/vmwgfx: Assign eviction priorities to resources")

from the drm tree and commit:

  52791eeec1d9 ("dma-buf: rename reservation_object to dma_resv")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 2eb3532e3291,0b5472450633..000000000000
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@@ -33,36 -34,6 +33,36 @@@
 =20
  #define VMW_RES_EVICT_ERR_COUNT 10
 =20
 +/**
 + * vmw_resource_mob_attach - Mark a resource as attached to its backing m=
ob
 + * @res: The resource
 + */
 +void vmw_resource_mob_attach(struct vmw_resource *res)
 +{
 +	struct vmw_buffer_object *backup =3D res->backup;
 +
- 	reservation_object_assert_held(backup->base.base.resv);
++	dma_resv_assert_held(backup->base.base.resv);
 +	res->used_prio =3D (res->res_dirty) ? res->func->dirty_prio :
 +		res->func->prio;
 +	list_add_tail(&res->mob_head, &backup->res_list);
 +	vmw_bo_prio_add(backup, res->used_prio);
 +}
 +
 +/**
 + * vmw_resource_mob_detach - Mark a resource as detached from its backing=
 mob
 + * @res: The resource
 + */
 +void vmw_resource_mob_detach(struct vmw_resource *res)
 +{
 +	struct vmw_buffer_object *backup =3D res->backup;
 +
- 	reservation_object_assert_held(backup->base.base.resv);
++	dma_resv_assert_held(backup->base.base.resv);
 +	if (vmw_resource_mob_attached(res)) {
 +		list_del_init(&res->mob_head);
 +		vmw_bo_prio_del(backup, res->used_prio);
 +	}
 +}
 +
  struct vmw_resource *vmw_resource_reference(struct vmw_resource *res)
  {
  	kref_get(&res->kref);

--Sig_/FOF.KFeJWSV=W1SNSHyzZ.S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1aFSAACgkQAVBC80lX
0Gyqdwf+Ps+56/U2wj4nXp8BIBq51rBPto7+yYUVy6oGFN9KkGsRaF4eDrY+MWu0
Z8XjwTLLXa4NrdfKVa/QAyFWr8IzZ57deJBdDwn5G0PH02R+zJZuW1RNhWry2jkS
D5QgBnOgkH4hx4swMcQXsAbgr8H9YnAxFo6qbYWLvjYiYEhISZkSNhAp0xz0IkJE
6IJ4hlwhhkByh8zArCHARhJKSSB/2VBLIF+E8eKVAjP2iQD2i4NMxmCRaIem1s0j
kBbOovVAywYVJxnctrmYqYuzweU8iEG4HniAobFhFPWtSWKAmNxH8ubKgQ+eVrl9
tAbZ2FYg3EhNUxW7nOCtx1TGWYzzRw==
=ujGK
-----END PGP SIGNATURE-----

--Sig_/FOF.KFeJWSV=W1SNSHyzZ.S--
