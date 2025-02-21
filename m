Return-Path: <linux-next+bounces-5520-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F09A3EA97
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2025 03:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C44919C2F20
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2025 02:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158E31CF7AF;
	Fri, 21 Feb 2025 02:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dHwvl9Wb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FC3157A72;
	Fri, 21 Feb 2025 02:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740103870; cv=none; b=UbZ/WMwc4Nb4+RaHzbgFY7Zpk+vOOmT/OPDSpOurVG41Ae7tIRbGSAL15p+00t6xaVqirFQ2Q6THLSSbt4x6AQirMMiC47xIfINrhWbHZI0boMaYr0qns2CTTJfMFGcfB9x4BYBWjx7nnIpxkInR+JCysK9pESl4saC12D13oZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740103870; c=relaxed/simple;
	bh=Az+gDOqCU8vyPMiROtAvv4mjaDv3YIgweVokjviTVTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=J1q7qtEaLsrWlUEqNw3wpheB/At6HOZf5tr7aXqCOderp1c70GtDGnMJsUPPpgz0fmLheYlXzU17ZxnIxkSsZ1uFNk/wj5PnlkIiKEUjYutLA37IT/G0JPJgSgw+E5rM50bB3UeKd7NVZHszNzmCEDRULTpGoUzFl5Yx+AYiw3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dHwvl9Wb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740103861;
	bh=QNZcojyq3gHMHfs6VZ3FjUlUxtMGxgOIUk87N8nCQBY=;
	h=Date:From:To:Cc:Subject:From;
	b=dHwvl9Wb2YrmqlNE1mZTytZ2qAB+9dlbFvHDgi25GMEnSt7dLUjBpNCVd9W5ktHkU
	 OI0mSavwczlttdJ3knuhCHZXmQaNDmUoZz4cW3qVTh/wf43mZfg2AoVCpKQJeqW5Wj
	 chqRMNU0PwUqID3dBGewLNTy3enDiQTHnzBvA73Y0AimQYtCGp/ac2hWasCofW6DNU
	 5Iqh18m8r51wTvdyiHTktTi7llo9f/vxu/W8AR5kjheAMH32Q1a0zg31BqnRhJ6GG7
	 buPGsCJEhgSWX/a7oz4HUbfFZc6EiFNme0RuPBLaZ+w5agvt1x8ewv7XUu8lG+3Klt
	 8KuDiSk7cOH7g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YzYWl6XtKz4w2H;
	Fri, 21 Feb 2025 13:10:59 +1100 (AEDT)
Date: Fri, 21 Feb 2025 13:10:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sebastian Reichel <sre@kernel.org>, Michal Simek <monstr@monstr.eu>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the battery tree
Message-ID: <20250221131040.7fe8b838@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JYnuc=nrhIl8mWhR06sqCeA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JYnuc=nrhIl8mWhR06sqCeA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the xilinx tree as a different commit
(but the same patch):

  a944cfd799e8 ("dt-bindings: power: reset: xilinx: Make "interrupts" prope=
rty optional")

This is commit

  5894be9685db ("dt-bindings: power: reset: xilinx: Make "interrupts" prope=
rty optional")

in the xilinx tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/JYnuc=nrhIl8mWhR06sqCeA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme34KAACgkQAVBC80lX
0GxtZgf9FZpCH0Ve5WrMsxIePVjjFFLMP2pivT/aAnIh0i0hhQG9OkoQeI+7rmJc
6SO4eMLcpUFWsfjfvrJyLtkpf/FCs9vPPECZwZBnMDeTRiDgsQIGhGFImXnGCqg4
jSgY+yt7w2gR6hq0TNI+MwMSznvkDIvwiNxAtIv0ByFas5MhRkPS+GVOBTTx8mSO
59Takw3QrfbMnRqHj9X1VWi9pvP9wic7u9aSARQNJdgX2OogOFh/IgkkZXxjxU4x
PajeaR2XynFtngdiSt9CXHchOhW3vazqahHvl9kHO1/rQuXICaIgfEFYXKmzA337
krF+van7U5INxs902rtufWRnaca5RA==
=iHCE
-----END PGP SIGNATURE-----

--Sig_/JYnuc=nrhIl8mWhR06sqCeA--

