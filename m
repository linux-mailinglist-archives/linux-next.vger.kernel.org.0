Return-Path: <linux-next+bounces-9618-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCF2D16295
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 02:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C2A63005482
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 01:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D60A267B89;
	Tue, 13 Jan 2026 01:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="f5MIeW7k"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585DDE55A;
	Tue, 13 Jan 2026 01:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768267631; cv=none; b=IrkoGBvQE/fxK6OtEvVPySOs12P81TM+GdLhmIaL7aNKHAc8NSGS/L8uxpoaO1g/QV+4uaDdSPIJawQpwihWnRJCxF1khhD+wwlCu13DVGKCd5QQmuTVo5oWp1btLOzoh5ozbSF4PY4uPve+eUeslIkN29Pso2YwsL9tlmB2BSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768267631; c=relaxed/simple;
	bh=O3alOfr6G6tIHwKSlrxvS6GQI/MdqWRUvB9G7+PyEiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pWs94NMrnMZAL2A9i0CWqj3BkSlupTp3s9Z15vEt9ZHTEDwYMicFKJiucaV/Nvr/HaTvm0iQKxjELc2D4VTGYBXBL9VgVyxjsR/oi036KkRS3pwU8lTUBXh1R0iDvjdM7DVEkqvbzY8c2iUpXp1nIjNCoo2XLwXlZ5MUiJvC13M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=f5MIeW7k; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768267627;
	bh=AFXT3t90crZ6CoYcxbaPBCkkgihQYJCDp83OEDl9h3I=;
	h=Date:From:To:Cc:Subject:From;
	b=f5MIeW7ks0auIcmjcawTxDfpWvSkOPvs9lsYqNkhS+HBEA6Q9I4OvLgv1afa46GOI
	 QcTKUxmA4esZYDWVFn7KQzFsp1mM0SUfgCOiEDaaDSaqv0DJVWqphtbb7bx+XRGvC0
	 pKheYcATcj/gcGQJqG0bY63kszfAZYADvXS9XLRm8ebeYeES/TP74x7+ELeVn9cl4I
	 uYv22x4TLrDBrNRVEC4X1G9cxy2/AhOahdWx5xyTYxHxgrN4PrY4Acl6NtahmC53HH
	 d/og+ZQGqIPAbOhOOga7iU3T4EYh4ZZsCUVlyfgjUWIB8W1KM7JGJpTt/J9fyDRaxf
	 YPq6QX8jP5nFA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dqs6d45d5z4wGT;
	Tue, 13 Jan 2026 12:27:05 +1100 (AEDT)
Date: Tue, 13 Jan 2026 12:27:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the bluetooth tree
Message-ID: <20260113122704.1d6a0284@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L57wOuyj7JqOlIei_C/wH0V";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/L57wOuyj7JqOlIei_C/wH0V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the net tree as a different commit
(but the same patch):

  d4f7cb6e2df7 ("Bluetooth: hci_sync: enable PA Sync Lost event")

This is commit

  ab749bfe6a1f ("Bluetooth: hci_sync: enable PA Sync Lost event")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/L57wOuyj7JqOlIei_C/wH0V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlln2gACgkQAVBC80lX
0GwyyQgAogYFZgnQL5oVePaSHmKSgEepRgSzIxjSTseTDZBJf9NPlay03xOfd1rw
B4/nPuxH0he6pw8LWFmobuSulGM71REqOMyKv3LLfa9pzSM6xxfnGtDe+eYvkiW2
XMVqTsO4yquLIEj0bS3W8xj88BDHUSInHcSfMDchykOQLpmJEUbu65lE5aPAS6GS
1QhKQNj2uaV2xfG3GfhUKm4olOmUYnmXgHezpUZa+v6ow5lOfvUy5igXtH+VxX/Z
1Z4Ff/6tZmhG/QEx5F1bcqfjmQu2WWzVYDBQn7CsqYsh/HExrqe71i7Xh4a7fJEz
0R3R9bm7IK+9wWRDoBJEblZVuFzo1g==
=0tGe
-----END PGP SIGNATURE-----

--Sig_/L57wOuyj7JqOlIei_C/wH0V--

