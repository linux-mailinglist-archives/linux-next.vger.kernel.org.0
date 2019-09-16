Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55700B33AB
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 05:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbfIPDLO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Sep 2019 23:11:14 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:37296 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfIPDLO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Sep 2019 23:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=HYG3EtKEz2X0M/ghZinqF0kMTjv/yxJlL5gBTbWxoFM=; b=hVXQ7Dey1pEC3LqnIE+r0xg86
        Ww1Om1tVJfE2N7ckMlZrPTlVCMPAYjo/2sRKWmOJf6GHE03krLoTz4sm8iIQC9ZysJz3GwczX6EbQ
        kuThVb8mrCw/oBXj1JCo8zLECjwrM9eK9ORgGtlXdfa4qqeuWHttuiobMAZ75NMrxkqvM=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9hQ0-0002Jg-Hx; Mon, 16 Sep 2019 03:11:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 79DD02741587; Mon, 16 Sep 2019 04:11:11 +0100 (BST)
Date:   Mon, 16 Sep 2019 04:11:11 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 15
Message-ID: <20190916031111.GW4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9+ohdFDUqiMJzwPo"
Content-Disposition: inline
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--9+ohdFDUqiMJzwPo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Non-merge commits (relative to Linus' tree): 11835
 11503 files changed, 777542 insertions(+), 373473 deletions(-)

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

--9+ohdFDUqiMJzwPo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1+/U4ACgkQJNaLcl1U
h9Bxwwf/U/5etl/NXCPcJBjw4ewoxfZ83s6ILDUw9Zf59WVDAQfPKJCkrsZVN+xk
Vttn7Sc/eYIIqJ5Z3W97owxSF+Sf1+cDft3QR4TQICN2HrGH+jRnWb0H1kMDWRZK
nKkjAsqxZTnpD1Oe92RoQ2D0oUn5Wfu0wS+NSo1hMVJuqDXykQqlmZObP176iKgG
3+3TwOqfynJeLUdRQ3ctKRD3KepDzT0ptx3tsWf+0mWtHDw0RhWs+fMLUDgTh87l
x6bywdpjBX7AS3qOyPbzdZ9qHbXzaf7uC1OJU07Z/Jm+C7xbW41E5fpBSlct8pv2
9cjFtMag2W8d4Ds5tTk9AY+xwpcAHA==
=c9il
-----END PGP SIGNATURE-----

--9+ohdFDUqiMJzwPo--
