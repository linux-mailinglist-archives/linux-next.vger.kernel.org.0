Return-Path: <linux-next+bounces-9520-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B924BCF1595
	for <lists+linux-next@lfdr.de>; Sun, 04 Jan 2026 22:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8365E300A375
	for <lists+linux-next@lfdr.de>; Sun,  4 Jan 2026 21:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F792F0C76;
	Sun,  4 Jan 2026 21:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XA+3Y8rC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7471D231A23;
	Sun,  4 Jan 2026 21:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767562752; cv=none; b=co1CaFhoDqFKlc26eel7Znz0eHn7nnt5c7QfftAdF7pfYel2rFdM594lsc5GLxbmWqEO6UghjtLRf56hZwkxZEc7faLcFA85pAX5OZt6ZjmxEOzEccqlgGsD8U7far6RZ+79CjW472NidJbLOevhKsheHnyn8AQ9PYYrZ6mGV0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767562752; c=relaxed/simple;
	bh=dq+weYe5LDkkWoH2TsszKVLvHZSJxQVV0CrJ3u9qxFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Mw2v3Sj1WzIC1clp+G1yyU/05iB8rQxa5yYApk25xE0DcK0hBM/IYJVC2Xjxl8EcM+TWHy26Pg0A11If3jhGBVKS0mPAsuNipcYTmWfhYXp26c97DF+XIvTnNf0kSercLM5Vuxy2hWQc40W8+V/ixjroqkT7e6HgxkAV4DqFW4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XA+3Y8rC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767562742;
	bh=Q1AZ/5uwNiANcLyA3B9Agkf6M2NQzVqHbl3MGuibDr8=;
	h=Date:From:To:Cc:Subject:From;
	b=XA+3Y8rChC5iBgOgoBvNgW0ZoEQMXT681VgjRGWZx7YNtRWcN/1WeE23jjQLpM5Kj
	 C7uh/GDNjSzfk9cc1Euf4X/cLjA91Fy7xX7LxJ32NumudBqr1/wB+/t9ko1uT/2iXI
	 qXTWIOnIaXKvL2gO1TYs9xnH1hc3jBalESqwj4LCitG6hPUQ2etUWnpglQRdnI6Eu1
	 FRVZgy4KXRmh9LdDMwit+WdswBs+FJi1KamHfNRMQywVAyguC4V/K3Jq1W2bT9pNq/
	 ip7eRE1yihYt05dNXHCOH03VXMefO/CVVREuuTyfq3WHU9jEJoOkDGBvrNtQgbxsSO
	 4lHTYjW/doT/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dkrRB454Dz4w0Q;
	Mon, 05 Jan 2026 08:39:02 +1100 (AEDT)
Date: Mon, 5 Jan 2026 08:38:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Li Wang <liwang@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the mm-unstable
 tree
Message-ID: <20260105083851.19677121@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/871mehOlLeUV+nH.UTRqRxS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/871mehOlLeUV+nH.UTRqRxS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  8bd5f5187a2f ("selftests/mm/charge_reserved_hugetlb.sh: add waits with ti=
meout helper")
  378d74dfdea6 ("selftests/mm/charge_reserved_hugetlb: drop mount size for =
hugetlbfs")
  99f5e30c38ac ("selftests/mm/write_to_hugetlbfs: parse -s as size_t")

are missing a Signed-off-by from their author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/871mehOlLeUV+nH.UTRqRxS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmla3esACgkQAVBC80lX
0GywHgf+N/85O8jzq5ZqADRfPFXbc8bZG6wndLPN1os+2hEcoWASFHWUeIQUFyd4
pZsLbdLDO8CK820bsZHTbdt439L+4Fl4uDKFYLTUBRbSlzwDKjl5dcoYUMJ6TzaQ
GmubsgVtyJ5obpeLdZoLMG2A4K0/2sggEpahdI7py8aohVfnT3WFjg7c0p209YG/
0YEJ+AjLnYNJKNZkutwH4zMgwOpfGWchNDr4bI/X1Qm6KrjRfRvMe7UflgQUOxm2
9SqYUubg7c4G9KiVStTgby+iz3MF6JiR3ZVcSTuVZ6JCYU2pe9d/2E43iOCI3e47
/JTKJtzxkT7PErp8/l5L1vya0+yP0A==
=YSJn
-----END PGP SIGNATURE-----

--Sig_/871mehOlLeUV+nH.UTRqRxS--

