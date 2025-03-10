Return-Path: <linux-next+bounces-5709-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6B8A5A857
	for <lists+linux-next@lfdr.de>; Mon, 10 Mar 2025 23:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B306916F87C
	for <lists+linux-next@lfdr.de>; Mon, 10 Mar 2025 22:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0181E47B3;
	Mon, 10 Mar 2025 22:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gYlz+Nw7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90781DE8AB;
	Mon, 10 Mar 2025 22:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741646281; cv=none; b=TdU+Y5qfPipHYI+fvn1qYuX7sLKEnmkihDwrw/26KKqA2xSd1ZyEz/ISv2ZSWivCUEFBIq71tG9okIkQNrbXHjxRoNnV80CBt3Z1n5nnooZ6HRi6dbUZ4qP+P4KJS7TFSrg8OnJuhgtQx2GAvUUSAfXjM3dARYXNrtRmXT2b5go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741646281; c=relaxed/simple;
	bh=7nKWMwAMXlJpflNICfgG68sJl9Dq4MEjyrVaHsRylSU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QKfpXvMU9BM6zdd9F/XEFa7caACs22pioP9qsd1Uu9FY8nNB0d53Va+qujQPhozv4Qj7S/SYjr/Od8Q/5RxRm9ULVdFuxiRmP1tjf4l3h2oYz3lgVP5sNJpEj15kHBoh4zq0+1FDDijDgDiQEiJBDf7/ofprniRHYzFklP4i518=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gYlz+Nw7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741646273;
	bh=5onEa9Mn+rqYPsiv6VHKuogGPZglJyzZJxHxOZ20DSk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gYlz+Nw7yL/HA7hlVeXFxu745O0y7YuIiQbbj57DZEbSM4RaBzd1baHstilnMWRWW
	 mx4YpRWfH/i5YxwOB5rDkNqBZjsnCZBqT/+9kzT1qSAPf5tIc9SnLsUH7vJ2KDcS4r
	 2aTa7RpLnI+c+J8uezVlCpt5rmN7QhgtGwphizZcWKVZFwlHsktDd914Bdb3487VYb
	 T8X/6bBDOL2hTDcpW+wzDX2o49fnKBwI/HsrwMuiUgdwk7NtlWosccuvBApfypd5jK
	 ANGb+eUJQvSqBcgO6CdE2Udw/CAwF6t1EYzs5p+6Q7mQEpHt1V+YfC39bfHceOlLfR
	 nAWakUz9HVwTQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBWxY4lPKz4x3J;
	Tue, 11 Mar 2025 09:37:53 +1100 (AEDT)
Date: Tue, 11 Mar 2025 09:37:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Uladzislau Rezki <urezki@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20250311093752.703b3069@canb.auug.org.au>
In-Reply-To: <Z89g6ZXRHQUq8WyV@boqun-archlinux>
References: <20250311081301.6a22ab25@canb.auug.org.au>
	<Z89g6ZXRHQUq8WyV@boqun-archlinux>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5Re1HHhgbBRwCjPav+56OgP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5Re1HHhgbBRwCjPav+56OgP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Boqun,

On Mon, 10 Mar 2025 15:00:09 -0700 Boqun Feng <boqun.feng@gmail.com> wrote:
>
> Thanks for spotting this. These two are likely for the next next merge
> windows (i.e. for 6.16), and presumably they will be handled by Joel
> (Cced), so I deliberately avoid putting my SoB there.

The next merge window (starting in a couple of weeks) will be for
v6.15, so if the commits are intended for v6.16, then they should not
be in linux-next (yet).  If they are intended for v6.15, then they need
to have SoBs.

--=20
Cheers,
Stephen Rothwell

--Sig_/5Re1HHhgbBRwCjPav+56OgP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfPacAACgkQAVBC80lX
0Gz4XAf8Dl83Mydkiw/it9DamD1VVvuaDGdAiKuO6NS0BDdgqNXKXC4WwT6oWNEC
W2FelvdWoGtzbHaUACSS6h3Mt5tRrYeEAfz/IzY/zxcBjtkrfDhoqDCw7rKUV8NE
5VPoq7oQah4O/Mcy6Nwn94niuprhb/iZg0dgVYrltdojoC9AcptLcMk5e407A6jI
EF6VvPLu4XRP9IRS3ha9oxqUwP31dfNWRPUfNtRQnlrk/HS2PnOW1pPJ9nrL1IyJ
kWcxNGi+SHmLm/eReeKUNldEOZQRYhC9oF4+UOYwuQhP7rrJTUsQ0jyCi4Oe1eGV
uW5kIpHZeerr+hkU4yGSppa2yH1Vkw==
=1zMF
-----END PGP SIGNATURE-----

--Sig_/5Re1HHhgbBRwCjPav+56OgP--

