Return-Path: <linux-next+bounces-9545-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A99B5CF5C67
	for <lists+linux-next@lfdr.de>; Mon, 05 Jan 2026 23:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 60B19300D286
	for <lists+linux-next@lfdr.de>; Mon,  5 Jan 2026 22:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B056A2D7DF2;
	Mon,  5 Jan 2026 22:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pSlKbRBb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838472D7D42;
	Mon,  5 Jan 2026 22:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767650951; cv=none; b=s//pJ3TEmNnNA++nLKHmzQJWSgawucUOUcEmNLq+VcsMW51mG18tlmtwOsp2ss42omgmLFP0nE2sLVWPMD+2JEpNl12EmU1wRlfvo6R2m8Bw1OISl+cR8RqTx4Lo4tiM5f71/Y1d1KabfDVOlx1vH/dJSyCLNcUdrCoHKXcwJ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767650951; c=relaxed/simple;
	bh=4eWhFZ+VUoo2ExQF3ewVVFKm+F/k1ABlyk/3sBf30iY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bEl57uYdXKFW67oL9adJy/LSEUyEeo2Zj0MrmPZI0Sa2InMAH8NxnGeTwcen9kq/waBeIbmhHac2EB52/dl6GNp+2vQ/TVxF/JevfH2lclzQLKUmh4HQavTKui7Ewsm4syikY4nxiD4c8lDzNezr9C8pjASMbAe2vvM6kSjd8ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pSlKbRBb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767650940;
	bh=4eWhFZ+VUoo2ExQF3ewVVFKm+F/k1ABlyk/3sBf30iY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pSlKbRBbFXoEsKneQkK42W4LPRvoNuveWdg/oHE6+chITjSk/BeXSZZlyVI4ppO3V
	 PiLosVvhYgBQnGAka9dFpzTzPLFrXm4hwANU6hBzbCYLBhSMNZeJCN9VwSr/yJgOPc
	 FlE114y2NT/WApS8n0qUpl9BTqXOjnwvCbd8rOiEgkr3oSx250UO/VvFW8JN1QkPQK
	 11NgsWAUcO+9YFo8WUzXwG8ZeCq+frvnoGEmEOwOV9+cJhucAX3i4UGRyUn4m7v0L0
	 kGsmStFC4CKTGWMdTxeZNIOcE9ldnnx4tcsg4Xda9NAhMSzQkUJDdlKCrMHV7qEqUC
	 a8GSKGYwNzm/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dlT3F40QZz4w23;
	Tue, 06 Jan 2026 09:08:57 +1100 (AEDT)
Date: Tue, 6 Jan 2026 09:08:56 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dipen Patel <dipenp@nvidia.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Andreas Larsson
 <andreas@gaisler.com>, Christoph Lameter <cl@linux-foundation.org>, Chuck
 Lever <chuck.lever@oracle.com>, Dennis Zhou <dennis@kernel.org>, Gabriel
 Krisman Bertazi <krisman@collabora.com>, Ingo Molnar <mingo@kernel.org>,
 Jean Delvare <jdelvare@suse.de>, Lee Jones <lee@kernel.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Tejun Heo <tj@kernel.org>, Tyler Hicks
 <code@tyhicks.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <ukleinek@kernel.org>
Subject: Re: linux-next: trees being removed
Message-ID: <20260106090856.7ea0a303@canb.auug.org.au>
In-Reply-To: <b8e8dba7-0f74-49fc-a384-b507132f2a7d@nvidia.com>
References: <20251215184126.39dae2c7@canb.auug.org.au>
	<b8e8dba7-0f74-49fc-a384-b507132f2a7d@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VBTuUlk1bZdCDkbtE=Y56.s";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VBTuUlk1bZdCDkbtE=Y56.s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dipen,

On Mon, 5 Jan 2026 13:51:09 -0800 Dipen Patel <dipenp@nvidia.com> wrote:
>
> Please keep/restore
> https://git.kernel.org/pub/scm/linux/kernel/git/pateldipen1984/linux.git/=
log/?h=3Dfor-next.
> The branch has been updated to v6.19-rc1.

OK, I will keep it.

--=20
Cheers,
Stephen Rothwell

--Sig_/VBTuUlk1bZdCDkbtE=Y56.s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlcNngACgkQAVBC80lX
0Gw+FQf+LeoJ4BPP64esP7OZC2SOffqckszBuhHKQZquL7IfEPorAL8zz0tDmmLD
RgTtGSujvoQV+Y0R3SaAyCFLrrPKrhzAxgVR0gfN5MN0/cA3QB7lPcGcMHP9Y75N
KJYVcjTTxP4jLhL4Vb0EGf/RFFlrum/sYWgUIVqma8yGisgzXMNpt975uQOljztp
xp43KN6CuF0rZ4zBJ2M8Uah2F7ZLyIUh0zjonHAZb3q4l2MpUIY4/0Oeg9cG4Wax
a3BxF3vOWl7JlCVcS9Ti/9LFYS6JVPthwG82+dwh6deSQcP/R756Av9SuoabRepa
etRieTU7oPbeGIFtjomKylvcu4Klvw==
=Bu3o
-----END PGP SIGNATURE-----

--Sig_/VBTuUlk1bZdCDkbtE=Y56.s--

