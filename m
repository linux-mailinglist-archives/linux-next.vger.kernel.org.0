Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA462A37C1
	for <lists+linux-next@lfdr.de>; Tue,  3 Nov 2020 01:31:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgKCAbk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 19:31:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgKCAbk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 19:31:40 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD43C0617A6;
        Mon,  2 Nov 2020 16:31:40 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CQ9gy0WJCz9sRR;
        Tue,  3 Nov 2020 11:31:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604363497;
        bh=abFiyo/RifuMQVqMIhH00amB1yormpJhfqr9G5pJa74=;
        h=Date:From:To:Cc:Subject:From;
        b=EHYEdXwcf9uUh/CupNFo4xDhY0prmaZWJFlUYvdZu1Gl304yd0qg4NLSlfoXalgwK
         yzAgrU4ad8RGQ6PiQQBYNlnRTSGgeEgvdFBEpYGsn/jz3VVf8OhuH0vvBgsbWk3cej
         XnExO0LBywlM15X4Njrsbfh+fUzZ4YRzHuSrjB/xWyeCzBVOns+rO64v5XxOair4Y3
         QMXci3CAooj0g1YbrdjSziALvJPriaDmgCZltLqOc7o0pItQ1GTSEF0f+rpzs1/NQR
         9mxYltd0HTm7XdbDyq7HaspwW5Ij44XSBRsSY4qCcSKAvMMd9eoFmc8YE8EusGaFcN
         WPBgvllj6aDGA==
Date:   Tue, 3 Nov 2020 11:31:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc-fixes tree
Message-ID: <20201103113121.4f1ffe17@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gJqgW8ibeandfWFBKfAJJxB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gJqgW8ibeandfWFBKfAJJxB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc-fixes tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/gpu/drm/vc4/vc4_drv.c: In function 'vc4_drm_unbind':
drivers/gpu/drm/vc4/vc4_drv.c:322:18: warning: unused variable 'vc4' [-Wunu=
sed-variable]
  322 |  struct vc4_dev *vc4 =3D to_vc4_dev(drm);
      |                  ^~~

Introduced by commit

  dcda7c28bff2 ("drm/vc4: kms: Add functions to create the state objects")

--=20
Cheers,
Stephen Rothwell

--Sig_/gJqgW8ibeandfWFBKfAJJxB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+gpNkACgkQAVBC80lX
0GzObAf9ELauIfurBLxpumwv/j7hYeA/o36O9sxR7KMYt/GU0Wf6N2v9s5jxS8nP
kECfAc743DU2tB6ruz4LhM5Ftz/Bl1gIP0fkgjN9dx3dvBUSN17iyVJTkriSm+Pw
wEHzVUhbZA0jDRL6+KceMBRbiijlrnjfeQ41yiEbLt7NX7zKoOwXwN/yXAAF11/Y
z/urYPtssjKfOXTca/DbC27hE9N/voIII80qODgj4zDFD4N4UY5n/UBMyDrEUcc4
BqF7pshekl9aSlRKODh3NIRP9D7CXij4ClP/Oz3mnX9F8ZiD0ma/SKBBoD6Vbqwi
XIPcQ0x9tC6LyjM3EEuhtsHOgLE5yQ==
=23z8
-----END PGP SIGNATURE-----

--Sig_/gJqgW8ibeandfWFBKfAJJxB--
