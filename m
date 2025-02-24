Return-Path: <linux-next+bounces-5557-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 020D7A43115
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 00:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F050916B516
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 23:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22BB20B814;
	Mon, 24 Feb 2025 23:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Wv3OlwKP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5481C8602;
	Mon, 24 Feb 2025 23:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740440507; cv=none; b=jQFrL6e9nEXnPXihWljKoMQdkq6wxbtJLkCCpTHPj8aiNXsCnfrNzXr89XzFP6/SEQ9d2Y8FNVIwV7nvdBdzYbnq3sj0DGTQeGsiDb/0Lr7N1NMmNXLvfLlmqggGyGmI8gM3F2/4x74jmNkQbPDEXjGwzAYQFL1KDgCWX7IqK8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740440507; c=relaxed/simple;
	bh=bZuM8TbiozudGGEVZshJboFdn9eUG467pzWc7Lo+RuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gAZvG1wi/uRyqVNRfB0FE5hXMuqlrbim31eut81oR64Jn3Qj09rCUXQQAr8aI96HGPKJE7uR2X3T7b7dhorkKY1Gceqe/YuXgbc/hwiNl1sVn4TES0+iTvZjhn4XJ9VfsCi0b9EwxDLhMGIMBWbLyGQ+O/hqt7UtSPaJVAI1fC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Wv3OlwKP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740440500;
	bh=abxmCZWzSUcw0yJZB4eumSfVlszT93m0/caHeEUEPlY=;
	h=Date:From:To:Cc:Subject:From;
	b=Wv3OlwKPYfOdKV5MdjePZJ2tg29Ie5LQBCj1C/p/O25qKuk/4btqA0Du5iL7F9cI/
	 8HTlJQ75UySQms3Pnt7mVOgNJy04sL41tzo1Wc/1Z/Jp8lTObCbQZ9xSpdvOhfQUg6
	 NoRm+QZCC9Q8V803uSgs2McczAbhPqSBtjjc2mt3hu8gotfivSVeHUQlv6q4o4rv1e
	 OsQhVblvwrPK+6aaKmTomsEgeYg+5FhGSdMJrSTtInfQ/yThuhecD5ERZVUxazKKyZ
	 b6L0aK83ZyN0BENSsGqpqQfGPujMD1bedUUxYyD676MAVr19b19FMlGe+jKqoldvlj
	 FKeMlrjEWG3ag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z1y1c4QsKz4wxh;
	Tue, 25 Feb 2025 10:41:40 +1100 (AEDT)
Date: Tue, 25 Feb 2025 10:41:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>
Cc: Zijun Hu <quic_zijuhu@quicinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the devicetree tree
Message-ID: <20250225104139.4fcfb7a6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LcX4yhot./nPi1jbBEJEecc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LcX4yhot./nPi1jbBEJEecc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  8d5008bf653c ("of: resolver: Simplify of_resolve_phandles() using __free(=
)")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/LcX4yhot./nPi1jbBEJEecc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme9A7MACgkQAVBC80lX
0GwnpggAhETN9c72MAJH4BTjwG0ALICEjVyzcOCqVvCmXVpmauxVR18XPA4bkK08
N4RK3/6WYUwnPsPZttaYaaCz5M+dQOkhERQTB8A8U8fJlFTdM+Uu+BtfH78R+M3W
M92/2MoM8pZSjggUeBxxryFS3ltn8GgM7m4p41HKFy8qD/RYQNQfqWIiibGNS8a6
xJosXiHBpLEYriSMzPGffcSnmP5rrFTDpkNglLG5uotH8LYtIP1Q/fS6oMSwIpPK
A4Z9MkjiaGJumatG7iwwnRiq/NlkeXiJTcCOnQZJYZiWU2mg8sbhI8Sks/hY7FH5
kn3bvCIvNVdgKqzbIzs0p8Ai+1tZMw==
=PiHd
-----END PGP SIGNATURE-----

--Sig_/LcX4yhot./nPi1jbBEJEecc--

