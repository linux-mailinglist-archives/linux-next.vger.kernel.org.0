Return-Path: <linux-next+bounces-8163-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 490D6B3F4BA
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 07:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE47F3AFEDA
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 05:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58471433B3;
	Tue,  2 Sep 2025 05:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="smJIhwuc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938DB1FBEB9;
	Tue,  2 Sep 2025 05:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756791912; cv=none; b=oQ3MpjtO85tLaBepxs686njHiG4gKHHcUatnUx5anL6fmYJ0a9umRMt7ArUFpopTU8eLVACqbSvMFZ8/FjPaTLKO+PgmFjxAFNZjDY/c3aGfkoreBzv8Kkpg08iscMZO4a3welxDzJuyhMTHQaMQYLBtVypyRxpZ1BBnY1XiPeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756791912; c=relaxed/simple;
	bh=Cnbto6KqHyH4lGZeD9rMr4Q9lfxDRnKqSyBncWK7t/s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CBJJsRkLH/fDj+Su9O6PDyRjeEe3cF8zuchSN2ev0yjpoZO4GrCjxEE0e66Y/fGovtz4RHD6i057UGoGvkRyQxLqI0LBfyaEMVyhU1C+H1SKMFtqOhiv/CsNYhubnatlYBTRD4yw8YrhZzwJpEG86GAQFTsd0NB5gNlFl3vD4+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=smJIhwuc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756791906;
	bh=Cnbto6KqHyH4lGZeD9rMr4Q9lfxDRnKqSyBncWK7t/s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=smJIhwuccsg/Zy9dNYxCo/8Om5CnLQAB4EvxMG0y7rC/I8uYeVTeA8R7PaxUPW+3l
	 Nx4VjW/XcObqL19EdJkE+K5TEIfm0qmOBkVnkXUL0yf/MnjkqyYQfwwwucAEZHsyd3
	 AK5cpS7S8UusCc/XOKysIbnygsmTI7RvMEzJe9ezKK+1Xsfl60oTM+l8EcF2dq2t2z
	 UnWvr8y5RtG2RfcFRzOc5hG/Plj4BcD5rLZp2S0i++cYYkLoHtLkFiyXNJ6UaS35hs
	 9Tqsa9ahWyivcHGXDmh8/elOoGwkE8l4gQ+NaFHx/uZRUsYMbNObTOjKOeI9q8FOgw
	 IwDwooebt38Sw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cGF7k3GXHz4wB0;
	Tue,  2 Sep 2025 15:45:06 +1000 (AEST)
Date: Tue, 2 Sep 2025 15:45:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: Richard Weinberger <richard.weinberger@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mtd tree
Message-ID: <20250902154505.3bcd048a@canb.auug.org.au>
In-Reply-To: <IA0PR12MB76998C672B82567715227485DC06A@IA0PR12MB7699.namprd12.prod.outlook.com>
References: <20250902120852.3dd6f0d6@canb.auug.org.au>
	<IA0PR12MB76998C672B82567715227485DC06A@IA0PR12MB7699.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VNvCssoOHPZjwJp9DOkWTG7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VNvCssoOHPZjwJp9DOkWTG7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Amit,

On Tue, 2 Sep 2025 05:25:04 +0000 "Mahapatra, Amit Kumar" <amit.kumar-mahap=
atra@amd.com> wrote:
>
> Could you please share the tree you are using along with the build
> steps you followed that resulted in this issue?

https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
branch mtd/next

I just did an x86_64 allmodconfig build.

--=20
Cheers,
Stephen Rothwell

--Sig_/VNvCssoOHPZjwJp9DOkWTG7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi2hGEACgkQAVBC80lX
0GxAVQf/bz5d47Kw2QPB2JsPXUwKe2SMc4feGknIzjvSfEdbLawnypMG0uZSLzUs
vWt/UjLEWrVtob0LzIWsJOoHxUgaGtYKMUxg0ycx2zcpC8u5y5xOstgIL7yWEEHo
srg7k0x0N/IjUtQl4rfERamfeMbiqN95jWXy0lXnKwfrHoEwjVUnWK/24otWJnNo
6ZgvFrBbkVNU14spU9BgKVNoQ3NSAWPkJXa6NyDNPs3EqF2eUcLjowrq4IPdoOmj
sRTCW6cBh5WdSaSFic/t8QPDa5welAAWvWCo+7L7t4Hy7cWUwrd184mOb43PIEvR
cvh+1ZxHTonWwwwYbFHQLFeh/g2A0g==
=KkmX
-----END PGP SIGNATURE-----

--Sig_/VNvCssoOHPZjwJp9DOkWTG7--

