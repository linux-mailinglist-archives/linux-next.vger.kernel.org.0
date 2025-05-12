Return-Path: <linux-next+bounces-6711-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B75AB47A3
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 00:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0997D3BF8BB
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 22:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B724298CBD;
	Mon, 12 May 2025 22:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YYZayiOq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2891DDC37;
	Mon, 12 May 2025 22:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747090261; cv=none; b=HGm4HfxlwqxQR8NdiLMsyQytjsiLQmXvvmgsPcB5TVdDBS84wb0tcACu+y7JAt2hBPson67UDdZ/ImM/6z7rFeg4C7Gs+jLiN7lb0bcz5EP6Tuy1U5/BVDmm3F4RmY726HcVqTu1MEKpvWtT4XDmsLuwSISUGXTe9IB1+MqdmLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747090261; c=relaxed/simple;
	bh=ga5i23lTWGeYgIe9VXerdC4dZkkyn3lgO93zG2MGRV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=d2CQVtSae0KXQTu+QSPrGhXznyXh2jt09/x5zdG7/y2dy9nnXqR1tuMEg7aBzxCYgy6Z40OG7ZCaB2T0qdhDq9bGV4EW084l5R4UL6t/6mpyluWJAdbm9T+aTzTNVkw7O/RA5P7QvWMSKjXlulC3CKSc0G5oIiHC3kjIEcMulHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YYZayiOq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747090245;
	bh=hf7Vc7Em4Px5+sjgfunJsGJzygq1BzsCWjkN+LWO8mY=;
	h=Date:From:To:Cc:Subject:From;
	b=YYZayiOqHnX7DDQ9pt1hpRPS9Y6cX2Rr+TBni68GfjZiUsXFAf7S47kKK/YESrJFc
	 ZDiizGAe21yVR56wfcWOKEOKEuPoAJMMZJt+K+snkYOofcYKyUkD5dEYHXk30h5koU
	 COzt74GCNXIY4cqh0ssRJovEtD7FlkH+0HqM+zKeWwQfm4XkpnJuEXx3V1z08RgD9s
	 cRopq+3oE/LYnl9LE0VYV9HxZOEYxZVPbCIcqbXyeYdh7FzbWIHjj6RfNIBHiV+bVB
	 djEhYiAkW9xyPvIDleCsg49YRKa1ejnnwnqQYkY8bgU53SKsIBJRXHj6U6oFWDgK0k
	 /LLHiEOx3jotg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxFFK59s3z4wd0;
	Tue, 13 May 2025 08:50:45 +1000 (AEST)
Date: Tue, 13 May 2025 08:50:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs tree
Message-ID: <20250513085045.7fa2582f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EWRb4S9=OeWhGwrJfhuJ/t2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EWRb4S9=OeWhGwrJfhuJ/t2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the btrfs-fixes tree as different
commits (but the same patches):

  6f9a31ac4691 ("btrfs: add back warning for mount option commit values exc=
eeding 300")
  bc60fabc3f6a ("btrfs: fix folio leak in submit_one_async_extent()")
  a9f5440815ce ("btrfs: fix discard worker infinite loop after disabling di=
scard")

These are commits

  4ce2affc6ef9 ("btrfs: add back warning for mount option commit values exc=
eeding 300")
  a0fd1c609863 ("btrfs: fix folio leak in submit_one_async_extent()")
  54db6d1bdd71 ("btrfs: fix discard worker infinite loop after disabling di=
scard")

in the btrfs-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/EWRb4S9=OeWhGwrJfhuJ/t2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgie0UACgkQAVBC80lX
0Gzk5Qf/dBiZ2nG/Ekxl/39aCodye65bZiHZUmqfYpmtuMs7EwFxnYwgWM/kO23R
xncqTbbHLVFuiCt8il8CHQtOObacemhGPnx9peJSiKIsQxX4LE7mQ2hQ7k4p+5NW
Y8zJQDZy121ApOrfNB7sFldYtGKduwGTZZ3gjW2hc8oqpMpY7viXH3mVjJ78PlkH
dBbY0XRvGm2wahYruuc8XhhCk4a8KBCx3xMFz/y7TaTyPKLgu/pUWevAU5gZEwty
o+MlMdVHEMcbNu/b8/WaP+xK13nv1boznHX3Jp3UEtYRbpeZ/jnpcgHFc/UcjCAe
Xx3Ma/A8KTGQWsuV3iXYKnWPKGPi9A==
=s7a6
-----END PGP SIGNATURE-----

--Sig_/EWRb4S9=OeWhGwrJfhuJ/t2--

