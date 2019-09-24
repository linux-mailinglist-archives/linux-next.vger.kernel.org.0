Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2C97BD0CC
	for <lists+linux-next@lfdr.de>; Tue, 24 Sep 2019 19:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730860AbfIXRmU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Sep 2019 13:42:20 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:50902 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387559AbfIXRmU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Sep 2019 13:42:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=zes2dxJDlGtac+6+LdBHVUz2/S2c9+ELLrylkyDTREE=; b=gfoEjdUSj4SNm7t2DOAPmfPW0
        J18O2mCcYpmRu1OcYFi4CrPe4xgLz271BBMZ9bDSlO2qkIysU9abEjE3TVjg6LiKBjgKL9S2kKi/J
        YgMcDUoba35ajzLjZ2YkfFJSt6GzgQvEcFcCtz+4H2o3RHXdWaz6b6MRo04tKk095A8Ns=;
Received: from [12.157.10.118] (helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1iCopI-00029A-MI; Tue, 24 Sep 2019 17:42:12 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id 602F8D02FC7; Tue, 24 Sep 2019 18:42:10 +0100 (BST)
Date:   Tue, 24 Sep 2019 10:42:10 -0700
From:   Mark Brown <broonie@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Jessica Yu <jeyu@kernel.org>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Philipp Rudo <prudo@linux.ibm.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the integrity tree with the modules tree
Message-ID: <20190924174210.GZ2036@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Z5Iw6G/4V9lVaptU"
Content-Disposition: inline
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--Z5Iw6G/4V9lVaptU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the integrity tree got a conflict in:

  init/Kconfig

between commit:

  d189c2a4b6f0f4a ("module: remove redundant 'depends on MODULES'")

=66rom the modules tree and commit:

  c8424e776b09328 ("MODSIGN: Export module signature definitions")

=66rom the integrity tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc init/Kconfig
index 70734141a2f5a,2dca877c9ed71..0000000000000
--- a/init/Kconfig
+++ b/init/Kconfig
@@@ -2047,7 -2010,8 +2051,7 @@@ config MODULE_SRCVERSION_AL
 =20
  config MODULE_SIG
  	bool "Module signature verification"
- 	select SYSTEM_DATA_VERIFICATION
 -	depends on MODULES
+ 	select MODULE_SIG_FORMAT
  	help
  	  Check modules for valid signatures upon load: the signature
  	  is simply appended to the module. For more information see

--Z5Iw6G/4V9lVaptU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2KVXEACgkQJNaLcl1U
h9BO2Qf/Riuc9Ogb9q6Q9JIlOKiEMESZ13GqkNzBCU24n7FPiO639flGaNBK0g8p
eqTHHhEkrkia1rJbkppDn1hLZ86lSrCBYiMHFrznhirDQQ+Q2kRl6A3KzE0hCl0m
0bYK2zN/Z9akzKhHKACjqjpa/HpZz9Cv8NHYp4ieCRVBwsJAOLKV22+aGz2KOi2J
KySKJrs+/NiQZd/nVPst8jOnS1B+OfaBRsm6iXIJ3jRvHM7t6hU/xsLLp+LYcPjw
ki555VEEwrYaG9/IKsK7pU3JyT0uwksX2LpnutMYCLd235IogNpWF5fwvuGMjVY9
E0UykZmiw9VYQzmD5Bdk1fJnkGNufg==
=MhpP
-----END PGP SIGNATURE-----

--Z5Iw6G/4V9lVaptU--
