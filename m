Return-Path: <linux-next+bounces-7961-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3E5B295A1
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 01:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B9611965F23
	for <lists+linux-next@lfdr.de>; Sun, 17 Aug 2025 23:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47FB8195811;
	Sun, 17 Aug 2025 23:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RZJ/0T4F"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AFA1519A6;
	Sun, 17 Aug 2025 23:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755471997; cv=none; b=CRSOxMqcpEaiA/flQP3kM8bAjUqRTKJp+aDYG1bpRxFRWbc8DnsAs1pzFk+09qdZd3KBjK5UIAAV3uCPHcLjcha441Kf+Nyh8UZi3co1CGKkud/sPRS+Dj+6WukNwnJA2LAEAB04EhlCW49SZnVt8ara6gbAEhG2Vs87XQbafso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755471997; c=relaxed/simple;
	bh=7dRZXRUA+ERZ6EDT7l0nmUaUUMlj8FXAHo3ZJTiVSbU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jCgE1lumn/UNvsrII5AYRXPTPGFTzUjscqf2XhIe0G7BpQX7rBs7ODvGMGVnJQRx40+hVgpDYP6sma4LBwqNf4ATtKAwU78DVdVI0pofwB9DWCrd1GY/5TiLsUGgo6LA1WzHqmqplFLtLZAKbiR7sG8i91YkvI02vc0olYS1AWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RZJ/0T4F; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755471990;
	bh=qMDqp+T1AbP/tr1Z5Mq/XQmY+lkNmg5sov/qnZcDLvo=;
	h=Date:From:To:Cc:Subject:From;
	b=RZJ/0T4FH5X/gGnfOsFUC2HS38RnkXnvDDv3csB3nOiXo0A1Jf+P3BlaE9Ka+4/MI
	 +n0LCoM+UguIVAZjinjeVzUUdK3qjdVLHhfISeZlsNElpLyI6o+06zvvDgTLgA/8ep
	 2xrwYsxktUEcHcQK2/L9vwQH0dXjvmigpJCBd5HJ4xZtqdWxzl5yKKdwKmo7ixJKeL
	 egOv3BwFaqHuAJwmoB5/pDlvAQWEv8rG21yL0Kdpu5BUk6Hqfs8vvW23eU7Q9C8lal
	 IEKhTJUWPYvQCo9qv/ntLQeNyLUA4hlAZuJSppp8oQCbx816ukqm4QIGNtQoNb867M
	 xZi15pnunmxww==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c4s0k10Rdz4wbr;
	Mon, 18 Aug 2025 09:06:30 +1000 (AEST)
Date: Mon, 18 Aug 2025 09:05:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Pankaj Raghav <p.raghav@samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20250818090559.3643eabd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S5lRRFUQlz/_LAXHBm9Z3vn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/S5lRRFUQlz/_LAXHBm9Z3vn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/iomap/direct-io.c: In function 'iomap_dio_zero':
fs/iomap/direct-io.c:281:36: error: implicit declaration of function 'large=
st_zero_folio'; did you mean 'is_zero_folio'? [-Wimplicit-function-declarat=
ion]
  281 |         struct folio *zero_folio =3D largest_zero_folio();
      |                                    ^~~~~~~~~~~~~~~~~~
      |                                    is_zero_folio

Caused by commit

  5589673e8d8d ("iomap: use largest_zero_folio() in iomap_dio_zero()")

I have used the vfs-brauner tree from next-20250815 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/S5lRRFUQlz/_LAXHBm9Z3vn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiiYFcACgkQAVBC80lX
0GwgjwgAojdRQmj7z9Pq3+fLfNppAA0O9QsLJ7e5iZFw9pzft8jwxfTtvGFl/y+/
mBw/ENGOK3t0jKm8c4pelFh2laHAGq6p1sMlytELqY+slXN7G9O5EEgohyVS7Xiq
eIUQNv/opqrWmktgDCsX/1zXGkqW6wPKGNGH1BQf69GIEUdZx3MRkp4J1b7gePlW
Q3A3JEMXOYWnQM80sfYmUyPUeEYBSKF7C/rB9NKvmFe2dHUazmEJ9QxnsZZo1vFr
OAn5kk1c8Kbe3FTDxbLwiOEIGyww1EsF+eg9JuAXYymwa8/zRukKdu2jUD1zMBZy
xfclkf5KPPaK+rG0ERSusBBfzBYigQ==
=BJgx
-----END PGP SIGNATURE-----

--Sig_/S5lRRFUQlz/_LAXHBm9Z3vn--

