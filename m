Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 594CCB95C7
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2019 18:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbfITQgk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Sep 2019 12:36:40 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:56922 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbfITQgk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Sep 2019 12:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=DJcRMUIoHnhHwFIAld5UtZEHloJI/VNoy6j6pLhjbfU=; b=m5D9R4nyDBQaUFOrlSve2bpIv
        k/BcrkopN6ab2o88k84NRkLK59BBANzerFdOJp/azg8/ZvwnRVzvZOIC5YeKCvLLf1EkDuv065UWz
        9ibPFbuytlPpa/9fl/LsxEzKaKSyGa4PAIwj5SPiiHpYdCHom/l9nKIVDHl/maI7jsGZ8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iBLte-00033E-Mq; Fri, 20 Sep 2019 16:36:38 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id ABB7E274293F; Fri, 20 Sep 2019 17:36:37 +0100 (BST)
Date:   Fri, 20 Sep 2019 17:36:37 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 20
Message-ID: <20190920163637.GI3822@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SdaPbLtAangIkrMZ"
Content-Disposition: inline
X-Cookie: Stay away from hurricanes for a while.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--SdaPbLtAangIkrMZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

News: There will likely be no more -next builds until Stephen returns on
the 30th, I *may* do some next week but it's more likely that I won't
and it certainly won't be every day.

Changes since 20190919:

The thermal tree gained a conflict with Linus' tree which I fixed up.

The akpm-current tree gained a conflict with the risc-v-fixes tree which
I fixed up.

Non-merge commits (relative to Linus' tree): 2719
 2712 files changed, 92075 insertions(+), 40381 deletions(-)

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

--SdaPbLtAangIkrMZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2FABQACgkQJNaLcl1U
h9B0oAf/UVIP4LrDU46vVRhUEy8SIiIYvRiSBAR1UQuvYKR/6wSrkKRRcrpcydmZ
DN/9SudF9wB5uZuqDTW1GBCNVHWKP3aYDtdMnUoTfQ1RRLlK133m5GpjcBHL7WjD
5GZH9/EYJpFJPw8Q+hyhd6ScBljtoTPg2mVey4ADRwsjCaFPac9mjAae0CmLSTKi
Oo3IW2ZTTtjtfVl0tkKD+9fBhx5CVM8k/kbNXSDMAgwyews6HwWs2wNlFpY+GrX2
oIMcbBijJiS3qYrMGXmodtTh8jJxfDCzTI4TKD47iTCQKBhpvnEqgdJiYf08IPqR
vPobGqP6kL/kj/5uQmHZvZ3Ymz04fA==
=IpSs
-----END PGP SIGNATURE-----

--SdaPbLtAangIkrMZ--
