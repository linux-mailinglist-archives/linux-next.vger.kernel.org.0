Return-Path: <linux-next+bounces-8263-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8D9B531C5
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 14:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD0D51C251E8
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 12:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898A131D758;
	Thu, 11 Sep 2025 12:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rothwell.id.au header.i=@rothwell.id.au header.b="J0Bb5QQh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.rothwell.id.au (gimli.rothwell.id.au [103.230.158.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA0831D757;
	Thu, 11 Sep 2025 12:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.230.158.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757592612; cv=none; b=XZYnzwpRNgG4D1I03vb/aHpudq+zbCM15lmoXgNs5yQ6518N2qtnunBSz9P5+v8nObytNFDPNWGMcJIzencvWfL9ji9DZ9r75kFibyKnxMQe3QHOk5Jbtmgdi3buPXfn9/dCzH6uY4JNmYYFmuT7y3UkxEVuyEAJTONWoP24dPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757592612; c=relaxed/simple;
	bh=jsPoExM3R5fHxTidfpAK036J0CAVVaEj+HeJ8s/huow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ef3WDEhsFk7ZozjLp6arwOS3ddjKE2Ssa2TTpLFpEEocacJiTvTv15PBoZsKvsO5bbR300B8XE4Di/4kjTGb+ot4AYFbrb4htWZFqnrTXsUYjcNgc12rMC7cVnouwIFuVwMOfKALsbVVa2WYXRs969m0hHd5yX/IzIXyTbPRIlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rothwell.id.au; spf=pass smtp.mailfrom=rothwell.id.au; dkim=pass (2048-bit key) header.d=rothwell.id.au header.i=@rothwell.id.au header.b=J0Bb5QQh; arc=none smtp.client-ip=103.230.158.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rothwell.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rothwell.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rothwell.id.au;
	s=201702; t=1757592178;
	bh=NSTWy2VFxRZPT2sLFojFZP9NqVCe10qrFdNcMUstosQ=;
	h=Date:From:To:Cc:Subject:From;
	b=J0Bb5QQhZB/rFpos5VzUKZQjVSRMiIk9REMbVWT+UwJ6T+z70o0ekbo1ce2mRx9iP
	 2DfNZM+w1KFBEEAHa/pHWoOjPj7upR++rSwyVl01Exk2jxCgr1V+cgrdqU9Ao52uDt
	 EN3RxNiDfkfdAj7X1r44nImRODjPvZOsfWwe1pboAkMtgdOZH9MOBsjBSbI0qsI3SB
	 0nohTigfzmK3sPCnZPUA6/Nsi+fOfsfoCEmGNUIYQl5EZK+5TDV9uY2j8Dmrq/Y5kf
	 svCeZepP3RlQY2c1CVupjHso3GeWR/dsZaNWZ+D20pW+INmqt35eMbmomz13PTu8P6
	 pgX8ZAGHr+bfg==
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.rothwell.id.au (Postfix) with ESMTPSA id 4cMx5Z359yzF;
	Thu, 11 Sep 2025 22:02:58 +1000 (AEST)
Date: Thu, 11 Sep 2025 22:02:55 +1000
From: Stephen Rothwell <sfr@rothwell.id.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Brown
 <broonie@kernel.org>
Subject: linux-next: vacation
Message-ID: <20250911220255.6706cbf3@pine.rothwell.emu.id.au>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KjpkcDFs/9=Q7n712GRR9Wa";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KjpkcDFs/9=Q7n712GRR9Wa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

I will not be doing the linux-next releases from Sept 13 to Oct 20.
Mark Brown has generously offered to stand in again when he is able.
He seems to feel he will be able to do quite a few of the releases, but
there will be some gaps.  I am sure you will all cope :-)

Thus tomorrow ill be my last linux-next release until Monday Oct 20.

--=20
Cheers,
Stephen Rothwell

--Sig_/KjpkcDFs/9=Q7n712GRR9Wa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjCum8ACgkQAVBC80lX
0GyZ0Af+OTPiuAMyqkq8Z4pXaJdeVfDIkEc3yuLfimMrMEIcltKbBCVQNbqHuIz1
zuxe7z8f3mSaQDr9l7rlI96arpoaxyBp+0cJJ+wj69yvHRubYwzKiUg2z7yh4gDx
S1qBElTtxuVuxZ7fwk4QkVGUnX2I9sK3B8E9RrtA7xq08mOdo6TwgMy198JS+EXd
ZP7DIcui2Q/any+wCZDs3mHO9fQA+Xtd0VRcjowYMHMnCwI2kAVxI5gtLKgwXj0q
cHlCZJGngiFlELQRt1uZ/9+wSmHdICARPInDe2z87swPW8ciXNDJxQp+UdGwP7Up
aqomfpfwS/jirGqOTfnOnslKSPOuJA==
=7pip
-----END PGP SIGNATURE-----

--Sig_/KjpkcDFs/9=Q7n712GRR9Wa--

