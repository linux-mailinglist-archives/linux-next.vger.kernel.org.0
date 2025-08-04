Return-Path: <linux-next+bounces-7838-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEB7B19CC3
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 09:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B688D1780D8
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 07:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF88239E8D;
	Mon,  4 Aug 2025 07:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h71OHqVU"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669A22397AA;
	Mon,  4 Aug 2025 07:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754293088; cv=none; b=Q8vmiiMwGx835Ywvzq9OJGrqvMrYHP4m/GGFkhJLNmyPS45vOxnYo7RCEuuiXDS5tHUkfXpz/BWhaxAsse/mezp3blRO8a8XMxhOp+Fx9+mTF7hrXOMVGtAjuU/LSwiOzpVFsUCv2Wl6L1pe0cRRLPej3PBLpWlUz8CUG+3H++I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754293088; c=relaxed/simple;
	bh=83GAS+CppKO8gsNIkaZwVDlUS7Y3oX1r8hSPs5uHBME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OISFUrmIcEcpicli/IfPoia7md6UcjNsc8y7QepwH36iXjV9Di4lEkOPm6DaEbgEXZxYmZc6wh2z7qFd36lhkWOkGjII2Y3lXlvAhs2WpdlMmCc70+5aTGGTxo32O4Dqp2Hsig1cJl1lH2kHI7FndrnYBU3HZbaEsmjjQMA0KE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h71OHqVU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DAC3C4CEE7;
	Mon,  4 Aug 2025 07:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754293087;
	bh=83GAS+CppKO8gsNIkaZwVDlUS7Y3oX1r8hSPs5uHBME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h71OHqVUmNSaxT5x2QXf9EMHconaLIsYGV3zKYYNBPwMNvbgnUyBCBYQH/8DTHg2U
	 x0tULgkWIpvrC7FIHiP0djEugc8t5h5h9C9jSS4v07PWt4MIPktJbKn8xSWLPoYfCv
	 00N1HmIkWSs6aVvwWmEgALUrEsUzNKnVfkl0Be31chdVYhAx2t/uJVSkixUZ76EfWh
	 mD/ZtQPYuPVBSOe42B4FhPvjbFO10p2vWSAbRmoAJpLRbhCP0/VZxMPGmpuLdpGAnE
	 s8F7pqfTXBntRPtMVgNWkDLPd/3op4BjE4WYriQOXy7wHVcKdtY6Jwu5PmfnwjKP3R
	 Mlz3KpIEHeJLw==
Date: Mon, 4 Aug 2025 09:38:02 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the sysctl tree
Message-ID: <4yrgfb42gdkxx463dy6m23i2nn6ffjx4ao7zgzzwuom3dceogh@obvawv5mxktb>
References: <20250730171626.5ea7e0df@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rfof2pxnbnhtfaz3"
Content-Disposition: inline
In-Reply-To: <20250730171626.5ea7e0df@canb.auug.org.au>


--rfof2pxnbnhtfaz3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 05:16:26PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
>=20
> (looks like all the commits in the sysctl tree)
>=20
> I guess it was rebased before the pull request was sent to Linus.
>=20
> Please clean up the sysctl tree.
Oops. My bad. I have pushed back sysctl-next to v6.16-rc1 to make sure
that it does not have any of the commits sent to Linus.

Sorry for the noise. I'll make sure replace sysctl-next with the sent
PR. Especially when I send it early (like in this release).

Best

--=20

Joel Granados

--rfof2pxnbnhtfaz3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmiQY1EACgkQupfNUreW
QU8mLwv/fBkDa9VOeb50iSNCqM9oCYojQAQihJ/L2eCq0FyNU9JfRcO4CjkYaiYC
Tw2MuIQEJVbo7jR2tro6bpzpifANQwhQoZPXLqMtZgCBrU93CV+qTeLmmSeRMcDZ
c8z1vFKjGSnQ7SLV8rqVzBl42G5EZI5lW21IZYUwOhjTJoFRMVpQd5GcIn0h6ZXf
4iUtZAnNyAZB30ZluH1qZHpvTX6+nLLnufoZqTz63CesxMiVFwjw60sylnXEUA4i
8oIeAeZ/CUYwurcPJ5vH7RBViHH314yfbxC2tGbm6bfPkv0NWjQoljJQ7uypNK2F
OPY8ZSJzhpvsRf5S9VMuhd8ITIitQu3aBQRdw6jYU8Q3n+eFWtOtpp2bZZ4iOODL
06mLvgQ8FVSjSLdu6P2JvcGXeZ32XnoTRsYc7TtlXJQkfcMq6V/h54zsVPSrg7ZY
Xp4r/1io/Vsri7U+g8x9lg4Kt/MXD7Dys39I5sfY1tTFLNEEXLq93Az8DWzoF2vM
9eAOSEPD
=OUaP
-----END PGP SIGNATURE-----

--rfof2pxnbnhtfaz3--

