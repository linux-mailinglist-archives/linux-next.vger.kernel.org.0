Return-Path: <linux-next+bounces-2876-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6232592B2D4
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 10:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92C711C218D6
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 08:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2240D153BC3;
	Tue,  9 Jul 2024 08:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SlwNl2N9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3679D15442A;
	Tue,  9 Jul 2024 08:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720515461; cv=none; b=hhK+okO60Jg0x5R9mOfzIyOIv54bOqAZ7aaSaOdnWzoWF65F5k74jjWvUbcZL/A4zArZWtITDscwwyC+TR0m9my1eEBoX1kBJjuXojRa6annF8n8svlAGzLJG17AITxZUuVXgla9WngXqQxyVn94pRDhWdqaNWEwUvXt58QLmC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720515461; c=relaxed/simple;
	bh=ZBOwGP7RVFCc7foedD+ER6Tdv+jbAblKiI6tXyPVmB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=szWAtBt37gmtHu+MUXlW4xUDaZrZof55R2aYnnPNjTZljTOVgVUXSQ2vfCqD/uUdVpq+yJKRwyPc5SqbxS2pJdvA3d3H95AsMsRTgsdgqP9ZavzGUK2kBkctFJa+80//kEepyeL5+fyd9YyYPkPjnltgzsSXWlswon9sKGuAF0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SlwNl2N9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720515454;
	bh=wM9X1L7zqsx7sqfqsxVMVnzH8u0zHqt08s8WTZw8nCg=;
	h=Date:From:To:Cc:Subject:From;
	b=SlwNl2N9a2XVJgwC1P0N2J9n7kwAJOFxQ785yBgBSj5gOJRXAa6yRlN6FrOX/rbS7
	 EEAJuax+CmC4bzGy7uL8TGLV3za0oc/kyoApbB/Gzr3mE7X/sus4P5ei/k4BxsSZ5M
	 HMvewDSTU0MHhe3aMSAMGyIplCk/G0iXSuAACq2UTRtHVNBhaMx9Uv5OjXLHW9bIFk
	 qqjhyxLx3HYE9CrvyGNgncZuOWM6QyXWHfdXa4yBH8e/jUrlHTV1jw6hF2HjuqedNX
	 2LCU0ZoKoDgOcDea+r0+YwW9M5RlmZ8ocHypHlkwhTm6rWYfAExoeqsZHyp9Wr0Reo
	 J5xdsG1yUwpaw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJFHf3xTPz4xNg;
	Tue,  9 Jul 2024 18:57:34 +1000 (AEST)
Date: Tue, 9 Jul 2024 18:57:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>
Cc: Mikulas Patocka <mpatocka@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the device-mapper tree
Message-ID: <20240709185733.4aac356a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D405Mat/UdkS.xjdaUH+mwk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/D405Mat/UdkS.xjdaUH+mwk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the device-mapper tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/admin-guide/device-mapper/dm-crypt.rst:168: ERROR: Unexpected=
 indentation.

Introduced by commit

  04a1020ad350 ("dm-crypt: limit the size of encryption requests")

--=20
Cheers,
Stephen Rothwell

--Sig_/D405Mat/UdkS.xjdaUH+mwk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaM+30ACgkQAVBC80lX
0GwXWAf9GvpDZfiGkricFbGTVWIiIf2s2644aR9UeKiAiFkC4tNtFayP66pIPqRk
t6JjCvoKMJEIsW7SBeABK27cAmsz84AkfdaeVt9ODqUKuaZkShGFnI3ZN/p9wKh9
2hRcy5Xli9wCDdq3zbUiMQVTNM2/TrVJYmyZwEq61T6x7bSRYJqtKFri876Da9SR
UI/L60WF/D8mw78m0HYlMMVvU6JtVh7z31onleCzVo9gh65AMakJRPXLMRRgBBTo
5Zyf4ydhn2cR0U8ppqNDl5/JU93YRviEHxFsezp36vycqJrkFA9HduVo+IZUAK/O
B+ZYhWRrEU3aygd23mPGBtb5KmW0eg==
=1USZ
-----END PGP SIGNATURE-----

--Sig_/D405Mat/UdkS.xjdaUH+mwk--

