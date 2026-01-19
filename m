Return-Path: <linux-next+bounces-9722-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0437D3B721
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 20:21:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 805F03050190
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 19:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE15623B604;
	Mon, 19 Jan 2026 19:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBdZnXzN"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA6C1DF987;
	Mon, 19 Jan 2026 19:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768850461; cv=none; b=Je7u8Hitubs8uzNH6wwCSX99FVAFXLUVhn8RnlHBpETPfhZMTJs9+toLJ86VRwDeh7mT+1PRwDkYm8ufbG2gN1W3qVk0HVmQVBco7ybw5assGOmcfj4sKYFCiqqsyz7SIJX2Q6dYymLoxkKVlBpQniGA3BNKOQNQodoDNRWQiC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768850461; c=relaxed/simple;
	bh=iuADDCFifETq+OhdcYtnEu90+g0P5u0ebYDWUgL3pD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fet//rAbvIagxRpjI8/UECZyvLVcGxQPzC271NdPo2mFKPc/nTgoAh2P+hGrjY7KMCCd+I8I806ZZTjFKR98HEbGI2nSgfbkWNySUvoS1E/a3fqHSaHde5BNr3tnqHsxz4PW0pVBfugz9JWi/JOWmkxNjWGUoiod2zmVQdB0emQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBdZnXzN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B06C116C6;
	Mon, 19 Jan 2026 19:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768850461;
	bh=iuADDCFifETq+OhdcYtnEu90+g0P5u0ebYDWUgL3pD4=;
	h=Date:From:To:Cc:Subject:From;
	b=hBdZnXzNNth22rXF83to3AihVvpPVkY+NUhvRKSLS0dJdfvVS/bHCoQkWasnJYGV7
	 XI8i4mPFzPmhBDaCUrJ/KMSXZ4z829qdbQePduRRxiUdz8vXRWq71Kidu++Mo/07fK
	 IQraKhbMkIctvba/hZ7FCCX1F2ZbPLC1dCAL7MDZa9xKE/kvdYGSYJ6/8OAkROSzu7
	 AhHyii8pytFovsk2dmYNXnZ/Y1DZWrsBEm7HvdVuj2os4RiGy8fbh9rRMD5Z3Qe12v
	 2peW88jDUMdq/L+VSVz0TMcLtI2VAN4qYIVD3JTzHgFvb5WoJo+ebtPw7yCx1c69b3
	 vM/GcJVwxMc0A==
Date: Mon, 19 Jan 2026 19:20:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Jorge Marques <jorge.marques@analog.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the iio tree
Message-ID: <aW6EGSEYxm2iTXXD@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b6OmAvp1A0iUE1xf"
Content-Disposition: inline


