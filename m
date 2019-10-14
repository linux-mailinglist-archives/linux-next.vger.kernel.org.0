Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4B44D5910
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2019 02:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728946AbfJNAbj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 13 Oct 2019 20:31:39 -0400
Received: from ozlabs.org ([203.11.71.1]:42619 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728848AbfJNAbj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 13 Oct 2019 20:31:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46rzyH00sKz9sPZ;
        Mon, 14 Oct 2019 11:31:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571013095;
        bh=txVz+KpHTxEXihitXuFZCcO9n7x7mzXgF+D2GNtYfrw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=he841bBBQ/gzvmza/djAZ4S4uuvtodWQwZDcpYdZNqN+cl3nyVtZiYwnGFYxk3mCZ
         qUR92yoo5I6tskb1kSDFmWtXHPt7m9WsFwapFn9xHKdKBBa4rrbWJLoFz8efJMf2Gi
         Gl9lPPOuBGdeNiQkR8aKUGZwRds0LfJ642LBOFwmYigG4VWppyuHujRMbXMiUcax4A
         aoHj4DAL3yl6hp36+5wYamQ+zTR5R9Ilm+0nglcs1nyh1g54ijFX3tbHcq2eu3mGNF
         HCT/SdlfwIJxnK7GlwHSPQlAF78F66DiQ8rxDHw4pBDSmyaH5afJfnmU1kmHe2WiMy
         lTATyUr5mb9Tw==
Date:   Mon, 14 Oct 2019 11:31:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     DRI <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexdeucher@gmail.com>,
        Dave Airlie <airlied@linux.ie>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dariusz Marcinkiewicz <darekm@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Lyude Paul <lyude@redhat.com>
Subject: Re: linux-next: manual merge of the drm-misc tree with the admgpu
 tree
Message-ID: <20191014113134.0c184189@canb.auug.org.au>
In-Reply-To: <20191004111022.28bde6dc@canb.auug.org.au>
References: <20191004111022.28bde6dc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8.OEXchmsJkajXkYsLBXLIM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8.OEXchmsJkajXkYsLBXLIM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

This is now a conflict between the amdgpu tree and the drm tree.

On Fri, 4 Oct 2019 11:10:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the drm-misc tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>=20
> between commit:
>=20
>   2f232cf29e03 ("drm/amdgpu/dm/mst: Don't create MST topology managers fo=
r eDP ports")
>=20
> from the admgpu tree and commit:
>=20
>   ae85b0df124f ("drm_dp_cec: add connector info support.")
>=20
> from the drm-misc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 3af2b429ff1b,5ec14efd4d8c..000000000000
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@@ -414,11 -416,7 +414,11 @@@ void amdgpu_dm_initialize_dp_connector(
>  =20
>   	drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
>   	drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
> - 				      aconnector->base.name, dm->adev->dev);
> + 				      &aconnector->base);
>  +
>  +	if (aconnector->base.connector_type =3D=3D DRM_MODE_CONNECTOR_eDP)
>  +		return;
>  +
>   	aconnector->mst_mgr.cbs =3D &dm_mst_cbs;
>   	drm_dp_mst_topology_mgr_init(
>   		&aconnector->mst_mgr,

--=20
Cheers,
Stephen Rothwell

--Sig_/8.OEXchmsJkajXkYsLBXLIM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2jweYACgkQAVBC80lX
0Gz/6QgAjNQ3/SDnmDTMfowInDEfiJMBTQe26l3MvmGi1dt7W6/wj34iCRN8Cop6
1EtRLK8+JWELbhtSYzzY9+zSAgoyD3f5jRGO6+4GvpW7bqvXkl/yPbxWl+sQdV16
XfyrR45kO7hGd7+8iofk/ELBQjs8F7J6EyQevHTGBYr2tGgK8lSRsnIYs0BDtYzB
MWsCTAstSFA1nl9NOIh7XFq8SSoICWjKon0aMB489Y2TGygqSj/QB17P1C6PIRjP
2D13KApEXAWVnuk9zbC47Py3L/3NfCXpITcmluEfMPX1DdGlf0UXMtHSlS8zUbp2
rzQ/OUf4SpoFzixR19BwIo2S6JZN1A==
=HuqD
-----END PGP SIGNATURE-----

--Sig_/8.OEXchmsJkajXkYsLBXLIM--
