Return-Path: <linux-next+bounces-4866-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CF89E2C2F
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 20:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C21C165186
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 19:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9C31F9F6C;
	Tue,  3 Dec 2024 19:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAWkh970"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D593E1F76BF;
	Tue,  3 Dec 2024 19:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733254850; cv=none; b=Auf8dyM/fx6ECTucC3VE7rFwFwmojm4mKb2FLhk4qe7U2ukrzYQfQTmD2LZYv2RhZVb15Z9f+tCilNpfMFYZveIenAw7yJpivUUWe1e1znoeFt2n3/MBAZgBLbznhGi4SNTjEosDwP2y4ncCEC1b/stbxTBX/n0rGqYL9GD7V+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733254850; c=relaxed/simple;
	bh=WZOyfP+EhstzoI/D5S9waU6x1CINluI59WEMWyr6MEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtDoVTMzuvS2B5YG/kHcmdEV9oYP3HfoVBDf3HdWTZpg0ZWdbH/e8AzUHatImFnuIyRmiPNLwgPQcTYJvxw7qurQoQy3abboHeTWp2/utUZtNgYWuKranirHVrk7uYPmOhr+pW6yzOmGbRPYJ2hG80AHrRizHHNdmZ4o4rjZ83M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAWkh970; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52485C4CECF;
	Tue,  3 Dec 2024 19:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733254850;
	bh=WZOyfP+EhstzoI/D5S9waU6x1CINluI59WEMWyr6MEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LAWkh970xyHObtE7T/DbXz1iYeKr+8SDXT167PWIybb9iJyOAPq4jsPTHUP3kP8MD
	 xxfFWr3/qNlN5sKnMsIUmoCyX41vwWPOi6WV16ZJwaNbecqfUZpfII93JRRvtkmHTd
	 +KXmEQeK2qxF3eSlUxehwU6lUoPCMuRsETXyK5H/shOIQDujE1+/RixTK6ZnUkar5p
	 MRL+Pke3LMbU1DxmJwZGXH5wm7OWazShjWjHXSo+1vwR0XItp7fy6MJzvjOOhKPHCA
	 AMelr1TdTx9BpZegheID6aRZdfMY4o3VR9gi1hPsqobx3VoeuA+KTGmPsYcz3VtXJk
	 b9T7x4ez76Qzg==
Date: Tue, 3 Dec 2024 19:40:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>, Andi Shyti <andi.shyti@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the hwmon-staging tree
Message-ID: <cba440fc-88c6-444c-af57-046ebedd60c2@sirena.org.uk>
References: <Z09c_U2l8SqLQG-n@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NTq8tl6fBawDbO5L"
Content-Disposition: inline
In-Reply-To: <Z09c_U2l8SqLQG-n@sirena.org.uk>
X-Cookie: Alimony is the high cost of leaving.


--NTq8tl6fBawDbO5L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2024 at 07:33:22PM +0000, Mark Brown wrote:
> Hi all,
>=20
> After merging the hwmon-staging tree, today's linux-next build
> (x86 allmodconfig) failed like this:

Sorry, this was the i2c-host tree rather than the hwmon-staging tree.

>=20
> In file included from /tmp/next/build/include/linux/module.h:22,
>                  from /tmp/next/build/include/linux/device/driver.h:21,
>                  from /tmp/next/build/include/linux/device.h:32,
>                  from /tmp/next/build/include/linux/hwmon-sysfs.h:10,
>                  from /tmp/next/build/drivers/hwmon/pmbus/tps25990.c:9:
> /tmp/next/build/drivers/hwmon/pmbus/tps25990.c:437:18: error: expected ',=
' or ';' before 'PMBUS'
>   437 | MODULE_IMPORT_NS(PMBUS);
>       |                  ^~~~~
> /tmp/next/build/include/linux/moduleparam.h:26:61: note: in definition of=
 macro '__MODULE_INFO'
>    26 |                 =3D __MODULE_INFO_PREFIX __stringify(tag) "=3D" i=
nfo
>       |                                                             ^~~~
> /tmp/next/build/include/linux/module.h:299:33: note: in expansion of macr=
o 'MODULE_INFO'
>   299 | #define MODULE_IMPORT_NS(ns)    MODULE_INFO(import_ns, ns)
>       |                                 ^~~~~~~~~~~
> /tmp/next/build/drivers/hwmon/pmbus/tps25990.c:437:1: note: in expansion =
of macro 'MODULE_IMPORT_NS'
>   437 | MODULE_IMPORT_NS(PMBUS);
>       | ^~~~~~~~~~~~~~~~
>=20
> Caused by an interaction with Linus' tree.  I have used the hwmon tree
> from 20241128 instead.



--NTq8tl6fBawDbO5L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdPXr0ACgkQJNaLcl1U
h9Bn7wf4yQkE/yjfCrruPC417+N//D/mvT1/DDROOlP03GJFuNX35olICCQolPJl
iatEwBmzK+kasB6f4O5rFfxp1Gq2jz442KbM5+XYv12uQPzzBcF2jzCXC0EmR1+L
CHsi7fX9LZw+R5y+Gbk5cryHxn6iA/gCCTYLZwa9+bktDxmiGKFpcd8ekyu6UjRZ
OA5YbfmO32eJZ6YTPlIwb0Z8CfYcw2GlyqLuudp9rWOf82XSWZFPRhH1zDhPQuW8
N5wYKafhBjdWnvId/dw3Q+OfsvRKDtVVR31aFMPi8XwNpcJY5kjf28ULb9+8mvuf
m1Tz1ryOkR2wc477MZpbfGdm/hnm
=RElm
-----END PGP SIGNATURE-----

--NTq8tl6fBawDbO5L--

