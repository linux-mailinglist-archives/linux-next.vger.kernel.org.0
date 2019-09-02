Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01CA0A4E2A
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 06:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbfIBEEY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 00:04:24 -0400
Received: from ozlabs.org ([203.11.71.1]:41893 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725839AbfIBEEY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 00:04:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46MGg82cSpz9sDQ;
        Mon,  2 Sep 2019 14:04:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567397061;
        bh=1Yo6uY9vYsCcKQ0uEW9Q12DJgkCErmeFn5PqfY/sKWw=;
        h=Date:From:To:Cc:Subject:From;
        b=pECNXKuf+e03cUscTqogf6/7IWR1KEnyVVEIWtbwLmaJrnR5t8Fum9SESkXoSqGbu
         /7E/16FVZPfsWwuOZzD6dXMiPr5Nu6XP9csLbHioCMDU+FjwvnqNnePzjHHZr3H6BD
         mu7kpT9xozaJ+irKQIhceQoJsKiYbfK8thaIJecKLL63pB2brr9fcTPG7aJZw6juy9
         0GU3DvL6Cy0KftGeiGmpp6IAuxyFr3b6EIvwlxfqJnypr9xI5Oq1d4iJDCcWLXgb36
         BKpehzOc4YyYY25TAZFKTbAGQXiKSIuoaerz2ixr3WJNpzCZTjMEI/KJ/Jxipi12ga
         n6lGqXF87bjeQ==
Date:   Mon, 2 Sep 2019 14:04:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: linux-next: manual merge of the sound-asoc tree with the jc_docs
 tree
Message-ID: <20190902140419.110a2c03@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A.PmcI=jXekuU.+wnbKcZUc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/A.PmcI=jXekuU.+wnbKcZUc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound-asoc tree got a conflict in:

  Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt

between commit:

  aa95b4a960ab ("docs: fix a couple of new broken references")

from the jc_docs tree and commit:

  8a99f76ac1a5 ("ASoC: dt-bindings: Convert Allwinner A33 codec to a schema=
")

from the sound-asoc tree.

I fixed it up (the latter removed the file, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/A.PmcI=jXekuU.+wnbKcZUc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1slMMACgkQAVBC80lX
0Gwv7QgAlJTP91u6YFVM1OZHrQUcYdIhXRuRZ88Y2tZJ2bTnNG+uFLsw30IXLaui
Cdn97hQQ92IO23G37CeD/bpwafX4cxZHEz89aQJf1Zl7ndhIcE4r5nFeqcLKrMKE
EYtf9Abv/mNgVLHr8fDVcHEfcbEex2Am/osceWRnhuw//VWcW9iDdnYi65VdIWmI
1HGNeo37pglnhM2yzEHP3f07YC9U2prljT9BeOOXrP8y1opXuNHmIyNBWyG1whdt
fspIp4PotXUEI/BezliBYCs0gvHGLoCgtEE0YYuhj3NURAisY2CyIkdGTI7Bkg9y
aBtJ/W7dvXLaDrnLtakDu0nGnI/pDg==
=b7Yz
-----END PGP SIGNATURE-----

--Sig_/A.PmcI=jXekuU.+wnbKcZUc--
