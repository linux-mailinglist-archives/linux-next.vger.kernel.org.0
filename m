Return-Path: <linux-next+bounces-8088-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDC9B33628
	for <lists+linux-next@lfdr.de>; Mon, 25 Aug 2025 08:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18A91161084
	for <lists+linux-next@lfdr.de>; Mon, 25 Aug 2025 06:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9C023D7E2;
	Mon, 25 Aug 2025 06:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lHTJ4nPF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242EF23D7DA;
	Mon, 25 Aug 2025 06:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756101970; cv=none; b=gRYxBe54aJh0nYw3hwBLdWnftDu+lPD6pKIilf6WOD4EfFqUVPuf1OTJeO2DLd2JcllCOoiQYzD/3TgB2IOF4cV7K5PEP3g/8hGZKGACX95kbdwwz+FfQh8aFP/6E8Fz3uLGzg+e+kcz+FK/oNUZCtqYUlEro4zEtsyW4ibiuuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756101970; c=relaxed/simple;
	bh=yrD56le40eioGmzXzTsg1qQGCLMkeOGwVrY7cv15Fz0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IYzQH84LPkfsXDakfNXtQ2Fm5mKYfHyGhzFvLwc5WoL1+H0Y8Md2ljfGzW3xwpVze/SfK0RmQupibM3YQh1ka660tqvUROlyH02nTBo/jsG/wzXzlATxNjGDvfPKQwjf1Gd0vKl75nJKAEf5U+Xn/1X4d94y7o6zgi8N+Kz+cCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lHTJ4nPF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756101958;
	bh=Vijw8TeqguQFZ1R2OCtKzTGurHB8WiXSYY6DcAghyJE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lHTJ4nPFTYQ7RLOYhKiag1aEKIjFpSYdtVcH+mKgZbhne/k4Itawg36mK+ltstcqs
	 0rzugsZqHyAPPsc1b2qGsgVmUL34FZXgfRh9/4Sxm7368TPHc0/lL+G0tHp8st3uar
	 gj+b1/Tp1E0NNDDnPtXS/G+NPyYK9/M64gWsHUlAofby/cWux4bMKzOVkg/s+m8Ifl
	 CQiyjvY0jV8T/IWYAydIl8Aea1FVXWxGF1dox8hvRfs1+i6Q2S6Y+i7v6mWgyqINOd
	 cb+fmFkjR+L6UzfAtQ8YsdTE+Z6q83anluvJ0/cSTgZUT+PCZMRBTDHxhutBWswNEX
	 4l3blhs7OfYIg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c9KzV224Nz4w2H;
	Mon, 25 Aug 2025 16:05:58 +1000 (AEST)
Date: Mon, 25 Aug 2025 16:05:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: David Gow <davidgow@google.com>, Marie Zhussupova <marievic@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, KUnit Development
 <kunit-dev@googlegroups.com>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kunit-next tree
Message-ID: <20250825160557.591ef4d7@canb.auug.org.au>
In-Reply-To: <CABVgOSm2_FGfjQpUBttuUH5ZrMEqnaGkYVkN6N96wX7Qs8EE2Q@mail.gmail.com>
References: <20250818120846.347d64b1@canb.auug.org.au>
	<1befd7ab-f343-450f-9484-0cef21fe2da8@linuxfoundation.org>
	<CABVgOSm2_FGfjQpUBttuUH5ZrMEqnaGkYVkN6N96wX7Qs8EE2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CSLmByyvfhI7Imp6=iqT0sp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CSLmByyvfhI7Imp6=iqT0sp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 19 Aug 2025 15:44:52 +0800 David Gow <davidgow@google.com> wrote:
