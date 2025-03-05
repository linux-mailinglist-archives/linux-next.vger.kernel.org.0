Return-Path: <linux-next+bounces-5647-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C9DA4FA5C
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 10:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A981A3A39B9
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 09:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7266A204859;
	Wed,  5 Mar 2025 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EGxwGh95"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA532E3373;
	Wed,  5 Mar 2025 09:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741167574; cv=none; b=hAdtiW982aOHY42nOZ3Opjl5LMqyaNqKKCO4T3EprSt8hdnDlAWKoZzxjkI+tFcy5pY6KAmgp3saO+tV9ufwPTi1AdmbhYeUymLcHOaFSds8Hlnp1lqTbWwhwg/pDBVspzymZodud2YXgWRJkk87GliCtc874pBWmRrQ/Le5h6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741167574; c=relaxed/simple;
	bh=tmskQ7leiKE8BAQ4W//EdsYp2G35k1bvxqkQemH6PvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kEornRT0dA6Lv5KmmPgRQeEwdGHyfUjl4InEpo2LJEFuL2ZvwBnO7iVDnF39HCz8a8veX/oOMEUJyhUiQ//LFlrTGGEXPzlVdgbRPvEMhY7fn11gThSHIGsgihMxtLQFRdsmg5ty43laTg0dU26ZyGS7gXXyPgbwfHl77jxqfFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EGxwGh95; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741167569;
	bh=Ou408YxY5WGW78KGngxWlZPtgXaMglVn8kg4eOYmRKg=;
	h=Date:From:To:Cc:Subject:From;
	b=EGxwGh95md1wAnQLpSH5VaAI4+bFfG9OXlK0CQ873VtWEYCsvHEO/D4DpIEwFZv5a
	 vzYxKzVSzeaLJqOLoJ/EjyHIn+jyXlJhOUhlSe1nR1iMEDpTxFfO2XoBAqwWANz4Rs
	 hrHN3OBQkFoB+3XEKpKj/jq4ZewV6Id1u8bVl5OusU7GmKz3YogGQ0NeAHY28UyAgO
	 Dba6wGOTSUvQJYzDy72zpOVmIUQyNbtIWQHhT4YA/YqWrhgx09vGe0s+7tBBrsj0VT
	 9fgs1/Ff2aXbypao2S9eUlGU6smvTaawEswbXtN6J+uj90L7DnJyQ8AHj9NeYtF3J7
	 Yc+1IPL+BZFvQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z76vj4b0Pz4wgp;
	Wed,  5 Mar 2025 20:39:29 +1100 (AEDT)
Date: Wed, 5 Mar 2025 20:39:29 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij
 <linus.walleij@linaro.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the gpio-brgl tree
Message-ID: <20250305203929.70283b9b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DywcQyTdc/7A5SL0oOz3tS_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DywcQyTdc/7A5SL0oOz3tS_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gpio-brgl tree, today's linux-next build (htmldocs)
produced these warnings:

include/linux/gpio/driver.h:551: warning: Incorrect use of kernel-doc forma=
t:          * of_node_instance_match:
include/linux/gpio/driver.h:569: warning: Function parameter or struct memb=
er 'of_node_instance_match' not described in 'gpio_chip'

Introduced by commit

  bd3ce71078bd ("gpiolib: of: Handle threecell GPIO chips")

--=20
Cheers,
Stephen Rothwell

--Sig_/DywcQyTdc/7A5SL0oOz3tS_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfIG9EACgkQAVBC80lX
0GwcPAf+M0hbDikIA+uWOvdiQxgHRrGSuO/6HQ3/EZ4/e4zXX2MyW/EQh7XFVZlU
ZuUbWFGY8mVQbbc+cmDRetOQtwOBq/KKew1mp14yzXEBDschPxGcFbsy0xTaGPdj
IYoNMYh8tew/wpJsU6GmfLHnxLDrr8vUVREZXCeLoxs30HcrKXDCfHARAXfS359I
4b77E6cPHiKM73TSpfairzhBmy8HlPLwPbjiYsdAh+f/kYQzEWUm22oC1uVQfwlu
qDouWcDbrHCmMGf9levqSb8SKaqgIZuhHWG6nzxMJC9tU0dIjPg8s/itJJ+GajS1
nNOee48dakRs+j1rsSDypMPbLcNIXA==
=ljFP
-----END PGP SIGNATURE-----

--Sig_/DywcQyTdc/7A5SL0oOz3tS_--

