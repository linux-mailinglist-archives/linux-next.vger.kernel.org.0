Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 245F33D7A80
	for <lists+linux-next@lfdr.de>; Tue, 27 Jul 2021 18:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbhG0QGA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Jul 2021 12:06:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:56392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229497AbhG0QGA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Jul 2021 12:06:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68FD36136F;
        Tue, 27 Jul 2021 16:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627401959;
        bh=S1AKqxcA5360tHItfkLLmUA9E329i9RckXGBuTcQ57k=;
        h=Date:From:To:Subject:From;
        b=Q0b5j/awc/l7o9kgVFG8jHFJp/IhTnQp+7473LbnFsWkU3JNiAvuwPn27a3PVTRdR
         EEjNt+Tf5rVvFBEsQbBM6aV5kNFMf0DchV8lm9kvU0CJnPjmGA9sL2F7SrCDB4IhOs
         bhDk6F0yNp5Br9krveJNjw52W11vxxtysmJ4eIpQ+MZXmaPd/4elElhV3A0zdlKNXY
         3NPPt5YzsvvNvKl1OCXD0Y0YWF0fhjpzPYoe1FaVA72G0RRrJWnKp3Loo4074WYqU6
         +md427appiOnsqH7APjzQ7k59vsiHGGmJyZahynYJla8XJugRRUTL9rHZkMrBOWLeX
         EEhj/7zTOncLQ==
Date:   Tue, 27 Jul 2021 17:05:50 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 27
Message-ID: <20210727160550.GX4670@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Zll6mx50Q8J7qlLQ"
Content-Disposition: inline
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--Zll6mx50Q8J7qlLQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20210726:

The drm-next tree gained a conflict with the drm-misc-fixes tree.

Non-merge commits (relative to Linus' tree): 3590
 3210 files changed, 179997 insertions(+), 56016 deletions(-)

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

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to
add more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--Zll6mx50Q8J7qlLQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEALt0ACgkQJNaLcl1U
h9DWmAf/T487Hcth/L8bctIWaaEn0SO4U+27K8h71nmAZjQ6ObCjsKoytubR98mt
LqmgiMwc+I9Oe0xSt0oQXSBUgwFhwx3FqroCgCWNDgtgdj38nhtKgIz7mz35Q5wQ
DUkJu5IFuqfQ0DYLqBVDvbfcf/RxvOsIEhT8np/fkb8ie9MswAohxn/t4FXKF8u7
TMbc1l80I613LWcGCqFIsOQmkJA3TxMLzPI0X/5MgIFO26EaES+E0yuwNENPnsQ9
A9fUti8CVPnJV+GTjIyARZubOzmB/VvR1dfZF4J5HJs9iTBvPXiZNVEikFzcQly9
ma1ObW09O2Y8iORRZ1Lq1eII6XNYbw==
=p9ZF
-----END PGP SIGNATURE-----

--Zll6mx50Q8J7qlLQ--
