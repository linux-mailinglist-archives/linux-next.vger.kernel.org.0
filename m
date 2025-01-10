Return-Path: <linux-next+bounces-5130-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6BBA085AE
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 03:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99F507A452A
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 02:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53442A1BA;
	Fri, 10 Jan 2025 02:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NDBQMgng"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5D92C9D;
	Fri, 10 Jan 2025 02:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736477259; cv=none; b=B4rABW4CiTsKCQkofX7moZzeCiSAg0/rF9EpUD/XgNaikM3rbHfX5/XsNWs8gXd//tkAFjNyuGNKGEzn0L/iPDmhe75zYtidCV3FB4EJw1yrIpZUg9H9ss+uF/rQnjzq7I/JWudORWHrZZTHPH1lRXK9/vcQCvpVFYGik9cjtpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736477259; c=relaxed/simple;
	bh=8hSC1cb3svEyOUq5EswSX+K5t4U5S8HePgHsRRXtnSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P3BOh0+M5jWez73PIA3X1xf2T+Lj8OVkl5RLmJ2Dg7vaYz47fkyGKKZlTYaNOvzqpTBZqSzHQnA1ZneZLuXyVBniInEAIwIhU92RNTfoh8LCjQ9n9InX8+03Jro5c7wk/7YeSfbVMsnrWDlqZfeizjNeJvUIydR2UTRHjfSDQAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NDBQMgng; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736477244;
	bh=nSAv4TaZZanW+vd7TR1IO3htmZTjXTyr33dZqOioaqM=;
	h=Date:From:To:Cc:Subject:From;
	b=NDBQMgngWiDJqCPIpYmkFPxS3yY/WXOTH8JnRCBe9UXfp5cOjOu5oXIRTl/jrpN8Q
	 Nd3Uy0hUHqa1SbxmlGmA59xFIzFKxr019FR+1Gq741MYx99n1Zuq+GwlkDa+hZxRaw
	 IafPcers6hiku8qzAtlsIoWSDR1duoGWgpTk7w1z7m88CPiXXSyGcldOWZcqZKnpxd
	 EfeHzNsJwobAHeZgXumG8rJmOyyhPf0YGtaUaQ1QLlhLpb9bqKRbOwo0mydy5i0HvR
	 5k0Piyl+PslDZVbH8EK0kMeLZPlaDjU7iLTWGywfv9FkMyVaG86sjOtfFW+/uC+gMF
	 2pNMgeoyeiKiA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YTmK7074kz4w2K;
	Fri, 10 Jan 2025 13:47:22 +1100 (AEDT)
Date: Fri, 10 Jan 2025 13:47:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Suren Baghdasaryan
 <surenb@google.com>
Subject: linux-next: manual merge of the tip tree with the mm tree
Message-ID: <20250110134728.42c77894@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8WwsoV+zxp7_b4s751ZB4vC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8WwsoV+zxp7_b4s751ZB4vC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  include/linux/mm.h

between commits:

  0562d49197b9 ("mm: prepare lock_vma_under_rcu() for vma reuse possibility=
")
  db691d64f393 ("mm: convert mm_lock_seq to a proper seqcount")

from the mm-unstable branch of the mm tree and commit:

  eb449bd96954 ("mm: convert mm_lock_seq to a proper seqcount")

from the tip tree.

I fixed it up (I just used the mm tree version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/8WwsoV+zxp7_b4s751ZB4vC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeAikAACgkQAVBC80lX
0GwiJAf/dGE/z+Hkp64m+Bm2n1Y6p0bxVC9QH9beBrE8D8geiM0BywkQT0ph85Dq
NnGWQmLGiTCRzoZBmUy+2jyjUGxVdndxn+Z+Y3bsULFIssYtiUrYeV/cKhxFS+ML
RItqLKeTOr7xrAnfDt2J+iP93elMbz5d5dMwM937ZrFNBtIiCdlm2UjZrYjqUM29
/kV0+C2JZ/SywQnpNc1hB7JFpp2/ckbXJiHKhlgXT2d2SaDQXAUSarhZftGNol9L
iPVKQ4O5z2sllfv8UrGGks0bYgTq4jXbxiaO7beXZY6QN7yNet8vgyFBtxvQfxth
u8RRmUmqrXGxCMPKzCsyy/Pyj+XZVg==
=wNmG
-----END PGP SIGNATURE-----

--Sig_/8WwsoV+zxp7_b4s751ZB4vC--

