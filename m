Return-Path: <linux-next+bounces-5625-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BF4A4B7C5
	for <lists+linux-next@lfdr.de>; Mon,  3 Mar 2025 06:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 171A87A2DDE
	for <lists+linux-next@lfdr.de>; Mon,  3 Mar 2025 05:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D1B1DFD8B;
	Mon,  3 Mar 2025 05:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="g+5oWLd7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE1CEADC;
	Mon,  3 Mar 2025 05:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740981458; cv=none; b=FtWXMLEI7uG3UoBcsF04uVyOI4YO1siUkMhL+F+5Ruqn3PjGW8NJPJ7Tf0FkagIo6t5BxXKhmFWzY6AALo4+pKAjVdbemGMba1KwRRj9d/zUsNhjEPGn3CQyz1oGg36jLx42EjLtp0Y/2ZIw3l4jDbChT5dQ4zfbKr7orqSXVS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740981458; c=relaxed/simple;
	bh=CQhR6gB0aJatgJRCzvHokMZoCQPfIKKaEwPAYSGeIE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=unGBx79ZU5w5/4qf8sJJsexFGDso8TS125YNOnj9JAkceM1+vYRGHulzMa2qrrPIAcRn9cej6SurYA6ktCXMUqYHZJPyzQph1EUNcN/yizbLrLEuAlZAlPsVEObH2tGFbpFfXU84jHvO5jZ9LTXcYxvjDeL/du9Ak6RrA6tfGh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=g+5oWLd7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740981443;
	bh=RSgLqzudgEPy/S6CCf1yszXy8VS9pXFuXO06zPu3m7k=;
	h=Date:From:To:Cc:Subject:From;
	b=g+5oWLd71/1gNn3fzcjPd+JAeXtepKalLN3m5Ze0zArq+0EXOWxgl8JYN/zjiOKwL
	 AoN77W1znlzL+N0ekZNymDG9jCl3MdvRVqg9Zna15nSlaLMLFoW8fZ1dbR7QoKw55r
	 ppguBWKgxPbQLyq/FEAulPE08HrFGfgV8RWLyh7F6v1UKnPixCiLbP1geHSo2UcXn8
	 /V5ouy3zcFiEmc7Nq004fM92kfGRIfoxm9UEb7+2Fb5Rcvj/I48TcZjboVgRW1hCku
	 JN4sUr6FvQWVtD2FLB8ptSIqwyx/MVbBVp1qeMrFLsqzoui4pwb93ahcBxCgA8XAcJ
	 GpsovXWVIZsiw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z5p4M3SkZz4wj2;
	Mon,  3 Mar 2025 16:57:23 +1100 (AEDT)
Date: Mon, 3 Mar 2025 16:57:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the gpio-brgl tree with the
 gpio-brgl-fixes tree
Message-ID: <20250303165722.53c98069@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/teg/10zs3vEuA_CCwjOn01H";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/teg/10zs3vEuA_CCwjOn01H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  drivers/gpio/gpiolib.c

between commit:

  64407f4b5807 ("gpiolib: Fix Oops in gpiod_direction_input_nonotify()")

from the gpio-brgl-fixes tree and commit:

  e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::get_direc=
tion()")

from the gpio-brgl tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpio/gpiolib.c
index 8741600af7ef,d0108cf2ee0b..000000000000
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@@ -2737,15 -2804,14 +2804,14 @@@ int gpiod_direction_input_nonotify(stru
  	 * assume we are in input mode after this.
  	 */
  	if (guard.gc->direction_input) {
- 		ret =3D guard.gc->direction_input(guard.gc,
- 						gpio_chip_hwgpio(desc));
+ 		ret =3D gpiochip_direction_input(guard.gc,
+ 					       gpio_chip_hwgpio(desc));
  	} else if (guard.gc->get_direction) {
- 		dir =3D guard.gc->get_direction(guard.gc,
- 					      gpio_chip_hwgpio(desc));
 -		ret =3D gpiochip_get_direction(guard.gc, gpio_chip_hwgpio(desc));
 -		if (ret < 0)
 -			return ret;
++		dir =3D gpiochip_get_direction(guard.gc, gpio_chip_hwgpio(desc));
 +		if (dir < 0)
 +			return dir;
 =20
 -		if (ret !=3D GPIO_LINE_DIRECTION_IN) {
 +		if (dir !=3D GPIO_LINE_DIRECTION_IN) {
  			gpiod_warn(desc,
  				   "%s: missing direction_input() operation and line is output\n",
  				    __func__);
@@@ -2762,9 -2828,30 +2828,30 @@@
  	return ret;
  }
 =20
+ static int gpiochip_set(struct gpio_chip *gc, unsigned int offset, int va=
lue)
+ {
+ 	int ret;
+=20
+ 	lockdep_assert_held(&gc->gpiodev->srcu);
+=20
+ 	if (WARN_ON(unlikely(!gc->set && !gc->set_rv)))
+ 		return -EOPNOTSUPP;
+=20
+ 	if (gc->set_rv) {
+ 		ret =3D gc->set_rv(gc, offset, value);
+ 		if (ret > 0)
+ 			ret =3D -EBADE;
+=20
+ 		return ret;
+ 	}
+=20
+ 	gc->set(gc, offset, value);
+ 	return 0;
+ }
+=20
  static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int =
value)
  {
 -	int val =3D !!value, ret =3D 0;
 +	int val =3D !!value, ret =3D 0, dir;
 =20
  	CLASS(gpio_chip_guard, guard)(desc);
  	if (!guard.gc)
@@@ -2788,12 -2875,12 +2875,12 @@@
  	} else {
  		/* Check that we are in output mode if we can */
  		if (guard.gc->get_direction) {
- 			dir =3D guard.gc->get_direction(guard.gc,
- 						      gpio_chip_hwgpio(desc));
 -			ret =3D gpiochip_get_direction(guard.gc,
++			dir =3D gpiochip_get_direction(guard.gc,
+ 						     gpio_chip_hwgpio(desc));
 -			if (ret < 0)
 -				return ret;
 +			if (dir < 0)
 +				return dir;
 =20
 -			if (ret !=3D GPIO_LINE_DIRECTION_OUT) {
 +			if (dir !=3D GPIO_LINE_DIRECTION_OUT) {
  				gpiod_warn(desc,
  					   "%s: missing direction_output() operation\n",
  					   __func__);

--Sig_/teg/10zs3vEuA_CCwjOn01H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfFRMIACgkQAVBC80lX
0GyNLQf5ASeJd7+RodT2UOprRcP1trQS2MsQtorDShYvIjM2vzsiTTE4fnz4/i2h
IxwtEy0UiRvIO+oUHTq3VSKF5Hx2vPNf+TOOMXg6r/gZ9Y82TUqI2ljZ3KS0eAYN
glgGTYLOCuDtHM4LzrHADTeIkbwoVyy6nBGwh9csRp4DB1XGmMVV8hTVUnmU7K2r
ae7jC2D/HumqifbNg+1poxRFSt6YayHA/HC3hutBcd8hO+n245HOLT7Ujuo8pEt7
nk8N2hdoBgBIoYNBvAa0ykdP3cSYmsH9wC63hSzgasIM+x5wHizR0CSkegEC112A
PoZqSUVfubEO1B4BVrdsRtG0Vo0g0Q==
=rJoE
-----END PGP SIGNATURE-----

--Sig_/teg/10zs3vEuA_CCwjOn01H--

