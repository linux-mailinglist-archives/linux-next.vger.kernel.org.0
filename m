Return-Path: <linux-next+bounces-9749-lists+linux-next=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-next@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cC3RIkiub2k7GgAAu9opvQ
	(envelope-from <linux-next+bounces-9749-lists+linux-next=lfdr.de@vger.kernel.org>)
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 17:33:12 +0100
X-Original-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 170BE47A31
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 17:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 18E3066C904
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 14:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32FA1436375;
	Tue, 20 Jan 2026 14:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NCLQLk5C"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC3942EEC2;
	Tue, 20 Jan 2026 14:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917774; cv=none; b=IrMzXv5jm71hW5Xe3KRgZXXgGZvjTf7W+4SkvlYtXMrW/qN/6ncRmiVDlokEHE600rqyAcICtHcFO6IoFnKtiJGMjo0eszsSo/K9SBpTRuq5TYF3WV4dVzQ6ocYXTaWEPvQrS1ESy6nKpSn0dY/EDu5zrPAsFcY7vVHSv19rm3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917774; c=relaxed/simple;
	bh=dzolzF61cDGb90FQ1PeXhOXzWafL+h2RrOSiBKKyg9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CG9NwHZpQV540oFzqBv4NRtUHYiDW8M1tRdbcowJj+ETnOftWft1ojFOJ7ZUVDXweAdYlW8l2mKGRKh2+EtvY4qTwLv9c+G7aMam2hWklERB9OaBV0thh25QPICM9tKW2UnAfbEOdrUzrfWZqPrCwut8Trv24KBkBvrwi9evxqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NCLQLk5C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3803CC16AAE;
	Tue, 20 Jan 2026 14:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768917773;
	bh=dzolzF61cDGb90FQ1PeXhOXzWafL+h2RrOSiBKKyg9U=;
	h=Date:From:To:Cc:Subject:From;
	b=NCLQLk5Ciq79igcQhySRaCev42V7iMaQ8cGfUPbutXkupoEDPD0Z/e3Nb/uQRaIyS
	 lk8ic6G7WMuhMV3cREuA05q63zpS1gwjQ4uc/bJhb3gMf+I1Qmn4N1HIrUcw1t48mk
	 w+lWDGLYkFU8v/sVUbHibHjNQQ2CsMTYSimoDyUq23qrMDNFtzw160idAeq/4a3mVH
	 4d6XY35S5g1t441XMqT6KrO1dKEuevNVpCKbE79ZBP6eQVINwaWRh8UhKyZoM3x9uf
	 SP/w8yE4uLvf0xu/ibHgXMQbgITz9GhdTgeIHSFriUB9gshh6jwmxv8AH6TuXxzbVH
	 v+DwgHonu1Drw==
Date: Tue, 20 Jan 2026 14:02:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the drivers-x86-fixes tree
Message-ID: <aW-LCX4W9qIWNSdx@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mQsPdBD8TuOMRnBi"
Content-Disposition: inline
X-Spamd-Result: default: False [-4.06 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-9749-lists,linux-next=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-next@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-next];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 170BE47A31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--mQsPdBD8TuOMRnBi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  bb820f17b68f6 ("platform/x86: hp-bioscfg: Fix kernel panic in GET_INSTANCE_ID macro")

is missing a Signed-off-by from its author

--mQsPdBD8TuOMRnBi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlviwgACgkQJNaLcl1U
h9D1Fwf+MCFFfXwoYeCsEfuaoTsAg2gZQt+sihdfMUSu788AwKC3BNgCvIAl4Tni
DPxo8Wd12em/JQlcnutb+A7NbmG8Wl/OC0XkloM2fGVbKHd9tOAXxd2yuLTvh3Ia
O2EsAFu9nkBZtAgMMjZorbMwbYgDMmsg+hASIDTAb1VwtLppgtadyPVx5SIYwfe7
vyBYCyr0U0raZhcCO36IVEIe0qLDf+ksesYPUDiwUcri3jIEr95z5R5KdRxu7yDW
M09rDnubvi3TxIWfA1uzQ30r9HCS+dL3Cbs73CYDE2U+rQrxp9EN95XSqWS2mvlH
WH56KDVGcAWg0RiWKaCBk7XCA9gHAA==
=VM3f
-----END PGP SIGNATURE-----

--mQsPdBD8TuOMRnBi--

