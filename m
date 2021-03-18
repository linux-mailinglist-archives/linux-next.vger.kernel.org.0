Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C866133FCE1
	for <lists+linux-next@lfdr.de>; Thu, 18 Mar 2021 02:53:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhCRBxQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 21:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbhCRBws (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Mar 2021 21:52:48 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91478C06174A;
        Wed, 17 Mar 2021 18:52:47 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F195Q4f4Xz9sW5;
        Thu, 18 Mar 2021 12:52:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616032365;
        bh=4vtpq80CBmDqW2sh2J2CRMVGkD6sU97trMEyod5tJA4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jGgtRVPNdd0DKGsIvquKCrN3Dbdk0DQc+PqankS3n/MerAu9HXY277PR6W6jVcnvR
         Vkum22u0yWpmLdcoQYk0v6igggjnsuwlNpvzpHf4g6SsNrb6g7M2p09Etx0hptJtdp
         mc2qwj12dgZ80td5IQ6LDSxUZR5i+ygUTSgA4Ak14QnCvabHa/2RdvkuM8vYIKGAFK
         I0Qv+TCTCXQ6pFjhel/53X/L1UC4cJaE5104jNSkGJU734oEVeQFlDxtLd0Pxh4br/
         GHvkk2SnQ+ryBLkWH3LeO0WeTuqOOIw0mY0A82Rsm+N1Zni4iCoKj5RKQGcnZDaGGQ
         A1nlhlSCAenBQ==
Date:   Thu, 18 Mar 2021 12:52:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Dave Airlie <airlied@redhat.com>
Cc:     Jani Nikula <jani.nikula@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: linux-next: manual merge of the drm-intel tree with the drm
 tree
Message-ID: <20210318125241.5fdfeffd@canb.auug.org.au>
In-Reply-To: <20210317140824.0a28ffec@canb.auug.org.au>
References: <20210317140824.0a28ffec@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BS././NG8qIOJgOu6hWnAIY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BS././NG8qIOJgOu6hWnAIY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 17 Mar 2021 14:08:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm-intel tree got a conflict in:
>=20
>   drivers/gpu/drm/i915/display/intel_sprite.c
>=20
> between commit:
>=20
>   92f1d09ca4ed ("drm: Switch to %p4cc format modifier")
>=20
> from the drm tree and commit:
>=20
>   46d12f911821 ("drm/i915: migrate skl planes code new file (v5)")
>=20
> from the drm-intel tree.
>=20
> I fixed it up (I used the latter version of the file and applied the
> following patch) and can carry the fix as necessary. This is now fixed
> as far as linux-next is concerned, but any non trivial conflicts should
> be mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 17 Mar 2021 14:05:42 +1100
> Subject: [PATCH] merge fix for "drm: Switch to %p4cc format modifier"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/i915/display/skl_universal_plane.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers=
/gpu/drm/i915/display/skl_universal_plane.c
> index 1f335cb09149..45ceff436bf7 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -1120,7 +1120,6 @@ static int skl_plane_check_fb(const struct intel_cr=
tc_state *crtc_state,
>  	struct drm_i915_private *dev_priv =3D to_i915(plane->base.dev);
>  	const struct drm_framebuffer *fb =3D plane_state->hw.fb;
>  	unsigned int rotation =3D plane_state->hw.rotation;
> -	struct drm_format_name_buf format_name;
> =20
>  	if (!fb)
>  		return 0;
> @@ -1168,9 +1167,8 @@ static int skl_plane_check_fb(const struct intel_cr=
tc_state *crtc_state,
>  		case DRM_FORMAT_XVYU12_16161616:
>  		case DRM_FORMAT_XVYU16161616:
>  			drm_dbg_kms(&dev_priv->drm,
> -				    "Unsupported pixel format %s for 90/270!\n",
> -				    drm_get_format_name(fb->format->format,
> -							&format_name));
> +				    "Unsupported pixel format %p4cc for 90/270!\n",
> +				    &fb->format->format);
>  			return -EINVAL;
>  		default:
>  			break;
> --=20
> 2.30.0

The above fix up patch now needs to be applied to the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/BS././NG8qIOJgOu6hWnAIY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBSsmkACgkQAVBC80lX
0Gzpsgf/YsqgwbYpm1vEujHLrODiCLuCVieqi0rDaDeJaxTN1d+PsRpVIvyqNL6B
2CbKvYakS3xKkD4f1YUlUFqA8uNHiVmepciYthnxoiTf+anY6yeJpxHVj/VmtHXR
a7RrWCEUwk4G9azZIYMTSQpKlhNNwhCl/7rVOo24Ra3blq5KhlaJDtEE4vliJzj3
pe/oIgk5/CT+DWRl8FadFlro++c+Lg+91BG6m92LjMMaGbNB//AkVhwGNhEgw5XM
CtUfydvQliOeeBWbROoovKVm95JMJXmCeqEsE2AxOgnIcN2PnboWhR5Sihw//Pwo
KUzK9IQIetRafLGBcg2nbgMIP3sq2Q==
=Wov6
-----END PGP SIGNATURE-----

--Sig_/BS././NG8qIOJgOu6hWnAIY--
