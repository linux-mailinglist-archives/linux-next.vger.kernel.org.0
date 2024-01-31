Return-Path: <linux-next+bounces-930-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CFA84493F
	for <lists+linux-next@lfdr.de>; Wed, 31 Jan 2024 21:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B611E28963A
	for <lists+linux-next@lfdr.de>; Wed, 31 Jan 2024 20:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E7F39860;
	Wed, 31 Jan 2024 20:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fb/k0goA"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3529638F99
	for <linux-next@vger.kernel.org>; Wed, 31 Jan 2024 20:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706734571; cv=none; b=ngk4tEL9NB5N6HrOec5l0SEmP6JHWQfWd+3DxoXYduc/y/zmRW9gTEeRbzejFgBPPwCRnQNqj2pUVSshsdO/C3x/njwzC4V47FUwimEenCW2XLrId3jtuaYvIBsX+npDo4QY/+dnT03QIQdf1ko+8WIS/DXZEqdhL1nGZtIHYTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706734571; c=relaxed/simple;
	bh=Z1l2LmR0mDCGtol5TfQcxHTp/15ucQxSXyfTbVBhk6I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lgPoQXAXZI1JlyBhcYAWPrnni4pnMn8uEQ4Z6VSFPWVav99cALhr0tLHvsG2oqhWrChZ6GvFaMymvC5MnaCsVSuo/OBvr4AlNw5cpyC6ROGvbMb8r2cP9wn5EgpBGKY5wRUWz85zAkzbcj+LUQu/2TwrX/k7W+CaXUC5WhZH+yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fb/k0goA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1706734566;
	bh=Z1l2LmR0mDCGtol5TfQcxHTp/15ucQxSXyfTbVBhk6I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fb/k0goAwlNGhWCFygRSiOUuf+XsbI9T3XxRNeNxaOxmb8iMMyRLvUDi1xPVVANWs
	 SA0I4KJC/GG+kbo8xp9RG3o9HjWRToihJl4d68AUuPuxqTlWuL/LqpJgL8uLICnutq
	 JmOhB9KR5ZqwT2Yt3M1bAbeJ4HtixJIkXQ/5JM/UaobS5iOQ1Ld5onf6OVwjiBT8mM
	 8o7URC5MI6k2R+Iiq5LWNwd2JWZzyt48tsn0uNMAFnQPqZn6wXRjs/MAqSUwKUrRXY
	 q6XlngCK/SOEZ0+dqXGXkL3RrwO5WnDQED3ZklMBgLRbeiUKbfedh5toG2IkpPC1u3
	 bkdWmmNMMx4sQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TQDpZ21f6z4x2N;
	Thu,  1 Feb 2024 07:56:06 +1100 (AEDT)
Date: Thu, 1 Feb 2024 07:56:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Subject: Re: Request for i2c re-inclusion in linux-next
Message-ID: <20240201075605.5db74042@canb.auug.org.au>
In-Reply-To: <xewyobkwecyhluztyrpwzhnuv3f25eq56iwkh3obfzxgqghe7p@2agb275csehd>
References: <sripk25leahdjiziacby4ql45kspw5cd3ic5vj23lctsawc2lm@be4sg32fjilu>
	<20240128142804.21d49045@canb.auug.org.au>
	<xewyobkwecyhluztyrpwzhnuv3f25eq56iwkh3obfzxgqghe7p@2agb275csehd>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9BxdiR2PUm=yCoRxhG2w_a+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9BxdiR2PUm=yCoRxhG2w_a+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Tue, 30 Jan 2024 13:35:35 +0100 Andi Shyti <andi.shyti@kernel.org> wrote:
>
> Thanks! I have renamed them in my repo as i2c-host and
> i2c-host-fixes to be aligned with your naming. I'll keep both
> naming for a while until you decide to update.

I have updated my end.

--=20
Cheers,
Stephen Rothwell

--Sig_/9BxdiR2PUm=yCoRxhG2w_a+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmW6s+UACgkQAVBC80lX
0GwGCggAio3JraZVFQd+eNuhAtZS2kG6I87pxSHWKq4KswvU7cx8xEqH2a/G6QyC
7C8mn6u0OMS28rNLY/uCg5fj06dV4hR6rQTEt+VLKEabb5nuKjPiZLC6qyWk2ujm
Hbpmxls315ncUkU1qw1AG2cWsMi9g5SoddD0wZN76bklHh2IapMJTHAzfQhlU60v
LTEB+0mfYyJtIE+ehXxvye7fZMzsN3pqmyIoPXYFyd9Al3mcjR8OfF/972YRlNdv
OYCwu0VxnHuo9e4rtuvgG/ggan72kxzeZ7VciJU4H7VbQdKP6mRVMQY0VL/oaKuT
SGXSkchsc5/2t84W7pYO/iKCmSyOUg==
=SUYK
-----END PGP SIGNATURE-----

--Sig_/9BxdiR2PUm=yCoRxhG2w_a+--

