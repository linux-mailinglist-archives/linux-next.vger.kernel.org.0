Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFB715421ED
	for <lists+linux-next@lfdr.de>; Wed,  8 Jun 2022 08:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240673AbiFHBSY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jun 2022 21:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389487AbiFHAfw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Jun 2022 20:35:52 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A10BA59B8D;
        Tue,  7 Jun 2022 16:59:38 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4LHnQc41TJz4xD9;
        Wed,  8 Jun 2022 09:59:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1654646377;
        bh=qMAL1jVBkcRNa7CuXLedIvQH7GZUdyMOYdDM3XQ6o8E=;
        h=Date:From:To:Cc:Subject:From;
        b=V8jjSVrVKRxsBz2Ar5yvxoDzEXe2NEZ4RtEsehU2OBVJHycdwDsU5AQMkLfYEliTL
         4MaIQ040AVnj3hh4MD7IwLcE05vQMYZkImX/a8FY0XwhgbWBFEYe5sDOQIBnbUUaUJ
         cmZHyBdtlAF5CNra4tsXUghBO7TCxg3B4id3nVZNZGPzC4d06etFVfZqKfDDD5iLf5
         BcxSa0T+bbadM+En9EXf+KsUUqJjGsqY9FjkWKSRUNhLFCpdLQqfzqXd7f19hyhaUi
         yrA0SubKFMDcoR1Sj/4YbZi4MUif0wHCCOLe2f1m/9ILqgz4MfJwbcjUxptv2UfOrb
         G/wkwTYPwDSHw==
Date:   Wed, 8 Jun 2022 09:59:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc:     Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Anshuman Gupta <anshuman.gupta@intel.com>,
        Ashutosh Dixit <ashutosh.dixit@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Message-ID: <20220608095935.2265208c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TOyBKbYeeW.Z63VLYgIRDgG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TOyBKbYeeW.Z63VLYgIRDgG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/gt/intel_rps.c

between commit:

  56758cc45955 ("drm/i915/rps: Centralize computation of freq caps")

from Linus' tree and commit:

  ee421bb4cb95 ("drm/i915/pcode: Extend pcode functions for multiple gt's")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/gt/intel_rps.c
index 3476a11f294c,ce61ceb07114..000000000000
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@@ -1138,15 -1095,13 +1138,16 @@@ static void gen6_rps_init(struct intel_
  	if (IS_HASWELL(i915) || IS_BROADWELL(i915) ||
  	    IS_GEN9_BC(i915) || GRAPHICS_VER(i915) >=3D 11) {
  		u32 ddcc_status =3D 0;
 +		u32 mult =3D 1;
 =20
 +		if (IS_GEN9_BC(i915) || GRAPHICS_VER(i915) >=3D 11)
 +			mult =3D GEN9_FREQ_SCALER;
- 		if (snb_pcode_read(i915, HSW_PCODE_DYNAMIC_DUTY_CYCLE_CONTROL,
+ 		if (snb_pcode_read(rps_to_gt(rps)->uncore,
+ 				   HSW_PCODE_DYNAMIC_DUTY_CYCLE_CONTROL,
  				   &ddcc_status, NULL) =3D=3D 0)
  			rps->efficient_freq =3D
 -				clamp_t(u8,
 -					(ddcc_status >> 8) & 0xff,
 +				clamp_t(u32,
 +					((ddcc_status >> 8) & 0xff) * mult,
  					rps->min_freq,
  					rps->max_freq);
  	}

--Sig_/TOyBKbYeeW.Z63VLYgIRDgG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmKf5mcACgkQAVBC80lX
0GyXQgf7BX8DnOO0GivgnVtHilyjOsd3SssG+71vVW0GOiXtJkJi3pkbgTGaQ3DG
bmco/k94IAKLipqDqLx6YmN8MSh+fyJeJCLA3FyGEJEiNGi47DLje4YGo0OwGmxK
J/cpqwFHgQ8j1sIKK8rbAVeORJ+M/pPBHCNeZbseDG1gi2eJlRwzTlHJdFgNdMWk
nTrI/FkTzxykW/K7YhJf5bUarrvDvKJkqfeJhZXb6nsSfU3RZylnXsztkh7xk5lm
HS8VqEirKLuCK8N5M2JlPkO1+tj1SIAEQSzhUYkTUc2rr52U+zTdplZDSxpbSr/s
b+iqHl61jVrgNk+hPC3LSW4yEilQmQ==
=W50a
-----END PGP SIGNATURE-----

--Sig_/TOyBKbYeeW.Z63VLYgIRDgG--
