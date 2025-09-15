Return-Path: <linux-next+bounces-8298-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9E0B58198
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 18:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07AA33AA4DA
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 16:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5963240604;
	Mon, 15 Sep 2025 16:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H25jOKyh"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CBC225761;
	Mon, 15 Sep 2025 16:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757952285; cv=none; b=Yy9PSuwjVfHChLbKNl2nKgI1vPAAdxV1rCiaRanGPzuMp/fgY+q0QtUhq2RqunvJV8ZGveLf+Abd+U49+eUyLTawL0VVRqGBjXNaeqaJqYKOe9rVGnjGgLWg3yl0rl5A3MnnQzBSXHiHf8QTXtm85lFaLbnfC3cg9NDGMzdxynQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757952285; c=relaxed/simple;
	bh=y/3VPnS/cbmPkKccFH0mNKVyABLcZQk5yctIJU7qkeU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cWUYSs9aJTG3NQIFWjeinjkRO1BKcGlQlYE9hhJVqgzN5D5qHTTNLfnXMkQaJ/97Z3o8GvRAC5mVnID+ggg0ZJRc494mTY0flijKz7Iw7pZQn0j5QXIRqz6xjELm6klaeg8XsIYdodktdADxipq9svaFbeAS8q07quuEB7iEhpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H25jOKyh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87783C4CEF1;
	Mon, 15 Sep 2025 16:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757952285;
	bh=y/3VPnS/cbmPkKccFH0mNKVyABLcZQk5yctIJU7qkeU=;
	h=Date:From:To:Cc:Subject:From;
	b=H25jOKyhKu9SsQ32YF10ks2Aw7vjeeHjuL7ObVdrNr3hoEAwIIWWFyDrquMoWsnqu
	 OfieuERGXkI6YDtHUc3vyW06ZbboENEwGIEALBAYm/1STbgUSdJLK2ou/auNZi1eRf
	 dQBtm8w6WnCmdhRWXaE1Q1ydc4/1DtF1yzDUD6Z5RwIEOkHI2zujTAX74h74bhdSDo
	 110eoWpgPamQuyXTRSgRjrPUIb4+vrbYPMNc0+chy6gHGr2yySmiRIOEr0sT8nDjed
	 z7w01iOVOYD2XSOZ7GR2QSHZyoxZQAnv4lqflJKiaZ3xUYGbPGgIFgGIaeWOqk0WTs
	 JOIq6aCnDOesw==
Date: Mon, 15 Sep 2025 17:04:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>,
	Serge Hallyn <sergeh@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Paul Moore <paul@paul-moore.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	selinux@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Missing signoff in the capabilities-next tree
Message-ID: <bb5c5c5f-fa31-4339-aa53-d06596351f86@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SrGtx5dXEmZpxw0c"
Content-Disposition: inline
X-Cookie: Use a pun, go to jail.


--SrGtx5dXEmZpxw0c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  d87d3c530e0ce ("pid: use ns_capable_noaudit() when determining net sysctl permissions")

in the capabilites-next tree is missing a Signed-off-by from its
committer.

--SrGtx5dXEmZpxw0c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjIORcACgkQJNaLcl1U
h9COCwf/X8kHyiQb0Ogtcb+5dSiGhzxyY7fa0vHQtdy+1MNrRpK4o3Q3RbBkX1yq
DSttkJeaLA8hJumiCnKEalevw+46mVeyXiV1iuAB7XqSB34ZiNhuKKXt2BXVW2Tf
1arHw1qit+5KQMy9pzGpgYbhsM7vbumA8pSBwyM/nXNyzeoPVRlDh5yubfMruVOn
gea05ZXg4GNskFG8c0ZTUgl/2pPxtgwok4UuNzMBeqXdJPrIueBvsgqIsM1quyI4
aLx/egNTyGgbCrMwKBslZ+cZ4BFr8uFURFGBSQEvOncGGWElpB2Ox9FqeK57ePYO
0fnT/qp9BoQxXXj0SOFgGEZzXZ+HRg==
=JsT8
-----END PGP SIGNATURE-----

--SrGtx5dXEmZpxw0c--

