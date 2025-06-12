Return-Path: <linux-next+bounces-7141-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFE6AD6623
	for <lists+linux-next@lfdr.de>; Thu, 12 Jun 2025 05:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93A6E1739C9
	for <lists+linux-next@lfdr.de>; Thu, 12 Jun 2025 03:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD271DA60D;
	Thu, 12 Jun 2025 03:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZVMGi3f1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3316A10957;
	Thu, 12 Jun 2025 03:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749698810; cv=none; b=qk4fzX7VqSrUrDR0Jlr9h3uWV5fBHL1UrLvN6tPifDjcxWIYCVWBf3qdLtjzubvesgKSMAymFNxQ+/mpKZ+ri2b3B0OZ3DLiK/3Q6IwV13d+bkxTneB+HaYHJz6a4I4gjOw1rPPItw6LQLpWZ6ps32FgNYD5ao/RS0kfDOlvz24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749698810; c=relaxed/simple;
	bh=fMSjX1XneikPjeYMLuohvrYv1PB55ij71zTFtcYndz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TnfKZi3iynMjJBepxipEsx4i2jd/gTAak5r5syknEoz4Kr1QGJIfRbNUwl5S4ANxqxFRk2r01n752rDb+dg5YMj0ShQieoorWCkvXVN43m1qvingN2QIWuCXxwP/wz/sgtAb/ydrrRKfCw3r5C6GdWS6eWitYgHzBDDsS6bRspU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZVMGi3f1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749698801;
	bh=pvm9Ym0WC6I6HYqTJLkuD9MN4dqMu1pJN8zQYxlhxfY=;
	h=Date:From:To:Cc:Subject:From;
	b=ZVMGi3f19E29S9UkDCpq+aNJmInzjQeVNVSB6+J6qusGN+OG49M763mwPKN/5h80v
	 Vb8Ya5wPcaKBS0koZ+6YTrQMdyOSpbFQttJuAQ0JEZiNjKF6kn4tyb10KXxXQyPFIt
	 dan3ABUJBstXbTPj5k3yCYveDeYHrgkh9egGOSJtlD9P5wmAzV4fWu5nCCaflNRZLB
	 S/j8Y4hW0j7V+iSMkuBWhc2w+ako5GJ0Tg1//kaTBxJdJQrES5WUFdBtr+IKQNSLyk
	 qPcLN1ef76wazOTFrMtaWJp1AVhmgC/wWJxteFcnkZ5ExcjAkOAlW4iJskntXQRjDm
	 tgARjpQziz1Ag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bHnxr6d1Zz4wb0;
	Thu, 12 Jun 2025 13:26:40 +1000 (AEST)
Date: Thu, 12 Jun 2025 13:26:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20250612132638.193de386@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/v+PwzsKkNWXLMa5eE9UzOH3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/v+PwzsKkNWXLMa5eE9UzOH3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/block/ublk.rst:414: ERROR: Unexpected indentation. [docutils]

Introduced by commit

  ff20c516485e ("ublk: document auto buffer registration(UBLK_F_AUTO_BUF_RE=
G)")

--=20
Cheers,
Stephen Rothwell

--Sig_/v+PwzsKkNWXLMa5eE9UzOH3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhKSO4ACgkQAVBC80lX
0Gwtawf+I9DCdPfuQaou1Z7CSgXKwO9gG16PetdWs+YVM/aL1iWzzximELR9fUyg
F4hCdJKGteAmqEwIcbL2LED/CPedHwNyym5Prtc+JzzaAU5lf9YcdnnfTFAhBAbw
ZaExTn46+TE0t3VmoW0CqkDoXX6K3vslarj8hf/t37m7q8skUzjyUobpUmbKoMm9
f1/3HI1jTmOzv2cd4csEIwD+s21RLus9WPxVBdku3LhtGgYWfr6O/x2ki/QCbvfV
9FLU5ihVkcjPh9x7mhUovHMIOzK3qkvK7qI1cwy1V0g8X2Ow42zAQFAqBSiv30DU
QqmjQYAqrAplDqbyC1Wkpnc3SZZa9w==
=ysv2
-----END PGP SIGNATURE-----

--Sig_/v+PwzsKkNWXLMa5eE9UzOH3--

