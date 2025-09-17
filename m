Return-Path: <linux-next+bounces-8351-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 242B1B7EB71
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 14:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B0401C025EF
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 10:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A12B2EFDAF;
	Wed, 17 Sep 2025 10:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBLt2+9R"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C3C2EA721;
	Wed, 17 Sep 2025 10:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758104794; cv=none; b=Wz3hyaZXcqfTEHLrFCi/I0KWrutF1hCTVtOsoOE986WI9ZDSumxdeOOeM/SDuBVjmq8mCVrsmi7IGYuAoOoasVQIh7SYHpzgcWO8Gu3hkf/LoTYnvcCRAdqpCfuo1LSnxrUWR0aPvyfle5z5uV3L58FHdfIU28CTmoaNTAIzTqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758104794; c=relaxed/simple;
	bh=T3ISxIPvcZvhmhbtWB1fP3pff0PITh55eSJO6Jdh7AI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dwi1jZBq23baXk0QnlarQnTNl1sl72w5q9JSVajr85Hl8tNbM5SovZTzXDk28HRVLuN+Ak6NLnKdJdYygxTPBgDnozgTnCZ/Q3D0JBLvRHPxMt+Ys1YrAlfNGxijtogjmlg+TRzQjWfKZ56JDuEXVo+QmoxPwIxMIyIN0fO+dmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBLt2+9R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50FE9C4CEF0;
	Wed, 17 Sep 2025 10:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758104793;
	bh=T3ISxIPvcZvhmhbtWB1fP3pff0PITh55eSJO6Jdh7AI=;
	h=Date:From:To:Cc:Subject:From;
	b=LBLt2+9R5ViUWWr6NoMg5QzzzaTg+h7deFeMsyejRjy0HEFvBSh0xe2ujbShleWoj
	 NKVkjQWlZt1JhZs77BLsRGveU2MyoLfV22Rf8icd0HghaH6Q78ZS5pIF31jkWBDkwS
	 rFlSvfdimzAEtFPRP3O/06M5R4A5R3ZuiWQ0DQyKNMQAD8JFnxXuSAXbOQc/pr1c85
	 Pq/W+3ZFZzAI93AnBaBbQHCcqr0nfb41HbGWXhscn+Tni72zxhnweSnMlo9NTqWrk6
	 RsYdeoWvJdeEmBktqQfqe6nYE5j7+DZp1z7gHJvvaBDmv6STpyIAPNu3bwY00DR2Jh
	 SMhIbUNTuiWvA==
Date: Wed, 17 Sep 2025 11:26:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	linux-mm@kvack.org
Subject: Missing signoffs in the slab tree
Message-ID: <6cc0566d-ba5b-4676-9b90-bf3d1fea4c7e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OQN2g4LYmcg72YgM"
Content-Disposition: inline
X-Cookie: Limited delivery area.


--OQN2g4LYmcg72YgM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  cbcc3da4e7bfc ("slab: Disallow kprobes in ___slab_alloc()")
  dfc415682b11d ("slab: Clarify comments regarding pfmemalloc and NUMA preferences")

are missing a Signed-off-by from their committers.


--OQN2g4LYmcg72YgM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjKjNMACgkQJNaLcl1U
h9AL5wf/cY4oAMRm0Hgklab3zCrDkwSOD7gJ6mgTuhs7J9knLFt6wYUUmxBtY5Rn
mhjUAIdnicH7hqqOsLRsNi4fdcHoYRkPH/aG5c+S1T8/N/8iXJkJ16YYbezR6Rve
7UV8USLM1tigK+YdcmzEJ8bSnSJVW3O8hk/kb+jzJrPVrLdBX/JlVaiU4h1RkA1a
h1LHf3Vm2Yoy85qi15HA8fiCRRj5aOssFa+VXVR0NdJ0QghCZX5b3xpGu9XEc2ZN
NJzeqyR8/9DPFsAqPUgE8YxOwlCDH56d26BZWg6oJFoomNFC7J0YIlhqmUr5ED8g
Y/RxvlOl5bxMT51e5/YF7EuAQWHfcA==
=uYmg
-----END PGP SIGNATURE-----

--OQN2g4LYmcg72YgM--

