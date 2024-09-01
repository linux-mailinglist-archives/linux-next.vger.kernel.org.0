Return-Path: <linux-next+bounces-3520-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D94E2967C88
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 00:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 164311C20F8A
	for <lists+linux-next@lfdr.de>; Sun,  1 Sep 2024 22:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03204139CFA;
	Sun,  1 Sep 2024 22:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CjuQyzuy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772692A1B8;
	Sun,  1 Sep 2024 22:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725229122; cv=none; b=I263u/hajSukOD+kf3ZNZPU0X/rU64ID2ht1LL0oXAKHkApM/TPU4krcMQ9KF9pQpe/U+MBklnYMif0++sHHDUyd+gM5xIpArhp5KSH2lvc1WOpLyFNrLW0dIHInH49OusZXvePIJ7PbjMFWNkaUceTFskwzrjQsWjt4YcfKP7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725229122; c=relaxed/simple;
	bh=eptuV7wHMzdUKX3/OAc5AxjS9miHiPi5jJdaBMdnXxk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=F6i0jZxxHCvO8H9YaSxV9ZdEaz3b6KaeIFr7ZH0TXVgFlz9MSzxh6WgKod3hV+E4F0o8Nj8vQCSgGHuSy6/QbS4inmVJFjMvC8+z96jxvNxJsGGib40teXAwZ1k62ufqS6Y4G+ko9mwDKeZyZrKWOTtTvmsD+VJWaqkSOT+ptQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CjuQyzuy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725229118;
	bh=qmzMj1DcmTxbQruVvXhQ60t7AS6CI1wZUCHNhYktqnI=;
	h=Date:From:To:Cc:Subject:From;
	b=CjuQyzuyh75lMNSo7dkBHqTV+1suV27/zde5kgX+5xcKv/XDrA+s/HlOiL7Cv90jy
	 CCW/1gHZiFHdHhZId1YgUsQNxB6SK3Lrc+NUMcOgelsbe6AdD4zeRtEzcI2HatDRWe
	 cFqQC2mp9vHUGCOeSgNqRi2/MUfNTir/mkeWQthTRURkV8s/2ggnZDNGomCiqXXi0r
	 41RavrxJzknmxwsPkFsOI8+EDwnr7HCs60da2QyzlPfpUbpbc5kgURbUJ7eX5LigUM
	 8i2EasyAdRXdEwPXMbnHaPfdSnkuPe6eCyQrFFQwsR1V6/hdpH15snZJqllb2PnisL
	 uAudonsTIGyzg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WxmW24Nkrz4x1V;
	Mon,  2 Sep 2024 08:18:38 +1000 (AEST)
Date: Mon, 2 Sep 2024 08:18:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Veronika Molnarova <vmolnaro@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the perf-current tree
Message-ID: <20240902081837.6def2734@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Nl+TKhf6S_Kg=56jlgfY2KZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Nl+TKhf6S_Kg=56jlgfY2KZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  387ad33e5410 ("perf test pmu: Set uninitialized PMU alias to null")

Fixes tag

  Fixes: 3e0bf9 ("perf pmu: Restore full PMU name wildcard support")

has these problem(s):

  - Target SHA1 does not exist

Actually, the quoted SHA1 is too short and is ambiguous in my tree:

$ git show 3e0bf9
error: short object ID 3e0bf9 is ambiguous
hint: The candidates are:
hint:   3e0bf9fde298 commit 2024-06-26 - perf pmu: Restore full PMU name wi=
ldcard support
hint:   3e0bf93e0354 tree
fatal: ambiguous argument '3e0bf9': unknown revision or path not in the wor=
king tree.

so you should use

Fixes: 3e0bf9fde298 ("perf pmu: Restore full PMU name wildcard support")

--=20
Cheers,
Stephen Rothwell

--Sig_/Nl+TKhf6S_Kg=56jlgfY2KZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbU6D0ACgkQAVBC80lX
0GzfqQf/YXNl5k2TLgM+b0mHmjOC/K9TIO7im9vLSSj7r4jRl/hk0XIobCLWbeSX
/Nv67QSW6RbroZLmdwBWS79kbil1foLYGjZQE/UZ4pSmRTzcc2k62T3uatzjtquw
5cJAOr/va05xsRr8dJ0ahBYI0rUMnjPgnEn6Ih0KFdHD2h9tTIa3FZrY2+M8MwTr
FL5j5dO+okIgmdseFcO6EoBv0IzG0Pf1iddbOU1Veqo4eIjncGNtOYXMffqlbUaH
uicCKtG+KQ6MUgjFwHWvJJnN5mrcbJ4c3SYlh9cWb8fb0e0I/onKp4X3lZSJ4HN0
VrN+NQ63f7eLGyKMuhP+O14xgdN1bw==
=BfRO
-----END PGP SIGNATURE-----

--Sig_/Nl+TKhf6S_Kg=56jlgfY2KZ--

