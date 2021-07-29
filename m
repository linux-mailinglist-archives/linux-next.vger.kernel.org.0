Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2E313DA8B3
	for <lists+linux-next@lfdr.de>; Thu, 29 Jul 2021 18:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbhG2QSC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Jul 2021 12:18:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:60676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229786AbhG2QSB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Jul 2021 12:18:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A74060E9B;
        Thu, 29 Jul 2021 16:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627575478;
        bh=wFwVi6Ndgej2Zd82nABr+Z4XB8U8oAueY674zW7k/8Y=;
        h=Date:From:To:Subject:From;
        b=lhgS5SDuI0PwdXrv1NRp+1BwvwKkHdzOxiWaRDmuz7QhgWwdGE0walLLDb6tSyS7N
         dSFowSXk7J66fvllYMx5fo3z57P2Evm/iKUPiHqaYUAAGoO46lMfKDfyANkskjLioJ
         K70/hB7D9SP6luT0Sdg6FFZHV/OOvgUO0mJ+180evqeTXG2gOS+NdPyvplSlTF+CKF
         knJTy38l9gcbrs0PGJ+v5mkUeTavYzKo/AEUE1UPYuOggd1+umplMURmUtdthNDZgX
         B7AkrKtMsAO2NWYN/cQtLyqt6QZSL0v3qKNkCKS1JcgFAfbkZcGsLL/r8LK+6mW7Fl
         WEAZJa/TMDuNg==
Date:   Thu, 29 Jul 2021 17:17:47 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 29
Message-ID: <20210729161747.GR4670@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YZHBoLCvxQT2MhEB"
Content-Disposition: inline
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--YZHBoLCvxQT2MhEB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20210728:

The drm-msm tree gained a conflict with the misc tree.

The drm-msm tree gained a build failure and was dropped entirely as
there had been no previous changes in it since the merge window.

Non-merge commits (relative to Linus' tree): 3847
 4126 files changed, 205916 insertions(+), 74462 deletions(-)

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

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of Stephen's local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to
add more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--YZHBoLCvxQT2MhEB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEC1KsACgkQJNaLcl1U
h9AhPgf9G68ypfbgbpJ+1tMDWNvJbbuEbIxRR3C25cwNhEtPli0ZTrR3AWitPY7h
plj6m7w+bL9OxIn+J9IgDRQ+a9GWBa4t3QuVKRK92+vP0GylPv6Wf3TIgDjMPnhd
s6Zz9Xuol2qynxVRHKN1/TQiIACNCB/NEJ/FKmPsq7AzPbrPGElBnM2tsMzBkET/
jD4ljWLxilQruYdaGvsOBSOFPrOS8+eC5ubnKCNNJI/lL5CAYzuJe2olULKxpyuq
45/uT6tvUfmmSwRsHS3XfeDsnKXkYe4cL3yY46eVh5p3ko/2B+cIwyofPWYg13Ss
6vJ8+4fmY5dOvaqdfPqiHkITgm3S3w==
=CoXa
-----END PGP SIGNATURE-----

--YZHBoLCvxQT2MhEB--
