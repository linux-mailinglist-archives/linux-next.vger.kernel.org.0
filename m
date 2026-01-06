Return-Path: <linux-next+bounces-9558-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 371C7CF7486
	for <lists+linux-next@lfdr.de>; Tue, 06 Jan 2026 09:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76746301A31A
	for <lists+linux-next@lfdr.de>; Tue,  6 Jan 2026 08:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82A7314D2F;
	Tue,  6 Jan 2026 08:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PejdERvZ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6E6314D0F;
	Tue,  6 Jan 2026 08:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767687765; cv=none; b=d796KHlhnXb+aNNgk4NHQFQSodFXubywnhamALHP9+V6I4JC3PTErVUyx0RxD2V19VJ6dwP6grDIAq6awtsbLv6ZPN4NuLzQgDNiULQ8rbmbsoCuGNG1vh3AkIhQR+Wor1zFZjVpUfT94UuLJLXcQj3lIKvGeiIm9MRpxVn0zWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767687765; c=relaxed/simple;
	bh=K/NgU23IFpg5nzWCq2Y72h70MNU8Nmrh9bHf7dCeH+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnnjC397X6YWFb0c9VO+eE/WfwOWDfTNRLNXOSeEfGFh3hH/JAjeIgDPyAm1sd9FtLBTgOXj9XAhfigZDsxfyyZbC9CKk/ZUtwBkV2DFlN+tiOCzLHQYzucBp4gv0h3GoupaNfDEzydHNASmGsnzxTun4BwIpmi24gBHzqw4jWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PejdERvZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0E8C116C6;
	Tue,  6 Jan 2026 08:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767687765;
	bh=K/NgU23IFpg5nzWCq2Y72h70MNU8Nmrh9bHf7dCeH+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PejdERvZwF60Cw3Vuy0fwLQ7+DQ5JGPke55UGL5NtCciK5yU+5GhsRm2cDCJe5CIE
	 UVJkj92Hc90q09rJ8eo8kzTdS78Mo8QvE+oPKEq0ajn3tKCoHACeqDEvHm2rNbIyRI
	 1iedTFpwbyXRrV4CYnPMCjm0l2kq5vAR2/T6+S7CrFPdGU6xs9Obp/RANP0bxSA4vi
	 ZwX5wf3KZVXDaZfHiSd4fDqvyXoLdqIK53Y/eakxfZTS48BVO64cwNcJ2OxaScYMpX
	 YhjptZx88Hy9REGgnwxiuFUnkgz7C2QkD7BQW4di/A4rZJ9piqdje5GaQlrfDVYMeZ
	 E5Oi5Edb0RkNQ==
Date: Tue, 6 Jan 2026 09:21:52 +0100
From: Joel Granados <joel.granados@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the sysctl tree
Message-ID: <kx7f46olzus4ggfeohsgr6aoct2dqw6vnkir6xyqyavh26f5st@6hh55ic5hcfl>
References: <20260106115432.039d130b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="th3kgt7n7xfizrwn"
Content-Disposition: inline
In-Reply-To: <20260106115432.039d130b@canb.auug.org.au>


--th3kgt7n7xfizrwn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2026 at 11:54:32AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the sysctl tree, today's linux-next build (htmldocs)
> produced these warnings:
>=20
> WARNING: kernel/sysctl.c:475 function parameter 'u_ptr' not described in =
'proc_int_k2u_conv_kop'
> WARNING: kernel/sysctl.c:475 function parameter 'k_ptr' not described in =
'proc_int_k2u_conv_kop'
> WARNING: kernel/sysctl.c:475 function parameter 'negp' not described in '=
proc_int_k2u_conv_kop'
> WARNING: kernel/sysctl.c:475 function parameter 'k_ptr_op' not described =
in 'proc_int_k2u_conv_kop'
> WARNING: kernel/sysctl.c:502 function parameter 'u_ptr' not described in =
'proc_int_u2k_conv_uop'
> WARNING: kernel/sysctl.c:502 function parameter 'k_ptr' not described in =
'proc_int_u2k_conv_uop'
> WARNING: kernel/sysctl.c:502 function parameter 'negp' not described in '=
proc_int_u2k_conv_uop'
> WARNING: kernel/sysctl.c:502 function parameter 'u_ptr_op' not described =
in 'proc_int_u2k_conv_uop'
>=20
> Introduced by commit
>=20
>   936d17ea83dc ("sysctl: Replace unidirectional INT converter macros with=
 functions")
Oops, Thought I fixed those already. Let me remove those from the branch

Thx for the heads up.

Best

>=20
> --=20
> Cheers,
> Stephen Rothwell



--=20

Joel Granados

--th3kgt7n7xfizrwn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmlcxhkACgkQupfNUreW
QU8lvAv/Va1ZM2+wObDJZp+vst6ur4Jaw6lpfXUAOrEvsA819SHheegcQhUfhK8/
2ccdwHpaxVqPXvwqeNyHMcvaA2w2PtKvzpgaSVn/7kFsg+uv2njJaijw4gYK9wyK
4PWkEJR+j8xFTqGm2Zp3zs1mWOBA0oK7zrVrJFgHkvB0AXiCk4TxXs9V0TZ2Na+t
p4qzVhGpdYCL0m8TSLyeiELtrMkCG5XK33TpeEdmc00VhxW2GlN9qw+Q+8yhMD3h
phUfpu6J0TZNlJS1kRBVsf0taBPsJtSHE5i4LOpqhSw0++Urbw0mfqCk8glU8Okb
ak2zSY4A92D8FNLXxjz2KnZmQjXDoMCg321vcGkn5CojJPHNCK7JmnHB5maqgLB9
wvqdNVgbZxm2lNDjTbWWJHsOBvGvljcwxN7IzJgjetx4eL99qinq2P/fw9lrKr+h
VIYD+EaP++luKhioAamAQCwkuQ8ABISbjJKUVMn4ER9jSedt8SbufTxVF0EZisjb
cdft90cY
=qIK6
-----END PGP SIGNATURE-----

--th3kgt7n7xfizrwn--

