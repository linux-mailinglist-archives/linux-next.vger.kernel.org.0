Return-Path: <linux-next+bounces-7552-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D03DB05591
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 10:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E5653AC8CF
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 08:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BA127510A;
	Tue, 15 Jul 2025 08:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="s5YtX297"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E972A27511B;
	Tue, 15 Jul 2025 08:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752569754; cv=none; b=fk133vSZOMVaM0A5D9LOESf7TdPYODo9mGw+BwFWZrxilhmAy1QLbL3saiaKM4/E59xBtlw3j+maNOpz+CdY6ZxRvjuH49Ej8koMf781hBSbtXxc/KCZJC3TTxu4bPD+LIOQGt7hbiXT8XiyIaVS5K/xutswfr4t5S6afBDDrpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752569754; c=relaxed/simple;
	bh=jKRrou7s1Ipc0VZqMZZhD7oP3gC0xxegTsPYksIhZZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bIfN6yVmxqnua3LHD897dnoMM5not8T8KebxrBwpd6inHnyON/aau4JYXnsUhD8T3esNUoYOZiYmjpRDK2woIvL2b0lGc7MMpeZ2ZL5w8lRc++fDK5bVuxDrRXSwYqVx60mmXMHxuyeU0GhK/POJmZUmuFzDWQDMgrUmgB8/0Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=s5YtX297; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752569641;
	bh=NuOYpjEuD/qBMs4xwuG7i8ba0v+MWYNTIeyE8cs9fEw=;
	h=Date:From:To:Cc:Subject:From;
	b=s5YtX297AzQa5qENN1Ga34oxJndGU8j8cjHF+BAHtJav6afKX8+MAZl5Phjtwjayk
	 wUnAPfq/AbST3AuTafPntBr59gV+BNS5JYUB3nkhtxAwf9pa9Z046TBo908DJ1ZQwo
	 Py/LFmX7zWJrMnEPgFQ9pVCwiiIhbqFNLYquklY2OHIWFDc6076WYOjyciYlzx35jF
	 FZONnQd0ADMw5d4h7EIPhmVdk8ZfnDKJVaLCtCT7Nyftka5As+FEoS9foeHKrA946N
	 DIhegj1iqJB+BzLM2C/gnoliPVkRcrx5e5++H3vU1tJb+jxTa4wl6QAhNQzm/TsOKL
	 0RBTp7w9YNtRg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bhCfK2Y22z4w2H;
	Tue, 15 Jul 2025 18:54:01 +1000 (AEST)
Date: Tue, 15 Jul 2025 18:55:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm-unstable tree
Message-ID: <20250715185549.264260b8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//9axO09oPZom.YCCSScsGl+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//9axO09oPZom.YCCSScsGl+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-unstable tree, today's linux-next build (htmldocs)
produced this warning:

include/linux/damon.h:629: warning: Function parameter or struct member 'cl=
eanup_target' not described in 'damon_operations'
include/linux/damon.h:794: warning: Excess struct member 'callback' descrip=
tion in 'damon_ctx'

Introduced by commits

  dff2bc66ec7b ("mm/damon/core: remove damon_callback")
  769bd386e490 ("mm/damon/core: add cleanup_target() ops callback")

--=20
Cheers,
Stephen Rothwell

--Sig_//9axO09oPZom.YCCSScsGl+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh2F5UACgkQAVBC80lX
0GxVBQgAlFVidAv9oEEGN5FskarV/A5p8DmuvJBasqDDVFq7B5ph26fMo5/WNklq
XPWYOdaip1NccSNmf9R6loGPlMuLOMK+dPVjtCzV8nS0bxnGEGvaOZ5XRg+iATae
CD6Ay9sEi+emzbReeHhcgiVHh73DqFpahSJ7JjZjT7SZTKXnALc6DGVH12UU3fzL
IOqwKNDJuRL1VzwT1h6FbTsFCGirVyC/XBvqoStJeOxKIiCVCHVQDvbGxVf7OetN
uLLFHV6rd0AAguAVh8Rq4v+9DABkj4dkkqneLdH2WpYqbIiqALYIihxz7Qi+nYvO
0Xe7LpZR2v1CxkCsO8kh/wThmaR+6A==
=Xt5P
-----END PGP SIGNATURE-----

--Sig_//9axO09oPZom.YCCSScsGl+--

