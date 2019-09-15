Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1994B3231
	for <lists+linux-next@lfdr.de>; Sun, 15 Sep 2019 23:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbfIOV0j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Sep 2019 17:26:39 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:50828 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbfIOV0j (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Sep 2019 17:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=X6ofwtzaPNoZu59J/JHRxv14EPtQuFvxrci0ghWNp6Q=; b=u+ZQVN8b/M4IHTTOKtmUQDYaT
        BAsmbQeFTu030/UficpaTRZ51NG4U91uNxdg0jTrrSGt4zhEKs2TEg11Q6kzu+2/yFLlzwbVduqAP
        xgrWE7fdQiDvASO0rwSjsyGLSgwORk/ghtHbnIQWKy0aKDW3Xa306MzfWQ4tYpl3MGXus=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9c2V-0001QF-9t; Sun, 15 Sep 2019 21:26:35 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 3B33327415FF; Sun, 15 Sep 2019 22:26:34 +0100 (BST)
Date:   Sun, 15 Sep 2019 22:26:34 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Kevin Wang <kevin1.wang@amd.com>, Huang Rui <ray.huang@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Prike Liang <Prike.Liang@amd.com>,
        Evan Quan <evan.quan@amd.com>, Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the amdgpu tree
Message-ID: <20190915212634.GI4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zqjkMoGlbUJ91oFe"
Content-Disposition: inline
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--zqjkMoGlbUJ91oFe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h

between commit:

  03dce35deb8575 ("drm/amd/powerplay: remove duplicate macro smu_get_uclk_d=
pm_states in amdgpu_smu.h")

=66rom the amdgpu tree and commit:

  eee3258e8f8be8 ("drm/amd/powerplay: add the interface for getting ultimat=
e frequency v3")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
index a78b2e2958950,320ac20146fd1..0000000000000
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
@@@ -907,10 -746,14 +746,10 @@@ struct smu_func
  	((smu)->funcs->register_irq_handler ? (smu)->funcs->register_irq_handler=
(smu) : 0)
  #define smu_set_azalia_d3_pme(smu) \
  	((smu)->funcs->set_azalia_d3_pme ? (smu)->funcs->set_azalia_d3_pme((smu)=
) : 0)
+ #define smu_get_dpm_ultimate_freq(smu, param, min, max) \
+ 		((smu)->funcs->get_dpm_ultimate_freq ? (smu)->funcs->get_dpm_ultimate_f=
req((smu), (param), (min), (max)) : 0)
 -#define smu_get_uclk_dpm_states(smu, clocks_in_khz, num_states) \
 -	((smu)->ppt_funcs->get_uclk_dpm_states ? (smu)->ppt_funcs->get_uclk_dpm_=
states((smu), (clocks_in_khz), (num_states)) : 0)
  #define smu_get_max_sustainable_clocks_by_dc(smu, max_clocks) \
  	((smu)->funcs->get_max_sustainable_clocks_by_dc ? (smu)->funcs->get_max_=
sustainable_clocks_by_dc((smu), (max_clocks)) : 0)
--#define smu_get_uclk_dpm_states(smu, clocks_in_khz, num_states) \
--	((smu)->ppt_funcs->get_uclk_dpm_states ? (smu)->ppt_funcs->get_uclk_dpm_=
states((smu), (clocks_in_khz), (num_states)) : 0)
  #define smu_baco_is_support(smu) \
  	((smu)->funcs->baco_is_support? (smu)->funcs->baco_is_support((smu)) : f=
alse)
  #define smu_baco_get_state(smu, state) \

--zqjkMoGlbUJ91oFe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1+rIkACgkQJNaLcl1U
h9Aiwwf+PkGOeqgnNp7x4175oFMXXdqvxUilkp95IEqSNy48lzvGMnxqI0fORUIJ
Yv+70L1iTsxyoZw/C7hA/VQYc9KROhxFyim+t8wW0rIYirTJQ0MK5gOVSEnrK6tk
yGSybok256/iIujuV1DsXLrn425AzbTZZ2QndkbzWKSSX+os+2KEltDLfTGSIkCb
wP0aWtN79tpCiGGJ6xcg8QB2kRQJ+/Ol4+YwVRv8C77s1hy9Q5/J8URdZoGyPeFk
VmRIROwZPycK33feO2cT14s/nicwLudIGcj4jdyEL06XdLVGSmvYp5NArkctjeAL
huOhUFVHHBqeN/zQRK+nqFoHXjoDWA==
=VHA4
-----END PGP SIGNATURE-----

--zqjkMoGlbUJ91oFe--
