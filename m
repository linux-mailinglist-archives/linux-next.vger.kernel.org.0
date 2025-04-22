Return-Path: <linux-next+bounces-6317-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB78A965DC
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 12:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6F997AD872
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 10:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57F9201262;
	Tue, 22 Apr 2025 10:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pgHMchKt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B954F20CCDA;
	Tue, 22 Apr 2025 10:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317524; cv=none; b=q9liKLHr7ERhGWf+06ApF1PM1vUNpvagQdxgh1tsn5/L50PeDwi/fSkEz1z0yjmZ8jDaLWSgNWncZN5z9NFj8cyya2vWO6gNbwrtY8TFdBWbGa1rPsOKrAtl+qnOr8cyHJXryDJ65n8i3ntfP3WEsYuWVImo/Mqd8JmGWCl8w4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317524; c=relaxed/simple;
	bh=5VjwBewgsMA8YlkWMLT7blnb88jiiXJudYGoZ/411yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=L1wYGyqIdLARE07L4mDCK+ZzP54ignYvWfhQDcOiK4M3MhlxKTp137JLg9L0Qcy6qevUAKXvv5M2QFEmkIYwZRFChjWagVdp3+4s4yjPw8zSTvfrZt8Q5fqLJOG/0OEy8DZeVgfZKBGPWlPKGL9mxx+Jffp6IbQviscDPSU6kdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pgHMchKt; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745317519;
	bh=wB/Ir2ZMz7S3y0buM0PVv9FIb5+lUQ7umgVqYMexXPM=;
	h=Date:From:To:Cc:Subject:From;
	b=pgHMchKtQWLvZAoDbUZLl09Evt2AwHipu10Kdm1Z5sjePb6wzg0nH73KMCPk+GJw9
	 H+Kfua20B6QFMQDZprnsIb79o1us2fnj0sriVokrOkq9HpNB9eGIX0MwJ+tBSt+pir
	 bV9qs5pGWPpOeIhVpvx7dAdyt4ltBE8FAlzz++wlS2Ln+aIMdebXCk4j5K01rB9S2b
	 LDSaqdHQY0TDSeqOhSe7HJa1Hpr/IcvGuB41suWspcSrnVTckjIOhQqPBo/qSRfiSB
	 ZBDe4mYgW19T2NE7rfT/4Xv+UFT4XLsNYW6hQ0APVziImiT9TQvrqUuB/LqcYGA0Dg
	 5YJ4MA8L6gA0g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhdfQ2RV3z4wcj;
	Tue, 22 Apr 2025 20:25:18 +1000 (AEST)
Date: Tue, 22 Apr 2025 20:25:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Chinner <david@fromorbit.com>, Carlos Maiolino <cem@kernel.org>,
 <linux-xfs@vger.kernel.org>
Cc: Hans Holmberg <Hans.Holmberg@wdc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the xfs tree
Message-ID: <20250422202517.4f224463@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4LlfqYE8s9cDthMW1Js_6QX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4LlfqYE8s9cDthMW1Js_6QX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xfs tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/admin-guide/xfs.rst:576: WARNING: duplicate label admin-guide=
/xfs:zoned filesystems, other instance in Documentation/admin-guide/xfs.rst=
 [autosectionlabel.admin-guide/xfs]

Introduced by commit

  c7b67ddc3c99 ("xfs: document zoned rt specifics in admin-guide")

--=20
Cheers,
Stephen Rothwell

--Sig_/4LlfqYE8s9cDthMW1Js_6QX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgHbo0ACgkQAVBC80lX
0GwKawf/dJJ5IWDWxeACkX2UFr27XwWl+QyJsFtgDsZ6elsjPRZN6LMQsf76lt/i
aj8xi2w2ILd9ZThkmvuR02uE8sgI5Ol0qb8g0K9JE3EKpGAa8VaOIvrjTigYcsLY
dwpGtISWNVHhCD3wHO/BOYKrikn3RQoxh4tUpBma2NJh5fpQZC1TZ2r7cm570lkG
mUPxesZudRcZB95VYAUCDlASh2RRgJ42K6Dn5xSlepZdnyqS6tvwJ4tZTOOoZoLd
pGNKAKIYHgRhPX/l3TxSWlYMlHEq4gQM3iVeGVe7Kp0+WnhPvq54vj48kxAP0gM7
MmcPrZXPtNeU6GYn7L/DAWh2v55s5Q==
=6JT1
-----END PGP SIGNATURE-----

--Sig_/4LlfqYE8s9cDthMW1Js_6QX--

