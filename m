Return-Path: <linux-next+bounces-7226-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F7CAE636C
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 13:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A10A619264CD
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 11:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD75422A4DA;
	Tue, 24 Jun 2025 11:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="T8gIYnqN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB99B219E0;
	Tue, 24 Jun 2025 11:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750763736; cv=none; b=mYGcuYKGR9hwF1l3k5KbWPKvHAySPjCzaRhBqTIFla+/uN39AN4ZOY9gOwlhaJUc02Gcn2rFnbW8aETAiCeJDd8apj/oPTO7H1koCt/Nxmk46ZWzb/1HQfvok4Qk4EwN8owJg29piyFbHY9X9hZCZFc6btF0x1R2SNjsiIsjVBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750763736; c=relaxed/simple;
	bh=TLkqf97AKaEymQttD1QvPzOUup9tkvH4B9dgCySCB34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NR5wheEIC8ZMMdiT7iKUkaGXOJnMrjGkBKTr049uBVnjpl0VTe/jhu382LSWCROy2koB//uWj5hOYisXnHTqeOMnwCov+vb2bNtJA46jRQZ0vhDViUAaCBCVLJhKW9QmPoWAu2XfQMqL/oZigpQ3IjARk4Py+yzI5oHsxaQB5cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=T8gIYnqN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750763730;
	bh=PPoki8NdQDT+GsOVVWlBYak8Wz+8531cXIBDBqINZag=;
	h=Date:From:To:Cc:Subject:From;
	b=T8gIYnqNwEX1vS1cahTd+HSdCmqHaTlFT/80YEEtgYb9k2ekKjjnH8tdMPc/4Lyh8
	 MciW571pz5mzvEqbbwO8r6/9lwCPY2CgwgjJfyUmZnYw4svxXVs1SFkwWal7R3LCk1
	 vZGFXdpHDFYVoMhdSMHfLBxpbHaNhmwrVpTIUcmqboKz5140XKC0aXUN5k1DfYbt8l
	 1VftnCJKWlWzdnjRuKUNX9ow573zIf1k3/J5LxDJ219SXtifvWrGU1KLpzf/4zNSlG
	 u2Vg0lf1aYtx0k36NqSL7sG9rLwpLQbSIdVfjpWFAgDTISVwX6mCHGWXHMIM5ftSMO
	 mGST84cFVRK6w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bRMnF3DCNz4x0s;
	Tue, 24 Jun 2025 21:15:29 +1000 (AEST)
Date: Tue, 24 Jun 2025 21:15:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, "Borislav Petkov (AMD)"
 <bp@alien8.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20250624211528.3b0b3bcb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mfsg4c9pM3LCkOg0RNC4cAQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mfsg4c9pM3LCkOg0RNC4cAQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e88b1627b86e ("x86/bugs: Allow ITS stuffing in eIBRS+retpoline mode also")

Fixes tag

  Fixes: 8c57ca583ebf ("x86/bugs: Restructure ITS mitigation")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 61ab72c2c6bf ("x86/bugs: Restructure ITS mitigation")

--=20
Cheers,
Stephen Rothwell

--Sig_/mfsg4c9pM3LCkOg0RNC4cAQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhaiNAACgkQAVBC80lX
0Gwqcwf9GchWncrg6OGIICN5lxxZhYx7tgB0KBo7TXQzrPDAO1Kl91GFEFpoSrQi
DWeRknS5WFMCqH23Cj47ndZSbjF9eepiig4PNVg3rXxsmky03MDcjTu34hxf2cG+
LwMjOOCUmM856AJSWIVmWraNZD25undCA6/hr4i4qHRT/ukoZ3wuLxnrde70+7OR
k6nrFdMySWCTNO1B+ZeVYx60L58nvFY24dZYdd/RzeK8q0/BervjgiLYn9X/D2MT
BObzmpfPmsSSjkj9amJGEQZiW35cDAx2Npzp/NPDM0SsukbdDWwyNpw2tPRNQGhQ
W+vHgzBcVxN71hj0B74h8T8jh6ixEw==
=V2Y0
-----END PGP SIGNATURE-----

--Sig_/mfsg4c9pM3LCkOg0RNC4cAQ--

