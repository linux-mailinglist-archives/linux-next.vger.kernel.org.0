Return-Path: <linux-next+bounces-3318-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C51E952586
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 00:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1E501F26DEF
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2024 22:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9FC81494D9;
	Wed, 14 Aug 2024 22:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="e5IuGjwm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D56A60275;
	Wed, 14 Aug 2024 22:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723673958; cv=none; b=bBYehe8oleqQ42DrybInJ9z24UpXA7csnOs6nQ7mJjk4gWOmrI8CSvE+keTfIWJO0cFSFz6dQfjxxnpyTRcEd8QE5/u3003OMT/VEYdlutdlDPT/plI1QeIat7A5Xqa6Kq9skn5yh9K1vpJ9UWFAEH5jGc7VpFOEWtT+BEGWMmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723673958; c=relaxed/simple;
	bh=S6HErFk/DjtsY5nOPJL667tA+5ftVzOeF5/3Sj6weLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YXKQGeL21PQu9u4yD88q2eOpowWF2z6OvAZlzPamZOy+OHXMJ11I2OS0bBq4W5uV8SVrEYJrk7YB/FCqhgj4WybY6BAUda7Z2HSCnmPWUXM0A9cO624uyE9ZkY/fuQu7aByQzE5GfV1G9Wt4vNJIhbIJJXxeva8q/PwgTubYShk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=e5IuGjwm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723673950;
	bh=nilCenmhG9USZYyCQvxka1GV+GVv4b854q4UoQLpfsI=;
	h=Date:From:To:Cc:Subject:From;
	b=e5IuGjwmRz08iVc+9YFHkHVQL4ABRrtW1wlQJ3bRVHG5hRixDKpMcqGETRqsgop7S
	 Hs7og8jje3c2hZ0kYyyhpbLxJoES58VXdXMAfq9xpMaKoPBWva1GjEovs0sodG/KLX
	 8crz/FmMgElxxG4BwtNveOcnEvV/SnX/wdjL3DqN9lzyXxRCbCUIuBVKvUT26GaiPL
	 1We5cTLFVyx9oPaQ8odleinIJ99r/ULmqgPUwmz2JceEDNJy+ucUMAYt4h/UBppran
	 lbXi9z1eMmiubs3RMuDKwJXOP7emKIiN6pFyCy1kVcIrM15SqEVFMh7oeucvLTQjsO
	 RVUnoS4oJGyQA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WkjMy4hD4z4x11;
	Thu, 15 Aug 2024 08:19:10 +1000 (AEST)
Date: Thu, 15 Aug 2024 08:19:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mm-hotfixes tree
Message-ID: <20240815081909.2047e90c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//fdpAqi0Qk46LeA5Fu4c9Sf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//fdpAqi0Qk46LeA5Fu4c9Sf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  a94f66324a2a ("Squashfs: sanity check symbolic link size")

from the mm-hotfixes-unstable branch of the mm-hotfixes tree.

This is commit

  810ee43d9cd2 ("Squashfs: sanity check symbolic link size")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_//fdpAqi0Qk46LeA5Fu4c9Sf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma9LV0ACgkQAVBC80lX
0Gy85wf+KjNbrM0KzqbcDrQUDmM3N3hBZMFKAnuiRYA8Fm9dYWxrANHjRBaSGujU
ZRfQeMfutAdCEtxtNCfWcnUtFjp+qvP/mknkZqV7kuf2Q9O+VohX1yjCSw9hB40a
zIeX6hMtxxUcdZRMmlsD/GdGr8ldGg/oqdQMH3ky2yCjX2aMdFsYsMMZdGkd90Rr
Xf9iTfvB4TnST+6lFKqQPK9HW42FrXbny1WSVnvnFGk4M2oCgaYtaFgvjZrf52qF
f8BUvDdmMUzlAx/6bTs6t4pQqBfmcdBcekrig1J9nW8cFfY47qbrcknRCvlDwiMb
u9m9NxdTpj4uXPEhFJ5KMvIm/Tgobg==
=tOf+
-----END PGP SIGNATURE-----

--Sig_//fdpAqi0Qk46LeA5Fu4c9Sf--

