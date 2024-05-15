Return-Path: <linux-next+bounces-2317-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E948C611C
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 09:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C26941F2352E
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 07:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A92C41A88;
	Wed, 15 May 2024 07:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZoC0D+wP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DA740875;
	Wed, 15 May 2024 07:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715756636; cv=none; b=FSCPhVKxCPswp/OJjsqR97XCW24iW1nyWo2a8lRwNxHshhmRlwfmjZoMnm1Pr/g4D2aGfEnI1z/+13ub4CPb1Scw307gkLrz1zcqbGzsiMKq1hr8dIjya0NJ6SYs2I+j1j/8A14Yp7eJG6oeg2tVNE6hyh8wcfkss041Mdvo+l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715756636; c=relaxed/simple;
	bh=a23Cug9AhjPBfUeD7DrLjspv0v/fZFiP7FlrMUsN2eI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=V1fLZOgqnCTi0zmgY8uGXe0U/DykFcyI2e35Ib3W71gkRmH7n21PM1hiVwsybjWINDsPPP+CMn6szD3h1xltQxsArKCZrROFrB9KlHb579ffOtN4ItWujKwKsfBynzhHk/RhNGkSs3ZD7gz+XAXB0vnN2rJGYC3gxno8VUw5boE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZoC0D+wP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715756630;
	bh=r5Txr5FAnBYVorvwRI+NCbA8wrTB5FWCVzgZp/cBdz8=;
	h=Date:From:To:Cc:Subject:From;
	b=ZoC0D+wPftfScTrINazpAMYzM8MYuf2G0L2s/3a5y5RjFQJjzbw3Uyka4irlxhLxl
	 tCkfiB/3T3/qvCz9EWlC1F7RW91pjZ6xbwgqVbICmh/4FhHxPkYIq1b1oz5orMPH74
	 t2XW7X4FRgTYgqaNb79lV1+b7oIP+20u3py0cfWUdMJ0kQdXw51QZvSG0iCf3LarDe
	 DGS7PbfSe8kwcPt45UFbcl5D1Y436L4d/kUSLbN6k6ilQK7K5qgsGUvrmaWfpI/yPb
	 IAdc+uMBAn0MD0BSF3tSMlxXW/M5TP+EOhjZO8LAksI13HCuUbts8MDchaKlKrkvW4
	 5eZcT57KHL3Bg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VfPMp1MM3z4x1Q;
	Wed, 15 May 2024 17:03:49 +1000 (AEST)
Date: Wed, 15 May 2024 17:03:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the btrfs tree
Message-ID: <20240515170349.76ed5933@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L1ZZfe2k_TQjc+/PbzgrEJO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/L1ZZfe2k_TQjc+/PbzgrEJO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different
commit (but the same patch):

  74a82505bc76 ("btrfs: qgroup: fix initialization of auto inherit array")

This is commit

  0e39c9e52447 ("btrfs: qgroup: fix initialization of auto inherit array")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/L1ZZfe2k_TQjc+/PbzgrEJO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZEXlUACgkQAVBC80lX
0GyWSgf/QDJxwhSAfe3DC5UQ/glTYetA1yNn8qtCUuP7+wwWvUPC4QOgmaXOv9bD
YDoNIqQEIFWdpTP57gyu7nZp5ObK2VJYSNxXQNIJ3EPFj2zWB0Pa+V/ulkAMMV+2
e6uKnpXYwxdSBrcLD/JgkkSEuw0mi6PUpJWrsSUzFX5jcIljIzFqKhuC6TynpJyZ
G/OLRctMwdqkCzu2a1WsF7ryZr1ErrbtsF3WgGvA+SzNEx2w8acdoq1hfnbGn6ku
mMbD6Z98MPY6E7+xtNqgGB9vHc4C9BtpOiF19zb8Ok6uTBCLJJBuDPzlCERSNiAq
+o0/13zwu9g4MoyOrQ9gxj8FhbsQjg==
=suKi
-----END PGP SIGNATURE-----

--Sig_/L1ZZfe2k_TQjc+/PbzgrEJO--

