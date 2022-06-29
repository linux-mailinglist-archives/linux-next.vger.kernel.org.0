Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76D3955F29F
	for <lists+linux-next@lfdr.de>; Wed, 29 Jun 2022 03:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbiF2BGh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jun 2022 21:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiF2BGg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Jun 2022 21:06:36 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBB771AF0F;
        Tue, 28 Jun 2022 18:06:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4LXjw50pC7z4xNm;
        Wed, 29 Jun 2022 11:06:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1656464790;
        bh=1+3MwZKZd2ZjLIsG0nYYRRDCrE/OOrfj/eVPhlnuJgk=;
        h=Date:From:To:Cc:Subject:From;
        b=SlJ6I7oKOmch/ygFbgoaGyHouagSM7o6jND0clZbciwc3sklNQbTjQuosDbcwWZK4
         HFk2zFbJ9AvGj7RHc+7MrzO0+ZDGOS3AeNl5jOPLQ8A7gM6d2Vc7UTYFBV2BknPXFI
         mu0LwiXH+YrAi8HR6OrdwZzARYop9+TSFUdc3jb6lOr3f1Dj5J0XHkytGm4cs+T/i5
         MnXPeIRJFkdql8HxZH9d1YIrdnTWt6BrgEFTc6zH5wS6v2UV0HNhdvwIolegPtfsaj
         M03qyzBqpNYavaZpevd6rsPp+ZPPVS9ptte9FWmN5qBVe1DxKhCxXqbn+ySRtrkxmV
         2xQ9Af24GDTyA==
Date:   Wed, 29 Jun 2022 11:06:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>
Cc:     DRI <dri-devel@lists.freedesktop.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20220629110628.71bef7c7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DP_7CW2A3Q1lQG13JlFqtyu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DP_7CW2A3Q1lQG13JlFqtyu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/vc4/vc4_drv.c

between commit:

  538f11116061 ("drm/vc4: drv: Register a different driver on BCM2711")

from Linus' tree and commit:

  da8e393e23ef ("drm/vc4: drv: Adopt the dma configuration from the HVS or =
V3D component")

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

diff --cc drivers/gpu/drm/vc4/vc4_drv.c
index 0f0f0263e744,14a7d529144d..000000000000
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@@ -281,16 -230,25 +290,26 @@@ static int vc4_drm_bind(struct device *
 =20
  	dev->coherent_dma_mask =3D DMA_BIT_MASK(32);
 =20
 -	/* If VC4 V3D is missing, don't advertise render nodes. */
 -	node =3D of_find_matching_node_and_match(NULL, vc4_v3d_dt_match, NULL);
 -	if (!node || !of_device_is_available(node))
 -		vc4_drm_driver.driver_features &=3D ~DRIVER_RENDER;
 -	of_node_put(node);
 +	is_vc5 =3D of_device_is_compatible(dev->of_node, "brcm,bcm2711-vc5");
 +	if (is_vc5)
 +		driver =3D &vc5_drm_driver;
 +	else
 +		driver =3D &vc4_drm_driver;
 =20
+ 	node =3D of_find_matching_node_and_match(NULL, vc4_dma_range_matches,
+ 					       NULL);
+ 	if (node) {
+ 		ret =3D of_dma_configure(dev, node, true);
+ 		of_node_put(node);
+=20
+ 		if (ret)
+ 			return ret;
+ 	}
+=20
 -	vc4 =3D devm_drm_dev_alloc(dev, &vc4_drm_driver, struct vc4_dev, base);
 +	vc4 =3D devm_drm_dev_alloc(dev, driver, struct vc4_dev, base);
  	if (IS_ERR(vc4))
  		return PTR_ERR(vc4);
 +	vc4->is_vc5 =3D is_vc5;
 =20
  	drm =3D &vc4->base;
  	platform_set_drvdata(pdev, drm);

--Sig_/DP_7CW2A3Q1lQG13JlFqtyu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmK7pZQACgkQAVBC80lX
0GzcnAf9EA2ipdBu8Ikl1iWWxpX4SFpr20QAEFImlf1bfZyG83uAeOstubLdNhmQ
8HdeZ+49Dtgc1DMn1P8Wapbv6Amso1atlThn0USMonoI3WFfgx8EWHRKQcdvSEPb
IxuTKIa/4XSHXoIG+1Dh2Gi0D8LeXLdxb5jNbA8AdHms6gJjEfbUxFWjB6mhhdld
5hhElPn0MqHzf0AAk/UtuoZ1dQIAZ2jDp6Aer+J/8ZLzOQA7piMdVLitYh0V4gYG
rbW9sCgEXwIUakEb2PADSqq7nIr6TU31mJjg0Qk7mRItSeuT3/GSo8PZ1nCRHkKA
PfbgE6pvQ7MixJT6ysv1kGSbXpSQUg==
=6sWZ
-----END PGP SIGNATURE-----

--Sig_/DP_7CW2A3Q1lQG13JlFqtyu--
