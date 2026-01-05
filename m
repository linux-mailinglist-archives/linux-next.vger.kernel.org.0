Return-Path: <linux-next+bounces-9537-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 545E7CF1D6E
	for <lists+linux-next@lfdr.de>; Mon, 05 Jan 2026 06:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F09230019D5
	for <lists+linux-next@lfdr.de>; Mon,  5 Jan 2026 05:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49FE31A54E;
	Mon,  5 Jan 2026 05:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GaxtpfGZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278BD2BEFFF;
	Mon,  5 Jan 2026 05:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767589504; cv=none; b=er2C7vkRoteKeCVBNMVziI6VIJ6IOteqzTZ5Mf++HVnRts34t79ILXl0RMJHbZaw0l7CvgGWypR+A84zbTDtHzEafthk1Bauit1LeV5qZtzAun2IjJRvBsBf0/23wVCq3VxvRemR6WAf7iyYN46U/RdDArruLIlpRanZi4+qd3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767589504; c=relaxed/simple;
	bh=rHRHWpNrTm9uSHxH2QpuNiCFWH0jVwzH3ovBUD5GPco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bOeqtaNLnJSPQn6RkzdIo9URhBAuFhCHL5KKNmcZVYekSnfGXfnoU0ASPqHrUEai/5rqoV+hKr/O/4udW8mEiJYtuyniMr2jpaz5dT9HCT0e0I63nu8vMKtWbNOVPY+MOTV+Xtry5bhAPo/zr0KaMjWKSvGvZaFnfzNdiUsU6aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GaxtpfGZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767589500;
	bh=ipMTB/0u/W8A1ESEuSQzQKj37E9dbJYQUunWYiFYJhs=;
	h=Date:From:To:Cc:Subject:From;
	b=GaxtpfGZ2mcIqy9yft4slfzYaJ29JzuVgj6g86yDxPfoFiMpmUWSDQWYudwbN9JLH
	 5vkXs3pRrOCFhg799FzcuhT3ipLWwR4f+WX+oz05J+SuBt3Iml/zbUGGcFiIQrjcfe
	 5I1IuVaSw8OKXnz4rHTIeVnqNtskyNu6rKvQnLGLnyX6bypQS4apNgfE+JYuH48sC3
	 S8wO/flgAm/mxJVQW5qs0iI5UjWQXLbKwuu5e74qIxUSRNNMFaniL6fFywdWgHEAKV
	 d0sRO+SpmLS66FrdyohkzOEyzg2hogXWQnaIR01+v3DKJU6anALc8tJvKnnCIzT/SD
	 DcSO8pIBGeFUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dl2Km1twLz4wCZ;
	Mon, 05 Jan 2026 16:05:00 +1100 (AEDT)
Date: Mon, 5 Jan 2026 16:04:59 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the mm-nonmm-unstable
 tree
Message-ID: <20260105160459.013ffb1e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6Lrl0K8/HbMCfewLepWEd1M";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6Lrl0K8/HbMCfewLepWEd1M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-nonmm-unstable tree, today's linux-next build
(htmldocs) produced these warnings:

WARNING: include/linux/list_private.h:91 expecting prototype for list_prev_=
entry_circular(). Prototype was for list_private_prev_entry_circular() inst=
ead

Introduced by commit

  4cf1e8d2b456 ("list: add primitives for private list manipulations")

--=20
Cheers,
Stephen Rothwell

--Sig_/6Lrl0K8/HbMCfewLepWEd1M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlbRnsACgkQAVBC80lX
0Gx2nwgAk1F9wK1G3KfBmqX0H9l/22l7Baw8n4tXpPlnSZ3U7GtpsYsjr5kBU63k
/i/1zfV3ILdWeNvhgOV7ZQAvjhp0nMk9wGDCGyRSM3qvm+CgDa80r3pKuONvlDv1
yeE3Kp4Q8MB5JU7vwJCtnSskzYEDMw6n8CHoCTHeaUPd/oezBYMU2TdnlyziWlcI
BeJDs6pI2pCkjUVnPxsxAMMvUjxNcPH6rbyMQ+RU8zCeDogxAYdkxPYFV1KfX4FN
dQTMw34B43ghhd+I0ow5k+bfSBr87YcJ+oq9pqrR14BKDu1Bg/J32RCkPHdTfZPQ
2NdIJ+rk0f2Klsscer4vlwq5WSIQGA==
=bpiO
-----END PGP SIGNATURE-----

--Sig_/6Lrl0K8/HbMCfewLepWEd1M--

