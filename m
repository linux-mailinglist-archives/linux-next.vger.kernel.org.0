Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3EA018C4FA
	for <lists+linux-next@lfdr.de>; Fri, 20 Mar 2020 02:58:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbgCTB6H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Mar 2020 21:58:07 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55865 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727049AbgCTB6H (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Mar 2020 21:58:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48k6P64pBvz9sRf;
        Fri, 20 Mar 2020 12:58:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584669484;
        bh=vpn3DCJ6hBIhxzV7dh61Ga58Bi+1fn8fnZxjDFSplAU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=odz+oJHlLzYtS9b8Hv2RfP3PVo3l8fX6GEpxx6/W5HfcvT2HI5kKtw4e3Ja2LTyjw
         3UQyuMIHR+xcNZvxY/yUZzqIiZDQRnQFk99Y3UNpR/Y13JHgbv+Tj1GIkv9PMUBni0
         h2j0ki4fPTiu5dYQIDt+2pnbDx/B6H/63/0Csr/1eIzL5gRniy8yJWqoYLBOSbDh1V
         S5ZqaAZ7qyu6+lGH79JTljnse3FpIlYKgn6pPQImhb1haNi8jEdi3ENg58vIlS8DZk
         MQdBWlStahD4hCQy/af08K83EZ0e9B5Ul99rK41x9D99mK93X2xuvwo/G1yg5HSEF8
         pTTxuxqmPUTNA==
Date:   Fri, 20 Mar 2020 12:57:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Message-ID: <20200320125759.4cffcfec@canb.auug.org.au>
In-Reply-To: <20200311133635.7fcb422e@canb.auug.org.au>
References: <20200311133635.7fcb422e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M4Ayn.nt.3qtE_R/ryZr4ui";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/M4Ayn.nt.3qtE_R/ryZr4ui
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 11 Mar 2020 13:36:35 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm-intel tree got a conflict in:
>=20
>   drivers/gpu/drm/i915/gvt/vgpu.c
>=20
> between commit:
>=20
>   04d6067f1f19 ("drm/i915/gvt: Fix unnecessary schedule timer when no vGP=
U exits")
>=20
> from the drm-intel-fixes tree and commit:
>=20
>   12d5861973c7 ("drm/i915/gvt: Make WARN* drm specific where vgpu ptr is =
available")
>=20
> from the drm-intel tree.
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
> diff --cc drivers/gpu/drm/i915/gvt/vgpu.c
> index 345c2aa3b491,abcde8ce1a9a..000000000000
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@@ -271,18 -272,12 +272,19 @@@ void intel_gvt_release_vgpu(struct inte
>   void intel_gvt_destroy_vgpu(struct intel_vgpu *vgpu)
>   {
>   	struct intel_gvt *gvt =3D vgpu->gvt;
> + 	struct drm_i915_private *i915 =3D gvt->gt->i915;
>  =20
> - 	WARN(vgpu->active, "vGPU is still active!\n");
>  -	mutex_lock(&vgpu->vgpu_lock);
>  -
> + 	drm_WARN(&i915->drm, vgpu->active, "vGPU is still active!\n");
>  =20
>  +	/*
>  +	 * remove idr first so later clean can judge if need to stop
>  +	 * service if no active vgpu.
>  +	 */
>  +	mutex_lock(&gvt->lock);
>  +	idr_remove(&gvt->vgpu_idr, vgpu->id);
>  +	mutex_unlock(&gvt->lock);
>  +
>  +	mutex_lock(&vgpu->vgpu_lock);
>   	intel_gvt_debugfs_remove_vgpu(vgpu);
>   	intel_vgpu_clean_sched_policy(vgpu);
>   	intel_vgpu_clean_submission(vgpu);

This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/M4Ayn.nt.3qtE_R/ryZr4ui
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl50IycACgkQAVBC80lX
0Gy/oQf/f6ur6aXr9wh2GKgS3ntYeqJLVO/RJzqtIfcwOlq5cuIKOy5mfBRLhBr8
aiIJMn641UtnqEALXAKcaHr0evQpQqey446ACo941EDomOPMlNWW3Wn/AKlE9rWq
mMyXNcmUcTq0VuKkJvCGoLQFtEPDjHB9G3bKeCDSmEUr8xR1QNRcVNXa+0/KxtV4
gQlE2gwYd8tMfs1Oh296zz04UyFWxDPOSk/KJzjGwJrtDOxDbkCrwNDTWL/nSU+g
UyLq39qjgFgXmlM2wpcXiRm8Swm0MwppnEU3pOD06b5avEQTtApteCgpuk4iSe+H
DquIaVloMeRBZf0353rkFYIyc/Wo7w==
=DcUr
-----END PGP SIGNATURE-----

--Sig_/M4Ayn.nt.3qtE_R/ryZr4ui--
