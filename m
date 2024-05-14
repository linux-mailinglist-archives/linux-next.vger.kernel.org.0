Return-Path: <linux-next+bounces-2303-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4E08C5DF8
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 00:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65DA81F21C73
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 22:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA90E182C80;
	Tue, 14 May 2024 22:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6Lr7PJ1"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE82181D1B;
	Tue, 14 May 2024 22:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715727522; cv=none; b=s+7JdgZHmOG3AGADAgLkLDQ6AWEnULmXfyMSOZhhLNcRXj1lHk/W0+LaUaPErvkCk2++nFq/120mndyoq8UdhdUAsGbLoMdj6PllKNVP4D8JbjIUW/hd4w1xhIqj2bN/RWPVaFzISWM5d5Kno947gfO39rcjWYC08w5yNxEOHik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715727522; c=relaxed/simple;
	bh=P68nGb35VuSmvcz4a5Xdl1OHScwiNVJfyNM8iyNvWm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dUVSCjXnITrj7chf4kaFR/pAY5B9bG47ObANi9MKLRltOoLqpfePnEeBUEc+e9NQ5QAOv0OD9oiT2r+Yw64NRMvSlexq4zgu0/MJ4xX0zbypcWx0OeCjF8h95aBBDvwcBzcNncX4ccqojre0FW1rA9dUW3+t2cy7G/yNd4o80h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6Lr7PJ1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC015C2BD10;
	Tue, 14 May 2024 22:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715727522;
	bh=P68nGb35VuSmvcz4a5Xdl1OHScwiNVJfyNM8iyNvWm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j6Lr7PJ1MhCi+cxGEe2pA4qRghtPkcYtX5vTWCCrVVLy/EkAuB+OgA7C2NIuqgbHL
	 gjSvX8DZVH56I740m4uanLNfalhQeKH/AAiAZdkXATfz6lSXXjFsL1XPv1hFyFWrqx
	 y4kEIG1bp2320T6HR/oVjR2TdPr6Q8CFYVdKYw1xle/8sZt4IRaoaXNcoXibQ/B8kE
	 LjCDZlH16biTJeFiKOVwHz3yb2pbuJa4KMHwrGIA1XqhD5A9xKLNmuM2U3Fzr1ztsB
	 rBbtYLuwjlUkipqlOAX3SWJEs3wMw/W9aZHiRUnQDs7zCRJGYbKLSTiWfMEgIN9LvL
	 FC0hXoqI7dPRw==
Date: Tue, 14 May 2024 23:58:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the pci tree
Message-ID: <20240514-nerd-acclaim-04cf23e62926@spud>
References: <20240515083145.5ef498a0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1w3iODFyDgoOP2ff"
Content-Disposition: inline
In-Reply-To: <20240515083145.5ef498a0@canb.auug.org.au>


--1w3iODFyDgoOP2ff
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 08:31:45AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
>=20
>   8b77e887b96c ("dt-bindings: gpio: mpfs: Add coreGPIO support")
>   8c24b6f1709f ("dt-bindings: gpio: mpfs: Allow gpio-line-names")

Neither of these, nor commit ff26bed00278 ("dt-bindings: riscv:
microchip: Document beaglev-fire") should be in the PCI tree really.

ff26bed00278 ("dt-bindings: riscv: microchip: Document beaglev-fire")
I don't mind if the PCI tree takes though, I didn't apply it for this
cycle so there shouldn't be a clash there.

Cheers,
Conor.

>=20
> These are commits
>=20
>   6e12a52c1459 ("dt-bindings: gpio: mpfs: add coreGPIO support")
>   f752a52d34cb ("dt-bindings: gpio: mpfs: allow gpio-line-names")
>=20
> in Linus' tree.
>=20
> --=20
> Cheers,
> Stephen Rothwell



--1w3iODFyDgoOP2ff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkPsngAKCRB4tDGHoIJi
0smZAQCMNZsDXrOK5ERwzG534OgBm9MNh1M8zI7uzGa3Qwo1qgD/b9XJA1vLbCys
RVDQYOvJ+BTNR9ze4foe6UV+lfZ3bwE=
=fMJU
-----END PGP SIGNATURE-----

--1w3iODFyDgoOP2ff--

