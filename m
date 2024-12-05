Return-Path: <linux-next+bounces-4882-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 383329E57FE
	for <lists+linux-next@lfdr.de>; Thu,  5 Dec 2024 14:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85CEC1883DAC
	for <lists+linux-next@lfdr.de>; Thu,  5 Dec 2024 13:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B2621D58A;
	Thu,  5 Dec 2024 13:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tRm97cn9"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2963A21A421;
	Thu,  5 Dec 2024 13:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733406957; cv=none; b=QGOvFnUqIY92SAa21LuT0pVv1v05JwIMg87fCTGYajCvY0m60ByKrSPBoEczgXkHynfuspaPeSRAzzkWRV7JhgAya0Vdh7mxnBYdFUpi5xflKDziEvw2JwokNS8A7xFBbNBhTY6zYbRUXLJJcTlPhIlD/UBgt+CVYWNc7vUxhAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733406957; c=relaxed/simple;
	bh=9xfNcPVSe44pJPtT9gM7f8XpXMhKID/xZCOWJKPfTiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k0J47A1KP9sueqarce6VIrwvoIxjWNDsg5q1GGY1x/nP9BtI5fGySoOEPpImVEYS4Jwf0rtYKlgnUbEmbU2eLWhrmY7w6vO2FWiIuKPkL5Gl248ZIxDsZID/HmRS4N1cKYitaS8B5ZRB2xzvfuwDqgfuoMpKWk3W3djjIoGfc18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tRm97cn9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CBE4C4CEDF;
	Thu,  5 Dec 2024 13:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733406957;
	bh=9xfNcPVSe44pJPtT9gM7f8XpXMhKID/xZCOWJKPfTiU=;
	h=Date:From:To:Cc:Subject:From;
	b=tRm97cn9eeAPAJMLXbs+YhVuQBugoRRq4zk3EDVRA6/xe8D9TK1TGrdgBgLVUXEww
	 Q/ZueGm+KCMJOxe04cB3MECeCx5TDE7tfjrEIC5I7bD0Cq8snA1uAVMrx+EQzJvhft
	 eZC2UNGkx4FRk157vMcxBO5KEeOnWeQltrOUSLwjkrNaYIqt/Csm4Dav2kkGlgL/Ga
	 pyu2dyIwrPkBK0JvGC7rD3djyBwKMYq5/XHQJvbPqQq67vJNdvZkTFdg90cxHtfvXf
	 CTBe8+eVZ/JnjHroRHE+zsUX1YQekrEIEJCPE8h7/Rp+TK+HBppRhvX3tmFZlWFMKI
	 ZO4bM7UTTztZQ==
Date: Thu, 5 Dec 2024 13:55:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Dec 5
Message-ID: <Z1Gw6QQaz5VxFKFW@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q1J+13aApQ1Q4AGh"
Content-Disposition: inline


--Q1J+13aApQ1Q4AGh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20241204:

None.

Non-merge commits (relative to Linus' tree): 1753
 1758 files changed, 67871 insertions(+), 29887 deletions(-)

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

I am currently merging 387 trees (counting Linus' and 148 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--Q1J+13aApQ1Q4AGh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdRsOgACgkQJNaLcl1U
h9ApzQf/T07oRQJfFRlPkS4kHhM1RBfZo1RWsCQzdQFcUTKyguSaWKzAWFuRoXdW
KAzFbtuJrk9acsNHVf21ujRVl+PjmVh7tMNiyRmUC2K0DQUW1ZhFBSwbGTyDtVnp
bxzZhcCUD5uQ8LFhefZ2FTe1Uq3HiDrS6pm6YtqpmsUOZuAZiAIvD5rIQpMBfn5s
GARQQIkYCWkfFq11qc7LYjiQR2rUwTUtMk/TdI+gyPRrJ/uKQTxaXlKEsXjmZnnd
89mpIB9TReK2ZBZmjhleIGPDp6LmcQKwTdafYJoWJJ+KjSaWsDss+pyjUXoJ7c/7
PKikxlMcAbqdnRpEhT8JAsp5jC7UKw==
=/E3v
-----END PGP SIGNATURE-----

--Q1J+13aApQ1Q4AGh--

