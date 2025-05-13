Return-Path: <linux-next+bounces-6736-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E70AB52FB
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 12:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB2811B474D4
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 10:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587DC2505CB;
	Tue, 13 May 2025 10:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OVZJ3gBi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A4C248869;
	Tue, 13 May 2025 10:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747132565; cv=none; b=Zj+z8Z9dZa4q7N4NhEthpEi2pKq7XWJsadyJBohZeBC+wv9Ns7bChJ/1g96E7/EihSROTWRjqxk3G4AyRu+bP/G14hFbGsLKzj2kRS/js45sTqS7rh8YtenidNIdPBdVGvqfiJ0Z3dzZBCRlnxyc7/2RgzGHeoAQT0L/tfPI2No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747132565; c=relaxed/simple;
	bh=49jF1lchXWFM8QKPocV1okFt6fRx+lINbwB+LoQo7TU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sRmfyAXeod4Si65KRf5+IyZGxn1zypuPMMCPoHSgaf/0AqchgUpap8eLNiCi9x4cTRApyzAcF8oIMAISCTa6rxco0HBbNTVnEXddnfLCT8WxwAcwh6PnE1FT4uvoqMbAA/epC48oJrC37czC70OJQjhNqk0ixBJBrInSHqKWd3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OVZJ3gBi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747132559;
	bh=49jF1lchXWFM8QKPocV1okFt6fRx+lINbwB+LoQo7TU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OVZJ3gBiSRey1jb55GAHLA33VFqBWM+HMgKdF5HgJ6C6kc+o02HY2BrGlnycGrgtQ
	 LNvGEFD+/kd3kM3bfKPwgCxR+7XMSE73WQtub+YgZ5RoPCzjFqsjzoMDx53srVZnVC
	 R1KMzd2JauAXUs7f+z+dnFNazUKnKSyqEIJHDvBcMt6BHF15lN5Ca7NNq3PQgd/rKw
	 c03jMFD3Pp0bVJ7OOa1cMEqdBDrY+F9zg2XpAvJ+zeFx301mo8P5CvLcoWfrUIAd6X
	 4ohj6+Rv8nQPMInVQ9lk6uFZQTp5IzgXeMMBRI7uUT6KS6CaPQ5cixhhhe0K06SK8s
	 ajfuhP+OdlPnw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxXv225hQz4xQ0;
	Tue, 13 May 2025 20:35:58 +1000 (AEST)
Date: Tue, 13 May 2025 20:35:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20250513203557.12e64f88@canb.auug.org.au>
In-Reply-To: <aCMNVzmguCy-_bMT@gmail.com>
References: <20250513165439.762fd52f@canb.auug.org.au>
	<aCMNVzmguCy-_bMT@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ws7EkVllX=LBGf2=1a=pTIi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ws7EkVllX=LBGf2=1a=pTIi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Tue, 13 May 2025 11:13:59 +0200 Ingo Molnar <mingo@kernel.org> wrote:
>
> Note that I have resolved all conflicts in -tip as well, so these=20
> manual -next conflict resolutions between -tip and -linus should go=20
> away after today's -next integration.

Excellent, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/ws7EkVllX=LBGf2=1a=pTIi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgjII0ACgkQAVBC80lX
0Gxlwwf/fdd0GZar1GAKIe4W9eqhIJySc2yGiFZxaUvc2AolPEof9m4dNG6C3ixn
YjmMW/Dn2FRdk02Gnnv1SFAo8NnOtwTMNI4a3kIH523sZHXteRma7h0+gG2Tk8sJ
jxVAnvXE4xMNU2+kwqWtZ5j1DFbOfGuPb1g0P/kOaf4GCOiQNgJciqt29A9qPBPq
ODpWUJH32Le0wAELTqZvAjjU40EwVVKuZCXUVraRjd2OjL/HyLz1vFeo5Sew5YW9
iWIoMlm14AihM3ZsKawn9z8YHwaTPgvA0U5nMgf7+fFLr7E+ddCTHOkGPcqSrd1k
Jq9ZQFG37x1+6lAqsQAXpm87MYhFYQ==
=JrEp
-----END PGP SIGNATURE-----

--Sig_/ws7EkVllX=LBGf2=1a=pTIi--

