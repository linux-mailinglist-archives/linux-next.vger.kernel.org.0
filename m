Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3CBD9A243
	for <lists+linux-next@lfdr.de>; Thu, 22 Aug 2019 23:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732656AbfHVVge (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Aug 2019 17:36:34 -0400
Received: from ozlabs.org ([203.11.71.1]:53367 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730759AbfHVVge (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Aug 2019 17:36:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46DyXG6wFFz9s3Z;
        Fri, 23 Aug 2019 07:36:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566509791;
        bh=hsjC5tg0AUO4VczoJ0W3z6ZBbs1wLKV5JQGRElboUTs=;
        h=Date:From:To:Cc:Subject:From;
        b=dMcZkQt5aw0Pl3RhOslmSQPXEna+iVKEMf9UIoV+FQnELhYRSQgMxpLXWXJ/tTFV8
         bzIuLxdf7/YrRw/h0M3uOT4d2P7pUamvcgx1wTzvtlDODGhoosg2X2zHuA8zBQ9oo4
         ssUOZKjzPkqHNufY9NGTwiRgzYcR40jVRwWh6vsjY5LgunlgQUT/mrw+3YCiVvMq0+
         1PODUpkeTJTXJO93JA2fFnFzu5mCjy+L/B6ZjzCOd8ifQeSX3XurPvhnDUjA+7ZlTS
         qxhcg0yRwA+ZJMvbA9Vzw3p3+ZcBFtuJCJm9WarcbgFAkrZFyKTG2SE7QzzS+n5ylN
         j7IPiBGL1aTOA==
Date:   Fri, 23 Aug 2019 07:36:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the sunxi tree
Message-ID: <20190823073545.647ec7d1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aTGv3uv8tSXDXzl4uI2kL1T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/aTGv3uv8tSXDXzl4uI2kL1T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  c60e09f77c83 ("ARM: dts: sun8i: a83t: Enable HDMI output on Cubietruck Pl=
us")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/aTGv3uv8tSXDXzl4uI2kL1T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1fCtYACgkQAVBC80lX
0Gzdtgf/Rvr/o6VttShgxqR7ITjaIT9PuuPBDvrNx8VJgNAXf4UN4v0XzfAVxZpJ
XpjAKzUpUuSZ4ZbPzihe9GxTt6SgDOH6Pu4XdQDFXE0lWA52fLs85tSUploy3bPH
8PXGUfOwSHuChb6IW+UOwzQSuF6HEBcmbIVaooXUxqdpTFM/TJU33UxBbso7DIjW
5Ib7w77LOCAqMOtyEXayJVyoBQ9+rWJuwFjugq2xylrxHlTQ7W62psoVKpBqRtOa
E2zEZEQNHYUN5PAhvIGmTjSYfkkBJjUd03sdpmG1J07RE0onG7jCELoBmi86E3Eq
r6sO0POK+e+BhvxrsniEjP04aJNYHw==
=SSgb
-----END PGP SIGNATURE-----

--Sig_/aTGv3uv8tSXDXzl4uI2kL1T--
