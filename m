Return-Path: <linux-next+bounces-5372-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F155A29B70
	for <lists+linux-next@lfdr.de>; Wed,  5 Feb 2025 21:50:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A18A71611E6
	for <lists+linux-next@lfdr.de>; Wed,  5 Feb 2025 20:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E7D2135C5;
	Wed,  5 Feb 2025 20:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SGBcboTq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB99C1EE7B3;
	Wed,  5 Feb 2025 20:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738788624; cv=none; b=cIT4gnHSTrQBFhb5VqhE/YsdvLi94Kuv8ncz167ZRwReMsB6Px4WNt4X8JyRx+CzaStZmI7wdwWnHuAegZQdFX1SuZU7Z1TRubRmqEF8eDxrNZlgZ6hc/1rXgIVR9GSjbYQT3imJbOfn0zVVQwmyJNtq0pMzP2VisJZJUT+A5xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738788624; c=relaxed/simple;
	bh=L0QHINaEQ68PhVJgxMB0FORbN8d2/bo9yzieldvMnfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nZoMx3n1kHwwxTFRvwri5HvEX+OWAMJjWdcaz/9YvdcvU9yYg+7yNkSlIu2UTaNei6chxUqK5ePumwOAIV0LPzMeOzIRyvA5b72snK48q/O4MbUl0xzrzHeAjZMM3xLW21aJ1TWiO/teOr45msUCewIzFPNcMINgKaAIwAJWwzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SGBcboTq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738788607;
	bh=4mxa7IiVJo1L9VO3tg75DkLvM4qfg0Z3b7deztHBhjk=;
	h=Date:From:To:Cc:Subject:From;
	b=SGBcboTqEoqeipl6+XByVuZ6tb0GiRCsKPnBwwp/6FvCNAWoOIXX1lVu/9ewtup5y
	 pioXyMuTJMN3vxXf/60Q/IeRznAMAGhl3bHAzsO/DY3Z8eg7+JsaCmgydPBPSJcsa3
	 +dtQgwmLgGN4vIqK7u0hnLGH0T/3DMgh3xMpYXy3NJ0jNokzU+c534w52cfsgn54sw
	 4gH1BdrEA3KHUl6/tPsom+VZcNTCYTtPueou2HZRypzPVnwEU3UYGNHiLJuVhAzPn8
	 2O6ELAO9HI/DmBrA4FhQFgMp+Or2yCiP6S8Oe0Fkv7fXEpvOs6Mgcg3iSncRuTC5wf
	 pFXRCJpIaJYrg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YpC6R2mK7z4wcl;
	Thu,  6 Feb 2025 07:50:07 +1100 (AEDT)
Date: Thu, 6 Feb 2025 07:50:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the kbuild-current
 tree
Message-ID: <20250206075016.7eb8243b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xhXR.N/2hhiHg25Q3lOg4RW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xhXR.N/2hhiHg25Q3lOg4RW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  efc96be55fb7 ("kbuild: fix misspelling in scripts/Makefile.lib")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/xhXR.N/2hhiHg25Q3lOg4RW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmejzwgACgkQAVBC80lX
0GwuTwf9HkTJ2LuEOuBoCYjkCQYMmkQFuQivUvRT9A/I2ltOmSqaN0pL+uzpK1Rc
nQflKXcQIz7Qudg0UmkjJODqVAeDK+HWBf2RlsdSpFw8dXXku1nnzC6Z4VxuvsW1
ia7kIXfZhaikZmOLky8DEKQyQ1Jhl6CA90W080DhurnTwpuc7s3QC4z010RJ81rD
rjTEFtWJRA3YY6O/Bs8OOH4dQKKPeMd8dfxdOpBvlL7ZsRDrK0g1D3frfcuP+rM2
AMsPtMyWg25vO3TJT4fNQqiTwqNPRtDQdbxeF9V3TBmQnsE/pqRZmWZ9OgMUmpVO
wDlRlW7YElOIX+U+/hO56bZmXBIp5Q==
=TeD5
-----END PGP SIGNATURE-----

--Sig_/xhXR.N/2hhiHg25Q3lOg4RW--

