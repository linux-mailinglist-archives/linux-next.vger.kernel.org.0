Return-Path: <linux-next+bounces-2400-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1C58D1288
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 05:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FCB91C218B7
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 03:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66082BE5D;
	Tue, 28 May 2024 03:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="vC/9+0lI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B5F2114;
	Tue, 28 May 2024 03:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867060; cv=none; b=Sycjp3o7ViI1tnXK1xrMxlongD+br4yo4PNDxEWJDHymp4j7w2TedHB3mvS+UtDzMwHzpqkF7fs3JJ2TPEWQAryJKy85OpvkO6EPlpPDt9fqoIQJMJA6DVmIYh0nC0KWv4uisLT1VuVq8+Ce9irTt2U8BYYAL6Zgw0hX/ZwP7C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867060; c=relaxed/simple;
	bh=0cErUpOwlb8rVjHrNCakHFeK+eA5rg67h/iRt3DvsE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IfSWTJHCAM+J+fKxP8Ve+v8SXe5o4Dfq94SNlCEB2AcMM2vWSwpnamSdMRa/GDXeuAjcwTel63P9iHi6CIgFkWqrXzydYEZk+gTVs4nN1ujfLW5q9q0H2FRyBgQh3mVcD0b/r4Aa7xAIo9WEU8JgLenZfhDnWBc9Q3SiQlYeK08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=vC/9+0lI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716867053;
	bh=zzza5UAsg06OVjXI6HvWONiZmJCEySwTEEGXi1EwRlA=;
	h=Date:From:To:Cc:Subject:From;
	b=vC/9+0lICxNtnMJywgQGmjrtWzUItP9rAoh+TiNIr40iTacwK6UsZ4gDMxH0BoXnk
	 BT7IdJaFziQEyTrHgS8T5khnvPxPQnBtSTBsCxs+Bp3IDPsPNGzXhQsajXlu/3hL5B
	 oe1aE5/2LY9ZEwy/XSc1GZ9yOE3pd18jKIeq1T7OHkVHLtIkXAvRkAoyPAYzKeLV/A
	 0f8BuPZnCgfz9qJ56W9bb93mISS00jnlMcsfrLqT6YBcV+RtXGyYSrTfYUDH1ggWOL
	 vvB5k1irBfERp4CbW/okaMaQEJNZuvcqgKov9kmkc9a1oCKk909wrIeEjZ6jLn5KXK
	 MGyP135N9TF+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VpJ252rGHz4wyw;
	Tue, 28 May 2024 13:30:53 +1000 (AEST)
Date: Tue, 28 May 2024 13:30:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Howells <dhowells@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings in Linus' tree
Message-ID: <20240528133050.7e09d78e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n922FnVTw.q6i2LXbO5pccs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/n922FnVTw.q6i2LXbO5pccs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Building Linus' tree, today's linux-next build (htmldocs) produced
these warnings:

include/linux/netfs.h:532: warning: Function parameter or struct member 'in=
ode' not described in 'netfs_wait_for_outstanding_io'
include/linux/netfs.h:532: warning: Excess function parameter 'ctx' descrip=
tion in 'netfs_wait_for_outstanding_io'

Introduced by commit

  f89ea63f1c65 ("netfs, 9p: Fix race between umount and async request compl=
etion")

--=20
Cheers,
Stephen Rothwell

--Sig_/n922FnVTw.q6i2LXbO5pccs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZVT+oACgkQAVBC80lX
0GyZ0wf+MZigcryWHpRS02zlCOMp6anVxlCXGrmSZQEutNzvLJNedTiolJGxw9HG
0ETrjaxE/mR82W5pyJDOv4XbZAxavBQOJ4MI+PcF1tpAFzMOwvO0RI+7yn1veKkZ
rwYQkd925sz8xQHEkQOS0ep/SbnmL2G68QhKleQpqRBYmCyyfmUnSpGozpHxX63L
M0GKBx4zE0ILcgqcddj5h1d+rlV8Bup21HgdZyqdPSF0twrTYPUGgSamC8DIxeZj
VEwZMw5aqUSBTnEqhsAg4t3rFFpLGMlUJKDyJHjC5x45fM8qiZiRidUB1KwGBbnW
46wGzryeFqmLNLOhnrYs58mLTBVzng==
=WKWT
-----END PGP SIGNATURE-----

--Sig_/n922FnVTw.q6i2LXbO5pccs--

