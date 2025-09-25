Return-Path: <linux-next+bounces-8484-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B65A1B9F27F
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 14:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 729F21C20B06
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 12:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147B630ACEC;
	Thu, 25 Sep 2025 12:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEFgbMgt"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A413074A7;
	Thu, 25 Sep 2025 12:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758802454; cv=none; b=CTyScMdrTWBVpVu5PzjicjeL+Me0R3keFq5c86WvIHwNyZDJwNMIMir0oWmwRgsvM6oCD3u6M807TYAUtDAGicGyD+z0Qy79V/GEHF3F3EIbXW0l6A8sAyws8AlGWEmB/5+CUKzeXXW/8cHsgnYDvBbjekEpS5vzNn0qFFcarIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758802454; c=relaxed/simple;
	bh=tDDpEOGumP7yl+MGVurjmjF8c72O/FllIbZZNTxj4bM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFEi+K/oEhgtFQs3ICeALFpJn2PFTfj+nU8nvntgdUd3E6WAk+F8x1hs5xd569J67EyrsDbQWTVDA+n3TzVAnVxgkvPaua4nZtob6TFzv/lMBxbZtSKwZINFFhPxGK2aY6mhyc8/kzX5Fst5IgaeWKtv2sPd2j1uL+lDeIPnO+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEFgbMgt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B8C0C4CEF0;
	Thu, 25 Sep 2025 12:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758802454;
	bh=tDDpEOGumP7yl+MGVurjmjF8c72O/FllIbZZNTxj4bM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CEFgbMgtvlIFSyZxXBqwR+mCgqdkNvUNSpzP+Swt1cpoRCp0c6FMZFJywdQoU5e8n
	 0J1TpQdewnVFNIOcbaUkeMTO0ovtIgHW513ZdpMuggR6/xhRZSf1mMj7v9KjWmuiyY
	 dtUWnpGIsHOmJxUy3CW8L1VKhxCUE7RfV5gTd6RgiOzVkgMJo6dachMVD6Nk1aMVEM
	 +8CIhIETVMxyQlKAs2LEO2daIYrKEjkeZPeiOliusFJR4E4qnCV18YF6zON7CZloAC
	 qUKGa3F0xuH8r+U6w0z/UtueebZMvsJuEXkK/2KZKKMcqIqXSPvrfUZ0if+s6yIICe
	 Nta3tvvY9g1Zg==
Date: Thu, 25 Sep 2025 13:14:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Ming Yu <a0282524688@gmail.com>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the mfd tree
Message-ID: <d014a00d-3868-414a-80c0-cdb376a0ef47@sirena.org.uk>
References: <aNEedsR5CDuVBoyo@finisterre.sirena.org.uk>
 <20250925103846.GA8757@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NjGgqseaIapnWHw8"
Content-Disposition: inline
In-Reply-To: <20250925103846.GA8757@google.com>
X-Cookie: Shipping not included.


--NjGgqseaIapnWHw8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 25, 2025 at 11:38:46AM +0100, Lee Jones wrote:
> On Mon, 22 Sep 2025, Mark Brown wrote:

> > diff --cc MAINTAINERS
> > index 55288f2ffb6b3,681fbc8258052..0000000000000
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS

> Missing diff?

No changes from HEAD.

--NjGgqseaIapnWHw8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjVMhEACgkQJNaLcl1U
h9DxbQf/d2HThvjvb7MarTC3MXhz+6neZVs+6ypjga7RPnDGLPZ3vzg5D5AroG4B
2smWKa7Eu9LQ0EDzCzgpdnRoajfw3Rm1PcfsFtdjxtq/cwx+/s9or3DhrFkxQYHg
zulC38z6bvYKskNjGO5HdSkyg+ZES9ZvMGuG6cnrEXHxIAYqPe5af1mnbn6WixtH
w9XESK03KwZr2CKMLc4PFrjMlP/qtiYIGl5CV0gaS0OwJx8QeG9qKmGNM/BfZgjL
sJ75CEhE/O+GHldRExRSN35yB8xtRdbRqkYFJkbwIGZ5MGUPYXlC/gm9r9ErPDmx
WR/HQ6j55yDT+sPtoP7U8ynJwqfKVQ==
=PDyQ
-----END PGP SIGNATURE-----

--NjGgqseaIapnWHw8--

