Return-Path: <linux-next+bounces-9681-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 776C7D30EC4
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 13:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F23B3039304
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 12:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D43376BCF;
	Fri, 16 Jan 2026 12:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qIxgCFY+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CAD26F28D;
	Fri, 16 Jan 2026 12:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768565564; cv=none; b=IisnjJzyTPtti6Ei2GdRysdWGgT+XNGcvrHMFTP7knv2e7FTMIP+RMtXhT7KS/3b7m3sUz8vlEkcrOzXRgEezsiwWXxDGRzxepaRvNSirUnFbFYQsnAx8IVYLrOfBxmMOwgPV72eC6nWSHsydXYo4MqWY6TUyN+uP1wFB7W87Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768565564; c=relaxed/simple;
	bh=iDj/jl9kceo8F1LpSpgXEhog7/oRm9aK3wz+trKiWz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NtlCCRA76aQJGbHgmJxTjFMLpmk/ZiSUSm7YCS6/dhZqHHHM0jY5d1t3HwM/cl8SSrPjw+V/d+d2wshDxd/V7xk1faQ6nuQ5Eu/RZvRUtrhOgmIKGPoAJGc6BCzLX8oMH1ykfEooDSWoSnfvAenhAv6duyKxzEj5r0r8GDXDXsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qIxgCFY+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0E7C116C6;
	Fri, 16 Jan 2026 12:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768565564;
	bh=iDj/jl9kceo8F1LpSpgXEhog7/oRm9aK3wz+trKiWz4=;
	h=Date:From:To:Cc:Subject:From;
	b=qIxgCFY+zJOpLpyHfw6R99nhQUG8KBtCYoC6wflejIKw6v5C54CCTt52Hh2Cjb680
	 oIXRPV9T7PJDxPpgSyePgGSwv40REMdN2oXVerZoEWAFUht3wlsGi3Jd7vQiNcOpCJ
	 bo4hdcqnBa85X5UczU+Vpqzh/ELntvk7vKAQtBJpdpQ9Nxod9pvcSZRi12WLVEEM3D
	 QNi3MF2dNGvJPexalwnbVhCza0J/TphV4OtEvMhEdwGYFirWOyk1+HNVJgVDJNPlL2
	 UZqPdtTpqxerSaej4yiT9ZbhQZiGRhH/kRieiTKyB6oMxhzYQsxtnzHvR1FZAX2h5/
	 8YQbBZtXjHoEA==
Date: Fri, 16 Jan 2026 12:12:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Fixes tag needs some work in the mediatek tree
Message-ID: <6961b3ff-a5c7-4f96-9f4d-13daf1e98abc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eS3eeAGzOjiy/aer"
Content-Disposition: inline
X-Cookie: I've only got 12 cards.


--eS3eeAGzOjiy/aer
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

In commit

  e1c9223adf1c2 ("arm64: dts: mediatek: mt7988a: Fix PCI-Express T-PHY node address")

Fixes tag

  Fixes: ("f693e6ba55ae arm64: dts: mediatek: mt7988: Add t-phy for ssusb1")

has these problem(s):

  - No SHA1 recognised


Thanks,
Mark

--eS3eeAGzOjiy/aer
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlqKzcACgkQJNaLcl1U
h9AVhAf/anIDXZGmE7nqHZCE0RG52qq6KZSX9JbEiakGC3KUAmC2W1cNhwZq77s8
L1VFsqBgpATg+yg7iHpcwRJHFOhv6tlscx9P0uuKjQ+VY0EqXmVKaDXS1DwfC+o0
PD3SZ7KNpV3F5aU/NviYFIATbnWotfTblNs6NWh5Ap0bQVUa3f6bhG9BcPpvVXr7
4QMKovEDK9aQXd40O75BJc9QqXlXSs6CIZe6lY3mtMu5UPNuEnxvpkYVFMcuToTz
ZU4QTo7WaWRBr8hGsBjGglJ5fsi9SAIvgCvSIu0OCQ2TRyTAEVu58BZvza++D/aC
lvjrXkqqVfGxxjvsdSrGEncIUPIyNg==
=ahK5
-----END PGP SIGNATURE-----

--eS3eeAGzOjiy/aer--

