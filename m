Return-Path: <linux-next+bounces-9554-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1765ECF6A61
	for <lists+linux-next@lfdr.de>; Tue, 06 Jan 2026 05:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90AFD3019278
	for <lists+linux-next@lfdr.de>; Tue,  6 Jan 2026 04:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188E0208D0;
	Tue,  6 Jan 2026 04:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Tpwn9ABE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E3A1F19A;
	Tue,  6 Jan 2026 04:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767673014; cv=none; b=g9187+4pXJUTHEhNXShZpSJrHcL/AC93qTWyBTrNsTEnv5EJCbJxFQ0eAfOwCHc4Sny3gd+Xs8PaFFmmdh4WrR70uhH5pqRvETnNEG+TLEY68ixvywhLbTv43UHm3mONvdDq4M5aWECe+qGPJjRYkqHzR5g9jsyZNmKsPLFyPMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767673014; c=relaxed/simple;
	bh=3CGF3nPTfMacqk//Vpndev5ZDb28mxnfh8+2gvlHyfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=a3VTcXqemjd+xjXxWpbWSvKzjb1BJOwfF4yZfqPugrYi+rq/gVH1Qv6yH0IKEDoZj/tvHXa+hFPhgke9FNUZLHpJLVYvtCfX2HX42cYABIqM3neCB6ulTTfuIYPNgOFdGoNuZsrdEQxQ46MK4MfdocoAoIfMGvYfsxrAsafZn8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Tpwn9ABE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767673004;
	bh=Yo4cFAiDeE/+CtVcCbcUk/NzrQQoQighUIsvOV0eSXs=;
	h=Date:From:To:Cc:Subject:From;
	b=Tpwn9ABEU6mu11rSyqrCIU76SoLC93E/t9bHabhDkMmC7AqEDIKGhmRfxK0J3Z9+e
	 LCuuK8RSLXtv+Hs0knVZvEkIXVtXKYKTz1xu92neMqfCw9U9u7fGD+C7n6LoFP1xHC
	 3B4IBQhMO/BQusOWrGQWO9nB9kg6iKgvZsVq1qkRx+w7Ihio7eoWkn0ocLx4CJXmQ8
	 CeazDSluU1WA+q2kt9uBeiDae3VFdw76XWaGyqqgmtLxb13nejnYjddCAYSIFrpx+3
	 fnDs/i5UnIiz+ALAyC652S9R3Ijk1Ecxy0q5+5fLh2NqRLL7Q8jJzO/HJ+vDjs2v7k
	 7NnAeZbik4JGw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dldCc0kWyz4w9T;
	Tue, 06 Jan 2026 15:16:44 +1100 (AEDT)
Date: Tue, 6 Jan 2026 15:16:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dipen Patel <dipenp@nvidia.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the hte tree
Message-ID: <20260106151643.4179e844@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8B7dThTTzddEnNWoG5=1Hn9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8B7dThTTzddEnNWoG5=1Hn9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  d8322a671df2 ("hte: tegra194: remove Kconfig dependency on Tegra194 SoC")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/8B7dThTTzddEnNWoG5=1Hn9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlcjKsACgkQAVBC80lX
0GwrCgf+MeSbLWDkQ5yoAI0VhMadyI971Ey+Xo5pqFSWWvvpsVQBnMQKGEsrj0+2
pWqVBjnvZvTfVwtuIM5+GogOjSZ71yTjc4O26sOedygilOwWrJkvQjky7lMRvFBY
e2STySMWM2jzzqNnlgEeda9JxC+xfrRJTnAv5NdayIK1t0N1du8zZxKJpNAOROIx
6cPJl6iciFRkznCWhVrIngYYQ9uAlrrElqYsn88d/9wtk06ltp1O90e6llRzj9Ki
d3MCjK9htOjVlnm77VSKRLEp58iZ2ceKZORUIqQTcNhxuYzjjFV7mNaPuQXAUz48
5x7CuGqWzDHLGA6VY8ThgL2Q14KG2Q==
=jL6R
-----END PGP SIGNATURE-----

--Sig_/8B7dThTTzddEnNWoG5=1Hn9--

