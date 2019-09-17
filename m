Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDC1B583F
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2019 00:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728343AbfIQWvA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Sep 2019 18:51:00 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:36388 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfIQWvA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Sep 2019 18:51:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=BQkrGZo5tuLJBJQAzy2lLF+VZBINZ2SFT0dwCp0vtLc=; b=Hu4zYl5qzP+h1wZpPTS8yezBx
        1LF0tc1aeqW4QIxUQBGu+7gnLDNTn2JtbiYK5N4SuUFP07eENAJG1iKLY2aSZXKLMCI8MbodcAHlS
        UM6s4d6+ayZ7WscMlYC98Mbh305mLd3z26exuW27OutpUxrnyQcafCjgFq0FNZ/nef37w=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAMJF-0000wk-Tj; Tue, 17 Sep 2019 22:50:57 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 18B9827428EA; Tue, 17 Sep 2019 23:50:57 +0100 (BST)
Date:   Tue, 17 Sep 2019 23:50:57 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 17
Message-ID: <20190917225057.GD47411@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GPJrCs/72TxItFYR"
Content-Disposition: inline
X-Cookie: Have you locked your file cabinet?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20190916:

The sound-current tree gained a build failure for which I reverted a
commit (this had actually been previously worked around with a patch
against the tip tree but the issue got moved forward by Takashi's
workflow for sending pull requests).

The OMAP tree gained a conflict with Linus' tree.

Non-merge commits (relative to Linus' tree): 10090
 9602 files changed, 691860 insertions(+), 283296 deletions(-)

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


--GPJrCs/72TxItFYR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2BY1AACgkQJNaLcl1U
h9CymAf+MyOY5psIKfcDreFqnmm0mg1f15g9LFL03eIHeqb10NtOvuY1blTuYaBk
GzlynWCciAAR/Bdp04RksRcjk3VvcspqGvq/LxXtWQqiYoeVRjP/4TcwjI5fM1Xi
Sz9+8y848QiMYO37LwlEv+1cL9ytJlg2wTtpop7XG74NEUDSyo57dNRdE0Gf8yPU
RrS4EUJinjYtXmUY4lWygPCPB7upUG5d5DH9v36VRTq7pI3XU7q/aGeWaSpxQn8x
bqUGMGGFZotaU3qxsc2YWIzXNWYFNbEvZGJjxRnBOotlU8bUTnrEP+etGn8Eos89
SI/XOmvnW8vwIcmRg2OG/h04IVQ2MQ==
=tBzR
-----END PGP SIGNATURE-----

--GPJrCs/72TxItFYR--
