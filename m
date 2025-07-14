Return-Path: <linux-next+bounces-7527-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2107DB049B8
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 23:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E76A1A619DC
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 21:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64961232395;
	Mon, 14 Jul 2025 21:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jOxmwhVC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52039190676;
	Mon, 14 Jul 2025 21:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752529675; cv=none; b=uAF1Q5jTw5bsDd5K5QyTvIzRXol8MF0V8axeA4gLK1NTUL7ZuZ1xS9piPaynN7iQC+PiiEPzonT2pw4vG81w12CQJMbFgeZkOXp57XzpzgHXRVINessDMximR2dSt+I8ZmGUJWnhNEwLMTK46LrcmPrlMOVR3krKLHVSYkXcuZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752529675; c=relaxed/simple;
	bh=zzl3UBEyb18LESYVFulpTvwL621ur031PwvoAGDIMc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m5/NH+tsVdKNwQomtcUjARsvkNP5anLlkJq/YWdx+vbG5OLGhMe/s5KRHVWDxTCtt2h9IZdC/TTQ7YChNAw1zCgi34dd7tgSmP37OmXnHC0HNBY1odyDoYWANEgb5Odbi7fF53hBuM2r0+S4jWpwqwpcNwkttGDDRRJfy/C/9kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jOxmwhVC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752529562;
	bh=W/fRJBCMj5GRLGBKfl+iK3mpOdEh9YZOTtbtk3QZG3E=;
	h=Date:From:To:Cc:Subject:From;
	b=jOxmwhVCXo08MeTbb6QpW+imAKY0GUzp1el+n9m5L0yre5CRjzJn/EPC1ncPlyJaU
	 BNnVHNx11wdkbu03DlB0D7yISYkuWnrI7lPULXzIwoecmCR80+ehajnjBeMHAe1bnZ
	 6BaZL/1vsbERDFuMieECYWEgLguAMKtiw5OZ0ugEJKAS9gIPraV3u24JMDrpBiQbdd
	 nAc+jVDWtFiyaQuw4J+W4u35S7HRJZ3fMnDxIJ2XgBvSejt9C+yKobO989QeAl3jWs
	 2CFq7dLsAwa5cEtmrwhiDikUTRqGOVBbL3X8NkOtVKz2lQhIa6Xc+orVNEvS/llvgW
	 rbbJGaIj43mbg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bgwqY3L1hz4w2Q;
	Tue, 15 Jul 2025 07:46:01 +1000 (AEST)
Date: Tue, 15 Jul 2025 07:47:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Borislav Petkov <bp@alien8.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20250715074744.5cf446ec@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IMVtJ_JCbtZPx9tGq0ROLKB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IMVtJ_JCbtZPx9tGq0ROLKB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  14056ab8aa1d ("x86/tools: insn_sanity.c: Emit standard build success mess=
ages")
  122b69a53b3f ("x86/tools: insn_decoder_test.c: Emit standard build succes=
s messages")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/IMVtJ_JCbtZPx9tGq0ROLKB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh1ewEACgkQAVBC80lX
0GwxEQf8DDJn30HSxnW/XR1beBGmT9Oc9+SInajHLerTtQ20qD25ZbdCxVlHqSO6
AvIpcJjRVPxoswbEZEedVVydu19BF986zVyRWigp3iIsWFzz8CJsG4AvKN7PzNFk
C2sh6xMxSXVYo6epjUyfE+SvL8Y9moqcFHFFTg7x17pkOLgZ+63nMygp3xINps/r
xPYJrG9oudnsTS85GcRFL/hSWMcp0eMk88l8/kANHZJkMdlznWrzfU9dCydY1pU8
IcJ4rwpi9zg4RlXcHmVcPzmOOIcdK2nn/CU9inICyncRlXzCeagzD56afh2xPvHx
oRLtiwrBkRgO+B4TI/pfbAJk7V8xFA==
=+alu
-----END PGP SIGNATURE-----

--Sig_/IMVtJ_JCbtZPx9tGq0ROLKB--

