Return-Path: <linux-next+bounces-6765-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D588DAB646B
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 09:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DDFF189ADC4
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 07:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7660E1C28E;
	Wed, 14 May 2025 07:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hwWbh2qr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B380B1DA31D;
	Wed, 14 May 2025 07:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747207842; cv=none; b=RrIRCoucO0OnS0JpuNWURmAh9l9Piu7TfQEwGGW0pEV1ptWeNKKKJlSJep2Cp5whlatIlnLAL6T9TzgU/shiw74HJ9F1XAdl615uX4HV8QILaqkb/os/n5HX6G+JLBY8zfdUuX6gdHI4D9sGPqxsYemzmMDVBn+whLKJ3zroXxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747207842; c=relaxed/simple;
	bh=CD4dJW+Gv+4m3iDMae7kIM/vg/0boHM3mQg6Gj/PAFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FBhFuE9dQ1kMcRcPkf41vYevVJlGAELwyPh5JyM1x7r1cJyUi5PYRwzFfqHrkNXcn0vfsKjOq4BSxy55itD9aw/ekc9aC7Z4bGxkbfE9NfM95bQAlBFNb0kDBaj5Z/BtHM2XHo7ar2YL49JP8sSc8sSGadFdzSC7cV0ER/GMrto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hwWbh2qr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747207835;
	bh=RRbMfXRZxB7U1lwx5jZiu9Md8X1fQf1+AbUlEL3dcUg=;
	h=Date:From:To:Cc:Subject:From;
	b=hwWbh2qrtJtWlmjom8KjQi/4yuqTvbGyiZacECjFDhkD6GWE9/VL6VvCFE2mvNAdx
	 EpGGlbX06+VqvJ4gK74S0IcL8Z3t+7U0a1eGNUYM4ZXsy1rvvUgEDkLMPB2tZ9f2fx
	 JJrOixg9fhXru4w8dY+ivj+gk432VsNt07WLQRZze7J71mc8BBsovdBqZ2gZ9YnT5d
	 CkgOgPZ1AgAdphoXfnD2UwMUET0k4yoOaRcyr3J55uw4cEow1JAZ5YjHLec8V5JCz5
	 oEA3E2uhFb3wczRfoghJD8KH0Ne9PiYMXcOsV+3Ve8KIsEiRWtsKe1YMCG9pmJDnXQ
	 i7iPV0k94F8Mw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zy4kf5lWVz4xQg;
	Wed, 14 May 2025 17:30:34 +1000 (AEST)
Date: Wed, 14 May 2025 17:30:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Greg KH <greg@kroah.com>, Arnd Bergmann
 <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the rpmsg tree
Message-ID: <20250514173033.647a4dd1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//athPkFYMEJ2U6METMfXPvC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//athPkFYMEJ2U6METMfXPvC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the char-misc tree as a different commit
(but the same patch):

  317c69397867 ("rpmsg: qcom_smd: Fix uninitialized return variable in __qc=
om_smd_send()")

This is commit

  77feb17c950e ("rpmsg: qcom_smd: Fix uninitialized return variable in __qc=
om_smd_send()")

in the char-misc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_//athPkFYMEJ2U6METMfXPvC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgkRpkACgkQAVBC80lX
0Gxykwf+JmkuecUAMSAjXbcFCEOH3gf39uyuY7wqPReHLBWaPkEvsk+VVJhg3vgy
RWazQw01NcQ1U0jK+Hw7sXlT3FwDgWsZb/hlL9f8NWvBQ0i0DrdeudL/ptsMTlh0
+YlABGZsP/ioIqzgwb7Gbf4LLjWkqWcn4t1auGec48axKia6zv1rAshkTm0CxxKz
aIXesZnaLb3k1HYEBMJMM1WsL1hNA7yCErRJwdgVAn9PBR+Lc4utGpZKpWaeNfsn
6tEre8XxNKkFaGa5MmZWvt1+ajuSIQF4kBcQQZyVQfxV139hIe8b4fLkzEvL5VnV
ujoKkszJJHEJ4mx5+uN7t19qzqjy5w==
=4roA
-----END PGP SIGNATURE-----

--Sig_//athPkFYMEJ2U6METMfXPvC--

