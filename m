Return-Path: <linux-next+bounces-8825-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AFDC33972
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 02:10:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5C9B18C2C3D
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 01:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A6C236437;
	Wed,  5 Nov 2025 01:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cnv/qcxT"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E9F27462;
	Wed,  5 Nov 2025 01:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762305014; cv=none; b=MWYuS4Trxjn9WhRcQkwZ9WNdRCzTfX0nbE052euNVCH/n7QChPv6vMDTVR1psoWUAXTQaH4OxW7BjdqCYThHSn+8gNrvBE2bjflUjsxB/Aw9DOGHS2FmYFZIlDNvXWr+jPFhOkHbfrz6jGjN9E4dFUo+FQKLt5B/soBE0ddqrnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762305014; c=relaxed/simple;
	bh=BR9QOkMBKtKQNFZBXhVhpUa+W8KCMPzKLzdfkVez+Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvMvwIeS2fGm6NBJcU8ar/9E9ZJdJaD1eYgpvmJ8r+djcrbgrGMtiMhmWfXX4QiQdGMD/qcehr3tvb0WKpHPAleRMbZIYBTvhSfPtQti3a+suiQzcZN+eWMEXaszfFFenY8X4+GZz+Yo4/9oY9nAr89BjU5uDkUXBkWQZi+922Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cnv/qcxT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5587C4CEF7;
	Wed,  5 Nov 2025 01:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762305012;
	bh=BR9QOkMBKtKQNFZBXhVhpUa+W8KCMPzKLzdfkVez+Pc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cnv/qcxTuwvpuaFbOkgxhwPhIjiuY8i0WBvmeo8bbKesf9fimeM6dooW3EORbcug6
	 +hihFA0uY49GgaImD3HnpUaRdJaJfccr0QrmDMZGBPCxrfBvZjwRfNw4DWZOcZRavG
	 hGeGfZRBN/l1qwdiemzqj6eufubYNxUqQ148uRWzp+GCYI0z7yYho/9BQirVm+2B1E
	 mM/We650ebIw9w7HxwiBkZLgrz7fM12HcjUhsJ4+6maqhKGgXo6AOqO0P508jMBGC0
	 xr9ceG0HxHdGOiQNpX4KjNpnu1fy3usOq5JhUvhBca3vwWslHYuzsTAZVDZipanYOg
	 dRrlBnBaT4Xig==
Date: Tue, 4 Nov 2025 17:10:11 -0800
From: Drew Fustini <fustini@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: Add tenstorrent to linux-next
Message-ID: <aQqj8yBEUUxfqPA5@x1>
References: <aQpkDYXT3N6qWiZs@x1>
 <20251105091947.2692a796@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zkB9bKyoC6CL6du+"
Content-Disposition: inline
In-Reply-To: <20251105091947.2692a796@canb.auug.org.au>


--zkB9bKyoC6CL6du+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 05, 2025 at 09:19:47AM +1100, Stephen Rothwell wrote:
> Hi Drew,
>=20
> On Tue, 4 Nov 2025 12:37:33 -0800 Drew Fustini <fustini@kernel.org> wrote:
> >
> > I have setup device tree branches for Tenstorrent RISC-V SoCs, and I
> > would like to add them to linux-next for testing coverage. I have sent a
> > v6.19 PR to Arnd to add the Tenstorrent Blachkole SoC device tree [1].
> >=20
> > tenstorrent-dt-fixes git https://github.com/tenstorrent/linux.git#tenst=
orrent-dt-fixes
> > tenstorrent-dt-for-next git https://github.com/tenstorrent/linux.git#te=
nstorrent-dt-for-next
>=20
> Added from today (I called the second "tenstorrent-dt").  I have just
> you as contact so far - should I add anyone else?

Thank you. Yes, please add:

Joel Stanley <joel@jms.id.au>

> Also, should I update your other trees (thead-clk, thead-clk-fixes,
> thead-dt and thead-dt-fixes) to use your kernel.org address as contact?

Yes, please update my address to be fustini@kernel.org.

Thanks,
Drew

--zkB9bKyoC6CL6du+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaQqj7QAKCRDb7CzD2Six
DL58AQCpFIUMeXY0rCeIY01BQ2uMYaDh5orPo+zf7ywG4VB6ZAEAvIBjWVj0Y6+C
fuZ9e77niZ/sOIZgzVm5IlOAQzbqswA=
=ZSEW
-----END PGP SIGNATURE-----

--zkB9bKyoC6CL6du+--

