Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 177BE2F9700
	for <lists+linux-next@lfdr.de>; Mon, 18 Jan 2021 01:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730517AbhARA6u (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 Jan 2021 19:58:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729621AbhARA5O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 17 Jan 2021 19:57:14 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF0CC061573;
        Sun, 17 Jan 2021 16:56:33 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DJtdl2zSjz9sWL;
        Mon, 18 Jan 2021 11:56:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610931390;
        bh=dblihYaz5X39tjfecv/dai/t29h3iT+VXjnXgyxnQ+s=;
        h=Date:From:To:Cc:Subject:From;
        b=Z4/J6Gm8hLAk4tkbn4nod18cxVArddA9NWDnQreEPD8qdGbPnOBXGVOSGigfVerW8
         Rv9WOTwHM2rEHzk4hMue+Nb06PNfwW4AsgJcRL3XPCi9rEDjBIDzPrnNIoqUS4n/WQ
         ahQz1H1niNZ6sbhXZMD96Okn3LiOONu2E+mB5mAli6wFltzFYUTLmpXKKhOpGevEYA
         +YsRX0vUDOUrxdVhXXYLBbiOvW3IdJxdBUgdt65cM6Xocrm8aGFdjd0FiW9G0Yhx6v
         yhkTWd6D0xLmPueH08j1hCvpZpV0is3WKMCVOr9pVbDgdrElN6tmIF+LhDtDBzxpQb
         ExKXP/WZte56g==
Date:   Mon, 18 Jan 2021 11:56:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20210118115625.0dae1d02@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j/H4e3/VxnyZ5RlZTzvJSXm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/j/H4e3/VxnyZ5RlZTzvJSXm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h

between commits:

  3c517ca5212f ("Revert "drm/amdgpu/disply: fix documentation warnings in d=
isplay manager"")
  a7ddd22151fc ("Revert "drm/amd/display: Expose new CRC window property"")

from Linus' tree and commit:

  71338cb4a7c2 ("drm/amd/display: enable idle optimizations for linux (MALL=
 stutter)")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 1182dafcef02,f084e2fc9569..000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@@ -336,6 -336,39 +336,13 @@@ struct amdgpu_display_manager=20
  	 */
  	const struct gpu_info_soc_bounding_box_v1_0 *soc_bounding_box;
 =20
+ 	/**
+ 	 * @active_vblank_irq_count
+ 	 *
+ 	 * number of currently active vblank irqs
+ 	 */
+ 	uint32_t active_vblank_irq_count;
+=20
 -#ifdef CONFIG_DEBUG_FS
 -	/**
 -	 * @crc_win_x_start_property:
 -	 *
 -	 * X start of the crc calculation window
 -	 */
 -	struct drm_property *crc_win_x_start_property;
 -	/**
 -	 * @crc_win_y_start_property:
 -	 *
 -	 * Y start of the crc calculation window
 -	 */
 -	struct drm_property *crc_win_y_start_property;
 -	/**
 -	 * @crc_win_x_end_property:
 -	 *
 -	 * X end of the crc calculation window
 -	 */
 -	struct drm_property *crc_win_x_end_property;
 -	/**
 -	 * @crc_win_y_end_property:
 -	 *
 -	 * Y end of the crc calculation window
 -	 */
 -	struct drm_property *crc_win_y_end_property;
 -#endif
  	/**
  	 * @mst_encoders:
  	 *

--Sig_/j/H4e3/VxnyZ5RlZTzvJSXm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAE3LkACgkQAVBC80lX
0GyWsAf8DbG8yMIm6wKl2OuMErnvA9zPz2NaqaQRFhiNApZsTin4cxJ0TnbrV8B7
SmwQiBwyDXFejeUsCMdEhQXOdiJI660az7sBAy9zfAB20Z46Kf27Akzou272r322
BKUGSdcPBSQo+8+TG5ICtXS2MexjAwlOICmc5OaI17V/HCiuvQS4fgpvsp/o0nUa
bzdNY+xdM3KS5V97PBEMkyQ7yyDLkEx/HYgGjV4WrpokULFrdipqgj03mnasXR2y
HB1bXvQb+qHWbLhuM8OUgBjMV8K3A5M8rucmh2At4qUI890+JeBWLNdD34TeELuP
laxqtMCqc5vtepmoJlToYThCwzClQg==
=bLvs
-----END PGP SIGNATURE-----

--Sig_/j/H4e3/VxnyZ5RlZTzvJSXm--
