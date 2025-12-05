Return-Path: <linux-next+bounces-9352-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9603BCA5FE4
	for <lists+linux-next@lfdr.de>; Fri, 05 Dec 2025 04:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 133DC3090A51
	for <lists+linux-next@lfdr.de>; Fri,  5 Dec 2025 03:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3954A2701D9;
	Fri,  5 Dec 2025 03:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dOCRwcAJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BF726C3AE;
	Fri,  5 Dec 2025 03:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764904982; cv=none; b=QonlnyR8p8YZut2Z3bagqbJ8ityUXBIefb7MhUQRpBS6aGGY8bi8Inu2Rc4dGhTMxm840wehblHR//laWs7nh9XawHTG/QbFsWm9E+CbxnNsNQ6FKP/lRfzeC/dkdWFTYSJmzG5wJamLPuFdVC4dA/R15fwx26a3PUNZqy18ssk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764904982; c=relaxed/simple;
	bh=ELajwRstGm2R3/rE2INokX78TC1rebSQv1EdrwnISA4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lF2BbnOVDo7aNdj98tlEEp83kOrRIhQ0czvjg/iwZl4u/xDCd6YbxsEHMnqyEi95/NStIOvSY4WCqncu2YlBxKIcY0gka0h4fVpHmUFVP182x514QpBvnKHZHzA7g1wOqNQNyvogMZNbPKZsXJogfz61KG9nCwkRYDGVAHMoIw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dOCRwcAJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764904978;
	bh=n91468z1wgdFocPxh6L/EfUhJQc0fzs/ljLTXJbMBV0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dOCRwcAJp3fh50KG2IiqqWlcl8pXx6QE1tsvS/N/WOGybLaNh6cbzPmUkXBoG9YIT
	 z5lR3j0MSpIAqI/98Yfih4gcZ5sjEKCaByFyk3XgHTTO5LK6hodBo+Xy1ChdL21YB0
	 VnetDF7BkLFTFCvemg1PX99H2eTETgQI7+2JLwApyDu/tmvk7VR+K752rjXOTfCONc
	 PhN2KLGEDC2RZHqT3rmiVEr92J1QcAvJwRthR5VkWxKBKklXmaJg8pNVmvDNG6cJVO
	 Ef208h+Qcf5fkWwnqrPpIuhKFQZjI4d+wXgrpt7HUOTit9c/GjwFZ+b9AG2U9xnprV
	 WzcsMJzK2ogSQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMxXK70gWz4wHF;
	Fri, 05 Dec 2025 14:22:57 +1100 (AEDT)
Date: Fri, 5 Dec 2025 14:22:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Danilo
 Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core
 tree
Message-ID: <20251205142257.226cc2ab@canb.auug.org.au>
In-Reply-To: <20251110122426.76ef487d@canb.auug.org.au>
References: <20251110122426.76ef487d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XBdJ=HlYpz9x9tfWt0+MUow";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XBdJ=HlYpz9x9tfWt0+MUow
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 10 Nov 2025 12:24:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the rust tree got a conflict in:
>=20
>   rust/kernel/debugfs/file_ops.rs
>=20
> between commit:
>=20
>   9c804d9cf2db ("rust: debugfs: support for binary large objects")
>=20
> from the driver-core tree and commit:
>=20
>   3f0dd5fad9ac ("rust: debugfs: use `kernel::fmt`")
>=20
> from the rust tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc rust/kernel/debugfs/file_ops.rs
> index 6c8928902a0b,9ad5e3fa6f69..000000000000
> --- a/rust/kernel/debugfs/file_ops.rs
> +++ b/rust/kernel/debugfs/file_ops.rs
> @@@ -1,9 -1,9 +1,10 @@@
>   // SPDX-License-Identifier: GPL-2.0
>   // Copyright (C) 2025 Google LLC.
>  =20
>  -use super::{Reader, Writer};
>  +use super::{BinaryReader, BinaryWriter, Reader, Writer};
>   use crate::debugfs::callback_adapters::Adapter;
> + use crate::fmt;
>  +use crate::fs::file;
>   use crate::prelude::*;
>   use crate::seq_file::SeqFile;
>   use crate::seq_print;

This is now a conflict between the driver-core tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/XBdJ=HlYpz9x9tfWt0+MUow
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkyUBEACgkQAVBC80lX
0GwwAwf/UfZ415Dn5ZRDKqPedg2s7tC4oawFr4krP4qJWhiPwAGK0v9WrZrQMr7I
AqGOG+hGO9EEJOJNshg5STjffztIA1/DvWePNYPCW3IZhPaTrtLBw7ZFVdpUejZR
qDeG50x5CGB5Bi6MEAfBTxwFg9RJ/6jOwU0ZbnBqc4S9MCpsf3jKBanbgjxD2X+X
Ku6ZjHWG9aBOWa/Tu78REduRqTPtUpTwZFj3o9FxdcbkocXLgYiBVbRWyLJTqamJ
SKIxxvAbfN+HvqosHNjJucjGoPaJXv8vBjhZFIOrCLLvyTzFIu4fR6S6GjdJ/6N6
5W1wKQe4rjfs2Kml7P8CHX5CoGetwQ==
=QpwE
-----END PGP SIGNATURE-----

--Sig_/XBdJ=HlYpz9x9tfWt0+MUow--

