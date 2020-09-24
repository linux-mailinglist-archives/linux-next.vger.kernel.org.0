Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51396276918
	for <lists+linux-next@lfdr.de>; Thu, 24 Sep 2020 08:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbgIXGiu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Sep 2020 02:38:50 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43847 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbgIXGiu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Sep 2020 02:38:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BxlkF6K9Xz9sTH;
        Thu, 24 Sep 2020 16:38:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600929527;
        bh=seWaRTVZXlHdO0q9uW/TGECU1LGVDqL3zNRfULslO0A=;
        h=Date:From:To:Cc:Subject:From;
        b=R6Z7AK/Ew40XwP7pQRf1swS65U2EOImcnF/LXO3N1KzBG3Wh23dAqAHHONkdysLqb
         5eIS6+8Jo+g0/sNXaz89MlC4wsEig6d9tm65eYXZvpsTOVUCSKRHufmwgyl558oF22
         gLXga2f4drItSb1pD+PMpDGRhd7rxLoY4gJNnxfCNOVbmpOwnmWmCtG8Tc3/qLnc9C
         D0tK1rS86p6EspECFjbd9j0loYQnQefUPHuJoMv0JovoyKoJYIF2IzedQITvJboigY
         kfDuXpswegEViRJgXQPi/6SuXNSQyP95CplYXhqC2AXZP6DHxiQ0rahhlt12EqAAkL
         cwPrY+poyBsDQ==
Date:   Thu, 24 Sep 2020 16:38:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dan Williams <dan.j.williams@intel.com>,
        Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Vishal Verma <vishal.l.verma@intel.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the nvdimm tree with the vfs tree
Message-ID: <20200924163843.1c0d0f2c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4YVOXqSy3go/5DMeSCOCOPl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4YVOXqSy3go/5DMeSCOCOPl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nvdimm tree got conflicts in:

  arch/x86/include/asm/uaccess_64.h

between commit:

  e33ea6e5ba6a ("x86/uaccess: Use pointer masking to limit uaccess speculat=
ion")

from the vfs tree and commit:

  0a78de3d4b7b ("x86, powerpc: Rename memcpy_mcsafe() to copy_mc_to_{user, =
kernel}()")

from the nvdimm tree.

I fixed it up (the latter just removed copy_to_user_mcsafe from this file,
so I did that) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/4YVOXqSy3go/5DMeSCOCOPl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9sPvMACgkQAVBC80lX
0GyiTwf+Ki0u9wvPLEv3HOp3WzZWJsmxo/ZiphqsIwQqhcd8/ekM6xaOx7U4aBur
LW3/btpUVPRSmR0KZCP7iPonuaXMHZbCw+5uDpt14n2s4lqjJWHq+odXXZB08k55
JEfdA5acy+rAqYuIRvvsG0sROtYfQ+lrz+OsPSV7UXjuIvJLuYTGptX7daI4cnTo
AJRZFUTlHzvaHkkfxNfpel2ds/hY1PhMLRdr4hmFyhMmD6cWnFkfJGwhFUKJzQVG
TlIzNQQL2zmXQ+Zse8C7cPdZbrCHHHR4APzrMeFeQTtzu/rhjbHRqWzJp83w3hdP
/wPNkd+jGVSj3ar0jj72rpDAtLV59w==
=QgDn
-----END PGP SIGNATURE-----

--Sig_/4YVOXqSy3go/5DMeSCOCOPl--
