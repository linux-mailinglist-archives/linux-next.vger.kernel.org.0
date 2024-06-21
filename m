Return-Path: <linux-next+bounces-2620-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C52B911A95
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 07:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48376281EE3
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 05:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECE23207;
	Fri, 21 Jun 2024 05:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MFHceolu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B0241C65
	for <linux-next@vger.kernel.org>; Fri, 21 Jun 2024 05:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718948746; cv=none; b=hMDCeCV7qVJgFVJXPkrKRrZKRN0AI5jM4s1bATgQ6Oq6ehu4mtKETiNdIFMqDE2EqR7mC4xlXFIpfYg2AYNOjdI9Vr5gFRKFSoNPjOOKkhAmnf6DYEpZc1ZrzGeoCbrfOGCzFPkAvBN7mzA/rRnC5PL0hEO5KKEXhJ8uI+UMTvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718948746; c=relaxed/simple;
	bh=MtcHAOeIoS2RovvK2ppujluiMEe5y2kwoSg4ES7GCjI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i/xmScGKxF0rpxkmm5RNaN7XtDLLpNkzIqAY//W40YE4CbZLS2TWj7+NTlCyKHu1DGS6Q8rnaPvrrBRIoIdbMqWTI9NqiznqxDFZp/5vnvd5iMNYXB9Ejv/FTyjL0i9VvB5ms1/kqLmXn97fTogO+VX543M0kH0FGJxxcJhSWqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MFHceolu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1718948739;
	bh=+FTwNdStX/8XZJDIhapNdkSk2f8J9SfriOA6WF5DF2s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MFHceoluSS2RRL+WL5YESWt6KZIbzpiWJTxIYU3v3Du7GjaWf3/z3w80eGOSkXEeB
	 xDeectzAUic38S4fm2WyfUFeI92gTtTzpaRm586jaFX/AczEEVGbRV5OGRB6k/DJ5f
	 60eW7O3AvUI/8IuOfjmI4LFQe9m6vbuYZjkSmDcZb0LOh7FQgofatTk+zyrMLkxUkM
	 Vv03mvxabDKbFIy7Ng2O3gseVrS8dvGAI75A7nSv+TjRRd7+x0FJWpXNDXf7vDJhPb
	 ane+IYBc8JH+tctt19aIOvK4dSrA9myNOL6o/t2GAmzfT5x6TzFENfzK0rVFfNbSCh
	 iSdJItJ3S4zUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W55tV5JFRz4wbh;
	Fri, 21 Jun 2024 15:45:38 +1000 (AEST)
Date: Fri, 21 Jun 2024 15:45:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, linux-next@vger.kernel.org, David Vernet
 <dvernet@meta.com>
Subject: Re: Please include the sched_ext:for-next branch in linux-next
Message-ID: <20240621154515.53aff781@canb.auug.org.au>
In-Reply-To: <ZnH9aHFOl4wufXkQ@slm.duckdns.org>
References: <ZnH9aHFOl4wufXkQ@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/opZcVuPocBZXZ3XGneEt2im";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/opZcVuPocBZXZ3XGneEt2im
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

I received the below request from Tejun.  Please add this tree (from
the next git repo dir) using

../tools/add_repo sched-ext korg:tj/sched_ext.git for-next

then add this line to etc/control (just after the workqueues line):

Tejun Heo <tj@kernel.org>	git	sched-ext git://git.kernel.org/pub/scm/linux/=
kernel/git/tj/sched_ext.git	for-next	no

Note the TABs between fields ...

On Tue, 18 Jun 2024 11:34:32 -1000 Tejun Heo <tj@kernel.org> wrote:
>
> Hello, Stephen.
>=20
> It's been decided that sched_ext will be pulled during the next merge
> window:
>=20
>   https://lore.kernel.org/all/CAHk-=3Dwg8APE61e5Ddq5mwH55Eh0ZLDV4Tr+c6_gF=
S7g2AxnuHQ@mail.gmail.com/
>=20
> Can you please include the following branch in linux-next so that it can
> receive appropriate testing? It creates a trivial merge conflict in
> MAINTAINERS but otherwise merges cleanly.
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git for-next
>=20
> Thank you.
>=20
> --=20
> tejun

Then reply to Tejun to let then know when it is in.

--=20
Cheers,
Stephen Rothwell

--Sig_/opZcVuPocBZXZ3XGneEt2im
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZ1E2sACgkQAVBC80lX
0GyWqAf/SHO1YDOqDNEvHfn2O6B9qMwXZ5i19pozUA+HW44/3tGlfvIPpQBZ7AQv
ILx9vCNUPDl5+5ov27UM+ItBDrRRbVECyrrs63A1m6jogpI90DkAxE3yZf94VUx2
zwy/VCRGejEC2po5ShR+69WObMYF57SAG7yvG/vq9q+PhX7xPyXAk4/zguzi3Zjm
AqNTacHOJrQZCygV6rnXXbiaoUhzDMoiay/nVlIbqElzTC4xUnAG8riC4Vw/eK3I
H0EOct3XesFZDX5AiPowKedAno4fS4XSl8pa33bjQoeUBZujk7Ub+igVlVLlVdz0
aeGUPuJMn/eWiDZK2XXOQfLUNB6saw==
=9X5H
-----END PGP SIGNATURE-----

--Sig_/opZcVuPocBZXZ3XGneEt2im--

