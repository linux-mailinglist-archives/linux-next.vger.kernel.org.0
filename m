Return-Path: <linux-next+bounces-915-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F7F843109
	for <lists+linux-next@lfdr.de>; Wed, 31 Jan 2024 00:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB39B1F21AF9
	for <lists+linux-next@lfdr.de>; Tue, 30 Jan 2024 23:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9940F762E0;
	Tue, 30 Jan 2024 23:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="t+T/TOId"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF48762D6
	for <linux-next@vger.kernel.org>; Tue, 30 Jan 2024 23:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706656737; cv=none; b=K3To0+v6rFkpaXB+OutQhjnMJ7jEr44k7jIJqqLxoAXF0Jmv3IwozXjTmb2aI2HcUkyrciT0GisOXXNOxrfBGwOCvup2mwm7YMU1v9e3GC2GY/EL63Q5e+uRC/Fr3ga15KgGD4VIK3oXrFCerhPq5vxcitgT1CfREtOqxFxINkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706656737; c=relaxed/simple;
	bh=i32N+tm0F9ughr43+GRteiv/Flq3FCcQJOKQVmdPbBk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bcG+LAHXKKKAVYh1DJ8OyHPvBTuTUdYnOGxPxxWEHp/cS9IWbsFhl30qDUa8+0Mqdqmi8AHnlXhrgKSkgfnJtBOdi/2Ynh5Cv3wDbuusKR7bcZecU7voD3QwKYyzWdG05+zKImFlY1GSttxTVScc/ahIRKwmHVXbXztaCzefOtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=t+T/TOId; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1706656733;
	bh=dFLAwBpiTlSpxACAo3Ukq7RtlyVZ0L/CBCdd9+EwYYg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=t+T/TOIdyysQObCHnXEeRgTzlqgr7yean+FnW1A5wkoWmspuSMKTDbChj00JLsDYd
	 A1imMDdEk+rSjz+K5ryGleKNW2D44j5XOAdYNUluIWWPRb65BphHPrnTOGcY5tZo7l
	 PcLNq88NihyhMXvlrE/EleBStrP1jrAx24KIroYlojkM1tcZbPTLfvw8i9WNco3Oyz
	 154NDmOk9RQidpS576ukMREddqOJbs8KKjBfG0tUOhBEgshvo9C/tu0zIbK5TLTr+F
	 TsSsXWKddcvSPxScJR5oBXvzvkaf1FLfuEhu23o27WjyLL44ic7sYKWsMyLW3MsU2y
	 u/DlZW6r9IoFw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TPh1m60fbz4wc3;
	Wed, 31 Jan 2024 10:18:52 +1100 (AEDT)
Date: Wed, 31 Jan 2024 10:18:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Subject: Re: Request for i2c re-inclusion in linux-next
Message-ID: <20240131101851.20f68fed@canb.auug.org.au>
In-Reply-To: <xewyobkwecyhluztyrpwzhnuv3f25eq56iwkh3obfzxgqghe7p@2agb275csehd>
References: <sripk25leahdjiziacby4ql45kspw5cd3ic5vj23lctsawc2lm@be4sg32fjilu>
	<20240128142804.21d49045@canb.auug.org.au>
	<xewyobkwecyhluztyrpwzhnuv3f25eq56iwkh3obfzxgqghe7p@2agb275csehd>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f=W5lg8vlJUISvs6mhH+nP.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/f=W5lg8vlJUISvs6mhH+nP.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Tue, 30 Jan 2024 13:35:35 +0100 Andi Shyti <andi.shyti@kernel.org> wrote:
>
> Thanks! I have renamed them in my repo as i2c-host and
> i2c-host-fixes to be aligned with your naming. I'll keep both
> naming for a while until you decide to update.

I had no problem with the original branch names, I just fetch those
branches into the appropriate remotes in my tree.  The names I use are
just how I refer to them in emails etc.

--=20
Cheers,
Stephen Rothwell

--Sig_/f=W5lg8vlJUISvs6mhH+nP.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmW5g9sACgkQAVBC80lX
0Gzx0wf/ceVkVh8G4IUcG/byL1uVa8K/ePDVtYwrj5BovQPQxKtSQHIMBmi2FNvP
FK+JPwzUxZALrpAJe86Thqb3SWr12rEuyKObY3ho424N1PO+ZfDqiWPCh0ZeKQak
SAabzJozNCeHp2SPM38jk6EpQZfqje3ZtRfhyB2XfjLIhWL3I9Za/CFlb3wDmCQE
/o+cwjP+XQOjII53cLXEmFlPgBCJ0rtMmsbvjVJGKheLHD88/lPJctYX95F3zTCs
OUmwixFCwSWht+4xacwwcl65X+9udSkrjqnT5+xHpTK8RrbN9iS6fglCFa9brq9h
nn2ZvSGVtDGkCqAO6RInooGu95BSHQ==
=9BgE
-----END PGP SIGNATURE-----

--Sig_/f=W5lg8vlJUISvs6mhH+nP.--

