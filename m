Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 773CC107E13
	for <lists+linux-next@lfdr.de>; Sat, 23 Nov 2019 11:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfKWKiI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 23 Nov 2019 05:38:08 -0500
Received: from ozlabs.org ([203.11.71.1]:55975 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726141AbfKWKiI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 23 Nov 2019 05:38:08 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47KqWd5Kygz9sPT;
        Sat, 23 Nov 2019 21:38:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574505486;
        bh=bnvsHm6hocJvSDljZVTTi1VrUYj3ZLx2xrnHxYB//iU=;
        h=Date:From:To:Cc:Subject:From;
        b=RTDcw08GZrt4/VOx4JeIWSigwtu10emHykywUqqFr1kgiKAyFGDUjsBaau0oFBiUe
         NsFEjJymozEF9bGBuTb8D5Sb9H1SLJ1SPu0sIFIoefL/oQ2nzBlDTF3X7W33mUVvfO
         eOx2b8MntpYsvS0cV3D0wC2LGcdnD200rmVUAJuApHCdAqs00avCs/Vgw+iMThgFA+
         eLctoPrXe5gwUyNco6VnITI9CUNMv2AEFCmSJ/Nni8KfdGU95IfHG9ckwG9AU5ocUc
         A1/AN3/KseIk8eWFeZNsDKlfkWHRgiJWWhfC31TSznUb+w6Jef9VptmA2KzoXiCq5p
         pI4n+Ktde4akw==
Date:   Sat, 23 Nov 2019 21:37:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: linux-next: Fixes tag needs some work in the devicetree tree
Message-ID: <20191123213754.0e6a9872@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lSS9=4FB1AdXg250S11Zeq3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lSS9=4FB1AdXg250S11Zeq3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  a8b0edcdd852 ("dt-bindings: power: Rename back power_domain.txt bindings =
to fix references")

Fixes tag

  Fixes: ea312b90857d ("dt-bindings: power: Convert Generic Power Domain bi=
ndings to json-schema")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: 5279a3d8bede ("dt-bindings: power: Convert Generic Power Domain bind=
ings to json-schema")

--=20
Cheers,
Stephen Rothwell

--Sig_/lSS9=4FB1AdXg250S11Zeq3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3ZDAIACgkQAVBC80lX
0GwmcQf+PQqpIoBlBtGt6StzSZngBli7O1/CIyS/BghfDc2psSpTzuKuCRsOOo9g
QrG4xEpytC3DSiyVabU2npvwryMp01grOyU+by1208es0AQ8/sogszXAv2uz5raX
0yDfckHCaYUpZ4b1qnLpL4X6EM7RyeXWaxucG335O3e/ccXYCy0w2xKjuJL36Ddz
fUz5g0UkkGdnromDQ4nddOD+VB4G7vzWvxEAwH7uRG1qW+bOg3wRpWWg+7JZ1jBE
MZJfp9KkEH0eJPmL9NT7JoY2LbDNdITE9bS0f9uE9t/ZKKvqWEZDsuv+CRUrqVz0
Zq7C375B3VY8ryHxh01rG26dbn+Y9g==
=acCH
-----END PGP SIGNATURE-----

--Sig_/lSS9=4FB1AdXg250S11Zeq3--
