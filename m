Return-Path: <linux-next+bounces-3987-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE5C987D4F
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 05:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD6A2B23948
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 03:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF3616E89B;
	Fri, 27 Sep 2024 03:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QiaSM/BO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DA94690;
	Fri, 27 Sep 2024 03:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727408623; cv=none; b=HWUr4hxBbqcpn/l6hD/6EF5BCRUhh/tUfkmMVS6CCcmolzsE64jjSeUEO2DvTe4KyKTMxv2loUnUgEG8LIgSCc+f7p5Bo1l5wsNExKWI1M38GdhWCCQicNjZdCiyDaQt8zG7gvCEX6P9QHX4EL2306nsJR5WQ9TfDf1rVTMC/pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727408623; c=relaxed/simple;
	bh=M12yjV2rLKndwGSVDOnRBmvPJV/rZi+eKahVkySN5Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AUADNT3FpCUzyfYygjMl95VrhcBGJTBP1E1fcHg14WT+MRz+LSpKVbGfQjY3ECcGPze/TA8Dz2HZcAWd8WgFlqIFAckXf8m4/i/teVIOl0pwLSUq3jbH+yZay/gJenwXR/qIMYgaHJMFnx8x8Tjl9EQLVtyQ7UNV+5tBtInM7UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QiaSM/BO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727408619;
	bh=AEZZTCs08ioT/lvvc5FwBArvA+RpNCDWVxF8TfYq3s4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QiaSM/BOhQLor16QllpuSmncshnP10EQpwSyPG9xSAYVgJkLMxcblJgLNy3jIb9iB
	 dqbG1EA8Ip3uAVFTCvP+GijezeCjJE0968atueEo1vD7BVQYileoyxcKmWs5VLpGSp
	 Gjhq+QaZ0WlU1RWUtp3JFzylEUF7ewAC24dMJALhcvX1PbEniUIY/trZcHiIC70b/m
	 Qqc5c3Mv0GrAMJoUyum2r7CokTwzhpZHwdsc+aSXP1BZLSJCYm9SocqlOJ1RDysHeK
	 W5v7bsYoBfBXyL9agBEp/XgmsYayseo6h2hGOrTdiizVapXzzODgqLCMwYgsmVOFKZ
	 rPLPhHiP0ubpw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XFGXW3KFpz4xPX;
	Fri, 27 Sep 2024 13:43:38 +1000 (AEST)
Date: Fri, 27 Sep 2024 13:43:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Keith Busch <kbusch@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the block tree
Message-ID: <20240927134337.021b1ec2@canb.auug.org.au>
In-Reply-To: <20240916183622.105641d8@canb.auug.org.au>
References: <20240916183622.105641d8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vPyaVJUikyZxYaRZ1Tqn/N_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vPyaVJUikyZxYaRZ1Tqn/N_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 16 Sep 2024 18:36:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the block tree, today's linux-next build (htmldocs)
> produced these warnings:
>=20
> block/blk-integrity.c:69: warning: Function parameter or struct member 'r=
q' not described in 'blk_rq_map_integrity_sg'
> block/blk-integrity.c:69: warning: Excess function parameter 'q' descript=
ion in 'blk_rq_map_integrity_sg'
> block/blk-integrity.c:69: warning: Excess function parameter 'bio' descri=
ption in 'blk_rq_map_integrity_sg'
>=20
> Introduced by commit
>=20
>   76c313f658d2 ("blk-integrity: improved sg segment mapping")

I am still seeing those warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/vPyaVJUikyZxYaRZ1Tqn/N_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb2KekACgkQAVBC80lX
0GwrzggAobRTGUqGyRk5nodbwG0oUTxBPrO8y5+SJsqm+gUYumLzrU0YdBc4MPhc
fFs69DeAc5xcwofbGLy04AcNi7LLlkEqK5JZ8bsvztd6ZE4mAYuGxw32HvsbC2Nq
KdlElftBFQJPVtpdircHFbY+N0YoAvvSZvjkQcopk+mzsV0qgHObD7VtcVhwv8i3
x0pXFXqwmHhklUiUJ9Tf+RuTSGO6edKbSW3+w8m9eXfhHuXMfiasIMZPhxPUAjQ0
WT00jRPup6ZDiWIvLJB4kPBVixz4uoQiQXB5fpAGPNbzOYgnHcDfGgOErbL7cuZL
yy8OCtddaP9NcoJwIr6Q1qAyJFDlGw==
=Yom8
-----END PGP SIGNATURE-----

--Sig_/vPyaVJUikyZxYaRZ1Tqn/N_--

