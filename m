Return-Path: <linux-next+bounces-8464-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CD4B98BD1
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 10:06:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49ABD189B13B
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 08:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9273E283FD5;
	Wed, 24 Sep 2025 08:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qj8R8egw"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEED283CA3;
	Wed, 24 Sep 2025 08:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758701058; cv=none; b=GxLkIDp7U2ZCgOTXS8KWUstJVKuPj+Y7iCo/8aT0JPyqx7Wkoafm9fAyH6ZBHSgOovNUXxH2iJufzNNN4G/NLRJ+goxWzm00R9lNIZTJ0lLEPt4+GSiVpuAwUjdU7w9HT8HJMBKULsdbHmSEODoRty7azgaCML6XPZC8uhN8wNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758701058; c=relaxed/simple;
	bh=LmLkRsKSY2fXuY/hpUqK5Lssy9BmQtVFnRdeR7eeV8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7lfow7qOqMyD2fgnjYJb4qy8yCfd6AvFmmPNizQeFnn+84sjf4Dh+IV7bEaYgqi9Dnfv79vXSM+YLdZstROyef+4R1tfTNfBFfkk0wohflx5DGwb0C9mJ75fZgAAspOEwX9vtWxc89oColJ9JvOA3qEtxLaEdm6SRrPA8Jzg+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qj8R8egw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980ACC4CEE7;
	Wed, 24 Sep 2025 08:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758701056;
	bh=LmLkRsKSY2fXuY/hpUqK5Lssy9BmQtVFnRdeR7eeV8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qj8R8egwhbRZ2Jnw3GD+EpMSFWf4uKrGWF7EscL2YNIQT8OTTjQn9ISmOWcvFEufY
	 ChFUEVvjOyKO+yetrpu7VifmgenAIESo8Vtm8e3I9w5I5qk/UJaR6SJLtVUPydBut/
	 3N5ViWS1YzgGyaC/9segIZ2G2/am/F/amoCPhQWKC892e7RRKPFm/gVs6s0BgLzatS
	 1mRg+igCswI40UjYoBxcY5VWn4DkzRo49x7QoEyR34l5o/n9aptWhwyhQohk9k+5nx
	 sODyFMflJbQ+Xjj0z8z/0iv/h+w/l1la8iMcAyPRVQn3O/tS99SfzTio+iDLLOXn0I
	 NNGbLxZ7i+m/g==
Date: Wed, 24 Sep 2025 10:04:11 +0200
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core
 tree
Message-ID: <aNOl-0O4ikg38x0g@finisterre.sirena.org.uk>
References: <aNLOhQyd0YmJnPco@finisterre.sirena.org.uk>
 <22591ebe-c496-42e5-b2f8-9ca4f8fcaed5@kernel.org>
 <CANiq72k6fioBpFam4YhHazS1X=EVGV8RM6Y9g7ecZG_0w2FA0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l4ucGXHfbP/Gt8Oh"
Content-Disposition: inline
In-Reply-To: <CANiq72k6fioBpFam4YhHazS1X=EVGV8RM6Y9g7ecZG_0w2FA0A@mail.gmail.com>
X-Cookie: Filmed before a live audience.


--l4ucGXHfbP/Gt8Oh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 09:24:15PM +0200, Miguel Ojeda wrote:
> On Tue, Sep 23, 2025 at 6:49=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:

> > This hunk doesn't seem to be related to the driver-core tree.

> Yeah, that comes from drm-next, a script went awry here?

It's the whole diff for the file in -next.

--l4ucGXHfbP/Gt8Oh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjTpfgACgkQJNaLcl1U
h9CkqQf/TuNUSiQQ5cvgODr0V9xknSZrLzmMx2XFxMckWXVpciccpi++2YhGJUZJ
gTveWqWSWSaWS1r4YF+p3IcJawysFzsZSsuiI//gSovtEn1dRN4seGbZjjultenT
Ma1kd00qAdexmbJNuLL1GXtoHazMS6EGsJllO0vGm0lXn6goGK+wjM25qsudRWtG
1PGXxwpuOt5odQjWxD7yLnyOFNM4Y2BuzDo63RfjN4wPopPgq5dGlhCds8x+NZ64
+Iz+KxQ4n4Qw7amZW9q3bGG3QsrDU5466uXQ64s6ooPnxA82ogjqpvlHdp4DRFLO
OcQob+khqwkTdpHny3Bao+1OQRs61w==
=/PON
-----END PGP SIGNATURE-----

--l4ucGXHfbP/Gt8Oh--

