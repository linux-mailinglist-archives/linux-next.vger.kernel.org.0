Return-Path: <linux-next+bounces-9020-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B39C61BF5
	for <lists+linux-next@lfdr.de>; Sun, 16 Nov 2025 20:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C18003B00D0
	for <lists+linux-next@lfdr.de>; Sun, 16 Nov 2025 19:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A909323D29F;
	Sun, 16 Nov 2025 19:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="s4B6ldQi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D36A1A9F93;
	Sun, 16 Nov 2025 19:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763322558; cv=none; b=p1Rakd+mnuHpQbyc4s9DRVKnelDJ/LzibZ6F1Y48KhbBPmKDEoSvpTPTQvlCGBd3tvsMX0bORg/GJ1RZouj26/k5Yrk/HNbos9sZlf6GH1Ekd4gr/Eh3qitmq9vgesQzxfcVayLSSpKPznq1F69kHq6KRPX6JOzOYPm8908T/x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763322558; c=relaxed/simple;
	bh=r8gWMLJNGRItG9YyOujQ9vkRAhY5GQpfsswnbeqLUss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cTdgX2SGj8IbchZYYuG13FJK1Ug/4nVUpExZPhD5MrRM4l6b+ImlTxt67bvoYUkFuUBP4PRFnnilL2YDvEGcDfUeA/P3uth5TKjSYBscqbizx/R3o3vJlNB1GGdVuAJpvpGQuv8P0av3hrR00qimW7Ikbug8Ba3yLjj+P9Ny/Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=s4B6ldQi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763322554;
	bh=M0SxqF2ESowX64vFRgILV6oWRnoey6w6O88SxpH5SdA=;
	h=Date:From:To:Cc:Subject:From;
	b=s4B6ldQiMkrTUXVG8YmKBGx8j471Rlag/NTWsLQgk0M0JBRJmmIiSumQeyABehv/S
	 p+9g9XM9B/IlhDh148vO4FYYVp05gkDGE4J7RbVSNV+dg4KoBcFGiKc/7zLobZH8WI
	 XHHgxduaYlsnILKFYoAZLdNjBA2bRXgf6OzNR8MsWBz999HuOClhDwaoNXAUOF/wPk
	 nXuUWCOjJL7q4IQmyS+ad7x6dgujKDPwqt8HZK+6s0BGLVonCjoemBYZo2VfsYJ2Ly
	 DWxAHDy4ce+no+EiD8YpAuFa0i6VseAva2o4u9/Ug1dRPET1qq9eSwuH9OJcXVHRVm
	 tGu9Qzs1Gs9zA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d8hK52zsVz4wCB;
	Mon, 17 Nov 2025 06:49:13 +1100 (AEDT)
Date: Mon, 17 Nov 2025 06:49:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20251117064912.407640aa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=a+mvx1b0dfjTffyXiZnY9T";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=a+mvx1b0dfjTffyXiZnY9T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  1c7ac68c05bc ("x86/acpi/boot: Correct acpi_is_processor_usable() check ag=
ain")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/=a+mvx1b0dfjTffyXiZnY9T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkaKrgACgkQAVBC80lX
0GzOogf+IgS3727rus5xFGjBIjT7UJZeIa4W/jq+LgvoSno6X1KtJAc46Z/NV58E
djlEq1mSFPptE2OkzaUSIQwYCHjktyn8hYAgkgNqMVo0ISisutdyWPUBpDcoPU+m
MG4y58xADYSd/FcfngDxqEUEyp0gROZruH68+tumK99Wvng+cRjJm6V+20ZrrLSQ
vqLlSNLh4ua6rliOGPsm4z9+LoK/FCVF8EaONKK4dniCH0pMfTpVoqGKF988ly+p
+IHpko+hhj+JkXRP4DVJ+8lM5eqYTZD4ECvHF6iIxjvTSHM1hCKFVK8RI9m4+am+
xluZEc6U4T3emRKW9GIkETHK4SkzpQ==
=lJ47
-----END PGP SIGNATURE-----

--Sig_/=a+mvx1b0dfjTffyXiZnY9T--

