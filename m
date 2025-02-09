Return-Path: <linux-next+bounces-5392-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 361F0A2DB4F
	for <lists+linux-next@lfdr.de>; Sun,  9 Feb 2025 07:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71DFC1887AAA
	for <lists+linux-next@lfdr.de>; Sun,  9 Feb 2025 06:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE257DA82;
	Sun,  9 Feb 2025 06:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="swCKRpEF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8B92563;
	Sun,  9 Feb 2025 06:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739082200; cv=none; b=LqgkLMZ4+snW73YNoZOkAThK/Shqadn8qkYZ3quUZW1ZmR4PvS077fthgqqBcxgDpfTPdE2G+Gj/Y+qAvfEUkSaV/ZX0nteTi1gFG0stu+cW8H9ny9LEfAte/bfi0zDmHAzyW1shSMmMPQjbTJNNLquzeMsqmg1lSn+yM8FeIhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739082200; c=relaxed/simple;
	bh=vyTum2WWS+c+u2ZOVwosSJx8c4I6R2jqPs83AFhSVt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=L9Wozjzy0onth/2K29ETVb1WYvbgS9yDTghrqky16KXUJtG3vjzRCzFq3lwOM1Iz2GV7Ktjc1sSL3J8n78TGDtQMcEX2bVkNIze2AMZNW9hjS3PkxL4V4N4GEMyxFHfWkMu/fItHxzW1m6wiuJalgxsWgY71rJ+7c61RQglEsL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=swCKRpEF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739082184;
	bh=yd+wKi2VGPmS+8ipS1vhLdPswveLbPphqGAxACHSel8=;
	h=Date:From:To:Cc:Subject:From;
	b=swCKRpEF6IcEpc0ySnbOD1PF6BToHGW3smPtewbWU93LyEzoZFPL8Nl/BIdjHF9HU
	 I1LQN1TA3+E2Xd7TybqsHMMqAVbxpjHea9jxLkEefhC0eST50V5LPCQknNM+qPK9Dq
	 byxD4/XfmO3XQGTaW6umpGm/AceylsHSEUOaJYgcnJWv4EiRJsV0TVi5LFaI+TqeQo
	 sE3Ynev/yhdbin1NFooTLVUulp5pM+DLGEt/ql+n43R+1ckg02x5r1F7Y29tq1zuk+
	 Lfu+jZFRH3irVWg7LqP1bySoji8BqrYDkrTn9H6Fjt26hFg82/m5R+YohJoJv5jdx7
	 WaofcojBJu5eg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YrHh84b0Pz4wcD;
	Sun,  9 Feb 2025 17:23:04 +1100 (AEDT)
Date: Sun, 9 Feb 2025 17:22:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mm tree
Message-ID: <20250209172245.2b17954d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Qn=4II7K8buwBXQNWGsG4iC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Qn=4II7K8buwBXQNWGsG4iC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  828566491934 ("mm, percpu: do not consider sleepable allocations atomic")

Fixes tag

  Fixes: 28307d938fb2 ("percpu: make pcpu_alloc() aware of current gfp cont=
ext

has these problem(s):

  - Subject has leading but no trailing quotes

--=20
Cheers,
Stephen Rothwell

--Sig_/Qn=4II7K8buwBXQNWGsG4iC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeoSbUACgkQAVBC80lX
0Gxzcwf/crsph/egLZALyctEDZijbLg1wNsWTIq8owxH6mXia7lncQl7SbgNUWCa
3OyOWwWekifHex5CEqwlUE3gp/0Ld+XXvypnnTYp9ptFbV2KoOcTk75kLb8EIQkV
bpd1pN/gP1QUaPck9OuNT+vbZGo4Xdg4ErEDJ4PfHyNoV3OejsxMunWIuyR7fy6g
/++kGKnp/koa7g0BZOuZaLJSbwBwwLwEn0HvRCjrodT11wwmYITf9T3YjfA74ON+
XujPlQlrs2b7Ftvo2uKsZwpkhifQqo6lqNZaBTaphjrCAydsSaooxqjaAuuait2C
uiLnycTngprNX9AKqaLhvy4nRzbrlQ==
=5Wn+
-----END PGP SIGNATURE-----

--Sig_/Qn=4II7K8buwBXQNWGsG4iC--

