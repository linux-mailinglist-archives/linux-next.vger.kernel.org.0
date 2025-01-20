Return-Path: <linux-next+bounces-5254-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CACB5A16495
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 01:23:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 687641884B4B
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 00:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8F4137E;
	Mon, 20 Jan 2025 00:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="udo06uK2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C626610E9;
	Mon, 20 Jan 2025 00:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737332613; cv=none; b=A6TrjDXygC7/t6YDeSmigyMDkuIwGkPNeOXeBItQUqipRjhcHQ+/kCOhhwHrQH+rAJGqe1Oh8AT1smSbGw+oz6cKxnyxbCdySLXT6Ey+pk2wRsZvw80o77wfK/APqvRtkFzUlY6iL51YipUA9C8JrTWVrpUC74BJ7M/HBluR5v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737332613; c=relaxed/simple;
	bh=rphUA26ZmBPazXZF/K9An5U6oNFtN8lHaT91UxpaATQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hRlPbLmCHj8qeJQNhkfbFxx2j3gfABGLP72CRYvh4NolytpIAonyXxF+FU9G3wXBsKEDs9FcYB6hmZWY1t5gyEGrA4iEsRx9bWHqsmSqSZRu95X2rVvnMw3ohTaEszFP4dMyJisqFK/J8ptqkCfPgVCni1PfOh6yAol3Y4K5b1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=udo06uK2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737332600;
	bh=rphUA26ZmBPazXZF/K9An5U6oNFtN8lHaT91UxpaATQ=;
	h=Date:From:To:Cc:Subject:From;
	b=udo06uK22HfFAtdzA+9CC05oq0Mvx+O+DyY1qcMQfsUJxPSIt29B64yWF5izTdRjY
	 awGMD8nKbgjdeOg3P8bDlyrqy+//afbaVVUf/GRSGBIgIER3ED8pH61tGj7hoOgV0W
	 AwyAtxjrCIIvgexz+lg47ejRz0+Fka0Ay/ippZQbHDsQv7cyL3/XdqB7Qo0+SqAHsL
	 DNWurDYmSM+SHyn06p0BRrbbCjsggQ1tHWyykj6vRgH+ytXgSSeGvYXHHoaW3soeTw
	 cZdoFwjRQudlAtk7vziahOKisVf49w6sGAGIX06ra3gwkrd6F47yhDLnahfsEFpdND
	 ampy6ciYG/42Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YbrfJ09Bhz4wxx;
	Mon, 20 Jan 2025 11:23:19 +1100 (AEDT)
Date: Mon, 20 Jan 2025 11:23:27 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: the merge window is open
Message-ID: <20250120112327.1fb726c2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0f9gx75Ezr2xYSyvRlxXMQT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0f9gx75Ezr2xYSyvRlxXMQT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Please do *not* add any material destined for v6.15 to your linux-next
included branches until *after* v6.14-rc1 has been released.

--=20
Cheers,
Stephen Rothwell

--Sig_/0f9gx75Ezr2xYSyvRlxXMQT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeNl38ACgkQAVBC80lX
0Gwbpwf+Ptkp9OoVLLu+YeHp2xMcjdaQtt5oZi2aOYBukT80xbmwfy8xTBs57xLM
VcPcqo42pFCyLsdPudVkGsirxCIRAzYiAc+LqkWRMqPBzJ6TwrUwyjgFZJwtwGyD
E9FnO5QpPYOceMae2vuaU/cGE7vPXrfnIYBqge+yP6zP534uSa79RFVN7/4pzRpt
CVX7C7xJ4nJL1aFSKGINGJ3xRFTot+Sq7TVbSXnj6a5floRthcFCEcV7LER/Rz4T
8DZDhD4lTkii85T2LOFozFRSwJbSj/ZuGqEsawTFn3psQVppkLbzYXRsK1zeN5Hh
4itBuqn3qVXesEuasU+yY4XFEBcavg==
=UsUw
-----END PGP SIGNATURE-----

--Sig_/0f9gx75Ezr2xYSyvRlxXMQT--

