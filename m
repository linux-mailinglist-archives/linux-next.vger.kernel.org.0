Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F75CB7EBD
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2019 18:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390345AbfISQGo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Sep 2019 12:06:44 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:42302 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388098AbfISQGo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Sep 2019 12:06:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=GOCQvL6i0fVL0FmIWtQyMjmyubdpwyxSGTHDlRvQXGA=; b=ANf9+cj9bFejOnKyvJZDCHIqd
        AGihL6BbZMQR8CC6eWrph+zIcUEWSev176/r7tkMBxE3rW/KFIy7Yb66esryNDUNYO8CdtrcO0Vv4
        Zi4DN70QWQSkOa7iBHEW6V4q1B+LCh9387clj437KnLxAWaoVseNciVBwZyKzzG+e7kQo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAyx8-0004Mq-0z; Thu, 19 Sep 2019 16:06:42 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 81AF12741D3A; Thu, 19 Sep 2019 17:06:41 +0100 (BST)
Date:   Thu, 19 Sep 2019 17:06:41 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 19
Message-ID: <20190919160641.GR3642@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9DptZICXTlJ7FQ09"
Content-Disposition: inline
X-Cookie: I'll be Grateful when they're Dead.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--9DptZICXTlJ7FQ09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20190918:

The btrfs-kave tree gained a conflict with Linus' tree which I wasn't
comfortable resolving so I skipped the tre for today.

The ext4 tree gained a conflict with Linus' tree which I fixed up.

The nvdimm tree gained a conflict with the libnvdimm-fixes tree which I
fixed up.

The erofs-fixes tree was added.

Non-merge commits (relative to Linus' tree): 5119
 4678 files changed, 388151 insertions(+), 105686 deletions(-)

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

--9DptZICXTlJ7FQ09
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2Dp5AACgkQJNaLcl1U
h9AyVQf+KDYCy2XvdPPARkmMF7W6ccQba30uCpl8jmQuJeDrrh8DJHnNeX/O6SrN
19D/48pUSoQoLIRJIYN7W3a+3YowypiVwxkg4XWk/VlpNIy2qWDqUIplQ09DQsjq
/b8s58VoKvRlVwZn4SRToQ2+kigjTf5YTlsJ/BohUgMJhdq4j5BuLG0RPQqMWpoX
3O3KRw63kya2r2OPU2NmcKyAUqNwsmnb9yEO52S6eiZdj0Q+tpP4lgJBsHKvcfGv
Xl0EN0Fzq2LZig98unj1X+YeQDNjMVQnE31358MS3KNMles/+OmAmo6JqZoMvul5
ot6eIhZ8jyF4OGz1wuKd6WpFtC6Eag==
=jSt5
-----END PGP SIGNATURE-----

--9DptZICXTlJ7FQ09--
