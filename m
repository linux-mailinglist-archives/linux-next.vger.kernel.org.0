Return-Path: <linux-next+bounces-8356-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D90B7C7CE
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 14:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49B78583182
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 12:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867D2374290;
	Wed, 17 Sep 2025 12:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzC7Qm7j"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B26372882;
	Wed, 17 Sep 2025 12:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758110624; cv=none; b=ZLP4KUPmMEDKwvrfdCn0N2dCFNUkCdOsYZGa5jmriMQKGHODUw5AEW8CBA7PTlicQ/X2uJ3H/6mxmM6plzz4eusUMTLCG1g+hCqQZanWwEvimAdJQWDQMdqU7EsgHSLh/3/t7sNL2b9u22rnlwwUEaJZBx46MeayM5XNKGvpdsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758110624; c=relaxed/simple;
	bh=EHrb4gqL1rHU8061yTQb4iB8KrgSabWPuy5lggceznk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RkCuz/wIKCSqwfdpBRiakIA3Z+cydfiBXs8awUhqMSPtQK5o+tnxRzgJJtQrPBWkiWlqJrUmGyE3Gisa9pu7DloSzgCsNowETDMDzDIjEY6Po5/vaGKrBwoar7kr9L33esgljEi/GEWh9bQkRIhQX28AlPjo3R7turZtlQODzDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzC7Qm7j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05383C4CEF5;
	Wed, 17 Sep 2025 12:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758110623;
	bh=EHrb4gqL1rHU8061yTQb4iB8KrgSabWPuy5lggceznk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kzC7Qm7jvkKwVjOdxqmUipfmdIolkXA48NHLg4RPZy7f6r5YaJECKhpzlMmwQedDv
	 qBn6Z6JuEhPIs5Kpbg5kN6QQ+8o0ZT6vP5z5XXGf0p2XFwyX1qdCWTpk5kZyMr2cdp
	 jMyt/EOXdruxwpX1+7+TN7Zx9WMtq1MTiVm6aEP9jiCcA7wJrahh3IP0sz214d/cR7
	 lQtS0ikgZVX42hQ1szoK/HivkJnESGzJyjwcFTaTgy0CDi6+XQNfUcAr/HNpCf7sEN
	 h51AMvI+XBNPQWK1t2ECUsiWaF0vJihNcmVG/q42F5qBxmreG5eoGIj7d9hZzCUvzW
	 4NLiR2+OwfvIg==
Date: Wed, 17 Sep 2025 13:03:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Networking <netdev@vger.kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Guodong Xu <guodong@riscstar.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the net-next tree with the spacemit
 tree
Message-ID: <76970eed-cb88-4a42-864a-8c2290624b72@sirena.org.uk>
References: <aMqby4Cz8hn6lZgv@sirena.org.uk>
 <597466da-643d-4a75-b2e8-00cf7cf3fcd0@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h8vWFp2zCMfk9XgN"
Content-Disposition: inline
In-Reply-To: <597466da-643d-4a75-b2e8-00cf7cf3fcd0@iscas.ac.cn>
X-Cookie: Lake Erie died for your sins.


--h8vWFp2zCMfk9XgN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 17, 2025 at 07:48:34PM +0800, Vivian Wang wrote:

> Just FYI, Yixun has proposed for net-next to back out of the DTS changes
> and taking them up through the spacemit tree instead [1], resolving the
> conflicts in the spacemit tree. This would certainly mean less headaches
> while managing pull requests, as well as allowing Yixun to take care of
> code style concerns like node order. However, I do not know what the
> norms here are.

Thanks.  They're pretty trivial conflicts so I'm not sure it's critical,
though like you say node order might easily end up the wrong way round
depending on how the conflict resolution gets done.

--h8vWFp2zCMfk9XgN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjKo5oACgkQJNaLcl1U
h9D03Qf/auRPE6g6mEJyZh5upt8xEArJkkPzZN2q9m3dfeL3iJx1JpoKO9NonZux
D9bk09lirIdMIVl7d+F8hOSeGV1tvbnKTgmhpksGSCOHoTOdNklClukJchpxGyei
oMFq9TYntSmp00szOt9batea3nXOdbk6gHT+rvm6llYt5Etdx7+I+FbIkCRRrI+g
yFm2xQP5e3eiUG0JOn5HtpbtNjhm8UHzKwo1WZLMaDzAbbzHOBQxxCNUKoGYjQmm
D1agVE1azU50EXDxNAIMbS/E8tDO48+fYJg5kYMCr1tXDS8Wgrf1bwfZMi5UyQA/
MQ+Kkl7aEsTO6yWS2gLARhq2nGxU8A==
=etPz
-----END PGP SIGNATURE-----

--h8vWFp2zCMfk9XgN--

