Return-Path: <linux-next+bounces-9559-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE4DCF7C48
	for <lists+linux-next@lfdr.de>; Tue, 06 Jan 2026 11:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06D8430285FA
	for <lists+linux-next@lfdr.de>; Tue,  6 Jan 2026 10:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58C1322C7B;
	Tue,  6 Jan 2026 10:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUColvMN"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD4C318131;
	Tue,  6 Jan 2026 10:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767694799; cv=none; b=AMlDUq/dHw0VwYUGRGc8T5n6OPS6up4D/8K5G+cpw7/64TiZdO5O6LDAc8SCrVU3cBVJqbGNwbSfSnXUQfJ8wt1J+RjqdT0ZBSY5Cd0YMCZn+b+YQHZJ+vcyIOmE5ufxEBENI6ga5k7zWtbS/ZS9Fw3VZp1OpFI0xYWSMHxpD7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767694799; c=relaxed/simple;
	bh=oihOVnQJT9LZusDi8h2kyoXqUP96j1TzSvbfLfAVEG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oq0TaLMGfdEFB64YYMsXxp8Ov6VzaaiaSfF745vUQuVK34WStCG/1E7fQtJXdHGQzw+kxJwF+WW8aL8owFDPXfZxf0v20rvMWWWovOrPivRLWrVcWSTFgZSnwyCYQ1cjhYzXlWXG/Yc5uM4vtIKMAe1yo/3/CEDT/wf+dLwOdRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUColvMN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B884C116C6;
	Tue,  6 Jan 2026 10:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767694798;
	bh=oihOVnQJT9LZusDi8h2kyoXqUP96j1TzSvbfLfAVEG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SUColvMN+LsGtSr4fahaPYNb71ZZjc13is6eV1NXfvIRYRieiLdVbKGU9yX8NaNFe
	 bXjsh/Pgyrw4jA+Z+W1OU9+qRHrdKr66+3Ifa93Pn66YwssrZlNo0SYs+tkD6Oh9qL
	 YeSGM3I13jNgZHVd+++dTm5YFN7PquWEy7lB9U2epR9zEspDIdrXkjkQxmpVaK2bwR
	 UoBzpSlbWjZM7rkbh6mUBdxXGl484ZwQS8c/rjbLPoeRtE+MU5oRRs//QfMttMUaug
	 AGjs7mIHoqfCOf67SPwAPicbzy0jUjoXKRis1TiaKSEobt19aR9vayl58bKhbV1iCc
	 vi3vDaM/kbAxw==
Date: Tue, 6 Jan 2026 11:19:51 +0100
From: Joel Granados <joel.granados@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the sysctl tree
Message-ID: <6npuxslv23xkesbloyx73emrsertjuwn65ezihftfmy2ypw6nx@5oa5q26wvya7>
References: <20260106115432.039d130b@canb.auug.org.au>
 <kx7f46olzus4ggfeohsgr6aoct2dqw6vnkir6xyqyavh26f5st@6hh55ic5hcfl>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nvr4yykmn37jlfjd"
Content-Disposition: inline
In-Reply-To: <kx7f46olzus4ggfeohsgr6aoct2dqw6vnkir6xyqyavh26f5st@6hh55ic5hcfl>


--nvr4yykmn37jlfjd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2026 at 09:21:52AM +0100, Joel Granados wrote:
> On Tue, Jan 06, 2026 at 11:54:32AM +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the sysctl tree, today's linux-next build (htmldocs)
> > produced these warnings:
> >=20
> > WARNING: kernel/sysctl.c:475 function parameter 'u_ptr' not described i=
n 'proc_int_k2u_conv_kop'
> > WARNING: kernel/sysctl.c:475 function parameter 'k_ptr' not described i=
n 'proc_int_k2u_conv_kop'
> > WARNING: kernel/sysctl.c:475 function parameter 'negp' not described in=
 'proc_int_k2u_conv_kop'
> > WARNING: kernel/sysctl.c:475 function parameter 'k_ptr_op' not describe=
d in 'proc_int_k2u_conv_kop'
> > WARNING: kernel/sysctl.c:502 function parameter 'u_ptr' not described i=
n 'proc_int_u2k_conv_uop'
> > WARNING: kernel/sysctl.c:502 function parameter 'k_ptr' not described i=
n 'proc_int_u2k_conv_uop'
> > WARNING: kernel/sysctl.c:502 function parameter 'negp' not described in=
 'proc_int_u2k_conv_uop'
> > WARNING: kernel/sysctl.c:502 function parameter 'u_ptr_op' not describe=
d in 'proc_int_u2k_conv_uop'
> >=20
> > Introduced by commit
> >=20
> >   936d17ea83dc ("sysctl: Replace unidirectional INT converter macros wi=
th functions")
> Oops, Thought I fixed those already. Let me remove those from the branch
Indeed, I had fixed it on working branch [1] which is not in sysctl-next :(.

Will update sysctl-next. I wont bother re-sending to the list as these
are only documentation modifications. I'll run my changes through the
scripts/kernel-doc check to make sure that they are no longer there.

Thx again=20

Best

[1] https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git=
/commit/?h=3Djag/dovec_consolidate&id=3Dd49958cf1ef4a4c967cdfab48de1c7ee689=
227fd



--=20

Joel Granados

--nvr4yykmn37jlfjd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmlc4b8ACgkQupfNUreW
QU9yxgv/a+qsMc6n4uxydoa7slt6xtsjjqhD88MnkuB5a1DWltXDoMMeaszw/Jwc
x63FsE15R3QztEUA4OYUaHJqMnX3mjyIh+hRtO4fzKkzOpCt6l2T223Ea0vaUY1g
hRUBgtvDxwwgvHqCz6TfPX0HViIsJMQ2TUisp7ZwVPPBSj328E84zZghYE/Ccq9B
HHfN0PlzwgJv8P9E5MXGneN2Cpcf4AVFIqaja9af5hZXAF7anPejUSjnliW0s7z6
alW5aZVYnhJjVnOhlXN3GhlsZYuZ5r8Y7LeZZGJk/P+k72d062MoEozMABgyOCFJ
mk1cQEWBbL+jo8OCb8k+tczggQzFpBM5xkydwPII7ri2XDybCkZbVcJIe6DS2Q4Z
8Hlm+/11AgQ4k9Nrms2nSc6aW5+oHkH1U5+4aJACMRhA3MRoyu9s9aX0vFutap3f
B4o+nBO8GeJNvpHRp44r0y/xkjSaf+XD+bDSNXRXc7+IPc8QebU2a1v8uFM0UwQo
M4K/Gupj
=WisO
-----END PGP SIGNATURE-----

--nvr4yykmn37jlfjd--

