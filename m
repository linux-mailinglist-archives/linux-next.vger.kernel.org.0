Return-Path: <linux-next+bounces-870-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 748FE83D621
	for <lists+linux-next@lfdr.de>; Fri, 26 Jan 2024 10:24:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6DE61C26C23
	for <lists+linux-next@lfdr.de>; Fri, 26 Jan 2024 09:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA9717BAF;
	Fri, 26 Jan 2024 08:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GW2zwJnm"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E3513AD8
	for <linux-next@vger.kernel.org>; Fri, 26 Jan 2024 08:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706259056; cv=none; b=V/XaPOXuEgRjtQ1qRLFHHVp7UozSs4OUVQGWLwDsDZ1hd1arGHnNs/J5q9vUy0Mh6P2jJeDziEL5cwkFpmNCoRh/i+4OkcO2x7usBXbKa/qQb5YcC4rU6WkZmVtWIbqb8D0BxPDrZlFyZN7/Urb/cQaYpiNHnUJfFVNQM4EuPEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706259056; c=relaxed/simple;
	bh=epPae/YNPKFDUOpUlHvcq/AtqEzooMv8xC07CnSkD9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBvKIt9ltitDqGk3507hFnSJuj/n5HfhCEn53D+aV+jFuvshGTh/nXooC12Zxv1I5Jf4RgnOuGu8irDSnixgN3u60Dmed33SiaoRLP2vcyZiVvkA2ympzSkysyzTIlyCHEswgbi2SnkrV8wWxUqcShjku48NCr+uhtn9/O1Jnqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GW2zwJnm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D69EC433F1;
	Fri, 26 Jan 2024 08:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706259056;
	bh=epPae/YNPKFDUOpUlHvcq/AtqEzooMv8xC07CnSkD9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GW2zwJnmMYCVHdilmqBCrRLa3G41oXFeh6IU5od+sEUITYasKniRDEys5VzP44utR
	 mbes0hc7bSbkIyFpeBGin3nd5KouxNf9tKIqD5zqvG6a/JKnk9YaWEOZQrRn95c8Dd
	 ivZPuPVoEsEbk7TLHgGmeOpvNBdcRFE0Yx46jRRRYr0z6odOGdYZaN+dd+SFdfWv9w
	 CLXskKGsVOI5ggM/pBQAjEOHL3HiFpgI7yAznuAVyI7n7J3jTnZzVmcbNbvvkFQf3v
	 BEsbEhQM9bqaBasl0r4BWCrWaaMbqY9G3Xjh37ZooWy+3m/15Ax45Scf4i8tFFTSPW
	 mtQXfQjKPuRkg==
Date: Fri, 26 Jan 2024 09:50:52 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	linux-next <linux-next@vger.kernel.org>
Subject: Re: Request for i2c re-inclusion in linux-next
Message-ID: <ZbNybBjbVpz-DC4v@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-next <linux-next@vger.kernel.org>
References: <sripk25leahdjiziacby4ql45kspw5cd3ic5vj23lctsawc2lm@be4sg32fjilu>
 <20240126115011.55da6838@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l2JbtYSFX8iqtKbR"
Content-Disposition: inline
In-Reply-To: <20240126115011.55da6838@canb.auug.org.au>


--l2JbtYSFX8iqtKbR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

> OK, I currently have an i2c tree from Wolfram who is listed as the
> maintainer, so I need to hear from him (and do you meant to replace his
> tree, or add another one?).  Also, above you list a git tree from

This is about adding another one. I will keep maintaining the I2C core,
while Andi is picking up patches for the host controller drivers.

Thank you!

   Wolfram


--l2JbtYSFX8iqtKbR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWzcmgACgkQFA3kzBSg
Kbbs2RAAnSdpNZ0PUikZ8J9C8pI8F/6a58AHXOn+111xqaAMYa2WZNvs9kg0GSit
dllnG0zrWRhSSb/3heWr9qI55GneqVYd9zTnZIyIcOqkjUTkISBUqNyrhOO5IJ85
mJ3fMU2b+BQmrWRrzT9fKyZzq41Po0lwsWOl7tUdWI9tEBhsg6+ICqEz8JLM/kmE
4/S5Ru9kLQVJhrb3BqBViL8OOEWkjcGH1JRqYLGcuwPbTsvhPVobCF7LInB3og3/
jbQheKeBbI8jwhMocZMRhZPbFaCs+lPQD90vO87XdZTuR9ptrgM+BRmtXVkA8c5C
r+/UBjaNznTqDa7mty1DxcqkSjeS6XotdVt6z32EQzcrmex26uBE1nTizkosFjrp
NEUe07d3ggFw1t0sUD+dDWS3/BdWe+OJ57UJhrgIjnuq6lZmj0aceBEASNQUH1CW
ERXMVlgIyBiDp9SIuCl8Blopth2SS+u+lMoQY67EQd/kGjgL0MUF08KZzCmjOJEO
leQw5APj3qsJsf1bmbe6eG3lb8CAGGqFYRJyKKY/d6Mgbm3rrvoLcKF3SnVHZuKv
adRk9734M34Fh6e0XlB4kHfYM2AERG0dheWZfeVwZbLJx1X1Kz96U7ou718T8pV9
zG6H4jTCWYl/Z+KyRYgCN4alBYXvqlX9LDibMvCrnGiHTc+TKSk=
=3ycF
-----END PGP SIGNATURE-----

--l2JbtYSFX8iqtKbR--

