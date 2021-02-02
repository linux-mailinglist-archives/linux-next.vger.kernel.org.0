Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9226930CC90
	for <lists+linux-next@lfdr.de>; Tue,  2 Feb 2021 21:01:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbhBBUAR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Feb 2021 15:00:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240259AbhBBT6n (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Feb 2021 14:58:43 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C00C061573;
        Tue,  2 Feb 2021 11:58:01 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DVbFw1Crfz9tlT;
        Wed,  3 Feb 2021 06:57:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612295877;
        bh=J+JvAQeb0ZSXaaN5XWDRAULBG+BGfSXBbOOLWMf1Tcs=;
        h=Date:From:To:Cc:Subject:From;
        b=fAowNYrwDsauDwK11D/2iB+SjBsfGM/+hBS5SnsFILqdnm4DGzH6iqDwsWLTBd0mB
         asxR+AjqQ0T9/QlEwMDHhvIslicy0jaHVuMXxr18xfSJcbBlKcrDMm9zLNJ8MYfGmS
         aNWPim4gOop1MkcRWeO84GERBOcVbQBUsoGKo0ZIx2bo/fHiT34E1P/AZNgv6IaiS3
         bCV0Brro/b+WqGjOMF0i7kU6m3T8uxoJu1aV+ZQq4WUREEGRv2lr+YPpNBsfQLV+pg
         OQpRPQlTmTTWWltkNMsoBvR/NwiX6QVuwOSUCJ9n3wicYT4scLOfKb4l2uf6d+a1vu
         /lEa3p0FUgz4Q==
Date:   Wed, 3 Feb 2021 06:57:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the arm-soc tree
Message-ID: <20210203065754.6b351c79@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T68msDAvX5wZ2qAMw_aeyuL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/T68msDAvX5wZ2qAMw_aeyuL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  4e238bfd83f3 ("ARM: dts: sun7i: a20: bananapro: Fix ethernet phy-mode")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/T68msDAvX5wZ2qAMw_aeyuL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAZrsIACgkQAVBC80lX
0GwskQf8DQSjYffS9KmZdTTzLEpSxUlwgittd2kw6GZ0tfU8GVfzVQ8esoHnJU+y
J6Kz5e7+CCMTo71XSDuoLThvU5PBnwrhuwy8SucP5FKS11YQJkU81vD4q0mTNUzm
Mchn64R4/D8a74D+S2a3OnxIV7LARNF5Pcoz2rvvGAngpAdRfU2i05TsNegE5zTp
9vzR3+9fCsaMqn7T0W39kYTQQFGU3iRPHs+oWYDw4zyRPpEfClc54ftbiFghMETx
1L4qUcPHxctJr0ojxuvuACTmKSuoAQNnqBlEUjcPUwlA/bjg0G+2xgD/JnSDW1+e
16SESPNEpwOCcIVMav+mjfhhOFjnBg==
=WlKF
-----END PGP SIGNATURE-----

--Sig_/T68msDAvX5wZ2qAMw_aeyuL--
