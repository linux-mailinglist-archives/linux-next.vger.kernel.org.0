Return-Path: <linux-next+bounces-281-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC3C809A13
	for <lists+linux-next@lfdr.de>; Fri,  8 Dec 2023 04:12:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2976E2814BA
	for <lists+linux-next@lfdr.de>; Fri,  8 Dec 2023 03:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5804B20F4;
	Fri,  8 Dec 2023 03:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tMYLAiTZ"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BD2D54;
	Thu,  7 Dec 2023 19:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702005119;
	bh=72VEtvIJ6CpxIaXsemMJUrDlyhqyH3d9y/tYOeQO1GE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tMYLAiTZEjzDYh89VKA/femGUjU9oWiIaCXH+fWg2cPcg6Ut7X8ybpi/DXgwPQjpn
	 4AvXp9Pd4LMIxp51Bnpkogi4on6U7UMGhRDddy4eojamlpADi46uNgAp3ERqUtTtjl
	 CrwpN+M9DZ1KaGq4N33R2pqDCvVWvoOfqxAGzyLw8awkjWH6HkDLe7tWIgw8WekwGG
	 rlpsJ/DZ11fydHdQeEYnGXPU0LOHxTM2m3N10mbYZnw+v9if4HefVi5HV3OWyoQGBZ
	 RNQesJTCJd8ZAKh460tIL6SXK7kIASmnmSmbamyUToJEID0L52kSE5X5ivxGrN0HnK
	 nn3BtT1pb/UuA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Smblf5m4bz4x1v;
	Fri,  8 Dec 2023 14:11:58 +1100 (AEDT)
Date: Fri, 8 Dec 2023 14:11:56 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the devicetree tree
Message-ID: <20231208141156.20341c10@canb.auug.org.au>
In-Reply-To: <CAL_JsqKyqe827YRyqZnqcVghhuAuvWoiS4U7uR8wwYoGj3=9KA@mail.gmail.com>
References: <20231207125737.5e7553e3@canb.auug.org.au>
	<CAL_JsqKXo+Cr=9s=dt1kCQeMadJ_cnuSpm06zmvK8yd-vd2X3g@mail.gmail.com>
	<20231208075847.6bbd23b8@canb.auug.org.au>
	<CAL_JsqKyqe827YRyqZnqcVghhuAuvWoiS4U7uR8wwYoGj3=9KA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1u9Ex+aSgYAkr2kJerTwxtH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1u9Ex+aSgYAkr2kJerTwxtH
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Thu, 7 Dec 2023 16:05:27 -0600 Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Dec 7, 2023 at 2:58=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
> >
> > On Thu, 7 Dec 2023 09:11:22 -0600 Rob Herring <robh@kernel.org> wrote: =
=20
> > >
> > > I'm sending out fixes for all these. I want to get the final patch
> > > ("of: Stop circularly including of_device.h and of_platform.h") for
> > > all this in next to get some better build coverage and catch any new
> > > drivers added. But if it is dropped for every new driver that breaks,
> > > I'll never get it in. Can you fix these up or just leave them broken?
> > > I can keep the fixes in my tree until they get applied by the
> > > corresponding subsystem. =20
> >
> > These dependencies between trees are impossible to handle.  Please if
> > you really need the final patch in, then you must put all the necessary
> > fixes in the same branch.  There is no telling what order Linus (or I)
> > will merge the interdependent branches.
> >
> > The alternative is to spray the needed fixes out to the other
> > subsystems and then put the final patch in after the merge window
> > closes or the next release. =20
>=20
> Yes, that's what I've been doing since July and plan to do for the
> final patch. The final patch can't wait a cycle because then we'll
> just have more moles to wack. There's a couple of dependencies that
> still haven't been picked up (seems Sparc is unmaintained), so I'm
> going to send those along. I'll carry any further fixes until they I
> see they are applied.

OK, so I have moved your tree to be merged last and I fixed up the new
driver, so hopefully we are good, now.
--=20
Cheers,
Stephen Rothwell

--Sig_/1u9Ex+aSgYAkr2kJerTwxtH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVyiXwACgkQAVBC80lX
0GxmdAf7BqaIpe3WGH5SKEELLOV19V03pACUoh5AkIb2ZbKHd0e2JIhwMx35pibl
DfcWXgRRCAQqDt0HfWTI0jUBpzzp1eMRW/O3t0A29obWDM+JRG5JZWiyJOo6Zelq
ElhogKs/w9Y9rU3ojIoPlTMOLxggBCnR1M+B7n5WkXGIJYBezJYNYVL0BhMO9loG
sr0DeiCQioayE8ibr+ov19c6ejjTBTslcdiE2w505fEei3LGpTz8Hc6KeXhz0bKH
ck1sU10lV8H0mTEC2a+5OHadAvou9ITYPT5QdnHlWSXna4mx6I5qru1u0lLYi4KE
DD1oESM4ptz1wOX7nR7fGb/So5kCcA==
=9eEw
-----END PGP SIGNATURE-----

--Sig_/1u9Ex+aSgYAkr2kJerTwxtH--

