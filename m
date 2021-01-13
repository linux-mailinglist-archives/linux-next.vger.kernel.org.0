Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 162492F42E2
	for <lists+linux-next@lfdr.de>; Wed, 13 Jan 2021 05:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbhAMELL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Jan 2021 23:11:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbhAMELL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Jan 2021 23:11:11 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B62B0C061575;
        Tue, 12 Jan 2021 20:10:30 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DFv9w1jNKz9sVR;
        Wed, 13 Jan 2021 15:10:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610511028;
        bh=L2CO6aHoctYXi1Ljpf7cCifbo388qd6rWI80hXgv0VA=;
        h=Date:From:To:Cc:Subject:From;
        b=fiSQXiNLbVapGsnem4L6Ho4L7fPrGmXoQjC1IY5GafsW7JK+ZOtnztuxi/j1459e+
         dhk5EoGKpsSh0osa2wA4Q/O5uNgXNs6QapVNqfqnlRl2m0EfmViHV+5mmIsR5u2pFD
         UZskwqbXOJGn/HZXFl965a1InqAvwfTXsJv6yQdJlcAUr8yB3DHec5RiHdmHOWXAcC
         OSlDE9bAsdk5ya+pM1+rvRJdLwgz8VYuD58rGscgLY/x+yHYZxAC9KbDvZQ8kykHRa
         XRklcrJepf9juPm0nPjLGMUs/MPQMSioUUzhpc6rRCAwgebOpsIqnCWP//700TgPNu
         mM/W5Oyiht6CQ==
Date:   Wed, 13 Jan 2021 15:10:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20210113151027.21f3f1de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GcDbE141J8WohQn/63Xr9Rm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GcDbE141J8WohQn/63Xr9Rm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/driver-api/media/v4l2-subdev.rst:125: WARNING: Inline interpr=
eted text or phrase reference start-string without end-string.

Introduced by commit

  25c8d9a7689e ("media: Documentation: v4l: Document that link_validate op =
is valid for sink only")

--=20
Cheers,
Stephen Rothwell

--Sig_/GcDbE141J8WohQn/63Xr9Rm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/+crMACgkQAVBC80lX
0Gxj1Qf+N47rzQYihDZfjH05iVJtu48/55wo/PEgQ99S+XugNimsMVfp86n7fE9l
Ehto6mXVYvlRsK5EecScPutEksWWa/kmlSpOqIW2Z4eyocBRajW9AgSkGmgwzQ64
R9EF53Owp9Dgl+jB7Ij+m2QwsyaGomqfVo419M8Rq+p7U+1pmOl7If4tSCtIZLrL
KKa+dIy4D4YW05uW1qGLPhD6TrA4+EQR7vLq2pPzZpCPq8A4O+kpFozu9C90BmlH
UKdMgVpjyLS76awkreIw6p5CNTY/PGnCNl8mQtm2oYjDehTUBmbAxKO/gfwkokTz
OTBi4V7PmNY3BIwcEJf7BIEB6U8UCQ==
=wDkX
-----END PGP SIGNATURE-----

--Sig_/GcDbE141J8WohQn/63Xr9Rm--