--b6OmAvp1A0iUE1xf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the iio tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/iio/adc/ad4062.c: In function 'ad4062_set_operation_mode':
/tmp/next/build/drivers/iio/adc/ad4062.c:471:24: error: variable 'xfer_trigger' has initializer but incomplete type
  471 |                 struct i3c_priv_xfer xfer_trigger = {
      |                        ^~~~~~~~~~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:472:26: error: 'struct i3c_priv_xfer' has no member named 'data'
  472 |                         .data.out = &st->conv_addr,
      |                          ^~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:472:37: error: excess elements in struct initializer [-Werror]
  472 |                         .data.out = &st->conv_addr,
      |                                     ^
/tmp/next/build/drivers/iio/adc/ad4062.c:472:37: note: (near initialization for 'xfer_trigger')
/tmp/next/build/drivers/iio/adc/ad4062.c:473:26: error: 'struct i3c_priv_xfer' has no member named 'len'
  473 |                         .len = sizeof(st->conv_addr),
      |                          ^~~
/tmp/next/build/drivers/iio/adc/ad4062.c:473:32: error: excess elements in struct initializer [-Werror]
  473 |                         .len = sizeof(st->conv_addr),
      |                                ^~~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:473:32: note: (near initialization for 'xfer_trigger')
/tmp/next/build/drivers/iio/adc/ad4062.c:474:26: error: 'struct i3c_priv_xfer' has no member named 'rnw'
  474 |                         .rnw = false,
      |                          ^~~
/tmp/next/build/drivers/iio/adc/ad4062.c:474:32: error: excess elements in struct initializer [-Werror]
  474 |                         .rnw = false,
      |                                ^~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:474:32: note: (near initialization for 'xfer_trigger')
/tmp/next/build/drivers/iio/adc/ad4062.c:471:38: error: storage size of 'xfer_trigger' isn't known
  471 |                 struct i3c_priv_xfer xfer_trigger = {
      |                                      ^~~~~~~~~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:477:24: error: implicit declaration of function 'i3c_device_do_priv_xfers'; did you mean 'i3c_device_do_xfers'? [-Wimplicit-function-declaration]
  477 |                 return i3c_device_do_priv_xfers(st->i3cdev, &xfer_trigger, 1);
      |                        ^~~~~~~~~~~~~~~~~~~~~~~~
      |                        i3c_device_do_xfers
/tmp/next/build/drivers/iio/adc/ad4062.c:471:38: error: unused variable 'xfer_trigger' [-Werror=unused-variable]
  471 |                 struct i3c_priv_xfer xfer_trigger = {
      |                                      ^~~~~~~~~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c: In function 'ad4062_trigger_work':
/tmp/next/build/drivers/iio/adc/ad4062.c:610:16: error: variable 'xfer_sample' has initializer but incomplete type
  610 |         struct i3c_priv_xfer xfer_sample = {
      |                ^~~~~~~~~~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:611:18: error: 'struct i3c_priv_xfer' has no member named 'data'
  611 |                 .data.in = &st->buf.be32,
      |                  ^~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:611:28: error: excess elements in struct initializer [-Werror]
  611 |                 .data.in = &st->buf.be32,
      |                            ^
/tmp/next/build/drivers/iio/adc/ad4062.c:611:28: note: (near initialization for 'xfer_sample')
/tmp/next/build/drivers/iio/adc/ad4062.c:612:18: error: 'struct i3c_priv_xfer' has no member named 'len'
  612 |                 .len = st->conv_sizeof,
      |                  ^~~
/tmp/next/build/drivers/iio/adc/ad4062.c:612:24: error: excess elements in struct initializer [-Werror]
  612 |                 .len = st->conv_sizeof,
      |                        ^~
/tmp/next/build/drivers/iio/adc/ad4062.c:612:24: note: (near initialization for 'xfer_sample')
/tmp/next/build/drivers/iio/adc/ad4062.c:613:18: error: 'struct i3c_priv_xfer' has no member named 'rnw'
  613 |                 .rnw = true,
      |                  ^~~
/tmp/next/build/drivers/iio/adc/ad4062.c:613:24: error: excess elements in struct initializer [-Werror]
  613 |                 .rnw = true,
      |                        ^~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:613:24: note: (near initialization for 'xfer_sample')
/tmp/next/build/drivers/iio/adc/ad4062.c:610:30: error: storage size of 'xfer_sample' isn't known
  610 |         struct i3c_priv_xfer xfer_sample = {
      |                              ^~~~~~~~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:615:16: error: variable 'xfer_trigger' has initializer but incomplete type
  615 |         struct i3c_priv_xfer xfer_trigger = {
      |                ^~~~~~~~~~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:616:18: error: 'struct i3c_priv_xfer' has no member named 'data'
  616 |                 .data.out = &st->conv_addr,
      |                  ^~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:616:29: error: excess elements in struct initializer [-Werror]
  616 |                 .data.out = &st->conv_addr,
      |                             ^
/tmp/next/build/drivers/iio/adc/ad4062.c:616:29: note: (near initialization for 'xfer_trigger')
/tmp/next/build/drivers/iio/adc/ad4062.c:617:18: error: 'struct i3c_priv_xfer' has no member named 'len'
  617 |                 .len = sizeof(st->conv_addr),
      |                  ^~~
/tmp/next/build/drivers/iio/adc/ad4062.c:617:24: error: excess elements in struct initializer [-Werror]
  617 |                 .len = sizeof(st->conv_addr),
      |                        ^~~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:617:24: note: (near initialization for 'xfer_trigger')
/tmp/next/build/drivers/iio/adc/ad4062.c:618:18: error: 'struct i3c_priv_xfer' has no member named 'rnw'
  618 |                 .rnw = false,
      |                  ^~~
/tmp/next/build/drivers/iio/adc/ad4062.c:618:24: error: excess elements in struct initializer [-Werror]
  618 |                 .rnw = false,
      |                        ^~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:618:24: note: (near initialization for 'xfer_trigger')
/tmp/next/build/drivers/iio/adc/ad4062.c:615:30: error: storage size of 'xfer_trigger' isn't known
  615 |         struct i3c_priv_xfer xfer_trigger = {
      |                              ^~~~~~~~~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:615:30: error: unused variable 'xfer_trigger' [-Werror=unused-variable]
/tmp/next/build/drivers/iio/adc/ad4062.c:610:30: error: unused variable 'xfer_sample' [-Werror=unused-variable]
  610 |         struct i3c_priv_xfer xfer_sample = {
      |                              ^~~~~~~~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c: In function 'ad4062_read_chan_raw':
/tmp/next/build/drivers/iio/adc/ad4062.c:855:16: error: variable 'xfer_trigger' has initializer but incomplete type
  855 |         struct i3c_priv_xfer xfer_trigger = {
      |                ^~~~~~~~~~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:856:18: error: 'struct i3c_priv_xfer' has no member named 'data'
  856 |                 .data.out = &st->conv_addr,
      |                  ^~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:856:29: error: excess elements in struct initializer [-Werror]
  856 |                 .data.out = &st->conv_addr,
      |                             ^
/tmp/next/build/drivers/iio/adc/ad4062.c:856:29: note: (near initialization for 'xfer_trigger')
/tmp/next/build/drivers/iio/adc/ad4062.c:857:18: error: 'struct i3c_priv_xfer' has no member named 'len'
  857 |                 .len = sizeof(st->conv_addr),
      |                  ^~~
/tmp/next/build/drivers/iio/adc/ad4062.c:857:24: error: excess elements in struct initializer [-Werror]
  857 |                 .len = sizeof(st->conv_addr),
      |                        ^~~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:857:24: note: (near initialization for 'xfer_trigger')
/tmp/next/build/drivers/iio/adc/ad4062.c:858:18: error: 'struct i3c_priv_xfer' has no member named 'rnw'
  858 |                 .rnw = false,
      |                  ^~~
/tmp/next/build/drivers/iio/adc/ad4062.c:858:24: error: excess elements in struct initializer [-Werror]
  858 |                 .rnw = false,
      |                        ^~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:858:24: note: (near initialization for 'xfer_trigger')
/tmp/next/build/drivers/iio/adc/ad4062.c:855:30: error: storage size of 'xfer_trigger' isn't known
  855 |         struct i3c_priv_xfer xfer_trigger = {
      |                              ^~~~~~~~~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:860:16: error: variable 'xfer_sample' has initializer but incomplete type
  860 |         struct i3c_priv_xfer xfer_sample = {
      |                ^~~~~~~~~~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:861:18: error: 'struct i3c_priv_xfer' has no member named 'data'
  861 |                 .data.in = &st->buf.be32,
      |                  ^~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:861:28: error: excess elements in struct initializer [-Werror]
  861 |                 .data.in = &st->buf.be32,
      |                            ^
/tmp/next/build/drivers/iio/adc/ad4062.c:861:28: note: (near initialization for 'xfer_sample')
/tmp/next/build/drivers/iio/adc/ad4062.c:862:18: error: 'struct i3c_priv_xfer' has no member named 'len'
  862 |                 .len = sizeof(st->buf.be32),
      |                  ^~~
/tmp/next/build/drivers/iio/adc/ad4062.c:862:24: error: excess elements in struct initializer [-Werror]
  862 |                 .len = sizeof(st->buf.be32),
      |                        ^~~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:862:24: note: (near initialization for 'xfer_sample')
/tmp/next/build/drivers/iio/adc/ad4062.c:863:18: error: 'struct i3c_priv_xfer' has no member named 'rnw'
  863 |                 .rnw = true,
      |                  ^~~
/tmp/next/build/drivers/iio/adc/ad4062.c:863:24: error: excess elements in struct initializer [-Werror]
  863 |                 .rnw = true,
      |                        ^~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:863:24: note: (near initialization for 'xfer_sample')
/tmp/next/build/drivers/iio/adc/ad4062.c:860:30: error: storage size of 'xfer_sample' isn't known
  860 |         struct i3c_priv_xfer xfer_sample = {
      |                              ^~~~~~~~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:860:30: error: unused variable 'xfer_sample' [-Werror=unused-variable]
/tmp/next/build/drivers/iio/adc/ad4062.c:855:30: error: unused variable 'xfer_trigger' [-Werror=unused-variable]
  855 |         struct i3c_priv_xfer xfer_trigger = {
      |                              ^~~~~~~~~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c: In function 'pm_ad4062_triggered_buffer_postenable':
/tmp/next/build/drivers/iio/adc/ad4062.c:1239:30: error: array type has incomplete element type 'struct i3c_priv_xfer'
 1239 |         struct i3c_priv_xfer xfer_sample[2] = {
      |                              ^~~~~~~~~~~
/tmp/next/build/drivers/iio/adc/ad4062.c:1239:30: error: unused variable 'xfer_sample' [-Werror=unused-variable]
/tmp/next/build/drivers/iio/adc/ad4062.c:1254:1: error: control reaches end of non-void function [-Werror=return-type]
 1254 | }
      | ^

Caused by commit

    d5284402d28f3 (iio: adc: Add support for ad4062)

I have used the version from 20260116 instead.

--b6OmAvp1A0iUE1xf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmluhBgACgkQJNaLcl1U
h9Bb9Qf8Cr4DztDaL9tJpN2EYAGwrL+vcf4ykJUllK/Z6VonK4NwZ0thAO73W/TS
AWCU5fCJbCspBACBxabfT5nlCAPK2x3kIBjbaeWconi5T+xyW6hSfLc4qM6BsHKS
hbwBQj3AVc7wIvmKRU1oWdtWv0q9xuFC6e8V81ofgwSoVTJevrmUuQswmX4LmwA1
SE+BpIELjnHJv3m6PTvqb+/MfE7AterpNnza+9ZUd7s/bNoFLTso7qI3PTEehncH
HIHZxgJ53UYCjhbf5SXn4voH9maFDpE2tORi/3WLgLGmPN/yj/asAHDePcMzpuVi
lESQjoDBDKPl27+rwHH3eTKS5vEY1A==
=iQDM
-----END PGP SIGNATURE-----

--b6OmAvp1A0iUE1xf--

