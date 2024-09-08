Return-Path: <linux-next+bounces-3661-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 631DD970A4F
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 00:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6294F1C20E4D
	for <lists+linux-next@lfdr.de>; Sun,  8 Sep 2024 22:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C6F1741C6;
	Sun,  8 Sep 2024 22:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JefDoweC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D25139CF2;
	Sun,  8 Sep 2024 22:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725833041; cv=none; b=A6UvFfa90QzRRgspt7xlxyTpLoDzycsIphE+rA/YVygIzeIjsCsQqmoxNVy7beOYN1TehLbzwMKdG/23rVoJqT+DKU9tr8cA5OXyJ0sLtTexwwyGMS361ujyWq7IHFBJ6uwG0uSHhBdyDkFL+z47ptQB7iSXjPua4GeK2j1k4ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725833041; c=relaxed/simple;
	bh=Vo1VxX+2y3hVxVq5quv78fd2BD3slGEU7WeXD7AExTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MpDrY4/Z/5qGhQ6YauVBPC9QZfRmKxaUuIvAlH3VuPH4JHayNB+1Bmp+oak1GsSDA6gKOFnHp5dp5Be/aGP1kMyKLLdhY782x6EsxX2gN5IBhRvF+U4XT27VzOxT8fUzRlnP0B2RPt9R4f7qZqNImkXoVO5jfnkU7Onh21jwRsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JefDoweC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725833037;
	bh=js5/iwcpI5a7uJF6Gfoq/jXJmkSnEQw1iwdO9Ft1czU=;
	h=Date:From:To:Cc:Subject:From;
	b=JefDoweCT0bP/M8QtwIBKaOuBM7CUqwS+bWMzRVX6xD377Q3IRxUjo4Xw9p2XI2S+
	 6eErOtioCxvyu4BPhaanjytPSgpY0IDTDSBWCC9Ch5ylPxIn8lMslY6IJgMGVhgz1I
	 qOJI6TmcVuQu9iO3xaRTz9UtJ1hf8fvdnopIJv2qiDvr1GY7cwa3SYcFq8JDH+7Q+y
	 j/+nzoNEPcvAdSy9EaTfLz4DRm6H/F7YwlJKMAaqWboQQ+JqJR5BxFpU/Ti3wzbn0/
	 K/qSDKMvNT4viXn4hbdLYAzTlDqzzXLbV2VH01bEmmGEJESEHwuT7GtHzsQR5bSmg6
	 8jVkOU9pyvQsw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X23rs1BQHz4wb5;
	Mon,  9 Sep 2024 08:03:56 +1000 (AEST)
Date: Mon, 9 Sep 2024 08:03:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Keith Busch <kbusch@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the block tree
Message-ID: <20240909080355.768b967a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/13xXrhyApBuapBwM_UTq/pP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/13xXrhyApBuapBwM_UTq/pP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  4e893ca81170 ("nvme_core: scan namespaces asynchronously")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/13xXrhyApBuapBwM_UTq/pP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbeH0sACgkQAVBC80lX
0GzMeAf/ZnsNgU4MxqPtqX4RrDq8J03v3D7+Laig5+evHGiH/1jCXA8CTXzYH7Qy
YsDfmcnktQL5N4sH6lF5mdra2T/FaifqWiRofJU8MppEhJZRqisden+r059Es3EB
dQ574j3y/gFUxmGgzokjf53tdg8nC4MntrwT/2VlPxxTXoSpXGVeFgaO1UMOv6ZE
HFRLTrLu58xOkhXB8Osm25F9xjqlQITUzIG32sNNkXwrLbdSqN5wTwkiusKa4nT7
XA56CTyFfZd5uQOFdc5vrKITiWh1NErT95lML1ryQg5JSRqzovfyAOBQUSffdueU
XGUen3WqkXZi8yDMtE6atIr7AIoZrw==
=h0Og
-----END PGP SIGNATURE-----

--Sig_/13xXrhyApBuapBwM_UTq/pP--

