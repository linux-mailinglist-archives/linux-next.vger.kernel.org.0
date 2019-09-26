Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEFB3BF9C1
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2019 21:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbfIZTDl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Sep 2019 15:03:41 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:60424 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbfIZTDk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Sep 2019 15:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=9NMqgUSfB23WIGsbVZdDDU/hZWIHyaCgjXWCN1PPWwc=; b=NfOql3QY+UwgN4oqicuJEQwTY
        OZvS1dNWGPUpxkUHniNvL93tVaJEpqo9kCdEynP52garrITg6TuZm7rkCi4RtHUsKNk7YG4a/2nZL
        fTJ+l9bGO76pfy4Efq3F5iC1M9qKyDExpfITnQGxzNIhXxGfJ4EJG99R27kmiBT+JLrWU=;
Received: from [12.157.10.118] (helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1iDZ3C-0004Wz-B0; Thu, 26 Sep 2019 19:03:38 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id BC4DCD02DD8; Thu, 26 Sep 2019 20:03:36 +0100 (BST)
Date:   Thu, 26 Sep 2019 12:03:36 -0700
From:   Mark Brown <broonie@kernel.org>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 26
Message-ID: <20190926190336.GH2036@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="StZ26hC3DS27TACW"
Content-Disposition: inline
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--StZ26hC3DS27TACW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

News: Builds for this week won't appear every day, I will try to
do some but no guarantees until Stephen returns on the 30th.
pending-fixes will get more updates than full -next.

Changes since 20190925:

The amlogic tree gained a conflict with Linus' tree which I fixed
up.

Non-merge commits (relative to Linus' tree): 1063
 1395 files changed, 30742 insertions(+), 13711 deletions(-)

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

I am currently merging 312 trees (counting Linus' and 77 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--StZ26hC3DS27TACW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2NC4cACgkQJNaLcl1U
h9DsWAgAhG0tKuXiwyO+uiIJHvs3QdDAn9jwTkc5Briz3AU8syfxlIvd3JjjUHyn
+Ew8wnQYA+G9vw0MVBcOKwYINblaa4tSs931/nlqGm9kHi84NjGEXbAek6+lQkPx
mXC+NrsGvHIKLcY+Hd87GyoSCOEiH6DNrfRPNf4IXBF9PAN6XQLAFoqu066LpDak
JFTkpNef+aOchsUu2vjUK9igDu0ca9uCsYNw58oEQD08LpnbLlubeFuaWfzXVFJ3
huua2yP95KUUVUSp3iAYFG58N2UN0AmV4fhUeLlmlxBMZSkcjPDB4Uwfe8DnFRQB
1Ohb4/O2NIzh20Jd4+6O3i91ffNR6w==
=1+k+
-----END PGP SIGNATURE-----

--StZ26hC3DS27TACW--
