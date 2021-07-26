Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 679AD3D68E5
	for <lists+linux-next@lfdr.de>; Mon, 26 Jul 2021 23:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231839AbhGZVHC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Jul 2021 17:07:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:45612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229489AbhGZVHB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Jul 2021 17:07:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56F9560F91;
        Mon, 26 Jul 2021 21:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627336049;
        bh=zgyLNyyiYQ6t66updPfgvxGxtDD4JlKzRMJiCuCkQzk=;
        h=Date:From:To:Subject:From;
        b=OQGx89jLp1aK0do77RwEIFH03wSOAGTIpxY14FYHigQ0GP0GrirYoIydQCH0fkgMC
         Guzyd/ne97Bo1OQuHy8w1+KW9YUH27raheOzvMfrHL/0sL+cMMVrLweffaOr5vEJcH
         5l7MGKjEyiBXwUJTvYzHMQXq+oCxwJFCN+runXC9LmCPOxgbK8kn/Jm9VK73k5WrwF
         ls/VvRUETTuG2NIsRlv4m9GTLcH7Bi2dRJCceJVAIBSgYfBdFMIGDhKHqVxXIPLw1v
         zSux1WohWJoyGFRf0zc7U7kJrW3myoTbJxF2Bnbb/sYPR/dOc4wfe2BnJAubAJysjV
         xcXbB2d2170lg==
Date:   Mon, 26 Jul 2021 22:47:20 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 26
Message-ID: <20210726214720.GL4670@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KIbT1ud6duwZIwNL"
Content-Disposition: inline
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--KIbT1ud6duwZIwNL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210723:

The drm tree gained a conflict with the qcom tree.

There is a build failure in an arm64 allnoconfig on the finished tree
due to a drm tree change.

Non-merge commits (relative to Linus' tree): 2938
 3037 files changed, 173726 insertions(+), 51477 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches will be at http://www.kernel.org/pub/linux/kernel/next/ if/when
I get kup working).  If you are tracking the linux-next tree using git,
you should not use "git pull" to do so as that will try to merge the new
linux-next release with the old one.  You should use "git fetch" and
checkout or reset to the new master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log
files in the Next directory.  Between each merge, the tree was built
with an arm64 defconfig, an allmodconfig for x86_64, a
multi_v7_defconfig for arm and a native build of tools/perf. After
the final fixups (if any), I do an x86_64 modules_install followed by
builds for x86_64 allnoconfig, arm64 allnoconfig, and htmldocs.

Below is a summary of the state of the merge.

I am currently merging 333 trees (counting Linus' and 90 trees of bug
fix patches pending for the current merge release).
=20
Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to
add more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--KIbT1ud6duwZIwNL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD/LWgACgkQJNaLcl1U
h9C7+wf+Now4Ux9uUQ5ZSy5JIxrboZPMvliS7vPADiVFFy4zCMvfKj0nFU+Kzcyc
ecEqbyOQ65AL5brTVsoRjk+w1uFSKaJLCTjYCEGJPXZ0Ml5zM9uzuL9ZIR0GFkVq
MblL/PA0G0Fgl6QDe46gZ1l2xZaDZ2CDvPxIBM5Z27TvRsl3gmI39Mt49PW2O+Ik
YdWxCsVxZBLnzD1Ae025WefubNkr8ALeCOSABzEP+B0LPggL2hr5P9DnNw5Bjz5A
S0amG0p4suq26JUKpEp3KmNcl9fdWtg9DnvntEhYv7KamQj+DPaIybRsaXugU09b
t7DvgSXM2ySXrZ8QQCvK0YDSay4QPQ==
=Libr
-----END PGP SIGNATURE-----

--KIbT1ud6duwZIwNL--
