Return-Path: <linux-next+bounces-8643-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBD2BEF158
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 04:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 044F618954F9
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 02:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C822820DB;
	Mon, 20 Oct 2025 02:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oDi+1zts"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D01299947;
	Mon, 20 Oct 2025 02:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760927511; cv=none; b=qjG06yzJw1ApwdLP12JQyOObi4yw7/Q7FHk0z2Hp9NdNoPL47aW9NtV7zUAX53+sFWR99Cs+RLx3nri/qfysrCFgBOMRZbWre9w2x6xmKqSe9+uGlexNQ0skPccpEGiOlfldMOUJDPuLdYxZTse6BsSkuapb7xhdvHHwGfGYNOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760927511; c=relaxed/simple;
	bh=HYaz4R6Fbg/vDCy4pxAEngNDF2Mcs0Idc4A5IDroFWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=C9/Sr/8njRjkLO1iD3BN+TrWGQC1zO7Djsj68yq+Czz0zgyPkW76CzpAeVkkl1U7Lb/3EZruYYTF0m9dQ7rf89MEFgDmM3tIQlaV4W7KyVpbJg+QikYKnqc3z1wc3A0FBvH+5bPa+MO3HahAJuTYg2q5GjT8V0dAnCdXCa1oj+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oDi+1zts; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760927504;
	bh=soN5YOMoEwqr5sAgtXnNGeiGeLXk9OjXNEdm9xZIk5g=;
	h=Date:From:To:Cc:Subject:From;
	b=oDi+1ztsynQuLbGpmftRioWIrDwyqD5B09SEAA21yiDV6hW/r1lcckLSfFcszPsGt
	 bfc32yWd+ud6Tff0p30OmlLcSEBJod+vNg3EHQvetgW7t9NGpG4F8N109n6duuiHrQ
	 7DQyXWfdQnzaZN0M0t9S4T9q60PkNamqtt7ZuaE81Hvjzf43cXzc+hhMOL29zNpbSk
	 lAnUaNqKGkXsOsjOWidc4c42GewqspqjdFIyRS2pSQOJpMOLHYJ2huj2BVQI2DE0c5
	 6nLnjeoj5OvpvzLWkn7JpkGOG8MLRvkcsHZ3Q2/uFCIWmeN4uBLP7qY0glsaxXGlxx
	 YWccxDJ40r1rQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqfZS5N32z4wB4;
	Mon, 20 Oct 2025 13:31:44 +1100 (AEDT)
Date: Mon, 20 Oct 2025 13:31:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wei Liu <wei.liu@kernel.org>
Cc: Mukesh Rathor <mrathor@linux.microsoft.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the hyperv tree
Message-ID: <20251020133144.5e6e3d03@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hB/LZLG3vbdIlh7W5L3II5C";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hB/LZLG3vbdIlh7W5L3II5C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hyperv tree, today's linux-next build (x86_64
allmodconfig) failed like this:

arch/x86/hyperv/hv_init.c: In function 'hyperv_init':
arch/x86/hyperv/hv_init.c:558:17: error: implicit declaration of function '=
hv_root_crash_init' [-Wimplicit-function-declaration]
  558 |                 hv_root_crash_init();
      |                 ^~~~~~~~~~~~~~~~~~

Caused by commit

  60116744be53 ("x86/hyperv: Enable build of hypervisor crashdump collectio=
n files")

$ grep CONFIG_MSHV_ROOT .config
$

I have used the hyperv tree from next-20251017 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/hB/LZLG3vbdIlh7W5L3II5C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1nxAACgkQAVBC80lX
0Gxcggf7Bs+hNGZ402bNR68J4DZqMiWmD9pHe8LBQn8dg7VcgUizIq1PaYsc+Gzo
y0eKWmsabxsDmN1HnFyg/uqOhBrM32bs4BqY1UceZET4rfks1NXiJ3/3xwNDjdMy
AgFBgpE3JZdeW9G1zYTe/KQIf/zaYfGTdIDbtbVz6zO4XjKYvbx5jX94iGHKhmX9
dQiLgQ6ue8pFgJQhZOm+eUWXM7Bp90CoDvpY5TqjRF9IJRhvVHJfAfjMZs9m1KlK
vw8aHcBS7t1N4/JtfXF4NwHCOYirtb9jie2UrOo9wdyJARp30HHX4KjtfQTjUAFT
u2OADPJBUiEI1adjP0M8TzYD1ZtrgA==
=0VCQ
-----END PGP SIGNATURE-----

--Sig_/hB/LZLG3vbdIlh7W5L3II5C--

