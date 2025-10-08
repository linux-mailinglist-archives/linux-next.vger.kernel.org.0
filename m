Return-Path: <linux-next+bounces-8576-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDC4BC4887
	for <lists+linux-next@lfdr.de>; Wed, 08 Oct 2025 13:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DF7CE3509DF
	for <lists+linux-next@lfdr.de>; Wed,  8 Oct 2025 11:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7823F29B8D0;
	Wed,  8 Oct 2025 11:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHNE8HQf"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5081835966;
	Wed,  8 Oct 2025 11:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759922422; cv=none; b=Zbtg3YKA2/wZRp+xCfYdIbs/98UTrlovIWqyqoYwoU/ayfzEIvD3kJphUMuMEzHWWii2Qn9kT97nyu2Pokd8kV8n4x5eX4I5SiVuKOOotxbos4B8Rm59Ddl6bYb3PBt3oe5WKs5V9vK6pvE6fQNCeksWFgO+kYTSNsspQgWzkJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759922422; c=relaxed/simple;
	bh=hPx7sPs78NXun8fEb27e++A5aDytEW/pauq+ggnhFdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PWMw7mRToWD8JpW+gVJVQ1IYvbL1i9P4BjdzSbgOAUY85hV/Gf0570597OYARImbZVfiklBxBgzt9GDGzWSugNkcp9KdtalnCq7pD4lTgyJKy78jRrdYLEJ0ACGTbZsrnOlJg4EOaVc3gAJICkKCHgZuDJ1LMhEZ+Y7r/clyuI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHNE8HQf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E2FC4CEF4;
	Wed,  8 Oct 2025 11:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759922421;
	bh=hPx7sPs78NXun8fEb27e++A5aDytEW/pauq+ggnhFdQ=;
	h=Date:From:To:Cc:Subject:From;
	b=OHNE8HQf/gFEugdITm552DkmPw6SDKlbu/SntHYtZqBUtZyZcTpEbZydiRW3cHQIP
	 xFTzvmMuhwvrP3wajfmPUkkbMW3OcB7gElHuxOa6JL/trsig2a0NA+MzWmxVBES7RQ
	 6ustjeVTkqkgUYpop7dQV79lLP0kiRbQTeubWp162uhsr59hkAgrBS6SvO92A7J1y5
	 olNgrCwoYOaUkfbebpAdHCmqo0KLkUcQZPjPoXRVRC2imMRnJtgZNvhTOa6+0ffjEY
	 5CUKTWyiBf5JkOMiCN/TeWLA1xQMS4DFabESsmq2kUWweHPteogGYT69oVMe5IYT1I
	 aKGcbVYia52SQ==
Date: Wed, 8 Oct 2025 12:20:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm tree
Message-ID: <aOZI8fDHGbBaINxj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L1fBzW+LfWEgLvKC"
Content-Disposition: inline


--L1fBzW+LfWEgLvKC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_configfs.c

between commit:

  59b7ed0ba2e0f ("drm/xe/configfs: Improve doc for ctx_restore* attributes")

=66rom the drm tree and commits:

  47ca7acff4011 ("drm/xe/configfs: Improve doc for ctx_restore* attributes")
  c09a9933af08c ("drm/xe/pf: Add max_vfs configfs attribute to control PF m=
ode")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_configfs.c
index 1396634231857,464a79c2a9036..0000000000000
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c

--L1fBzW+LfWEgLvKC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjmSPAACgkQJNaLcl1U
h9AbrQf/TdDKMaK2X9bqkY0zjcglSOWKRNxLFHNJeLr1KGuPwCGtrQVfg6YdMVwc
8fJt0rpuykY01eIKzYsMDCTOHJeinUkz6SszxNU/QzR+daf8LqnDILl/qdRrxb4G
/Bk5EvpI4roAPsAq9uUAlUIW6QOKUiEggQpXT3KLSG7c2a+XzJQYsxEECXCMdzfX
683iWuG+F0BquA1Yad/LPNe4QmFN4tXkX3/R2JHWusOhAC+IgaCY+HYrIJeSo3uk
1hUcLxVM4YOzOkXxi1tcm27S+09wmqClSzO5roRs6Dy5e+rR4j+oe1b8aWNUiR6f
BAH2eE1iQnR19a2DMJlL+bdKMf9UGw==
=oPq3
-----END PGP SIGNATURE-----

--L1fBzW+LfWEgLvKC--

