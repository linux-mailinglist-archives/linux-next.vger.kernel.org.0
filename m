Return-Path: <linux-next+bounces-9755-lists+linux-next=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-next@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHEJCsKub2lBGgAAu9opvQ
	(envelope-from <linux-next+bounces-9755-lists+linux-next=lfdr.de@vger.kernel.org>)
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 17:35:14 +0100
X-Original-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C5547AE7
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 17:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2590C9817D3
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 14:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECE842981A;
	Tue, 20 Jan 2026 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="REuQsjee"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B693612CD;
	Tue, 20 Jan 2026 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768919889; cv=none; b=dzwM/UUJcDyPM2yDLP0iPc4rhavzFLgxsEhPQgiUw/5luyfK/AhVDRdYQBPBtbmTkCrA4AqX2xLwnxFOrlq/xBjklhEArfZVvMIkdR573k3yv8urDkEfUctN2lLpd3aXedooK2MRibQsSvsHUA46kdJx/8hALiuwngnk0R1pg88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768919889; c=relaxed/simple;
	bh=61yZ5yWAbpKfyGFPxMid26UMLaO6f9MI6Ne8Pkicft8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sctJv9IQrMjmOANdJE7GYTHkTta2jTDc1bn8UWKhZpo51UVWK0I41404bJDuL7gahSVkxsvZBU+5cwnlcj06CoErloiAH1bSSpg4V4HLKJ6El3+M7uc5y0hPj1ulLNOVbc3NaOX0POo579Js4f0398tgPCtGXV8qM6wFp9mq6Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=REuQsjee; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2D5C16AAE;
	Tue, 20 Jan 2026 14:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768919889;
	bh=61yZ5yWAbpKfyGFPxMid26UMLaO6f9MI6Ne8Pkicft8=;
	h=Date:From:To:Cc:Subject:From;
	b=REuQsjee+KS4+TVKWYGSEjvOXGUsAgsk+DeeCzcCfYpVBExSzaGqmG1fIt90DQ7WB
	 P+PsT7jEJSMxtnf5+BRj49gResL/SA89i+oVb0wduPp8ZcaJYQgm8ydnXtQCP2Wong
	 mQMUy3jdv6tFv7eNwQt+oHH7BQIlMycwErF3o7ny7gemGqjxtvhL7Uwo6KHGDj63lN
	 YpvxagpclhYypjbyU+EZg+xHPkWjVCeSAvl6Yqu8nct0AuGiZsTbvIRJyV/upf3UjV
	 9lU4uw13VEa+V3j7222Ijwc18t1nOpcw6eIDH9gr2fXfnklWNRI4P/YlJUJ/IAiMSh
	 rdYsxxGK+3oFQ==
Date: Tue, 20 Jan 2026 14:38:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: -next status as at v6.19-rc6
Message-ID: <8aa94614-9fa3-45fb-9e7e-17f147342aff@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0AoONI9w1Hs7icec"
Content-Disposition: inline
X-Cookie: The sum of the Universe is zero.
X-Spamd-Result: default: False [-4.06 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-9755-lists,linux-next=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-next@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-next];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 89C5547AE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--0AoONI9w1Hs7icec
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

You asked for status summaries for -next as we get towards the end of
the release cycles so I figured this was a good time to start trying
that.  Not sure if this is useful to you, or what other information
might be helpful.

Trees currently held at old versions due to build breaks:

driver-core	next-20260116
iio		next-20260116
iommu		next-20260116
leds-lj		next-20260108
perf		next-20260116

We also have the Tyr driver marked as BROKEN in the drm-rust tree
because it does not compile (Rust got picked up by all*config since I
installed the toolchain in preparation for running rust specific checks).

There are currently signoff problems in these trees:

at24
drivers-x86-fixes
risc-v-fixes
spacemit

I was also thinking about trying to do something about pulling testing
status from KernelCI and flagging regressions that they are seeing but I
didn't actually do anything about that yet.

Thanks,
Mark

--0AoONI9w1Hs7icec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlvk00ACgkQJNaLcl1U
h9DWGgf/e+Ui51SBtjunx3y72vk7dFWZS2E7qqot2cKOHTAdg31SdIFtkh2Mt2b5
xE7zl0Ukd+KJS40ypzX4b21oODwHc98hdyjEWzX4CakwTY9yMtz5eaH9DjC/mkGp
I8VXh4bvNDayb7WybZiQkCkVnq1P241GzT+IZCbJJqD4tN1zHYRnXk6AdRBECnpx
+yYas1HwCfK9u9i2yjRkqT6ZM5ayP2KDWJUpEaMxWj1EM1Rm29f14QnPRZlSLdVv
5eAeg8NSTWcmXRjiaH1ATxc7CFj5sKYOmph7RK1act2Z9Xu2UsQITshMRjLf8ayo
L2tDUKJZEvSsa+IbvFoS+aT4PZ8z3Q==
=tCai
-----END PGP SIGNATURE-----

--0AoONI9w1Hs7icec--

