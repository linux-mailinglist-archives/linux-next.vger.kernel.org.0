Return-Path: <linux-next+bounces-4640-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AC59BE477
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 11:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76C851C22E50
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 10:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BD61DE2BF;
	Wed,  6 Nov 2024 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNwSqe1j"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAC21DDC29;
	Wed,  6 Nov 2024 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730889676; cv=none; b=U+kqqWhGenYnEZ7qkBQTEL5txqcDDibHVl5B21IBCcvhzIu/xYVDJMkH9FRD7wjXOL4AMoJ0U12hanc9Y6oaap/fUIxhz4rIFyG1kUOwJ5DXLVYtkA88O0ebFhWQ9DnQgM7J5iPIccqSkknuZuL95dmM4ITMbT4yr3uMtiYV6us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730889676; c=relaxed/simple;
	bh=aKMZry0zU9jc0hxKUceZALQgjsRpHrw1CuDNWdHz8hQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bClKpKv18ZKpCqWfxRqPz8igWYoz/2sulCM+nq6p6XVIQmlG9CCFGwytrZMxp4IaiQBN9Z/Z1SwnsYPnUZHL0c1ti2WYiVtbyrm5gh7qRoHyeTgvba6w1Bh+pvSyGR0nNJuK6nOb9OuXKwjYRZitaaag3LX18Nb2nugLipFpB4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNwSqe1j; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7ed9f1bcb6bso4537669a12.1;
        Wed, 06 Nov 2024 02:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730889674; x=1731494474; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aKMZry0zU9jc0hxKUceZALQgjsRpHrw1CuDNWdHz8hQ=;
        b=YNwSqe1j9+YRj79Q+VUpthTovuA8ahXu9qrSfIGkXh5t20m2i/IcmsjZL1jiYU8yxj
         rZuTYdL9ct/pajW2EJiQs71npVVeyIbLfqnptFANbYLopR9Ud4eYG+rgps1w6w0qnWeb
         Zm5B+u2beoLKfL2dRQx+OwFNvZZ95xit0FkpByZdLyNhFWPEJmsa7IdqLTs/4a6U0Prs
         TkAHgg0F2T9kpmuKD0Gzt11ARNi6BdelvlJ21w9jBNdWcZJIn4uLbJAZ0k/PckcAgUfF
         kIN4UkqsRiHcFp6yETQBqkauqUe+ZaiAhmDovju1XlRka2M+uGOlWjFxn76TLZMgVUAh
         N4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730889674; x=1731494474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKMZry0zU9jc0hxKUceZALQgjsRpHrw1CuDNWdHz8hQ=;
        b=eL5Fc+ntHuJi5QQ16i1H8eAk9KHbMe6kleQKDyFFszPzD9lKTgMht2uU8M+zop07Hh
         J1V8PFagaWAGiOUrdhNifmWN2kLc3Pyo0gBTiRJscqH78sbbG9E2IjNiKY3K9p2Wj1eJ
         asUisbMmEsfznAgTq7NZL9r51AVKGpf3pdGUekk18Hn0geOSlgkysXBJA1Y+qgTsCA6t
         nV+kC1xyAh2Ob0varOmtAKVsfrowBkYxnDucmGPjBoEyVkVX0uoBYkydrMMSByet6qi2
         wUOOvmlxFcNNY5dq0b/+SVJsUXykR3T1cmRCUoz/Ql0VZHZfgNoJWdURC5zH63b6qZNg
         MLdg==
X-Forwarded-Encrypted: i=1; AJvYcCU1o4aK5vm/YmNrreFvvDX9gEY3/VgkoyrsaSn9IdG1Hs3q6wwR64KibAvvo0nFhz3TwLMzwy/6vKZPMnc=@vger.kernel.org, AJvYcCXKNeKUSQE/X6oWZNEO9SssHKQP8PbIdgOUehArRvJYdk8c7YTBKDRq7VVx4ug24cDfn/Sy8VrKdXymXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YydPlq34joPJLWzHq9DGSfWo4XWt6yDHZpNcnHTyjOELJeCz+zK
	AVp3zXbhDZe1uFbFUq4CgdjWXpRSGW4EKmKq36SjP68OPd8i7wTm8vttvw==
X-Google-Smtp-Source: AGHT+IEmJXqLAPUGkEQREzaDE/c6yRq/tAfrsi7A2FGJm4WBOAOV015k1/vm3+l7bHXRjp0mPIr05g==
X-Received: by 2002:a05:6a20:bb06:b0:1d9:c743:860f with SMTP id adf61e73a8af0-1d9c7438653mr36451189637.11.1730889674000;
        Wed, 06 Nov 2024 02:41:14 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c02bcsm92894295ad.191.2024.11.06.02.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 02:41:13 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id AA6B1456A07D; Wed, 06 Nov 2024 17:41:06 +0700 (WIB)
Date: Wed, 6 Nov 2024 17:41:06 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3] docs: bug-bisect: add a note about bisecting -next
Message-ID: <ZytHwhJOjeg3r-Pq@archie.me>
References: <ec19d5fc503ff7db3d4c4ff9e97fff24cc78f72a.1730808651.git.linux@leemhuis.info>
 <ZyrAoWSF9KXxtuYL@archie.me>
 <1a3dcbe4-76dd-40c4-bafd-16be33607e77@leemhuis.info>
 <ZytBuIRztNwrXoe_@archie.me>
 <230b7ea7-af9c-4f46-b331-a2df4ae86933@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dY7o+MeR2VRqlo4A"
Content-Disposition: inline
In-Reply-To: <230b7ea7-af9c-4f46-b331-a2df4ae86933@leemhuis.info>


--dY7o+MeR2VRqlo4A
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 11:35:10AM +0100, Thorsten Leemhuis wrote:
> On 06.11.24 11:15, Bagas Sanjaya wrote:
> > On Wed, Nov 06, 2024 at 06:26:49AM +0100, Thorsten Leemhuis wrote:
> >> On 06.11.24 02:04, Bagas Sanjaya wrote:
> >>> On Tue, Nov 05, 2024 at 01:11:08PM +0100, Thorsten Leemhuis wrote:
> >
> >> Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst handl=
es
> >> such things, as it has a different target audience. Should it cover
> >> -next as well? Not sure. I for now decided to focus on this addition.
> >=20
> > I think for those who want to test linux-next, they can simply follow [=
1].
> > Maybe we can add a pointer to it.
> > [1]: https://www.kernel.org/doc/man-pages/linux-next.html
>=20
> Don't think that's worth it either for this document, as those that want
> to bisect -next most of the time will already have retrieved next via
> git. And again: providing such a pointer for -next, but not explaining
> how to retrieve mainline (which is left to the other document linked
> prominently at the top) IMHO makes no sense either.

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--dY7o+MeR2VRqlo4A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZytHvgAKCRD2uYlJVVFO
o++GAPwLeonibiZiiZ28aQvZcM9Tc8FFa2MJv31ZcHDbWLGXrQEAxtxcSjh7oXNG
WvpyCFxhAgXwPbv4iDPpmnd2JW4Jgwo=
=8DAm
-----END PGP SIGNATURE-----

--dY7o+MeR2VRqlo4A--

