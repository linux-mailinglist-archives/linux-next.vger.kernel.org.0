Return-Path: <linux-next+bounces-9385-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46525CB410E
	for <lists+linux-next@lfdr.de>; Wed, 10 Dec 2025 22:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5366730652D2
	for <lists+linux-next@lfdr.de>; Wed, 10 Dec 2025 21:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372E3223DFB;
	Wed, 10 Dec 2025 21:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VlWV7LnT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2091C860C;
	Wed, 10 Dec 2025 21:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765402348; cv=none; b=uRLqy3hrcKe87NMZzUqq2oOw1ojbQ8U7HV5NyDkbnSfbhLr4ErQ/9NhFE861mXOEXyceis9VDrECMeNM8beMWTGcvm0M7LViq+ZJHrpokilLeB3l5em7VpUBK//m5zBfOnGGMmSeHX08cC13YRXocxwDmO+fcJYgL4m6pW9pXdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765402348; c=relaxed/simple;
	bh=jdFg0Ik98LkEqTdf3Il//2Gm+rNjnnfYpKY0IvRsU+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bIQzdd99Af+I51duUhh4PAeCNHHRI0GCmaVIKIzSoRFg0BLO37iCc2OerP9hBwq91mrG70VZ/JVpAepRzjRH2qVCesh9DCa9MzExNsjM/dABTQwZCSA7aEwiu1bUktCeSULQRuG7IqVFMzBqqvVJQN+phTUy2COtlthhgYtfzjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VlWV7LnT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765402340;
	bh=gp6MdaKnhZJVJLKVVavOT13cmK3pQiaZSAqmeqYleR8=;
	h=Date:From:To:Cc:Subject:From;
	b=VlWV7LnTmSa95hs/jeWzl6w32gwmWLjXImkRq54t7O8MSqt3S4X/p1tkoKML4GrM+
	 8bUfDEYHOTkCzchCCat6rcT+XJxE+javvR0nmpCi51dqu26LpnHjvNrwiiI/MtCfga
	 jiN7u6npnPHWtHQzCjO5sWznYw5HGbQ1tC5MjGsm9RYNsYADuMEVp7s2GQEgTD4i2s
	 3nDXzgXhf0WnlV7TUebWNhhAwkUd3BkGnspSBJEI6i6y3zQPOKxnzParjCxfZ5VULY
	 fdVf7XkniUsVamowDUY3CwmSZBe8cZdIi/qjgS+wsT1jnIqq+bfCfoJB8QncQbDdh1
	 R5LTQk1usfQ0A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dRTT00dHQz4wBJ;
	Thu, 11 Dec 2025 08:32:20 +1100 (AEDT)
Date: Thu, 11 Dec 2025 08:32:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mailbox tree
Message-ID: <20251211083219.654b645c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5xF=f8qcy4BAvyL2Myqi7_/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5xF=f8qcy4BAvyL2Myqi7_/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  c6d0fb270501 ("dt-bindings: mailbox: Convert apm,xgene-slimpro-mbox to DT=
 schema")

This is commit

  ce1e204a51a0 ("dt-bindings: mailbox: Convert apm,xgene-slimpro-mbox to DT=
 schema")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/5xF=f8qcy4BAvyL2Myqi7_/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmk55uMACgkQAVBC80lX
0Gx3cwf/e0l/DTJM3+7evgtvWF9I6m1ihlGeM7RFbO/XBF4C9I235zfWyw4DsFro
7J/bZp1V4Ln5TZZ5A8D/JbHuwIPZqGkeeXHzpBSiHvVNK9586SbPhk5xh74WMPbD
FTtVfOP+A7SHY1ureIaGo07YqVsNQAv+1n/TRNbsqp/gtvpT13aC/DmUUaZQPJ+F
KP7nlBLM60PFiXl/VjBJd5B2TlDclzgd1RCUnRBPmXz33pd7UBpE2qyPlNQc6bMp
gNkbjqeUjZhqqkxqM8HxAn9QnfWaPxBmX/50+whpuAzh2LFvd/9AlkMU+T5VBD+s
Z7LT3SKvQAtSKi9HVC0PV34FOpl5Hw==
=LRfM
-----END PGP SIGNATURE-----

--Sig_/5xF=f8qcy4BAvyL2Myqi7_/--

