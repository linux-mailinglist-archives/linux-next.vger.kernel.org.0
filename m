Return-Path: <linux-next+bounces-5510-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 262D8A3CE26
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2025 01:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10D283A7BCC
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2025 00:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A8E1BF58;
	Thu, 20 Feb 2025 00:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FJMjgVfC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD448488;
	Thu, 20 Feb 2025 00:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740011629; cv=none; b=po2KYNTX6g1I2IbEpr7IV8omXLeUG6L8KXtp2wT5xFeJtJNrY/9GiUdAS0/sZI+w0R1WHIjBCzpJ653GOnKtN1oRjPwSIeJ57C/BWmcrREKqQVPXL6srao030XleJPRd0fdlvVJaRzbnFwp65eT2gd/iELgQJ3Fs/RuFwoU8gJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740011629; c=relaxed/simple;
	bh=ImEFMO/q6ebJudwrHnpM++r/hmM1fDbvAydNIJg3HjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QhQyfeCUy7g45b9neWIpSPbgtWqVHsADJCnJ1w4yUkjtfE0hHZunIRXtSO1OQ1SKdx20yHUIrFknVlxOrFdBCX9CrgcNnKgocmGM4J6nAz7Jk1MnVRcaaI3SkyIMHwfrJMrOCIhAMLk+xmfdKlAIZt9r54SqZo21ocsMSIUsJZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FJMjgVfC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740011621;
	bh=kbVw4FNdgVORriD4OaOB/O4oJCafMyTVf7h1a0dO6mo=;
	h=Date:From:To:Cc:Subject:From;
	b=FJMjgVfCsewgIhX3igx8XKn3nZhtJ4MN2khcukZIj1ChK3E/bLUC7E2qbnArsX7Jo
	 mUFVuVPznq9wKWC8m+h5Gms7KMXNlS2TXNrg0Gw+UpDXZ0LhsErxzTM5WBjjFjX2KP
	 NQFrpR4QkDGA8fzKIQq2DCpZGUT2+tl4cUzDNBIe/LJYmoFuxfQQlpQwZKxqODsDDi
	 9UyO9g3ncMMhHffIXoqNeu+ryYHMwSc5CzwTFcJ31hgW2iSsJ6oFW72j9WwfwglQAd
	 14ecJ8Ho7Nc7+H1HIfeT4CkuwWVkf4McLoT9IRS7jRLrMe098Tmce0t7/eug2AqDol
	 t9bZyNkYEfO4g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YyvPx0F3tz4wy6;
	Thu, 20 Feb 2025 11:33:41 +1100 (AEDT)
Date: Thu, 20 Feb 2025 11:33:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pmdomain tree
Message-ID: <20250220113338.60ba2290@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T022rkAnHoByt5_nPOKCDKN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/T022rkAnHoByt5_nPOKCDKN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pmdomain tree, today's linux-next build (x86_64
allmodconfig) failed like this:

x86_64-linux-gnu-ld: vmlinux.o: in function `rockchip_do_pmu_set_power_doma=
in':
pm-domains.c:(.text+0x19aa103): undefined reference to `arm_smccc_1_1_get_c=
onduit'

Caused by commit

  61eeb9678789 ("pmdomain: rockchip: Check if SMC could be handled by TA")

$ grep CONFIG_HAVE_ARM_SMCCC_DISCOVERY .config
$

I have used the pmdomain tree from next-20250219 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/T022rkAnHoByt5_nPOKCDKN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme2eGIACgkQAVBC80lX
0Gz6pAgAh5qMhs7giC3FcvxHXLc4Lhl3FkI0A7UhDWWXm4x4aO8AGcUsur1IoAf0
WaVgHgxOVn/3UFjRRFHt+LYopvM6lXSEScT/qlMgrIVNE3w4BxiH3SVmnDyjULYk
1kUTLYtcnsSwtezoIOUE0vh9DSoNOm0rRHy106q5eMQX7WPBbqX1lChrSgfHsPZQ
Di6QcRxSm/rSEn9l2iM4y5IP3yohG/dVU8o9VgGY5p/S2kzBQCHexqjqUHFOkZc+
l3WwUal46HZJGvYMxvd4SzgGYogSrphDNpB9SKPMLarfkNahY/s3E++heGL06llj
sY1tEJQCObAGGS5LdPZCFKQbag+qdA==
=Ln3J
-----END PGP SIGNATURE-----

--Sig_/T022rkAnHoByt5_nPOKCDKN--

