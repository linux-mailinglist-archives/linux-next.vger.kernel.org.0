Return-Path: <linux-next+bounces-4865-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD709E2C1E
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 20:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93502165C27
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 19:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E613920ADE3;
	Tue,  3 Dec 2024 19:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXUP7zHL"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B749A20ADDF;
	Tue,  3 Dec 2024 19:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733254402; cv=none; b=UVehxGHioOvlZIbahPScKNjIAVpf0szDGbq2w9TDLCZ1kWAbTHKN52VQI2Iy5PfLF8IxqcQV2HFXj0RyFW5W4iLKNIRif/+yU4j4FEJaFOhWDFi+OmIFO3ZKsRV4d5WF9RrKqasaL61hEBNJeruowN6MAjfsmsQtD/+8CZVjGqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733254402; c=relaxed/simple;
	bh=UfQ6ZMAmFyaVl1WaANxYOS08qhgErHJXc/qHtAmXbxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YlOYZ0tfFrnQNWs719Ma7xAMmcqgxit+qjw8XVLrgRpJj42njCo0p4mR/Ex6qAfql1T1GwJWFFOUBi/+AOpolbFFBAkBbBcmqdz0R9u7B/ja6xYo+ZnBaDfTafOCmuGUW7Cx/3ZhLpB8YuWpdKyVQGiEFq3IWFLjF2suwTtgvbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXUP7zHL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74470C4CED8;
	Tue,  3 Dec 2024 19:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733254402;
	bh=UfQ6ZMAmFyaVl1WaANxYOS08qhgErHJXc/qHtAmXbxg=;
	h=Date:From:To:Cc:Subject:From;
	b=iXUP7zHLsxv5UCtao1gBdVFZZwGlJvYhe6nHTyC6PzdHmfYmTLDzQeqFNfpTlThHp
	 J4k+kFslut7W1UdpY52pnRQXReUL9lsyhw2H0Z4aSc2KWb4+QJghn+SkVJEpuN2pPu
	 xGfH2DAajjW5JePF5vGKDeVT2lQzbWz6wtt6yT+ogq3zidX/ywFNnHtQiBCTVFwGKs
	 5BNYIcbKWsW5fO6BppeC3MZzHQhJGsxrYjQJSjoDRsfDrlmBRxjyXzX6KT4Lg2tLcP
	 VimfHABfrgTrtmqilMtTHd+7mfqESyKQ/u+4bQ/Yui6pnH98iaE3Bk8WGuFikDp/IF
	 bvCtf1QQ2PD1w==
Date: Tue, 3 Dec 2024 19:33:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the hwmon-staging tree
Message-ID: <Z09c_U2l8SqLQG-n@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cOKDY8y/dtFwjHZR"
Content-Disposition: inline


--cOKDY8y/dtFwjHZR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-staging tree, today's linux-next build
(x86 allmodconfig) failed like this:

In file included from /tmp/next/build/include/linux/module.h:22,
                 from /tmp/next/build/include/linux/device/driver.h:21,
                 from /tmp/next/build/include/linux/device.h:32,
                 from /tmp/next/build/include/linux/hwmon-sysfs.h:10,
                 from /tmp/next/build/drivers/hwmon/pmbus/tps25990.c:9:
/tmp/next/build/drivers/hwmon/pmbus/tps25990.c:437:18: error: expected ',' =
or ';' before 'PMBUS'
  437 | MODULE_IMPORT_NS(PMBUS);
      |                  ^~~~~
/tmp/next/build/include/linux/moduleparam.h:26:61: note: in definition of m=
acro '__MODULE_INFO'
   26 |                 =3D __MODULE_INFO_PREFIX __stringify(tag) "=3D" info
      |                                                             ^~~~
/tmp/next/build/include/linux/module.h:299:33: note: in expansion of macro =
'MODULE_INFO'
  299 | #define MODULE_IMPORT_NS(ns)    MODULE_INFO(import_ns, ns)
      |                                 ^~~~~~~~~~~
/tmp/next/build/drivers/hwmon/pmbus/tps25990.c:437:1: note: in expansion of=
 macro 'MODULE_IMPORT_NS'
  437 | MODULE_IMPORT_NS(PMBUS);
      | ^~~~~~~~~~~~~~~~

Caused by an interaction with Linus' tree.  I have used the hwmon tree
=66rom 20241128 instead.

--cOKDY8y/dtFwjHZR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdPXP0ACgkQJNaLcl1U
h9BpNggAgm9PvudnvzaZzW+dRRteQcBzftFoFw0oHJom7i1Y/zR/y2IwXAKwpTBu
iXXEorMvQ0ZxX+6HXSygGAUhsZdu/RZZYNRJIh9qK7gmKtmitpDePgMWCXuobjM9
mBviRKpa0I2+4Aypb3a1XgkwwziBjtHMnJswP9YCEp/gZICFKc6KkvwaUL63csoE
5l7CGbZ9v9DNh5BNpgnf0/mXqlQoA4JIZvdkra2CWyJHw5JuoJbh8V9Y4c1VyZEx
GeZUY1LT5xkFWC/AUGDbYDVquolw8XMz4yDkbztrphPbydjtkb7Ok9FTvKE9wTlK
IUvQb+9pV/vAwcEbDrXmNZ3O8nJIjA==
=xW/E
-----END PGP SIGNATURE-----

--cOKDY8y/dtFwjHZR--

