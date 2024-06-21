Return-Path: <linux-next+bounces-2637-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2858912E7D
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 22:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C811287B7E
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 20:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DAA6146017;
	Fri, 21 Jun 2024 20:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbktpSIw"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C75374DD;
	Fri, 21 Jun 2024 20:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719001856; cv=none; b=UbaVhLG9DtY0ERf+3IcZ4B+6hFxyjLtDACRX8M60mX73CWE4ZNp9KUsWs1yWPPIAHBtsRKxnI6D/NR2T6aETPscJ/ukwtaJaoFeij38g83a9D9tfzUDLvMFYHoaJLOhefB5J7i67SPi9zIMkwzCip8+HcvlyDHDJSxMc/cpsMT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719001856; c=relaxed/simple;
	bh=Fz1obuJu2KySblgdOnyn6EyXXspLQtoucM1rWIb5h1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHzGi9y3iXnkOqVtj2SR/aZ414qMZaP6GECK7XUqIZxBeeyIGVzH11b2Wc2izKgDtZfQWALajzOGgTDTyADPm0TcIVIHKAiRP+NaQI1vYdEri9HJZnDjZKeF/nt5hlJeT9QE1JS8cvId8x7xGNcTKNHUdoJ16CRvpVztwQRjQcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbktpSIw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41883C2BBFC;
	Fri, 21 Jun 2024 20:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719001855;
	bh=Fz1obuJu2KySblgdOnyn6EyXXspLQtoucM1rWIb5h1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fbktpSIwNSQbvA4sxhtDrhE/2nesPbwVyH2OPBo4aQ8dF+JnNEyM1XqmvDw3BrO6g
	 0gBs0oiu1yxRfEGCOD2lju4Qmxwg0eHxzqySH3tryUQoGPPx0pZfYoWNl9em4VzqTn
	 E/wCdXf49bEnuBLUzHukl2lY9exFUWraJIGXclNuFXGrm7nEIX7Etp1HPdcMgkykHV
	 nbPNgmmT87SwrxYX7PuXYXU46/i+uJimFKr4lo1Yix8xSQrNG1Xye+pXK72hzSQjSb
	 KRNWmWOk5MQqiE2TbKOnK6Andlwc4Frh25cN1rFmhY9jPGLMenwqMSTW2lb8p81VFS
	 ooPo94YcR4Hog==
Date: Fri, 21 Jun 2024 21:30:51 +0100
From: Mark Brown <broonie@kernel.org>
To: "Gowans, James" <jgowans@amazon.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rppt@kernel.org" <rppt@kernel.org>
Subject: Re: linux-next: manual merge of the memblock tree with the origin
 tree
Message-ID: <cf013a59-a297-4685-94ac-87566023aa5d@sirena.org.uk>
References: <ZnRQv-EVf2LQ1Cjv@sirena.org.uk>
 <eb58b1b2f84444acde3f9e25219fa40c73c499f8.camel@amazon.com>
 <db13f2b7-88da-42db-85ed-d78cdd5f6c62@sirena.org.uk>
 <e6f1bf73d13060635520c70df269c0b390352f37.camel@amazon.com>
 <44ce3730-8e4d-42f9-8b17-104805e46f93@sirena.org.uk>
 <9262bfba5d65c603dcad49a75e5a30564f75c3d4.camel@amazon.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Guoj/QETIVZljXJc"
Content-Disposition: inline
In-Reply-To: <9262bfba5d65c603dcad49a75e5a30564f75c3d4.camel@amazon.com>
X-Cookie: Androphobia:


--Guoj/QETIVZljXJc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 21, 2024 at 08:08:53PM +0000, Gowans, James wrote:
> On Thu, 2024-06-20 at 19:00 +0100, Mark Brown wrote:

> > Yes, the merge in -next is wrong.

> What's the next step to fix the incorrect merge commit?
> Looking at today's -next I see the same issue:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/mm/memblock.c?h=next-20240621&id=f689ee4c062317a0831fbffeeb30d7816608b2e7

It's remembered by rerere, hopefully I'll convince rerere to forget it
on Monday.

--Guoj/QETIVZljXJc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ14voACgkQJNaLcl1U
h9CQ1Qf+JW1zyHEWAdd4W3LSLlCiyB2U3kwn+bug8P2iTXmIrQOQALbleXwmZXiS
pPLI+DMwiULsJ47Iuw69L6twkg5zdLg3l4p47q9PAmj4nIp6gw2AjeErFu+Kh20f
gDMhwr4vkFJOwyZ4Z13C+kQUsPhPOd4GhkifP3eQa/srCysqQ/RvdlSYYO+0ylRU
5XymmxXgCCeuvySC33CG1eLOi7eSASyJRduJAt3weYNAhz1pOSWBq7wghiDbMEAP
wkNe1oV+nm9KoLWghC99iHrCNxApukLGfWw5AHGo0dHuawAh/JgEHd3PiIhxPNCx
SfkmOWg5tBfO4EqlJZoqK3afc6Wf/Q==
=/IqT
-----END PGP SIGNATURE-----

--Guoj/QETIVZljXJc--

