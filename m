Return-Path: <linux-next+bounces-3708-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C34971B73
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 15:46:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDFD01F24246
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 13:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423751B1403;
	Mon,  9 Sep 2024 13:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TitfZOGf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7691AD41E;
	Mon,  9 Sep 2024 13:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725889489; cv=none; b=u13XTrUiQ2CMVmL0emdzhSVWdnivCDZpP7kpBMU3CDhtgCEAvosQdFajj1JKgx8NXdX96GcE0JuN/QjCIFPein+gHwpXQuUpDmtOpYAbPn2Vty4NAwYVq6BwamzhAMoMwEBFxJsUJ9IZCuNXtiRNjmgMjT61bTValkS+NB3ZsrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725889489; c=relaxed/simple;
	bh=B7ey3nZDcRFbRW1IadABmLyLmNiqYPB/2VFqPwGDTG4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u2EA43jZSPtB2pUfaJUIdt+2p1hSxoWoG3sERXXPodstSpJgG1XzjxLjcPaVXIYSST+JD0ZEMTATfGsnN1+pj+Vx22xPTJms5nogI2FtrKqbgQZbFvAWg6oDNwD/DkwJe6ASZm4EAe+/mmYTnBQfeGWNdzupSrQeQfoslhDnjiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TitfZOGf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725889482;
	bh=B7ey3nZDcRFbRW1IadABmLyLmNiqYPB/2VFqPwGDTG4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TitfZOGf346VfWBf9wmceTfh4wJyQaip25s+7NddsZS+08s54ki9PCDDFWyzGQozn
	 d0bn7CfSBbVSd1EjqJ9zITDT/a1aiY2sFK1UseUwoUfU7A8ru1Ia3zoPbB3X04AYNW
	 UpD99hYz+48J5kMCMCf4dHS1NR4Q7/FYlb0EzuMpKXbT/4mrLESGSZgn56wGesh7z3
	 s8OBDvj/Qv/uxZnan6xhiSF8MMuXGyZ3mID9UMzLqOPVmDhbRa5rOY41/YVit5JYYi
	 /UFEVHngVtgq0BjmJaSYs3aKvCqdBjSrENfBzz/RhcNoipsVW2X66p0aGQlZeYRHUV
	 2z2reTGslhHsQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2SkL5DcXz4wd6;
	Mon,  9 Sep 2024 23:44:42 +1000 (AEST)
Date: Mon, 9 Sep 2024 23:44:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the slab tree
Message-ID: <20240909234441.3a98fb01@canb.auug.org.au>
In-Reply-To: <20240909-armbinde-klaffen-fc59f67b2279@brauner>
References: <20240909171220.32e862e3@canb.auug.org.au>
	<af23f1d3-27de-4591-ab0a-02268ef547a3@suse.cz>
	<20240909-organismus-sattbekommen-06332e10fcd1@brauner>
	<5661a983-9875-4cdb-8bdb-fc83e82f0b58@suse.cz>
	<20240909-anvisiert-weltweit-d3b485680666@brauner>
	<ffdcd6ff-b83a-47f6-bb23-e6baca7a3bc2@suse.cz>
	<20240909-missrede-abverlangen-dfccd1414bb2@brauner>
	<20240909-kratzen-holzweg-c1fd7da1f895@brauner>
	<20240909214533.0f8437ef@canb.auug.org.au>
	<20240909-fahren-ansah-1b49bad59efd@brauner>
	<20240909-armbinde-klaffen-fc59f67b2279@brauner>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9jX7B6=irJY.uZ0aISwn8AZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9jX7B6=irJY.uZ0aISwn8AZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Mon, 9 Sep 2024 14:37:50 +0200 Christian Brauner <brauner@kernel.org> wr=
ote:
>
> Incidentally, is there a simple command to detect duplicate commits?

Have a look at "git cherry"

--=20
Cheers,
Stephen Rothwell

--Sig_/9jX7B6=irJY.uZ0aISwn8AZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbe+8kACgkQAVBC80lX
0GxSFQf/WkwugiZRkBpeYsRV8s/d8N4hWd36yGhYOdIZ608do3T7xGzDMHt4W+/4
2bGCz/J7fUbtXVY2bjrygA8xlxyLQCo/DRrM4Zjg5C4q0/4MCOymlmo3nafpPYMT
oEhUAcdwkhMXW6Anq8qaq13dDoyYQeWYYOyqjdj7/n3KklwXfhMWorUk7cuYfSQ5
WTBTyK8AdWAHzj+Kfm7+G5Ag7LvDwB6V8gP5ylbkCxURWSDcB3RaH1LvUM13LTRI
qMnhynzhADCn1GGcPmLM43HXUIbrf2L2cXP6jUeJcOZSl3medUVbrKavkd70oRKG
lnvDlheAMAliaqXDuZTUSwRsTJilYg==
=lIuZ
-----END PGP SIGNATURE-----

--Sig_/9jX7B6=irJY.uZ0aISwn8AZ--

