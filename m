Return-Path: <linux-next+bounces-3554-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7340B96906A
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2024 01:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D65B11F22936
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 23:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD0B187843;
	Mon,  2 Sep 2024 23:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P35lHfTd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A933F1A4E8D;
	Mon,  2 Sep 2024 23:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725319675; cv=none; b=mBJ31eSJ5mjvZhZIJNSUOnRv/0inHR3kwpcOZu4twjhy7Kn+tzmEl+oUsw27mLhwXnBOdoaf0Fseys7iSJoh5u3WCk2o32zMFli1IwPNysrEFHUzEtZM6wV4L+ul1DTCImV0PwVLukPOv793XIe2bZAi5I9Nxn3ElS4W45zA4dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725319675; c=relaxed/simple;
	bh=ArA44y85opajLpwr0lgkQS5z3Uf05Ii2ICiLngFWGjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=S8BtcdhMdKJGIIFpFPKaK18zQ15i0XUnLODcfwKeaDQkUW9YMc2fLzVz8ENpcU4hiEtZLTmHw3j86GfGULapFrj10/unMt1fpuzeH64RYwQcrc56dLxZBQ279WCJlmo5TBVhul4A9GCSWH5kyL1y6ogkZ5Wy2WePJ8Q83MMebRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=P35lHfTd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725319666;
	bh=mnc/5UGufkzutMRwk1vmSMHfK3wa4BaJOErQoMLG7ww=;
	h=Date:From:To:Cc:Subject:From;
	b=P35lHfTdW6S2ejop1Z6OcUhAJCuyeaknxwh9AuHxzZipYn++9UWZLyuzH8rfrIAs/
	 BWlUEqs7lu/OkHThpCqS2Srcy8kLsOU5ZcHsdibgdwMmYznRda6/pU6YLCZOsN+rWZ
	 Uq0CtyLMhhVtz3vJtyiQQK8KxEKdZn6MNaqlSIqn/OqAZ4mB1Djmp95P3ZsEs20jNz
	 ODIbhSt90CrzE2eKlRVba18lMpd55bu8LH4vek6VLsUsA1xI3cFRY57cmGUunIyrHa
	 5I9xpGqLOlkUsG3EhZW7mcHn57y9kwm5WyssLnN+rDSoZj2JhpdZK18lkN+Khvkxv6
	 U9Q2+LF3RIAfg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WyQ0K5x6vz4wb0;
	Tue,  3 Sep 2024 09:27:45 +1000 (AEST)
Date: Tue, 3 Sep 2024 09:27:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Aleksa Sarai <cyphar@cyphar.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20240903092745.370fc0c6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sHT6gIzZSIgM/RiEkn8F8nH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sHT6gIzZSIgM/RiEkn8F8nH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (native perf)
failed like this:

In file included from trace/beauty/fs_at_flags.c:21:
perf/trace/beauty/generated/fs_at_flags_array.c:10:31: error: initialized f=
ield overwritten [-Werror=3Doverride-init]
   10 |         [ilog2(0x0001) + 1] =3D "RENAME_NOREPLACE",
      |                               ^~~~~~~~~~~~~~~~~~
perf/trace/beauty/generated/fs_at_flags_array.c:10:31: note: (near initiali=
zation for 'fs_at_flags[1]')
perf/trace/beauty/generated/fs_at_flags_array.c:14:30: error: initialized f=
ield overwritten [-Werror=3Doverride-init]
   14 |         [ilog2(0x200) + 1] =3D "HANDLE_FID",
      |                              ^~~~~~~~~~~~
perf/trace/beauty/generated/fs_at_flags_array.c:14:30: note: (near initiali=
zation for 'fs_at_flags[10]')
perf/trace/beauty/generated/fs_at_flags_array.c:15:30: error: initialized f=
ield overwritten [-Werror=3Doverride-init]
   15 |         [ilog2(0x001) + 1] =3D "HANDLE_MNT_ID_UNIQUE",
      |                              ^~~~~~~~~~~~~~~~~~~~~~
perf/trace/beauty/generated/fs_at_flags_array.c:15:30: note: (near initiali=
zation for 'fs_at_flags[1]')

Caused by commit

  34cf40849654 ("uapi: explain how per-syscall AT_* flags should be allocat=
ed")

I have used the vfs-brauner tree from next-20240902 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/sHT6gIzZSIgM/RiEkn8F8nH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbWSfEACgkQAVBC80lX
0GxCbAf+LO0pCo00BXmyyYdByTDUl0nTpVv4DEBY0J65TQkPKMFLb9hKF5T49aq9
FkTweYRG74Qqfd7lVfXT3EDgxjB1GgBczmphvorUM3FSlNKqXQ0I6sVr9aUvdmg6
fvvYK7GXI0vwtds30NqzWdfVx/u/Tb54BrAq2kigk2wQAW7QtuZ9/SFW/6gHJF+6
/DeHZqEXx9OXnEUoBsPcD4exZ8Doqiq6W65E5RoGzDhPm88PVIX89WAgL686048p
s9tlvjLo8pR1SwrGr7ZzsxbLlNBlTaSI9UB/TfudHN95CfwU9Fn1rIFiD/WQscRT
RjS8wg6cP9w2kqz0+dNbRXazWCCftw==
=hbZp
-----END PGP SIGNATURE-----

--Sig_/sHT6gIzZSIgM/RiEkn8F8nH--

