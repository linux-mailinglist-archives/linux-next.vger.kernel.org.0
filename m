Return-Path: <linux-next+bounces-4945-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D909EDA73
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2024 23:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89BD3280A8D
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2024 22:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943921DC9AB;
	Wed, 11 Dec 2024 22:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KICnKP93"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73F31DD885;
	Wed, 11 Dec 2024 22:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733957683; cv=none; b=s/MZaxwP/1mpOljVYcVyJ3nMn2tSay8gHXhuUEc0Xp3LR/OvVRm8hvCKtJ44FTnv2ywmnjKOt8UNf7ayt4XFA91zN3OcunWQ3kS1uKuKYtQVQCpg6Etm2i47ZoCxTqAc/LKpxvtQWZUaMkPB8aHPmPqwG7v0hcT0KTBOgxEjPxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733957683; c=relaxed/simple;
	bh=k3atfXh62Q7mbstu7AQML+pvSvuCfejuzNLa8edlgKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Mprt9oARSN+5b7oN/MT+gCaz1YxLcHJr05qqElRYONEtWGB7eXNQ2nEf8eosfIsuY1BFtG96jJAqeX8kpNS7Sevcm+KNiBQk+URdClO1jte6Fixhm3c9SHGxBrOyuV8I37hvOaBqHor7ZzJuH0Y3/HNAbwtQV4u+IcZ+Zzsc5Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KICnKP93; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733957672;
	bh=OHIhfm/AKJaEurTUHS45+taXE8ZcesaGGJuuh4BwAO4=;
	h=Date:From:To:Cc:Subject:From;
	b=KICnKP93ZdEABpZggFrhAgIYGeD8NvRYt30ZyBE6HPjaKBVLR4NpQO/vT+el8NN+K
	 +H2C+ty0TnzZy/Z1gDpD3xJYIDR+MJYwhgdK1l5nrkTfkVkrobHunydU6KXIdgvhTP
	 GghANPt/y2cFczF4/ha8PDUkTalA53ttBVrF/jBfgRWZZA+yYUwtkV0fuBSDkheMt2
	 oRexd2SlhnZFjzYYy0fXqowm36oiDYz6CI88kaKIRtiI2AhndlA5vm5XVVgv+0a7xi
	 62osIxfl/fsdYFdSvpNn8PADYZ5Y2ovmcNQKSyRoEmJiXfZmlSpPF+0vIOjNqMGWJC
	 JOfQCg58yjqDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y7rWr1jb5z4wc3;
	Thu, 12 Dec 2024 09:54:32 +1100 (AEDT)
Date: Thu, 12 Dec 2024 09:54:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Erin Shepherd <erin.shepherd@e43.eu>, Amir Goldstein
 <amir73il@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20241212095436.4285940b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ls7Ryb3InLvXRMSOo=FNEyM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Ls7Ryb3InLvXRMSOo=FNEyM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/pidfs.c:641:27: error: 'EXPORT_OP_LOCAL_FILE_HANDLE' undeclared here (no=
t in a function)
  641 |         .flags          =3D EXPORT_OP_LOCAL_FILE_HANDLE,
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  ccb189ccdd28 ("pidfs: implement file handle support")

I have used the vfs-brauner tree from next-20241211 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ls7Ryb3InLvXRMSOo=FNEyM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdaGCwACgkQAVBC80lX
0GyVYAgAisNqYAxZlKjclktKx7/3S1T7zgmlYuufOLIYuAaEwTzqDTzy0J25NvgH
1skhFB7ovXK282C2PbIFLNSVrRH0XhBiP77JXc0LwrS7G7MDlKT/KYvw0Y0/S2q8
jE9mHg24Bg5TOdiYwIDhcsdGkTYyujuzhmNKsuJtk7G/1uOrRv/MJMs/RgBq66I/
x9CWsw8IDZs/P1FZmKrCtKEowR65qKV0rucfCXWgNQXvT1IUFFkTnr4hDupCTccE
Nxl7CkNwbxHTmvfZFtCxlH7u90TyPGV+PKCBUl8sYST0Tbq6dpYnNagihK5hQ66z
kgd8nSlw66srybSiGeVwtr8qvt3U5Q==
=1Mc4
-----END PGP SIGNATURE-----

--Sig_/Ls7Ryb3InLvXRMSOo=FNEyM--

