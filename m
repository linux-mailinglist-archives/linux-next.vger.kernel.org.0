Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05624249263
	for <lists+linux-next@lfdr.de>; Wed, 19 Aug 2020 03:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbgHSBeJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Aug 2020 21:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbgHSBeI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 Aug 2020 21:34:08 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D03BC061389;
        Tue, 18 Aug 2020 18:34:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BWVgL00mLz9sPC;
        Wed, 19 Aug 2020 11:34:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597800846;
        bh=3CFmGoUr1qeQ3yQkPQcqoPkqXoYuIS5LuW0Ppe6JGL8=;
        h=Date:From:To:Cc:Subject:From;
        b=OXj8CHfrssKbVbKXQ3v4l1eLeln75/VXGPgD69gLPdsKZOKp6XS3l3pFC/Q8Y/kbT
         E8LupIN9CAqXiiGWrawd4/5dEnUXu//kCYZDFtTC54Kt98A71FguojqT12f/QmM5G5
         TOeXNlV3IHBVgE0QwLWq1ZvrZjEnltMlX93nGM9sd8h14cF0QQTWx/KvQ6yTVZh5by
         HYOjpgMDQonqn0sb21QUu8Vvelyz4NVRoCML4uNfNXLW4c01fYZiD8/sNWb+6HRD8A
         08mkZm2eNRuRCKilanBhe/JNGeydFQVcAwoh65MOXqD2K/utQjcBQf3dHoi0NjNX7N
         gZYFl/X92k0lA==
Date:   Wed, 19 Aug 2020 11:34:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Samuel Holland <samuel@sholland.org>
Subject: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20200819113405.55582925@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H8P6RelfQOFoVvM7gf+cH2z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/H8P6RelfQOFoVvM7gf+cH2z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

sound/soc/sunxi/sun8i-codec.c:532:12: warning: 'sun8i_codec_component_probe=
' defined but not used [-Wunused-function]
  532 | static int sun8i_codec_component_probe(struct snd_soc_component *co=
mponent)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  90cac932976e ("ASoC: sun8i-codec: Fix DAPM to match the hardware topology=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/H8P6RelfQOFoVvM7gf+cH2z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl88gY0ACgkQAVBC80lX
0GwiKAf9GFJrZ2EynQyPuEQpgbLVw32e5Bxr07rIeobQG7eJwa3NCpIG+h4ahvCR
iVoNxTzvTMDVsb0ZIZRb5tX5+018sFEcawMcUvhq465nbZ7tQJudE2SetlLxRtiO
djCvDPNfESZ+nBZMibGXeRorYVmgsAQDQrB2F56RrsQ4VrU6CIEp99YoKYO68G4G
7HcMgV13naGEIGtqeHC7BGU5ajPXsiBvjeWT84tNMJYRuwA8S50Z3DKwFLCZp3xr
B/baZMtnoLDcqqZEmZ9I2ZcRhV2U1btS+RIlgQJBw64BLnb7JGlNnOc/4wFqs/2v
IuwRxPNo2BTDNm/euRmR+YdUSlVzpA==
=Dxqa
-----END PGP SIGNATURE-----

--Sig_/H8P6RelfQOFoVvM7gf+cH2z--
