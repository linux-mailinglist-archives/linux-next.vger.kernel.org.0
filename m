Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5A7CB18F
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2019 23:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730713AbfJCV4s (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Oct 2019 17:56:48 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50827 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726002AbfJCV4s (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Oct 2019 17:56:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46kn0F5q3Nz9sPl;
        Fri,  4 Oct 2019 07:56:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570139805;
        bh=h9nN/ZgKI9bs7xE62e7QIoDmPYM8Zxxl4Udwidfyin0=;
        h=Date:From:To:Cc:Subject:From;
        b=G//YceGfGwrKyOXTlFHG7v25TTEiE3xzb+G0n7bnTCUY/PkxUtdkRtBn4CE7xya7L
         yiFLy5ywOhF3fPry+DEQ8bWte6sgK9k3rjyZW2qcEseLZk0XkYjkMWS3/r/iCqImMs
         I8SddJbVloGf00r+nmj4l0/1su/vYr/sTAmBnnkyowSpDvHd3fqdc3eRvejnz+hm/v
         eQQ18f6qDIO8dXNNSwG+hPzleov3iDCIBxck74/hL3crE2CBYAhoUTI0iBpp8J66L4
         fcb04nK62IR1Aqy9098YqzsepouEes1SY2BOTs+aQPxnUwVZqMEGSZ11OWyfZUdCT9
         RCGlw75dNPHHw==
Date:   Fri, 4 Oct 2019 07:56:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hugh Cole-Baker <sigmaris@gmail.com>
Subject: linux-next: Fixes tag needs some work in the rockchip tree
Message-ID: <20191004075645.715fb074@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/30ogMC48ZC4suie7lnnLB0l";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/30ogMC48ZC4suie7lnnLB0l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b62ce630fddb ("arm64: dts: rockchip: fix Rockpro64 RK808 interrupt line")

Fixes tag

  Fixes: e4f3fb4 ("arm64: dts: rockchip: add initial dts support for Rockpr=
o64")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/30ogMC48ZC4suie7lnnLB0l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2Wbp0ACgkQAVBC80lX
0GzUoAf/f5C+acLVyTkfj1UKwXxVdcX0aXTmCZpcned9VDl5YK7qSWptMO2dVIiJ
ARSLYfpI5zDlEehDPfA9wkF1r7JfE5hxh676i9lmqc7Xc4jUETodcGN0FrCdJyex
IsPBi75Y20xf1VM6WYakGdBXMAS1MSP+uoJ6ns/uJbDjcpr6eeQnDrEyvszh/ypA
JdVs4xGM1mJxYuVpmZPemuwXlydy2P12ykTcFwl6rRPB5xFgqljIn179BpXJLLak
FQXTzFzH/XoUYNoZbc/wXkth0pCSwitX0YooPJUXVkV+PzDv6OQFf6ugoCVNoxV0
Bas3rauMf/GV8z41PkwwiWsAyrbHSQ==
=l3CR
-----END PGP SIGNATURE-----

--Sig_/30ogMC48ZC4suie7lnnLB0l--
