Return-Path: <linux-next+bounces-273-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B14F8092DC
	for <lists+linux-next@lfdr.de>; Thu,  7 Dec 2023 21:59:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEE7AB20B32
	for <lists+linux-next@lfdr.de>; Thu,  7 Dec 2023 20:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0F04F613;
	Thu,  7 Dec 2023 20:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LGhIC5dN"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C94B1719;
	Thu,  7 Dec 2023 12:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701982730;
	bh=OahjUiyo1OGiDStDJt6xdb3ykfMCzHaeqGJimrbb/ww=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LGhIC5dNRK/Ne+ji5uCQX1VZTo/TFWUTJSLADzhyeSW5SXrr49GpyEVvriCG8WoxY
	 RZg09DANoA0rIf3IJS8yckHrC67T+DKmNVx9wNSSo6xGWgrkZlpqDMHeMe0JdRhDMo
	 Prp2WsQDpSdxD+UTYlgVzX0kSbd9vwI8JK0kNk4+/CU1rfS7Xs6Ez0Gt3jVywXwf3g
	 3oRDlWDveKiaFwhXrYN8/Ks9auN8TzHd259iVCZNUUuwPTIRP+d5CZf9dcw5chdvNP
	 kPCpqKkOmbeicYCnc28ELYm/qNskxTEweCq/gV4sN415tOnbr9onzU/GXW2gwuPEy0
	 sz0UcsjnNmqBg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SmRT63Qqlz4wcK;
	Fri,  8 Dec 2023 07:58:50 +1100 (AEDT)
Date: Fri, 8 Dec 2023 07:58:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the devicetree tree
Message-ID: <20231208075847.6bbd23b8@canb.auug.org.au>
In-Reply-To: <CAL_JsqKXo+Cr=9s=dt1kCQeMadJ_cnuSpm06zmvK8yd-vd2X3g@mail.gmail.com>
References: <20231207125737.5e7553e3@canb.auug.org.au>
	<CAL_JsqKXo+Cr=9s=dt1kCQeMadJ_cnuSpm06zmvK8yd-vd2X3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y5My8QC91/48vQRFjaBW_a+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Y5My8QC91/48vQRFjaBW_a+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Thu, 7 Dec 2023 09:11:22 -0600 Rob Herring <robh@kernel.org> wrote:
>
> I'm sending out fixes for all these. I want to get the final patch
> ("of: Stop circularly including of_device.h and of_platform.h") for
> all this in next to get some better build coverage and catch any new
> drivers added. But if it is dropped for every new driver that breaks,
> I'll never get it in. Can you fix these up or just leave them broken?
> I can keep the fixes in my tree until they get applied by the
> corresponding subsystem.

These dependencies between trees are impossible to handle.  Please if
you really need the final patch in, then you must put all the necessary
fixes in the same branch.  There is no telling what order Linus (or I)
will merge the interdependent branches.

The alternative is to spray the needed fixes out to the other
subsystems and then put the final patch in after the merge window
closes or the next release.

I cannot "just leave them broken" because that will interfere with
other's trying to get their work done.  I will try fix up the newly
added drivers if they are obvious, but in the case of these include file
cleanups, that can be quite difficult sometimes.
--=20
Cheers,
Stephen Rothwell

--Sig_/Y5My8QC91/48vQRFjaBW_a+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVyMgcACgkQAVBC80lX
0Gyepgf/WasA+iIOtn/ZTy7BHxAZLqhsI7Dhvs+SjIeHrj2cw2iXlXo9cJwAdwAw
h4abJR4iFSOGKmMRz0jwjT99EPZxSu+PNOJzHMH5uPo4+yLrDQ7I8PtH+gzJeaQb
j3RKwRkYQDwPQxvQ2AUHgaOzxyyekthoN7QFz7C0UgX9HUR0oB++OQ5E6foVEUSz
lb2NSZ2OKBmI7h9wYa+S06UnhgNIKv/Uz3nIvrdu6NPSoGsheoHwirP0W/82o4tC
fk3Mn9AKLsJcaohAekMC7dEtDtsAZvov+y6/u9bqY9mtksj3vzoLBL0EesBkH1X1
7UBuhL8gsT/MPOGTpeIDuVLn0EFcUg==
=IU0l
-----END PGP SIGNATURE-----

--Sig_/Y5My8QC91/48vQRFjaBW_a+--

