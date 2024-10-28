Return-Path: <linux-next+bounces-4476-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B83809B2A78
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 09:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 760C5283B02
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 08:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4162D190471;
	Mon, 28 Oct 2024 08:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OvV/ny9f"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAB117CA1B;
	Mon, 28 Oct 2024 08:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730104657; cv=none; b=h0GcHdWrshh5+GqQSCLlRYgfJG/UGMz1H6X0S1l3OYocLLyFckOiyLeCqiLknSOxdq8/5pLLcVTtMVLT981iPjyt5KW1PorRV/RyV/Bp2MiBKU0z2xZ9oiFw9A+lA+UuRpeNCdO7O+oVrYqZJajBURrim6HR+j3k+o5dBnCw4VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730104657; c=relaxed/simple;
	bh=1X/Axb1AksBKevDoQK1qbXXDl4Iz+ytIlxThFMFJEpM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PRvSglm5oRsziWqA5AH4P6Ig+hSql/dSDGC2cnDNaiw7Dz/iU+iM2zVTnq4IlYQlFt10u7lwkSYCDMB1RctIl2P0Z7svYe5Qmp7y5SWiY5PGnrEwt3ZRJi8mrW4KKZaLzxwjhvz/BN0ufXFwMUwt6xqzAJW3p8EZQhEM5Ws26uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OvV/ny9f; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730104651;
	bh=WtKGHCbpUAX0+RelPvW0wdUldRn5nZ8PDozAcY86xBU=;
	h=Date:From:To:Cc:Subject:From;
	b=OvV/ny9fiHB9BPWHp/mgpG2l37YzQUhVDJ0OGYJxNPyx85LgpQwryZ3G7xpHLvHG8
	 SSGDKhFihNBQyjojthXSLMEJlC93Sr6USHbQDayiq8OGKafv/mnN1rnh1R49JwSkOL
	 8LqME0LKFDBkTAHneVu+6kueBdNY6zK+RqPcQSUhraMNE9fcdYnfZdKf+xVfVgE0PB
	 aHI5OFbhlzAocH7BUHOsjqkQ1xPBOxAfsVUnHGGcqvNGCu5dFNjR+9UdhDLDhpo2Op
	 rTItCuSOVCKZOIw56ySNqMHmhMyqvVGmXINEeOJAaCOkAXubAiWc+AlgEkjlMcHdCC
	 4ttw2+ToqB57w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcRbG6TfGz4w2L;
	Mon, 28 Oct 2024 19:37:30 +1100 (AEDT)
Date: Mon, 28 Oct 2024 19:37:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the sound tree
Message-ID: <20241028193731.4b0c3788@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MiKLHoTm6vOmDpwx3mVBB9N";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MiKLHoTm6vOmDpwx3mVBB9N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound tree, today's linux-next build (htmldocs)
produced these warnings:

include/sound/compress_driver.h:176: warning: Function parameter or struct =
member 'task_create' not described in 'snd_compr_ops'
include/sound/compress_driver.h:176: warning: Function parameter or struct =
member 'task_start' not described in 'snd_compr_ops'
include/sound/compress_driver.h:176: warning: Function parameter or struct =
member 'task_stop' not described in 'snd_compr_ops'
include/sound/compress_driver.h:176: warning: Function parameter or struct =
member 'task_free' not described in 'snd_compr_ops'
include/uapi/sound/compress_offload.h:151: warning: Function parameter or s=
truct member 'reserved' not described in 'snd_compr_task'
include/uapi/sound/compress_offload.h:180: warning: Function parameter or s=
truct member 'reserved' not described in 'snd_compr_task_status'

Introduced by commit

  04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")

--=20
Cheers,
Stephen Rothwell

--Sig_/MiKLHoTm6vOmDpwx3mVBB9N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcfTUsACgkQAVBC80lX
0Gx3lwf/ZrZPKmycN/natltehLen8X351kS7BYIOzZT0f+Lw/5uFvEpUpKuNTjRq
wTnwGlzTQ8+G45v6/2/oSim059ZswS83AykBtGG1wnx63PUGuYHgtX8D8wqUCzNF
5M+FeEE/r4BRqT0YcS8SETtOy3WwgF1SB3IQUatuEIZFEcs52vSm0Pc711ENFxLE
7JHmGlExGAPHP8/ncQzzuiDgH2PHYaR2DOn+eUKpIzmoGiDA4nAoCQfZHIdZsnIX
XoSZtKnKnoKOkTJy/wLCCY/ieVvTWyZ61WGU68dSoMCW+xri/0EajWOczoXNCVe0
e1xStD2jBTSCfgSocwjM+PL5Y9mBtA==
=mDc4
-----END PGP SIGNATURE-----

--Sig_/MiKLHoTm6vOmDpwx3mVBB9N--

