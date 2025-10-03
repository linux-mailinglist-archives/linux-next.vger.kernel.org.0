Return-Path: <linux-next+bounces-8554-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7737CBB6972
	for <lists+linux-next@lfdr.de>; Fri, 03 Oct 2025 14:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E2E33A6E3C
	for <lists+linux-next@lfdr.de>; Fri,  3 Oct 2025 12:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6F0224225;
	Fri,  3 Oct 2025 12:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OS6oI4aM"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A256D2ECE83;
	Fri,  3 Oct 2025 12:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759493292; cv=none; b=fS1D/t8i+bXiM+fqDrXuanaf5ZXzhycPi9BaeBxw6fHCu++8DT2eZ9ED4KLXVO2jUufRcWvKUuDKHg/ydxj7s2GB9KOpF3DFN82tGUgpWeksb4fQ2ZQnzTB5IqRkZLy2JK59E21Rz9hs4kOBYpvey62kJ6LTfuX3H8ZcoQ938L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759493292; c=relaxed/simple;
	bh=dJQkGYflY+j9UuLVfzN/vcOYOX7F6X9gPrL7iQ3Lza0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G/dLIyl0pgF3xwdDgIyBLJz7cZ8xulHaMuljxOZDj+Y+rCsAxNwKd4HYNuia/J32RcIh67glweIuRUoEbN54x8KyEJ3FeSo3Q9qeN7X0sESnwYoun/JSaDDzz429CvXWymGhfp3FMo3gV5wG/wTI6LrBSCQYLRTH2zahGuiU4w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OS6oI4aM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DBA9C4CEF5;
	Fri,  3 Oct 2025 12:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759493292;
	bh=dJQkGYflY+j9UuLVfzN/vcOYOX7F6X9gPrL7iQ3Lza0=;
	h=Date:From:To:Cc:Subject:From;
	b=OS6oI4aM4xydCqXtVAdr/hHfgC6j9Q0AZnsmxhCDsnxrsm4PSu+Sjezsv1cJWuX7l
	 W9XccRtGfbyY2dv+ok1q2OfofxiC5SOQcQvzCcSjVNwnxozce5tdTJksjuLXzx7zak
	 y2oJEMq3MOIcfZHOPzmp0hTQpASst92XGo8ZGjSUQt40yEKRsUH21uX7ufDQ5O6gHQ
	 yCyNXo/vjhzLmAGPiSQ7Y5gu6sMT699lmewDUEMAaIcGfyjeGulQe/YN4axtIsDoB7
	 NhkrDKcRhrSLDik87rTIRk/VAaBBq19Jz7LVRvgHm2Ri+UCbzJPYa8Lwi+3CatTF0z
	 ++hW1m7KEBNNw==
Date: Fri, 3 Oct 2025 13:08:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 3
Message-ID: <aN-8p5aHWG4m29Kd@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2YATftu5aMWzjusl"
Content-Disposition: inline


--2YATftu5aMWzjusl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20251002:

The char-misc tree gained a conflcit with the mm-hotfixes tree.

Non-merge commits (relative to Linus' tree): 3547
 3724 files changed, 172502 insertions(+), 54966 deletions(-)

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
directory.  Between each merge, the tree was built with an arm64
defconfig, an allmodconfig for x86_64, a multi_v7_defconfig for arm and
a native build of tools/perf.=20

Below is a summary of the state of the merge.

I am currently merging 407 trees (counting Linus' and 406 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--2YATftu5aMWzjusl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjfvKcACgkQJNaLcl1U
h9AP3wf/YX5ZWsAMcIGBkgpw7mn8fFUWuFERNA4H2s1A1e24jxy4fI3Hjq6FZDvl
6foINPOHDjd+5NGIZ+JPP7tP+qp9cpn+Q1le7UhsbZnblZAx8OTDs1U+6vZ+ed6l
tgPM6UQ2HA2Vslj2mZD6mB5r3W3Xi9MTrry0QLe/A0wHPltItkCfG4cCqP5uDYtt
h/XtLb3nthyn8INR0gQeJnlU3fnVjNelx3ZBIMzb4isIUIWcHYXyMdlFOwYuOvXO
dyoq76o+q4TlWiWG5WUaKanXiYU0NOX1NVNVznRF/7nuRsYbjoV7a0XcHDFxsYDq
+6HtT+j37xxumRzO+zT8RslDS/iYzg==
=Ht5y
-----END PGP SIGNATURE-----

--2YATftu5aMWzjusl--