>
> On Tue, 19 Aug 2025 at 00:32, Shuah Khan <skhan@linuxfoundation.org> wrot=
e:
> >
> > On 8/17/25 20:08, Stephen Rothwell wrote: =20
> > >
> > > After merging the kunit-next tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this: =20
> >
> > Thank you Stephen. I did a allmodconfig build on 6.17-rc1 base - didn't
> > see the error.
> >
> > Marie, David, can you take a look this. Looks like conflict with drm
> > in next?
>=20
> Thanks, Shuah. I've managed to reproduce this with:
> ./tools/testing/kunit/kunit.py run --arch x86_64 --kunitconfig
> drivers/gpu/drm/xe
>=20
> These patches fix it (and a corresponding drm/xe test failure):
> https://lore.kernel.org/linux-next/20250819073434.1411114-1-davidgow@goog=
le.com/T/#t
>=20
> Ideally, they'll be squashed into the corresponding patches, as
> otherwise there'd be some temporary breakage during bisections. I can
> squash these into the original series and re-send it out if that works
> best for you.
>=20
> Cheers,
> -- David
>=20
> > >
> > > In file included from include/kunit/static_stub.h:18,
> > >                   from drivers/gpu/drm/xe/xe_bo.c:20:
> > > drivers/gpu/drm/xe/tests/xe_bo.c:610:48: error: initialization of 'co=
nst void * (*)(struct kunit *, const void *, char *)' from incompatible poi=
nter type 'const void * (*)(const void *, char *)' [-Wincompatible-pointer-=
types]
> > >    610 |         KUNIT_CASE_PARAM(xe_ccs_migrate_kunit, xe_pci_live_d=
evice_gen_param),
> > >        |                                                ^~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
> > > include/kunit/test.h:210:38: note: in definition of macro 'KUNIT_CASE=
_PARAM'
> > >    210 |                   .generate_params =3D gen_params, .module_n=
ame =3D KBUILD_MODNAME}
> > >        |                                      ^~~~~~~~~~
> > > drivers/gpu/drm/xe/tests/xe_bo.c:610:48: note: (near initialization f=
or 'xe_bo_tests[0].generate_params')
> > >    610 |         KUNIT_CASE_PARAM(xe_ccs_migrate_kunit, xe_pci_live_d=
evice_gen_param),
> > >        |                                                ^~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
> > > include/kunit/test.h:210:38: note: in definition of macro 'KUNIT_CASE=
_PARAM'
> > >    210 |                   .generate_params =3D gen_params, .module_n=
ame =3D KBUILD_MODNAME}
> > >        |                                      ^~~~~~~~~~
> > > drivers/gpu/drm/xe/tests/xe_bo.c:611:45: error: initialization of 'co=
nst void * (*)(struct kunit *, const void *, char *)' from incompatible poi=
nter type 'const void * (*)(const void *, char *)' [-Wincompatible-pointer-=
types]
> > >    611 |         KUNIT_CASE_PARAM(xe_bo_evict_kunit, xe_pci_live_devi=
ce_gen_param),
> > >        |                                             ^~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
> > > include/kunit/test.h:210:38: note: in definition of macro 'KUNIT_CASE=
_PARAM'
> > >    210 |                   .generate_params =3D gen_params, .module_n=
ame =3D KBUILD_MODNAME}
> > >        |                                      ^~~~~~~~~~
> > > drivers/gpu/drm/xe/tests/xe_bo.c:611:45: note: (near initialization f=
or 'xe_bo_tests[1].generate_params')
> > >    611 |         KUNIT_CASE_PARAM(xe_bo_evict_kunit, xe_pci_live_devi=
ce_gen_param),
> > >        |                                             ^~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
> > > include/kunit/test.h:210:38: note: in definition of macro 'KUNIT_CASE=
_PARAM'
> > >    210 |                   .generate_params =3D gen_params, .module_n=
ame =3D KBUILD_MODNAME}
> > >        |                                      ^~~~~~~~~~
> > > drivers/gpu/drm/xe/tests/xe_bo.c:624:51: error: initialization of 'co=
nst void * (*)(struct kunit *, const void *, char *)' from incompatible poi=
nter type 'const void * (*)(const void *, char *)' [-Wincompatible-pointer-=
types]
> > >    624 |         KUNIT_CASE_PARAM_ATTR(xe_bo_shrink_kunit, xe_pci_liv=
e_device_gen_param,
> > >        |                                                   ^~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
> > > include/kunit/test.h:223:38: note: in definition of macro 'KUNIT_CASE=
_PARAM_ATTR'
> > >    223 |                   .generate_params =3D gen_params,          =
                      \
> > >        |                                      ^~~~~~~~~~
> > > drivers/gpu/drm/xe/tests/xe_bo.c:624:51: note: (near initialization f=
or 'xe_bo_shrink_test[0].generate_params')
> > >    624 |         KUNIT_CASE_PARAM_ATTR(xe_bo_shrink_kunit, xe_pci_liv=
e_device_gen_param,
> > >        |                                                   ^~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
> > > include/kunit/test.h:223:38: note: in definition of macro 'KUNIT_CASE=
_PARAM_ATTR'
> > >    223 |                   .generate_params =3D gen_params,          =
                      \
> > >        |                                      ^~~~~~~~~~
> > >
> > > Caused by commit
> > >
> > >    444be9072fca ("kunit: Pass parameterized test context to generate_=
params()")
> > >
> > > I have used the kunit-next tree from next-20250815 for today.

I am still seeing this build failure.

--=20
Cheers,
Stephen Rothwell

--Sig_/CSLmByyvfhI7Imp6=iqT0sp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmir/UUACgkQAVBC80lX
0Gz+uQf/eRUEmVp/4AG5GB6ZDeMogB2T+8OUA5RZIJi/X0QRm0uuaBpDQ0usgJDp
Nl5XnxGfVZWLw3xoDE+vKq0e7l/NShSLjWJmM85rUzZY0u3s8J4H0Mt2OTZdTWlX
hyjaRyYVg/dVxokddniND1FOjlsK9p4zXHqNISG4FZ8S6TqONjkGDQsrH0x5DzJK
AYHbIsDiWl33liei/5RAV3hST3DOUNNVP4WRfL0Vx0lfr44sgCiEuMHrWc2qRlh2
RgCIOhqaLXRWlX36grHG9QVitycqrccg6qaeii8CWf63oKech5GM+ux2owIL6dt7
i2Jf5gBtZwd6357EqcnIltrLQoXmdA==
=CTa5
-----END PGP SIGNATURE-----

--Sig_/CSLmByyvfhI7Imp6=iqT0sp--

