Return-Path: <linux-next+bounces-2586-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F50490D5E5
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 16:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83DCF1C238F2
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 14:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEC213C83D;
	Tue, 18 Jun 2024 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OplgsZDc"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2357F1F17B;
	Tue, 18 Jun 2024 14:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718721416; cv=none; b=M60ZBcGu6hXsRbjeWt5+1Tx1exx1zFhUHzLe4vwiQzVcljvlAJIn1+OIPzigKCvhuA08QYqHfJw/zA7cX10drmeziHzSTxkhcRXujxD4gVgg4YdwykXJoAc5OxDjBnvvohywTK/x/n6xcnAdbu0K8XeajMomeADoa4K7wjIC3rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718721416; c=relaxed/simple;
	bh=M8IvU9Ql6svFg/Pn4NPUP2k6IkJgLqxbdX2UT5ofmgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PUd2fF2ZoequeImRgzfzV8L+t7UGoVfJcBUCzR+NaASLcxTp39x1Dxaq0qEHbNjz1w+enELsY9+KXBz4T1ibDgaj/l0kUB8EKcyvr5ImQ4ua/zy7jMTDcavSytI/TcCUs708gmYsMefymlhvKJrjXNeJTvxdZLeFRhYZA4SPECw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OplgsZDc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36DCC3277B;
	Tue, 18 Jun 2024 14:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718721415;
	bh=M8IvU9Ql6svFg/Pn4NPUP2k6IkJgLqxbdX2UT5ofmgE=;
	h=Date:From:To:Cc:Subject:From;
	b=OplgsZDcTbppO3LINE9etaPTUdcynd+Sn+zJz4W5/ym4qyORFmTy1LHbtKhbfm6av
	 jJt6NmQdWt5TTt4fi2a5gB4JHgSIyphHDW+/y9s03EXwAL5nQnEcHBuZMLEYqMAHOM
	 yFTLErjRypB7P9mOE9lAfB2h4sVoTHmJnoVx4gxf42u5TcZjIaci2ebD/4+HjTXTm5
	 E5WztNEdi68UdW6z7KE1jTqm3vUNNqdNyjT0DvpgKPruyPKCBuhf4re8p26E/c6Hv+
	 K0rKOdembTAbsZ7PDzc/deSVoYDhl9/bvDDooozmB4ZVEapKtN2bRwalI7QgGDkdHy
	 c2ctnsHPsTq3g==
Date: Tue, 18 Jun 2024 15:36:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 18
Message-ID: <ZnGbhIeuVinplu-m@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JWh6ap6eMY3Oi9fO"
Content-Disposition: inline


--JWh6ap6eMY3Oi9fO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20240617:

The vfs-brauner tree gained a conflict with the btrfs tree.

The nvdimm tree gained a conflict with the pm tree.

Non-merge commits (relative to Linus' tree): 6138
 6596 files changed, 576349 insertions(+), 114580 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with a defconfig
for arm64, an allmodconfig for x86_64, a multi_v7_defconfig for arm
and a native build of tools/perf.

Below is a summary of the state of the merge.

I am currently merging 377 trees (counting Linus' and 106 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--JWh6ap6eMY3Oi9fO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZxm4MACgkQJNaLcl1U
h9C0qgf+NTPyXTIaMc1oOQ/nR4XgQdmkonM26FkfZJsSeCxy20X+pVvr5K3hjwoa
SfIOz+8HtGlhQo9DiVPXwOSReIQJr+W+QqwlErzbzKPHMtYrDUXNiuMKth0FbfxH
gTY3tQSplq40PhfvK6kvKw64jf4+tpIKiEVCs4+47SHLti027mRuhZPmNmtwurMK
1RsFNlZrp2Vri7dSiJkJWQwBEEzlXmRZXrMXNCzbJXi93KimXa5Gi4dU6M2C71Ao
/Oyi6UUEW10e5Ujr3tlOrcSYIxdUQJjPt7/0GHeyg2Bgp7tJ6P47nmdUNd4OZu+G
tOLw8kFp4fkI8zMrizVbYdz5pnwxpw==
=WOuk
-----END PGP SIGNATURE-----

--JWh6ap6eMY3Oi9fO--

