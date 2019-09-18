Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4BD9B6F3C
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2019 00:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727648AbfIRWK5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Sep 2019 18:10:57 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:41244 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbfIRWK4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Sep 2019 18:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=zD3mQu7Dwnrq+zU9FMgW1/ESaRwRSfPdPgrISyrbCC4=; b=LrJ/oYOLieq1TS7tmSUAHEWue
        JaiChxoRUukHgrPsEdhRo3kKgnMc0zmkEuei8wgHdyRU7iz7zqEQ7FDorVPsCIHLOgkYXm0jeO7pl
        KiwxB/D867H7fWkKqlHphIOKDla3M6J4fZ2HvXBwEEwtQFCZJGU768Mzv+fsqnyL6jTxc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAiA2-0007fa-LM; Wed, 18 Sep 2019 22:10:54 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id CA5BC2742927; Wed, 18 Sep 2019 23:10:53 +0100 (BST)
Date:   Wed, 18 Sep 2019 23:10:53 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 18
Message-ID: <20190918221053.GV2596@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="asNXdz5DenlsLVVk"
Content-Disposition: inline
X-Cookie: The devil finds work for idle glands.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--asNXdz5DenlsLVVk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20190917:

The sound-current tree gained a build failure for which I reverted a
commit.

The driver-core tree gained a merge failure which I fixed up.

Non-merge commits (relative to Linus' tree): 8551
 7914 files changed, 621805 insertions(+), 224850 deletions(-)

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

I am currently merging 310 trees (counting Linus' and 77 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--asNXdz5DenlsLVVk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2Cq2wACgkQJNaLcl1U
h9CqaAf/a92AEBIpXlg8S1dj5PsASjMUBDPqE88g2xp2XtYSR7PHNLonm92tx7aY
LWfPNkScT8GJXYOWVlO5LCgS9ASRXZ5Gam4O5GcORcxbSXdidfgB933nU8MePwaD
8RbI0fsLtpA2LEu0BJO/bPm4z6cOZICmdoAna+0aOGEen8rqf0Y2sSJcTKKQNb7B
YBxvtKVhFEUkbDNOuIQbp65QVRKlwiExKYBrt64gEMIdl2BkID53vmz1j61zBPOJ
760NQBcROJcthLvi8NumonqjbHfV4T24IgHTQAAwl9/UyUqWfpHwKg4AlgwboNjE
0rjOlrpL0CQmObPrXTXLLl/ECou6tQ==
=AP9T
-----END PGP SIGNATURE-----

--asNXdz5DenlsLVVk--
