Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8B5B3D3213
	for <lists+linux-next@lfdr.de>; Fri, 23 Jul 2021 04:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233396AbhGWCRj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Jul 2021 22:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233222AbhGWCRi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Jul 2021 22:17:38 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0129C061575;
        Thu, 22 Jul 2021 19:58:12 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GWDXJ2pCMz9sV8;
        Fri, 23 Jul 2021 12:58:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1627009089;
        bh=AVPR+HcNVfylKc22PFaIntULQ0TKJ7pTUnfJX1iiFeQ=;
        h=Date:From:To:Cc:Subject:From;
        b=SFeZyOkWItCY/ch6/0UVrskzYCQYx6XFfLumu7v7k+2Uhx0gp11iVODMgLJN1USgS
         Da2K7vxCP78UvIiwsWJsbBSqzFEg4YZUVuk//+N+lIk8izy31bHtI0Xodqp4j64Enf
         awT2MExXb/g9t8Yw7ctU4fNKelDkOQRsZwZj04eGEMc6QRftScUYBt4uKhZbOiTNbu
         BrTteadVuyb9d47is+5K0nI6uA2huBAF29DhhU0oUqfiUnw9xE/GH/JdC10JmuPJTY
         rA81SMl1oQYbE+7qiZTpeYDBQe+QCt/061PbqUVQnToy3aqskGHAoEtQzVJ6C7GI2m
         iXP6EiSaE+xhg==
Date:   Fri, 23 Jul 2021 12:58:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stylon Wang <stylon.wang@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the drm-fixes tree
Message-ID: <20210723125807.3c779f68@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z_=BRdfQ0zkCFuZVtIKC_mv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Z_=BRdfQ0zkCFuZVtIKC_mv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c

between commit:

  6be50f5d83ad ("drm/amd/display: Fix ASSR regression on embedded panels")

from the drm-fixes tree and commit:

  fb85f280bf40 ("drm/amd/display: Re-enable "Guard ASSR with internal displ=
ay flag"")

from the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 9fb8c46dc606,036a87af6c5b..000000000000
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@@ -1761,6 -1752,38 +1752,36 @@@ enum link_training_result dc_link_dp_pe
  	return status;
  }
 =20
+ static enum dp_panel_mode try_enable_assr(struct dc_stream_state *stream)
+ {
+ 	struct dc_link *link =3D stream->link;
+ 	enum dp_panel_mode panel_mode =3D dp_get_panel_mode(link);
+ #ifdef CONFIG_DRM_AMD_DC_HDCP
+ 	struct cp_psp *cp_psp =3D &stream->ctx->cp_psp;
+ #endif
+=20
+ 	/* ASSR must be supported on the panel */
+ 	if (panel_mode =3D=3D DP_PANEL_MODE_DEFAULT)
+ 		return panel_mode;
+=20
+ 	/* eDP or internal DP only */
+ 	if (link->connector_signal !=3D SIGNAL_TYPE_EDP &&
+ 		!(link->connector_signal =3D=3D SIGNAL_TYPE_DISPLAY_PORT &&
+ 		 link->is_internal_display))
+ 		return DP_PANEL_MODE_DEFAULT;
+=20
+ #ifdef CONFIG_DRM_AMD_DC_HDCP
+ 	if (cp_psp && cp_psp->funcs.enable_assr) {
+ 		if (!cp_psp->funcs.enable_assr(cp_psp->handle, link)) {
+ 			/* since eDP implies ASSR on, change panel
+ 			 * mode to disable ASSR
+ 			 */
+ 			panel_mode =3D DP_PANEL_MODE_DEFAULT;
+ 		}
 -	} else
 -		panel_mode =3D DP_PANEL_MODE_DEFAULT;
+ #endif
+ 	return panel_mode;
+ }
+=20
  bool perform_link_training_with_retries(
  	const struct dc_link_settings *link_setting,
  	bool skip_video_pattern,

--Sig_/Z_=BRdfQ0zkCFuZVtIKC_mv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD6MD8ACgkQAVBC80lX
0GwscQf/ezmWzqUMoVnvRMzL8SXNtKmeAEFws6gdurJHat+vZq1WV64XKWTztkqv
Ol4HSgtrhrudgxsPVKUb0S15MZVHXCaQ0LTFPRyzuiXDPYqc4fNk6bSLnhr2EfcR
KM42UIb9wwZ7z6K3FD82gtOZAbAkEZcs20LXahyfuNolasKJah1FMTeq/ZkqViKd
+RYGB9gzBSm6tWMCYAhJAAUgjXi9UmZljUJfadotpdNKYTJ7s4QYSoAzXIBpgqF2
vGsVnv7bCXDqnFGcZmKrHAVe8ibHx1ITF/Fo/IRYLx9CLZCP5rxw8V2PNgkfAQHK
aZUvsk2EmNNMCpBHcKBpeOCPXkIe/w==
=pfez
-----END PGP SIGNATURE-----

--Sig_/Z_=BRdfQ0zkCFuZVtIKC_mv--
