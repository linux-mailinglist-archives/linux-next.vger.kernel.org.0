Return-Path: <linux-next+bounces-9718-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7357BD3B63A
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 19:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 317D53046995
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 18:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0AA238B9AF;
	Mon, 19 Jan 2026 18:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldvSI1X7"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD7F2773C6;
	Mon, 19 Jan 2026 18:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768848842; cv=none; b=jsb9cTrEOBntFwS3lN4jK42BYfwXCuY1CNb2WzG7ddzt3oa7IAfc6CkjmwxwLQcoIwgxvy0UpW4KlFAMexQYenqdSft0VVDAygQcK7evsj9fLU/DRBsF2gpHJt1h6xtdyTnUG6rj8Q9hiAuExm3oYprYqFnav/gRUEkb2mQeZAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768848842; c=relaxed/simple;
	bh=otdp204VLN47IZwbNbnZPPxzmbM8MHuDiDV5ZEEyles=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkU4SziaHZBphEautWYsD0RCCKirq/wT+rBh9cxo/ZZjMRZokwPrtaeLhr5jt5GT5Z/OYBtYHWCL8yN/Yk2gM/GAFCAZbcpJktGqAKw6/wH9rxj31O5cFCjmefSwGuMyGn+NBuDhiNG/nkAurpkpy18Eb4A/PQlPExlDIIimIag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldvSI1X7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAFFBC116C6;
	Mon, 19 Jan 2026 18:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768848842;
	bh=otdp204VLN47IZwbNbnZPPxzmbM8MHuDiDV5ZEEyles=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ldvSI1X77CKhhFizj5gD01vnR5tnbqD1X6jUny7IcNsV9vLfMSuX5EMNKWcTYEkQX
	 h9NfmgqMXjiRVchtpIUcG7tl6D1sg0dQeQVRY7h2B4RFMPd3HX5FtrDpyuTDzBh+oR
	 guGAaeC+1ihQQk7NK53P7KmfBX7yTTAW3qgYS/saqI/UmAntVy6E0aSgjeJh6utYMa
	 1Ygc4hDT6oCcMyk7wj7ssBJ1GDxsS9jUinaimsfyN4nGUt4piIOGJbsSSiVhtMZp5M
	 T+RMGeAHib4+1qPMibn3GWRxzAYRarM8NZL0zMTJcDjRXL3C31sVUWMMMuCOMvgaPq
	 j3ampdmRCGUTA==
Date: Mon, 19 Jan 2026 18:53:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <27b562ca-d79b-4f80-be71-ebf5e26ed9ab@sirena.org.uk>
References: <aW5xqLq7gatOy1DV@sirena.org.uk>
 <fc855e76-5f3a-458e-82f9-f43c7d23932e@sirena.org.uk>
 <CAJ-ks9=V_JmzEaXUrHPm6K-DyTgkxEhrPCW=2ZgDJpc+4Z83_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P4q8oaxhu/lOV53N"
Content-Disposition: inline
In-Reply-To: <CAJ-ks9=V_JmzEaXUrHPm6K-DyTgkxEhrPCW=2ZgDJpc+4Z83_A@mail.gmail.com>
X-Cookie: Does not include installation.


--P4q8oaxhu/lOV53N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 01:18:09PM -0500, Tamir Duberstein wrote:
> On Mon, Jan 19, 2026 at 1:13=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:
> > On Mon, Jan 19, 2026 at 06:02:20PM +0000, Mark Brown wrote:

> > > Caused by commit

> > >   4cef2fcda3ada (rnull: replace `kernel::c_str!` with C-Strings)

> > > I have used the version from 20260116 instead.

> > Actually that's been there for a while so I'll just revert the commit
> > instead.

> Ah yes, this is the combination of
> https://lore.kernel.org/all/20251222-cstr-configfs-v1-1-cc1665c51c43@gmai=
l.com/
> and https://lore.kernel.org/all/20251222-cstr-block-v1-1-fdab28bb7367@gma=
il.com/
> going through different trees. With both changes, the import becomes
> unused. Can the import be removed as part of the merge commit?

I could do that as a merge fixup instead of the revert, I'll have a look
at some point but not for today.  Someone will need to work out how this
works when things go to Linus...

--P4q8oaxhu/lOV53N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlufcUACgkQJNaLcl1U
h9CAOQf9G9F1hgcpKKT7REZGX5EsY9O4xkfzGnt4uHPIbW74oTV28DVnK2qOL9++
N7c7eYitswzvcAgu9SWRrchREorWAPdjL51/4mFudpkA5ma7EzUrJQT11xa+O0Ou
yQHUrIVjR32kUsS0mJLEzVrAxEq4+TN2FDOYa1gijKPwCYX/SRXbMGFa5AHmP1oa
QtTeR74yhxa2OT7YRPVWmjIrJmfvF3aJ7DewW0Aj+wJmH/YzTIeStlsTRV9lvOgU
+I3eRu/p/qwmd3yguD8QX0pChy/Lm8X3s7qtgfDG8tzGJvtIiZui5bEzjhA+/Bqa
HpHtpzhDndILaMhB9A37e1MZ4lVrPw==
=zl/9
-----END PGP SIGNATURE-----

--P4q8oaxhu/lOV53N--

