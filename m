Return-Path: <linux-next+bounces-6407-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CB8A9EA52
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 10:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B86C1666C8
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 08:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E35421C18E;
	Mon, 28 Apr 2025 08:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hNTJniPR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7F525D1F0;
	Mon, 28 Apr 2025 08:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745827733; cv=none; b=Muiht62Zb2NoNxkBish8avG5MApB+imaVEsBBGtUXWMxqYWf3P/bxX8aDuH+YXZBUsVCMZvcFi3J7Ld0e9pN0B+zLCBd13+E++15RV4OBc2GQnaB/IuYq6wWnYC0/aWG87kfmpXJ2+YQWH8du4aPPEENoZpTo+SWZaAerM2KDhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745827733; c=relaxed/simple;
	bh=9dJD1kfcDp74fb2u2rSIT1WtOdxROPcPGxIZfBF2KkA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P47Oj5hWe8Nfaj4w+4cOxvqhIQ25nnyPiTk3HuKzVqyjKNA95qvUaKD4s79b6d95YYOo7KhQ0PHYF3O11RAorhlZ3ic8R5iPu4ZNTx+onddm5fX3xsVhtOxpR8NHLRfcsx+2q3XXdxQWZQmx5obyp6WCCNFN83xqBIrhS40w8CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hNTJniPR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745827727;
	bh=uMYjoKTqTAsrvsdmx9JvrVMqXMtLshLTMIIPGCH9ycE=;
	h=Date:From:To:Cc:Subject:From;
	b=hNTJniPRNzNyhHEXVCAhR7T+5M7Oizn++wl0fNc+FVaxrKNn63L3ncvAEYB0fBAIk
	 qEBXHrU5FyGAP6UMT5rlbd/yL6FRBlvfVJPc7nUwU+BLC4V5nHPalqBni++uFsu4BE
	 KBkjONyxCCiIZOVqwc9WVbbKdg2CxMWxnNR8H12jztSyW3QOV7PleNJph+qMMR2S2L
	 xuE7OEyfAmvpM2k/iuQcQkhEFO53dsUn20vTcWwBEsanFURCnL47cRrOnVXxKn2zFn
	 ebOvLUm0uQa7Ha7RsPccRzOI1pIOLj2zuyq3dW2rKVQCYktZV1B0wGJA59fbtQV0wS
	 kdlI1W+6LZZ4g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZmGL748Ntz4wbc;
	Mon, 28 Apr 2025 18:08:46 +1000 (AEST)
Date: Mon, 28 Apr 2025 18:08:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Boqun
 Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the paulmck tree
Message-ID: <20250428175438.0209858e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N_Wt==fayysKQyN4rTjekpR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/N_Wt==fayysKQyN4rTjekpR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the rcu tree as a different commit
(but the same patch):

  5c9e0062989e ("tools/memory-model/Documentation: Fix SRCU section in expl=
anation.txt")

This is commit

  8e40035aab95 ("tools/memory-model/Documentation: Fix SRCU section in expl=
anation.txt")

in the rcu tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/N_Wt==fayysKQyN4rTjekpR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgPN44ACgkQAVBC80lX
0GwC0Af/Q/VcDJA4oIb6f3eMfswy/kD88rWdknuG5Co6J3V9J/id7HRGn7rQ8Z6n
YY4eSMKJz2YHLWBVTn7A7u+RCvvHkNj/Ei4EL9Ka1zlAuFn0urO+2mZWNTpDdvbU
l15UCk7KRWBIpiHnBqtY5hktfb6k0RWXefcEmo5gVkyLaY8BspSACJaQem3IyuN9
B8nWb2IOENi+gC/WZfKZMlMCCEhlfwE5XRvFWpwzFBRtVMSzFgS7gucbqzGS5Kcc
5Mp0E7UkhwPc4RyOGfawIWJoxo6DneRpVhXZvdnzyYJVTtS/mxaXFZY2FSSnYJ91
xsk9l1tjI74RJWQes9qOMZS7xXELWA==
=TakA
-----END PGP SIGNATURE-----

--Sig_/N_Wt==fayysKQyN4rTjekpR--

