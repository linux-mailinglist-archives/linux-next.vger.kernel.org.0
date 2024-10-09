Return-Path: <linux-next+bounces-4193-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7302997725
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 23:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81E591F22F3C
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 21:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7F3199FA5;
	Wed,  9 Oct 2024 21:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MMxWWbGP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86092186E4A;
	Wed,  9 Oct 2024 21:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728507704; cv=none; b=k3J5I9aTxG2XjEIt4JTXbz2D7SlKXNhK5cJ/OxvYrLWOwYx+Z27wPDrAI45l0XFfctJMXgThZ5sakXLyISdKpTnYffTQkU00tvIbyTJVlprWjssrpvLXf6ISeQ03y8iHSGTY8SIfyC6LBXN1O04Q12MjD6NDlBRqu9af4tU5LYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728507704; c=relaxed/simple;
	bh=apgSj/Y2nNVXp1K7UM9TR8iXNb5w0mZfePXcwRsxrk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fuNF+xefJtGVrkVV8hpLZkmtQtG+v/mLkFeFxibuTKhFVCJ2LbcXraghnQpoIRw3/n9EHlhze67zazpsRmHNi/b7ulL/nNYTkazWnkisljRm5lUIS44TrR5wzAbRUKep1R9W8QwjrTxrwDwnxfAGUPKpavxFQneBMFt76tn9+9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MMxWWbGP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728507698;
	bh=VDQRS9/pFywPg/ID8+mJmZ17S/O23SAKseZQwEaodFw=;
	h=Date:From:To:Cc:Subject:From;
	b=MMxWWbGPQdOc3+4XSjUMiXtVTalMqXWWWWdRuRqiIXkwPY6FszcVBvQz4a8VRiO70
	 MJoPIlSYepST3IVvT0XR+SWeCIccIYuc0Yfj+nc3zmKK9aV27iMOLEyBB6RG1GF3gm
	 rpGKeseMRm06zJfED9FXqNyFOcKzyoWiMdk1uAckxXVzkSKbGaqy2nXvo71GkOrNJZ
	 b4Lm382bnqjbigIc2K5yzWMBH8fVpWQF5YugOL966UejfS7MnIS+HGRg34V3ZY4k27
	 EZssDJ2l0IljEORSZ1eNf/yw8W9aSMe6DQ3s9AGAWAAH/LEbrTWT7t6w87hlRiysaA
	 HTAmJ5Yw12lFA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XP50f2RdSz4wbp;
	Thu, 10 Oct 2024 08:01:38 +1100 (AEDT)
Date: Thu, 10 Oct 2024 08:01:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the mmc tree
Message-ID: <20241010080137.22a14141@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w1iokgarLPG0=CXo7UfEv0_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/w1iokgarLPG0=CXo7UfEv0_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  8170aa383c9d ("mmc: sh_mmcif: correctly report success when obtaining DMA=
 channels")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/w1iokgarLPG0=CXo7UfEv0_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcG7zEACgkQAVBC80lX
0Gy01wf8DRGIr9HXZIsCFL0esXHE4FPk7af5HH12BEldMjEofQt0TK8L0x/WEtyX
7uLNj+dv3ep8EBQmsgtpfc0F7zf6Pn7EAOR+dRnWYiLF2nhrWK2uXrVzsU/AA3Dw
BlyxU71rcCK3gq8QUNUgPmS25qlnemSYau2BXpG20khOE9arUP8qrjjMSXNZKYmT
e5Fr7NPXfRI+OVMbGIC5NZ5OhxNpc80BnPeqMvVaTJPMg3xFYLNJaY2JNuq7s7aw
thS1He/YPvTlt+V7IuJnGL9vy40tfIJl1FLx87O9uL7ZjWWXyik3FLP17QD6iTdk
mhENFy8RD6zxexfTUX2dXUudJLmCuw==
=Qh8O
-----END PGP SIGNATURE-----

--Sig_/w1iokgarLPG0=CXo7UfEv0_--

