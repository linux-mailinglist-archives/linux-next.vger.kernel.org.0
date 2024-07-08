Return-Path: <linux-next+bounces-2840-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6D992AB89
	for <lists+linux-next@lfdr.de>; Mon,  8 Jul 2024 23:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29A97281F4E
	for <lists+linux-next@lfdr.de>; Mon,  8 Jul 2024 21:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CA314EC61;
	Mon,  8 Jul 2024 21:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Z3yLB0XH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE3A14D28A;
	Mon,  8 Jul 2024 21:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720475872; cv=none; b=DUaGN+oHccSMDVhHYneHWhfZvVz0NXdwNuqQoR7oVsmZ0v2JpFLMIXWXSED+N9FxPqN7RAf/XJ+hb2m886scBBh41XOVuYko+Zrh/nhb9Jj4PN8zBXcHRlJo4CpW6P2aiZDia6CaAY36o9DoJB1vRAvHVNyPMES+waJtbnH4LZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720475872; c=relaxed/simple;
	bh=LKHYZeYNaLOOJu8eJHtrLafIEucDa/cEgejIoonuEso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aCf/iqobT70N12FLJ/LmDzscVcKbZa5oue5+oo3CGuJxApq3LtcM3WIkcwaBvnlIIQESJNqpOqOpsicc2Sl8ZxgbWgfza+POGXbmeqehnQYnqrv5yQXHqiCBe/THdlFbsdg8juuEj8uluuuM2rS3PRNig3pfFrHs68fjUETfkkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Z3yLB0XH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720475866;
	bh=3vLFw91ir8W1EScyPaD0LKiJBkMIRKC8mv6t4G1PHXk=;
	h=Date:From:To:Cc:Subject:From;
	b=Z3yLB0XHLdVzUiQ/bdZ3oo9/PY5khGQUmXZpRobiUtflFh4Lnlqhnc05BWbDr+3Lt
	 ldm/uSQK90YEE+Bob2W8s1qkrjB1nYJuSSVc3KARqk65uZiZLa1ywZDjYPeaYjKFay
	 bcICzHCFOoW+MnErpnlxdOzdQhNJmIEa4LQF4kBDW8Dko2I2pUHMMPCuAKM5abKrgx
	 ijZSr3YirSoYaIxJD6pCM/dyynASertpd2oVnqXQaF6ZGFeCLlfWGdFxZ+/NRfscH/
	 XszaV0R27BJSid6Hpc7ab+RDPfQW33SOyoUxMsL158c2rM0mGYfUZMxtst6VXribqr
	 Jxzef3BunJyrQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WHyfL6MxSz4w2N;
	Tue,  9 Jul 2024 07:57:46 +1000 (AEST)
Date: Tue, 9 Jul 2024 07:57:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the perf tree
Message-ID: <20240709075745.23abecec@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_uZOH/AKTDBFLUawt3edxcY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_uZOH/AKTDBFLUawt3edxcY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  1059fb529114 ("perf dsos: When adding a dso into sorted dsos maintain the=
 sort order")
  feaaa8be0b1e ("perf comm str: Avoid sort during insert")

--=20
Cheers,
Stephen Rothwell

--Sig_/_uZOH/AKTDBFLUawt3edxcY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaMYNkACgkQAVBC80lX
0GwLBAf+MA4S98f4il2bgp0dAOo4MRCzrYZoCW6x/83hNG2JQzLLm8NHjfcb3wyl
/vJa0uUzKwgs4QwYuBVQjkfG4WZGHCx4uLjyDGDJX7Q3ALYOU2ns/+94FO1zJ6bN
G0NfgJ6huGU9IeElr7Fcz5t2hAq7oIGcNOl1yWfF7pQPpD7xJMo8VRDqMByMSMCt
LGEx2v4CJFH1cUCxfJxNDY54mvCx6ls+nWv/EzJSRnZ0PcaCJ4zqEuz+IvLgQAFL
dnScTOAfCUCJspTmviELuEufhUdkCEsTtR9IxDLtP5jCmtRmF4fkEDrYMXNJVn71
MyAyUz5N7Rno0TIltJN+YovvVatIQw==
=zVjz
-----END PGP SIGNATURE-----

--Sig_/_uZOH/AKTDBFLUawt3edxcY--

