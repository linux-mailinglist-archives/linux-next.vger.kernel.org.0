Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7BE29A201
	for <lists+linux-next@lfdr.de>; Tue, 27 Oct 2020 02:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409284AbgJ0BFw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Oct 2020 21:05:52 -0400
Received: from ozlabs.org ([203.11.71.1]:35863 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408613AbgJ0BFv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Oct 2020 21:05:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CKtms4TYyz9sRK;
        Tue, 27 Oct 2020 12:05:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603760749;
        bh=lPKXSMNrrrUfU7oXUMBJyamwJ+XBop/o83Zh0KYxJMo=;
        h=Date:From:To:Cc:Subject:From;
        b=u/PsmOIArackl+F5S2IenlOlbjdQqBpbF1L5dESkLYSh6pSlxvOBZJOAKAa/D6Zlx
         Kd1lkJaqJ+xOyBRpxzZP4HU01V3rShx1mnAoMSdF8cdW6aUQ8x7tLssOyJ/TMTiGlE
         HnOEnEjZYsVW0aNtDiao2mAZvF1qk28/1nBCPbSYxRGO/Beji+DPMHyAAIVHm3blE0
         CtaTj4qFCsdcz74FcqIxxcezfo/brd21kw6jva7kEN8tvjULcfunH6TGT7L3C/MfCB
         TnjpXdPe6Cz8Rv9PzWKWVdr/5ffnGM36L9Bb/gtV7J2g0l0kBwt4Mt6f12buJzVGNL
         KFuuEzGIBNsTA==
Date:   Tue, 27 Oct 2020 12:05:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Yifan Zhang <yifan1.zhang@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the amdgpu tree
Message-ID: <20201027120548.5618aa56@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WNd.wFTf6=VoXhUcMUeZJQE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WNd.wFTf6=VoXhUcMUeZJQE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'a=
mdgpu_dm_init':
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:947:34: warning=
: unused variable 'pa_config' [-Wunused-variable]
  947 |  struct dc_phy_addr_space_config pa_config;
      |                                  ^~~~~~~~~
At top level:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:888:13: warning=
: 'mmhub_read_system_context' defined but not used [-Wunused-function]
  888 | static void mmhub_read_system_context(struct amdgpu_device *adev, s=
truct dc_phy_addr_space_config *pa_config)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  0b08c54bb7a3 ("drm/amd/display: Fix the display corruption issue on Navi1=
0")

--=20
Cheers,
Stephen Rothwell

--Sig_/WNd.wFTf6=VoXhUcMUeZJQE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+XcmwACgkQAVBC80lX
0GxToAf/dgU5iXyaetur5vsgdX3FJr5iR48r4dGsM2egblmA1sVQU2B5RXQJAKtj
ePLyROMsYzOT8wXUlqGPjiZVCz8ROWil22IPJ1XhQaWVA2bq5fpOS0Y/0DxN6CM+
btVfdb5yxscCZImthu9Qm84FkSNZiHcbyjkMU18PxTup5Lk3J3MW5fPqdJ5BCONw
/0dMZMJUiQm0Xonwv7wKK99spEbH7mLGotWKdoRA20fqLQ7jrUGu+Gt/rDFajbnz
DvNEMAjOJJG+7dkku8fByivaFOPDlO4ZTE67QrqDbEC4HkWUwtfvwP2I2OReAVn/
+sz0Zo7Nuf312VPS5RM5LlaiIusCRw==
=jyM9
-----END PGP SIGNATURE-----

--Sig_/WNd.wFTf6=VoXhUcMUeZJQE--
