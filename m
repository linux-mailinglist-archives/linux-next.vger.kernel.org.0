Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0CAE3D99B6
	for <lists+linux-next@lfdr.de>; Thu, 29 Jul 2021 01:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbhG1XrM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Jul 2021 19:47:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:58012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232641AbhG1XrL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jul 2021 19:47:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A32160249;
        Wed, 28 Jul 2021 23:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627516029;
        bh=3+i6c0OAdyQ8BvDYvkVzd0unkM2ave1GFxFyqFjfQ+I=;
        h=Date:From:To:Subject:From;
        b=BDutStOEZcfNn6JuncP+EOcGAX4YQn2/9V96ij2TbtGu0dF9qBVKoqrKHwF0eKWEh
         XJrCRP1/Zd4FW+o3Pzm6hWpq1kiK5iG+/cAidNxKCtai4jqCRsZCK1KafTJACupls8
         WnxY5LkzSGnUMspaejl7Vf30imVks96j6ekEvVbeJKFPt+/m+T9yk2ual4Qu3D+6r1
         bulG4ZcC2+p5RIiF9XtUM36AshPYGcHxvKRbOXK7XWICFVR58pm+r6vaHKcsr/D3P4
         jmyCvqcdsd3nnBH7OQCFPaPGxCd0+j0+r952DLllPBG3m8bDmQuLk1C0plx4WJ10BF
         jgjAAwOLg4vMQ==
Date:   Thu, 29 Jul 2021 00:46:58 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 28
Message-ID: <20210728234658.GI4670@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Iovxle6z3WGVZjcj"
Content-Disposition: inline
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--Iovxle6z3WGVZjcj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210727:

The net-next tree gained a conflict with the net tree.

There was a build failure in the amdgpu tree, I am using the version
=66rom 20210727.

The devicetree tree gained a conflict with the clk tree.

The drivers-x86 tree gained a build failure and was dropped entirely as
there had been no previous changes in it since the merge window.

Non-merge commits (relative to Linus' tree): 3887
 3986 files changed, 205251 insertions(+), 67330 deletions(-)

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

--Iovxle6z3WGVZjcj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEB7HEACgkQJNaLcl1U
h9B6Cgf+OVJN0AxcvqHpMmLINM/GKN5/1bo1kUjfxc1mscpe7rZYrjL7swd+i9Wu
kk81K+gr46867vftGDpCCW645GdhwBRh/SEds3ae6cQCgUqtMyWSl4DLFsSdLpMh
d5VUnk2XDioG6F51Sm4yuKy/RgEVbrtyXWiJQf6CLjmliT3BdZJSPSEbDc7JAJCk
amanViTsv3Lt42vp7ZLDGfOI3JWy/Bxh5w439wPKUbtULx0aYwmkvD4NMk8x/pTK
itZmOw4zne8tol8/Sms9D1JaaCsqfDhFvZX0AjotamK2M78uR/5E3mxoKwguhmYr
x9v/omOPFAiyxwnA9ejqOGNaoDtQ+g==
=cAlc
-----END PGP SIGNATURE-----

--Iovxle6z3WGVZjcj--
