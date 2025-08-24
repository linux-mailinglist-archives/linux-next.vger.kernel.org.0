Return-Path: <linux-next+bounces-8083-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDC6B32E79
	for <lists+linux-next@lfdr.de>; Sun, 24 Aug 2025 10:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FED4441F01
	for <lists+linux-next@lfdr.de>; Sun, 24 Aug 2025 08:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831FA25B66A;
	Sun, 24 Aug 2025 08:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Cm1THmRD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1A725A62E;
	Sun, 24 Aug 2025 08:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756025450; cv=none; b=tImldpCIrmbJANCeM34whltHFqwBIFBMqQqAoQrPOVKstlzmYl4z6EBo5lGSCAOk3rO9sRjuI1ud7w7QSv6OxMZe9xtz6OIiefgq1jGP7vLfO4ISLyDMj0eu13pNE5PXNY2pQ5lg6C8Mrl/HpDnweKRQ52INd0B1V8aWQqXozAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756025450; c=relaxed/simple;
	bh=CkpYjhYzT2/KWwF0TVr2HosUh23kpgls4zjQskCPgbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TjH4Dy4WX6IVc/5Jqau6YmAISc7djB1qzbnBW/iZhCRQQl6tLJHXe4cuAzfTvU46aanddkFf2YjBfsU14AFqrzf+vOTAkTXbM0xcgU+oB3Yg6pxHUXH4HJj07qOAtAlKwMQaQDa2I7FLv+7WnXPyVtvvSaeI+iRMKNp9haLW0kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Cm1THmRD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756025446;
	bh=ILGgzuvMnXWxsBogs87qNd4kdFS07ZSKw09BdW0woKQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Cm1THmRDlTl2lu+6ZqFyjrFLBeTjVUCgV5NACfBGXDQwZEhJmPsi0KTXQPNcYGoXZ
	 vAekHXu3p5tRp86sJB6Chz8ziQ9nhHwV+KKKlDrV1TcPG/RH7w7TIECPyAQq2neQsd
	 u2JA0iJAgeysTM3yydJb597AFWr0JDPdrVTWxn6poOtruiDhYbDGvhmCU7UNMr6BHa
	 RBSTMIkO9u54tHUw2PLyHlDc4f+Hr8n50icSD8oFa3JEdZOIuBHPDSEd/wbXM0Zqe4
	 liCxRG7Hbm9t1m79fU49rRDP0n/xzJghu11wSWe4wwOs9FcqIojHare1LBtw1t84h7
	 GcW7F/20FlMSw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c8nh62PZVz4w23;
	Sun, 24 Aug 2025 18:50:46 +1000 (AEST)
Date: Sun, 24 Aug 2025 18:50:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Boqun
 Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20250824185045.43623e9f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2lUXkKkl_qd3S0hKCdzSU+s";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2lUXkKkl_qd3S0hKCdzSU+s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  e5ae44cfd65e ("rculist: move list_for_each_rcu() to where it belongs")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/2lUXkKkl_qd3S0hKCdzSU+s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiq0mUACgkQAVBC80lX
0Gx5aAf/WvaC30d89PP/Q2qgwid3cMrcWmJymm6u08UdY5EBnsEqeWnoj2ajquUK
Ne2EFZJFo0nEcQBdSNs61Zsqv05Ikf/tAa9cQOqTojarEHfQZ6I7Ntm2NVnJkyLc
VBHqX9flf0OAViyOy0vyGf0hlyaFHAdAxZgqaolhAzfP0Rr6Q6NGhpX4OeBH+3TR
6tVQ0sF53UEZxkUKlr9g9GCVDNkDXi+oN4ddjnNBlcg4DG6kA96jtH3zPvFRU2zy
65LfYfuhwnbTgXqO3O9bSMRGQ81RJ6Omo9hNCL/d0s3yBUpq735KZFs13zmyTs4N
X47xlQb5rRXcQND7+GBdxI9LZBbCDQ==
=8BUZ
-----END PGP SIGNATURE-----

--Sig_/2lUXkKkl_qd3S0hKCdzSU+s--

