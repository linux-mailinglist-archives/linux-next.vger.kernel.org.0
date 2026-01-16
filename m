Return-Path: <linux-next+bounces-9683-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 962F8D30F35
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 13:15:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 950903002A4D
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 12:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3672F5479;
	Fri, 16 Jan 2026 12:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tvv1R2zR"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902A337FF58;
	Fri, 16 Jan 2026 12:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768565716; cv=none; b=UrswK1sM9J6ZCPTs3rzRvK14hVMFg1vm8xTtZEITvneGucFYYKdDytdhXK/WE5Hba2XBQVs62KJNrWx9uvMym9dPG5qBkX1tq5sVxMlmaM4MVqVIJOlG+E4AFIeTvtETBbQ17jTJNbMbLENrFgIytT1WLdy+z6PxyknZ6+nIJlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768565716; c=relaxed/simple;
	bh=tFnPVNWd+ix4gXICj3g1Wj5BoEanRcBMzOVyVsqNmLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YhhM2yIgMYTO6w/3EKWEI4nj3PZdsAr2hnKns1Yp1N5Rv87D44lswkpT4739+FYQzSXOFJDDaPAbBnAmTkSANV8GC8mDNdtEf6b3D5Qs7xpZ4iD7u4P/NmOuOX0XtBbdDpokuDxpaFDbTC+5vJSNPTe05zeIeFcYSGmSDRL56R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tvv1R2zR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB86C116C6;
	Fri, 16 Jan 2026 12:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768565715;
	bh=tFnPVNWd+ix4gXICj3g1Wj5BoEanRcBMzOVyVsqNmLo=;
	h=Date:From:To:Cc:Subject:From;
	b=Tvv1R2zR9eyfvhhvYQUQC5bAHnE0ftHIES2fhIMR+bX2oVcuslw4sBxkTJggeAbMl
	 FSmEgB6DWLIYp80KC/SgosU3GAobofyACmDAa6zhtamOWoE7G5s6tiTj5EO3FYvM5L
	 1Y2ANkaCDDZjYXJXZBo9xKKs31mbPtCG4R4EY60a0MFKQ5hTejvVbm2ZOor+Ywc5Dg
	 pZuhTkNeyYun8YClR669bi11we+f635YLHgbnFLqTLRR3KHkY3kzMy0G5ItaniQa5u
	 Z4Y9qg8v9lc5AucEUNuahmxeE+AtRK2LR47Bsd4fgzCMMQsXyCqhBUH7dwdd8nOGs9
	 44xUBcf9njLuQ==
Date: Fri, 16 Jan 2026 12:15:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Missing signoff in the riscv-dt tree
Message-ID: <a2a97349-d6a5-4fb8-b9c5-40ab8d8e7ea0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bU9DG1EOXXZc49Nf"
Content-Disposition: inline
X-Cookie: I've only got 12 cards.


--bU9DG1EOXXZc49Nf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Commit

  46f5d0d487b2d ("riscv: dts: anlogic: dr1v90: Add "b" ISA extension")

is missing a Signed-off-by from its committer.

Thanks,
Mark

--bU9DG1EOXXZc49Nf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlqK88ACgkQJNaLcl1U
h9D25gf7BsdQue6rBPqtrxPk7jYtiW1vXomCA4gIujFW4dWVtaqU5fH95JoIGyvM
LNn+L6KPpwsYPpzS14m/6e10f+2GGMidxy20V1YwMFAh031/gYBMa2yz723TwSAT
9ay8xLHXYqHmeqmu6DXaTaCws8U9/V1UM/XXBOE3N2krJthBPq2acFspjgOJEBHv
21sik4H9bdIZDmANww2qnx1IdvMnKHXyoSTO0KdeBdnesG2HFIcAwqHv3BXUsZdE
FrqOAvp/CPGJKv3acsKOquOH9jlZlXNNZ++UJ8OHpckITLi/fmREmHHX4dWK+9GN
uj979obeMXP0KMFMJiQUs5rw9Uc0Rw==
=3qq0
-----END PGP SIGNATURE-----

--bU9DG1EOXXZc49Nf--

