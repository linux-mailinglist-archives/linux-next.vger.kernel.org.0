Return-Path: <linux-next+bounces-9751-lists+linux-next=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-next@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LxKF0Ckb2n0DgAAu9opvQ
	(envelope-from <linux-next+bounces-9751-lists+linux-next=lfdr.de@vger.kernel.org>)
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 16:50:24 +0100
X-Original-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 414AC46B9F
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 16:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4200D54C757
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 14:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9DF43E48B;
	Tue, 20 Jan 2026 14:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IxrUrPLp"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40B643DA31;
	Tue, 20 Jan 2026 14:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768918206; cv=none; b=gPYgF9blWJyqod834RIALqOAUJBN+AAEc7ur4W/7YXhtmYN67xmipcu8xsEuuwUdiZqIP8F+Jeavzp6EazyCC17beGNhW67baQ09yd6o+/3X3nCSPEnmX6mrhCuJzCYsaparjrdynKAFh93Vgrj/gpWRYengEKrKxvpXy60QsB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768918206; c=relaxed/simple;
	bh=xiEWWvYXjQGoblDkR+TM4RZ9DpoEl26DG4bqYZLk6wg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QsFOtc1zVVBcBl1uD5JjqqmeL9txurfDX9OYghgimP3n8Y5oGQcRf7c8lOjdaBRKiWufvepP75HAx6aQcJHqq9QuY8s0s2MuqkYhg16hbJnvH4oqOFVAD9Q3l9x9OlynZyhD7DnHqPwql/7RFW/bbBhAwJlcWoSM+TNCows8ODo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IxrUrPLp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840C7C16AAE;
	Tue, 20 Jan 2026 14:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768918206;
	bh=xiEWWvYXjQGoblDkR+TM4RZ9DpoEl26DG4bqYZLk6wg=;
	h=Date:From:To:Cc:Subject:From;
	b=IxrUrPLpYAqRxkAbW1T/quTDOj14Px3VWVUYtPUqqC1paenwjhSnC5wNHgHmlmmpH
	 FDsgZbYOf0I7dSRJOTmjgNbMf2+jP0gs8bwwgt8gJoSoa2Z+SW5H3nBo5NV2rLNw75
	 +jzyE3JYbIUH3JL6X7VU6u1TdOhQ93S7mOSir/WLx4AAJZBIHq45/sdueV8uLyovZp
	 mP4pR0yWxxS1x8Gfi7LLSIwI4C9D55iO4UnBlFAAOi51sQkGBoRiGzrHzcRFMDro3n
	 nbND6dhTGTBw+it12bSo3v0UWy5WqKsHoerGXwrb81uqRe230yT0heqheeEjdv1cac
	 hGaB1gnBR15fw==
Date: Tue, 20 Jan 2026 14:10:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the at24 tree
Message-ID: <aW-Mur4VZrCg5gjM@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wmmTrZ6Zv4D3BrZg"
Content-Disposition: inline
X-Spamd-Result: default: False [-4.06 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-9751-lists,linux-next=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 414AC46B9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--wmmTrZ6Zv4D3BrZg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  c6e79d34bf80c ("dt-bindings: eeprom: at24: Add compatible for Puya P24C128F")

is missing a Signed-off-by from its committer

--wmmTrZ6Zv4D3BrZg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlvjLoACgkQJNaLcl1U
h9AYsAf+PB5QhE8HPzOcCYw74NiNKANtd5R0eZRRer0COvP46HPMhg9+apkcaoUC
Vxrz1OEYwaeOAEFPHEE/6vcwX/AIJOew8P5UBQx7jN4t5mphiM3QPstxketPPWYs
vGLxPmfBTHcBgjqgTlxiOh4ucTki3sKvC7fNzGb1bwpWuNqHEVfhTstb53i5tT0V
jT6Q/tM2aFvMZIJFhHbVwbHH6w0yAsHt2yGSMAHo2wsjn0ngKQ1+VurspJybRk14
t7mpeATBQ4T3p9Jcq/PCflXN2x/A2McqdLUM/+cUfDL3l0CJ3WIc0cha5pg4HrsL
xwvrawmNikx2SlKyrzJh50RAK+2XFQ==
=SibU
-----END PGP SIGNATURE-----

--wmmTrZ6Zv4D3BrZg--

