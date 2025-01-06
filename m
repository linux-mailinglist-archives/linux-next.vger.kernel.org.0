Return-Path: <linux-next+bounces-5052-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F64A01F63
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 07:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02D621882CEB
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 06:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A874D481B3;
	Mon,  6 Jan 2025 06:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="m84AMLGS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C16522A;
	Mon,  6 Jan 2025 06:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736146271; cv=none; b=Aj31QKFNjlE7wELiRJ5c2dAmiW83/Hx/3sFBhq0F053jJW2GcUMc3yLG3i6faZZ3Wv+K6I/4gLg/PErJNgdCESzlgs+Us9nytwGcz2Y+OzGj93p1qK531ychbe5NbxHnGyMCwNFX5e60hsRYQdVGEDy+Piy4ooH/F4iqb8u5HrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736146271; c=relaxed/simple;
	bh=jBxlFjK+iQX+hodXru9BaeQvcPkG9xF3sQ6llzmf/Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LjfeZVRv94fT+VtrSU3G6lB4eeh5MDgjCptn0Lm/DcbUeq7qLpkAolgWM+S5mkUbb7arjqBkoT15z5uUS0o/YD9wZ3MdJWEOff3UqOsGJb0toj8UbAaSGvz+1c7QlH9EREdNKP0s0ByOk7crWzRwV8RiAZ5W/ZTmIJT8jLOySBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=m84AMLGS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736146261;
	bh=YNZZQ03gKCShOj3Kr/C34eyivIHW4FXdqq5Oi0GWoo4=;
	h=Date:From:To:Cc:Subject:From;
	b=m84AMLGSvxtRfAZRz+Z5gTgGpR5dFDMjyztAzyq0X++JOydCBl+8tKnsoCc50Rm8E
	 UA1k1qwxwB/gEX01iBliH237wO5lz6gEEbjNOi7DycVbal+OzPORhRUMNCAUbxf/7+
	 KmNrk8elPehSunTDaa/6G5nbXnHrEdG2f2cQVTc4B9Ku3c1KNLH81LowI+Xa5l3czH
	 VSqr5xBJNVBwz4rPoEtsWmWQJm6pGibF/gKU4NRFjYkKP7I0a/H3cMPSJ3HJTxCyb1
	 wP3Uc3gppMIh6gL9LhJewbENYWbkN9uTWQuU7eljEyHl6sQ816jlkxWQryC45Ikzh1
	 FGdK+tbaesrnA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRPw51Wzyz4x3J;
	Mon,  6 Jan 2025 17:51:01 +1100 (AEDT)
Date: Mon, 6 Jan 2025 17:51:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the linus tree
Message-ID: <20250106175107.48eed897@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QsaBjB1XfrPA3vUbD6+xhLs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QsaBjB1XfrPA3vUbD6+xhLs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the linus tree, today's linux-next build (htmldocs)
produced these warnings:

lib/vsprintf.c:2760: warning: Function parameter or struct member 'fmt_str'=
 not described in 'vsnprintf'
lib/vsprintf.c:2760: warning: Excess function parameter 'fmt' description i=
n 'vsnprintf'
lib/vsprintf.c:3037: warning: Function parameter or struct member 'fmt_str'=
 not described in 'vbin_printf'
lib/vsprintf.c:3037: warning: Excess function parameter 'fmt' description i=
n 'vbin_printf'
lib/vsprintf.c:3177: warning: Function parameter or struct member 'fmt_str'=
 not described in 'bstr_printf'
lib/vsprintf.c:3177: warning: Excess function parameter 'fmt' description i=
n 'bstr_printf'

Introduced by commit

  938df695e98d ("vsprintf: associate the format state with the format point=
er")

--=20
Cheers,
Stephen Rothwell

--Sig_/QsaBjB1XfrPA3vUbD6+xhLs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7fVsACgkQAVBC80lX
0Gx2AQf/TVmaf9ke4SYauS/kLzfVFViQIQglhfLAkMZvMOy1xpZ8JLejoMuNQDNZ
ySAYF24rJIqAa33W+gFm4j4hgtgqCFHK21YREWjCxnfjJFkoogbe8fP51oCWrOAX
p0SyjNRpmVmfIp/pSU8wSoyV4RjzvWoPJbV04Nu2sqvkM4jcZN9fTdwcfJ/HUX0f
Z/4KOe6OabQipKPlojhE1hstZgGs5CgVI+Jf0P7+GZpdpotup8FKhhEs0+JLNZuB
CYcN+/Ki23/u+2da7M6CVcwNlPeg78kbiKOA040PFmGMidByCKWXGD8rTsQN4O3b
yt3PwNUS/4pTkl+QU4/mb5UXpRO0EA==
=G2n9
-----END PGP SIGNATURE-----

--Sig_/QsaBjB1XfrPA3vUbD6+xhLs--

