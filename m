Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7AF91A006F
	for <lists+linux-next@lfdr.de>; Mon,  6 Apr 2020 23:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgDFVtR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Apr 2020 17:49:17 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50669 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726225AbgDFVtR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Apr 2020 17:49:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48x41k4g5tz9sPF;
        Tue,  7 Apr 2020 07:49:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586209755;
        bh=NWcuyzViV6lzfUobgKJBcKajPh/YkbUXXzQpMSODrGI=;
        h=Date:From:To:Cc:Subject:From;
        b=Tve+3Sxu2pQpZyDbUNXcW77iK+kyroU3prUAIrA6SUK79yf4Fx3kn7DI7LaPL7ZC/
         bVgNd4iQ3UxP9Xnht6zzmAMftT22I+DYb9052oBwigtYqyqMkQKzQsKJEwXOVvmcoA
         Cyzogn9bg1cKmvY+NUM9M7kHdVmJQtL7+QSp/5dUZq1fj7y2r1NTmh0JXVEtHXqh4d
         /XAwoRtprFKhuG09/2G3i6SqCzl4pEQZTUF8l45R+uvk+5qhVwzq6Y7F813fijb5eT
         zKFj8ArNkSqFwghscrX0IXtCwPyL2f2iRVUuy1rc6LVt1ZnFmmS4c+c3wZVE7lfho3
         aWnmPZBl54iuQ==
Date:   Tue, 7 Apr 2020 07:49:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Julia Lawall <Julia.Lawall@inria.fr>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Message-ID: <20200407074913.75fd8ac7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6nV8PcPx0=WMHmqqOCoWP_w";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6nV8PcPx0=WMHmqqOCoWP_w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  7506baeed8d0 ("ASoC: stm32: sai: Add missing cleanup")

Fixes tag

  Fixes: commit 0d6defc7e0e4 ("ASoC: stm32: sai: manage rebind issue")

has these problem(s):

  - leading word 'commit' unexpected

Also, please keep all the commit tags together at the end of the commit
message.

--=20
Cheers,
Stephen Rothwell

--Sig_/6nV8PcPx0=WMHmqqOCoWP_w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6Lo9kACgkQAVBC80lX
0GyW3gf+IUmcuFC6x03xBRZyobXMkgF/FjPCyIt9waGAoKkL5zoUlKVJ+kET3ymr
a8BE8UlDR32gmqiqmD5ENJUvGdNW6Uxom6KqF/jcS16Q+AWKSNOh1qk9pV92mFJd
OqmaRaT7XNvqq1P93JJRtEckOkhViU4p3yzBBkRwNQPobEOk8SLkB4buRXqJiA6Z
Pe49HicULGevlDvL7fmYXHbePml/KAXZJtRifeeW83C0CVZaRbI1Jm/EuVXO6hIf
rlVI9Fs/eouiaqOIxuop61GkY88iBlZSldUA9ZjwVmPgSOvcQs4sdbsrxo7Jx7rd
WNGH8J7OGmsWa228lunmcrAo11kvsw==
=ol1I
-----END PGP SIGNATURE-----

--Sig_/6nV8PcPx0=WMHmqqOCoWP_w--
