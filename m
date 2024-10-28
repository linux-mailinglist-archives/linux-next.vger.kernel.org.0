Return-Path: <linux-next+bounces-4503-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2B19B3C49
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 21:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02D3D2837B9
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 20:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18BD61DFE38;
	Mon, 28 Oct 2024 20:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ad+Km1h5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4EA1E0E12;
	Mon, 28 Oct 2024 20:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730148633; cv=none; b=BXwNUal8XuKwsB5nbbLlh/V+jLSPKNDd3b9AWfLtUdAWxrYasm25W2X3k+tDeMPtCRqBkKtsJAs/V1cQdDDY0av4IgweK+G+L7m5GU3V2+ySJE4QHv2gVQfLIOnVL8oep9hoUeKbtqk3iZeEcl3LeU5/NhcDP5fvbP9+3M14caM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730148633; c=relaxed/simple;
	bh=51gYubsqkYynHlGCldDrHkYfPi4+3KF6xcB40O/1zss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MVnDvLy9LRsaPSkelfBqOk3NOwwoxfRLnOFhr7OcmCxQV+0GCVUQtezvtQM3Jk28LEvPy5oD3LpA3kA8PlUsYO69FJx1yUmLGAvIanrxTm7fnou8xgX+0aRaGmaWjns0em5iXUNYZGRiJaI03X/qAs/BdSWQl+/BeqsWj0O0sGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ad+Km1h5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730148622;
	bh=nuPBMF007fmKMpoEF9JeBunJhfhlIJ9szqp1ee7v6yg=;
	h=Date:From:To:Cc:Subject:From;
	b=Ad+Km1h5aPCrdcU32+P/Penm8DYMsV7YvfumAVFozxmUetnLc0q4JLj/ZzxJVw3Ju
	 pDKlmEFqWuvDL/RKSqxlpzu9ZvUdAUvecKZv2dZ6KUD+sokMDVUirQMuMxKK4AEK+R
	 xjnH1dlZd+D1oZnn2e2yF3DGfREcTcx0yqYKrl1Pn4wfQfcbqRwnEW+ynsUN7eiQni
	 ZlmO2UsYxKfZ1tR2bghAaMo57QHa7XRA3dUl04kw77Ea2sl9vQhaUevkrfa+S5uRVS
	 cCbW9lAXpQUs9gdryVQ2MuW1od4Hg+puh0Lt4QODp76XDj1dOxqere58xnNIO5W/FU
	 6v6hrNXqf2ZXg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xclrr3xG5z4x8S;
	Tue, 29 Oct 2024 07:50:20 +1100 (AEDT)
Date: Tue, 29 Oct 2024 07:50:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20241029075021.107877f4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JO_WOYw+GI5x404KKobtcXC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JO_WOYw+GI5x404KKobtcXC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  b4f5f4934b58 ("sched: Pass correct scheduling policy to __setscheduler_cl=
ass")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/JO_WOYw+GI5x404KKobtcXC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcf+Q0ACgkQAVBC80lX
0GyEbwf/cCtsRfLyKUwvlq+a0UxdGXYPDrS6Nw9MCLNC2yXapBY+ROKZgyyCUV9J
GBedy3RdgfQZRyZJkB5wV27FljeQm6gwEKLTY0N/v/j9qfiEcg7FMRfVvgXZXNTj
fNfue/d11lHYvkRJf6EaHPtliPczs27/Cqtq4h+Fa6KMtCtsSSzduqiSHNAykWFC
RvJ+OXOLXrB3NitmLT9di5MuxBvU5LuraIYeLPuIuoVmnDEdy+k62n+L1gB/S07t
7f/D7Tg1Sk5BA18NwlBXUHakP+wFTHoTMBYTCdHDFSvzVCaPb5dM62C1gEwlwj91
jHXyZpiLc8Xie5V8r0t68REio+EiHQ==
=kDun
-----END PGP SIGNATURE-----

--Sig_/JO_WOYw+GI5x404KKobtcXC--

