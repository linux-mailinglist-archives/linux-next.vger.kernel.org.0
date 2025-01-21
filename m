Return-Path: <linux-next+bounces-5285-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A63A18638
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 21:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3C7A3A3526
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 20:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944491F5434;
	Tue, 21 Jan 2025 20:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IVKPFXCp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893B71AF0A6;
	Tue, 21 Jan 2025 20:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737492356; cv=none; b=lpP3RnbN/7yw5LQFRmt2c+ggYsi2/kFYCFbKIyv/zLC9OvvT1FJhOUrINoPSIc9RJO9bgekz7xfxuYcSiDt5T8gZzuMizt5Dda0JgTDYQrZfC16eBMT9zDFRAgYce4lKFZuOLNzdmWh/Br75i6jH4aJyv0hWmW3V++RtfeVUOgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737492356; c=relaxed/simple;
	bh=oEz38jMSVTettZI+0wOaoCl/8KPmcOkcEpclqG4dPsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CBM+nXKesnXJ5xytVHm30A7lEPqWpQ7rTGQCp8zzEkIUvD1J3gs0YJ08Wm4F5j/tl9MNr0WWtixDLiVPYUjLuDV87LoaS1JhjsBtTHpD1MwyKt9pqDBQIxQNXmp66Qpq9qYVaU9W4wHDmYgF5oeWRZKNlZbcMekUZqGD2BlmD84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IVKPFXCp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737492338;
	bh=mc5oFT1Uug1RBJotDMbxSqCfp7CK9+KiG4no1nnxSx8=;
	h=Date:From:To:Cc:Subject:From;
	b=IVKPFXCpw9DvU4Pctapg24M7pYKfymwgO/w2eX13KRCY4Rs96wfPW3HE16kpozNKX
	 LwisC3UqHCCrV67oIlBdd4Ab5y43elV2/8CiVa8ONcrqVl3FFblaQ49tuCErw2HDD1
	 tpgqgp1XJsWADfajaYUTbJC/RXvATwMePWbMsNcAXregf7dIboIF7gU9CzyZB+kZ0D
	 5GXgAG1D4JXd0fgxFzmFIWmAuKMMh+iflrcDl/0Rew+bdHAJAmouLF9bXwHyD8oiIO
	 gDXxecuEMNqQMqrSyiJfy+RBakLmEFIe+o3Co8T3bHPjCFI9It72ME8LlXVYuV2FmE
	 utPfzHPCQmX3A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YczkB2xlHz4x8Z;
	Wed, 22 Jan 2025 07:45:38 +1100 (AEDT)
Date: Wed, 22 Jan 2025 07:45:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the mm-stable tree
Message-ID: <20250122074545.6b600b6c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A0OvXpobmUstK7DiQW+/xFS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/A0OvXpobmUstK7DiQW+/xFS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  6f030e32e449 ("mm: introduce mmap_lock_speculate_{try_begin|retry}")
  e5e7fb278e59 ("mm: convert mm_lock_seq to a proper seqcount")
  dba4761a3e40 ("seqlock: add raw_seqcount_try_begin")

--=20
Cheers,
Stephen Rothwell

--Sig_/A0OvXpobmUstK7DiQW+/xFS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeQB3kACgkQAVBC80lX
0GwD/wf/X3lY4ptP1R7m+vCJz9bDigGiq8UJXruABkoh4q3Sc8BYrmFyCZrILwQ2
BLmTe7xqAt5Q6tWl+Qgqjc7vFW9Z4euE97dfHTF38rcam+TIWKBAdM5uuqFueAQm
KczYwV3PJzqGWrv1mmKp/8UzkmFYiHpEHCWJ4YMjg2buPLpxyp7YQKTVA8mFBf2M
TwI838KLbhxwLSh367771tJUDySCJsbu0zVvSNtooYwHD3oMTcKSYwuODkf54Oy/
N86gUrnX6zqIsJynz1pdJrmZlWlldtTFeL2EHQ72UM09h0oL4+FaDFx15iI/MFDC
2JAwup1rYY+hM8Hd5VF2nhZ+GcfFlw==
=T+1f
-----END PGP SIGNATURE-----

--Sig_/A0OvXpobmUstK7DiQW+/xFS--

