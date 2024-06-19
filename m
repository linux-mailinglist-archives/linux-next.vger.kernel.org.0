Return-Path: <linux-next+bounces-2599-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FC690EF58
	for <lists+linux-next@lfdr.de>; Wed, 19 Jun 2024 15:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A3F01C21788
	for <lists+linux-next@lfdr.de>; Wed, 19 Jun 2024 13:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3000214D719;
	Wed, 19 Jun 2024 13:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o67+OLIM"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095D513DDAF;
	Wed, 19 Jun 2024 13:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718804974; cv=none; b=I/GT3NA8rf0WNpcLD8aHgbgOmWp4E0H1Sb1Ks5d1ANtX0IeVprzwBRQw/SN2Flq1817onzeIhp6En6ZrVsORQyZvaEPSYk99FLz3VxPqr/0A3axCnqubuSrsxAyHUumQvoxFzA1yM5xxRs+8ZEkd2/9TRIifRkCAxOnkd/EhVi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718804974; c=relaxed/simple;
	bh=IpiiqVWt0mCyUw592WvcQMcgbbSD/LqiNRT9+Z4Fktk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SrHZuNYi9Jb/1ci32Y93cCQcR7uTrEDJ28Rrr8v87rQpRYknn247sc+q8IX0h4ocNYb/k6iIICMAqA1VsG9QtM1GT87S/ghI1HkJffpJXvpiPL/gz8iwMTidY/Zp92QDdhmk+wJFGFLrFMvg80oiLhrI3n3tHyERWBiI9QJUiaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o67+OLIM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9BBC2BBFC;
	Wed, 19 Jun 2024 13:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718804973;
	bh=IpiiqVWt0mCyUw592WvcQMcgbbSD/LqiNRT9+Z4Fktk=;
	h=Date:From:To:Cc:Subject:From;
	b=o67+OLIMwOnyFDIXGr7ITBUX031R1vNQMYVzCMmmc6IGLITFNK35iR7q/Ee1+jpj4
	 EfKumBYD7x36uOwskflP0bR1PSvX3Ytw1mGclTljAaNruXRg1BbN8n8zptAiA/LxEH
	 X+bFkA0vc+6G2zqiRjXLiZna36DmXtHHBobtfsYk7Aj+8raf6OIaGcoSNhTrLtRWqx
	 ja5ZHu/PrE7O9iglrEIkZDi7ndH/3oh55XyTVGYhy6szPDAbdcAziuX8K+1ChHw6hs
	 at/hN3/PSFlGxXW/j1fd3r0xdqD99bQjcmt4V77UxTDvHO8AaV88R/Ypx73Hy9unb5
	 qkN0tkixiJ5lw==
Date: Wed, 19 Jun 2024 14:49:30 +0100
From: Mark Brown <broonie@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the paulmck tree
Message-ID: <ZnLh6tnEtBgi-hWi@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N5PJ11pAlrZGxV1Q"
Content-Disposition: inline


--N5PJ11pAlrZGxV1Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the paulmck tree, today's linux-next build (arm64
defconfig) failed like this:

/tmp/next/build/kernel/time/clocksource.c: In function '__clocksource_update_freq_scale':
/tmp/next/build/kernel/time/clocksource.c:136:25: error: 'CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US' undeclared (first use in this function)
  136 | #define MAX_SKEW_USEC   CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/kernel/time/clocksource.c:136:25: note: in definition of macro 'MAX_SKEW_USEC'
  136 | #define MAX_SKEW_USEC   CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/kernel/time/clocksource.c:1167:50: note: in expansion of macro 'WATCHDOG_MAX_SKEW'
 1167 |                 if (cs->uncertainty_margin < 2 * WATCHDOG_MAX_SKEW)
      |                                                  ^~~~~~~~~~~~~~~~~
/tmp/next/build/kernel/time/clocksource.c:136:25: note: each undeclared identifier is reported only once for each function it appears in
  136 | #define MAX_SKEW_USEC   CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/kernel/time/clocksource.c:136:25: note: in definition of macro 'MAX_SKEW_USEC'
  136 | #define MAX_SKEW_USEC   CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/kernel/time/clocksource.c:1167:50: note: in expansion of macro 'WATCHDOG_MAX_SKEW'
 1167 |                 if (cs->uncertainty_margin < 2 * WATCHDOG_MAX_SKEW)
      |                                                  ^~~~~~~~~~~~~~~~~


Caused by commit

  5800c05045dbfe ("clocksource: Take advantage of always-defined CLOCKSOURCE_WATCHDOG_MAX_SKEW_US")

I have used the tree from yesterday instead.

--N5PJ11pAlrZGxV1Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZy4ekACgkQJNaLcl1U
h9A+GAf/Zqdl7RO9Qe9+gwHQiwzoPkwRNGVkTZv9YWaaJbZTHcTTO9GC6TTvG/Tn
sgQFNreslQqzgJhsfO5G6Yf0jhA71AmIlEzrK4Syay/uakdDQ6kCMkSxk/9gLgAO
+Vl+hti9YIUIHgqBdfBIBIlzYjy5qSFVUqAP09JW0AvOb2P83G7OEmtPaDt4imo4
5M+k8ocnvFsHCbQUT2OKX03HVFWg709Gzrle2mpe4j8YPD4kuP47MP4vihxCyHbM
K3UUeZAjqBFjcqhBGHOtkyvL9QVFVeLtq5/fup2Wks/Ao097Qq59lWCmLukNj34x
vDdl8pQXnC4so39D6JRmKzyWG/XkgQ==
=LBtP
-----END PGP SIGNATURE-----

--N5PJ11pAlrZGxV1Q--

