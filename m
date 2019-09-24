Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2F7BBD310
	for <lists+linux-next@lfdr.de>; Tue, 24 Sep 2019 21:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731035AbfIXTv1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Sep 2019 15:51:27 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:42132 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726748AbfIXTv1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Sep 2019 15:51:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=lDDv0UjNbldCEQiv2l95K2OogJYghBmcWLLfu3oMnJs=; b=nCypVSuvk+K9SGrCkJwG7YuWg
        4EQbERGBETflyU+fiFCyHv37qFDvyd/Cradze2MU3MpDlWptLUvorHNw4bRNch5QfpQh6VgmI++aJ
        gh2hkfUv+nKpiq498WRVrx/otCC05RvNNnrh2IgN46buj8XSEGYeJn0ki5Ds0VhiPY7g0=;
Received: from [12.157.10.118] (helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1iCqqL-00034W-5t; Tue, 24 Sep 2019 19:51:25 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id 86363D02FC7; Tue, 24 Sep 2019 20:51:23 +0100 (BST)
Date:   Tue, 24 Sep 2019 12:51:23 -0700
From:   Mark Brown <broonie@kernel.orG>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 24
Message-ID: <20190924195123.GF2036@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="m3zcgECJg5Qgddwj"
Content-Disposition: inline
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--m3zcgECJg5Qgddwj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

News: Builds for this week won't appear every day, I will try to
do some but no guarantees until Stephen returns on the 30th.
pending-fixes will get more updates than full -next.

Changes since 20190920:

The integrity tree gained a conflict with the modules tree which
I fixed up.

Non-merge commits (relative to Linus' tree): 1168
 1408 files changed, 26929 insertions(+), 17222 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log
files in the Next directory.  Between each merge, the tree was built
with a defconfig for arm64, an allmodconfig for x86_64, a
multi_v7_defconfig for arm and a native build of tools/perf.

Below is a summary of the state of the merge.

I am currently merging 311 trees (counting Linus' and 77 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--m3zcgECJg5Qgddwj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2Kc7oACgkQJNaLcl1U
h9CdBgf+LnJhZEEjOi84+NxgVa2omHRT97BNKi2XhzthlGRdZGKDPhOEFNqL1rdU
sQksvtEdftHRhWoQnexD2vlHnd9egNwcCK8bWvCd9Tm2hAAzyBBFIK2BnbdLVZet
II18dsiTacwz6wmpRpzmzSzJNkaoeG/ndMDCm3P0F5FvWyPbCM7kMPFI9LHkBwIe
pRinDxGtHfo+go3dAa4GAONQGOdMWe3833pXSZFty+Xh2gzHiHe3UcJO8uyFv4I4
VYfvWEGXXcKVvHVcO7jHjubXWXHOOJaXUv4EWcrZeCuW66cPLELF4hsx+aVqzlwV
RvcNxeWg0ZBJT77HUqkxSu4Rs5stfg==
=+RYZ
-----END PGP SIGNATURE-----

--m3zcgECJg5Qgddwj--
