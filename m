Return-Path: <linux-next+bounces-6566-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B7FAAD626
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 08:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 442179856D9
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 06:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55607211484;
	Wed,  7 May 2025 06:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="evvLTzgt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED7D20E003;
	Wed,  7 May 2025 06:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599550; cv=none; b=sDAyw6P6tROy7iCbrvDSazYFCt3zM/KWiIKZK80dwxdgc/c8r82YmLlpGg4/WNCZj34v0arZfNNsIanFH/WGuGD4ftT8u0enUMNQCl/MMogVOMNe/noTjYTjN5Ebr+tKxtjAYPNWR/Op7whbQOIw1x9U+0P0rB5Y18m0SDUvvX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599550; c=relaxed/simple;
	bh=/IFGVq9hMOoUxgRfDfuCDTmH8hHKD7k4p2EbG8rNVpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KFsujvoV7Ycf54ze2a9PvjIMh0YrHl5QPeqjFXe70vtfg2p/Zd+dgS/dFYonVpXYolvzWc6iqi37wFiBe7NmtHC/TUPHN2zq8bo+Rei7WaMZAAO0z6cj5JR73LlZgW6MEaCMEuPTyUHh7W6W7ncifhzgi6klnQge6pkKsiODrPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=evvLTzgt; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746599543;
	bh=VpV+Jg+FDugGwvLS7dFbqu73YoPSSo/m33nsn4yKhv0=;
	h=Date:From:To:Cc:Subject:From;
	b=evvLTzgtFF6P/f13hvKHLRaFRm14VefFWtGAIvYqcqEpAgUhO+9lyRwXJ3Iyzwr/H
	 MB1nJvlsPCUlfNGhNzI1/sM9GqDe9/FxwUbh2ykEFOTrDICJrgPiHmlwVY3RsXWehl
	 pcB7V+3lVAhr1z/owNlXYjSZ/uWkuru5JVKSES1+yCVd9Aj3859vnoYFlhhhQQF357
	 ekTcfpOvyMpcTxJ86J5JneuvmeckMHee1/XztrendOKG7AORGMo8cTNQGgU1/M1nWo
	 /EqWpjUPZpkCVPi2kO6+xgElXNh0kOr6QjAOFq+mpIH3A/EHq6AE9AriwCPxz/Ric7
	 0/tNBidyEf38g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zslml35tZz4x43;
	Wed,  7 May 2025 16:32:22 +1000 (AEST)
Date: Wed, 7 May 2025 16:32:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20250507163220.00141d77@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/29X5H_RwOtum9jibuK6bfUo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/29X5H_RwOtum9jibuK6bfUo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (htmldocs)
produced this warning:

+WARNING: include/linux/blk-mq.h:532 struct member 'update_nr_hwq_lock' not=
 described in 'blk_mq_tag_set'

Introduced by commit

  98e68f67020c ("block: prevent adding/deleting disk during updating nr_hw_=
queues")

--=20
Cheers,
Stephen Rothwell

--Sig_/29X5H_RwOtum9jibuK6bfUo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmga/nQACgkQAVBC80lX
0GzJuQf+Pyk0MRyMEHmiDZN0up0doSkse7XtrM8gvr9JY+6cnEJ6Y8OpPBYYX3c5
9SSYKAhqklj97FYPIf6C95ZBqWvXL89X5ywhsEwURaxM4PNK6LW1pJMrXug56vAO
Mi86Rga0mFNGiZkZBgRYTNx+w1XQO1kbAMhaYvMVRCkl2i4PxqjVMVnvcy5ckBi6
OZSiq6XmnaMC8NahquP4EnJmyv6Pa8aUf6deR91ogzf3zs3prNlkSdrB5ctEglVy
wI6Aea3UDwygtPLH4s0WLw/3UjJxKy3AlX4+Zge1YgmkzPJ0d6rH3bWRjcCpMZVi
wsjLWbBdtooN4z/QF7YD3b+JmoXuoA==
=2t4h
-----END PGP SIGNATURE-----

--Sig_/29X5H_RwOtum9jibuK6bfUo--

