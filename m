Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF05B227714
	for <lists+linux-next@lfdr.de>; Tue, 21 Jul 2020 05:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgGUDjc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jul 2020 23:39:32 -0400
Received: from ozlabs.org ([203.11.71.1]:45567 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726016AbgGUDjc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Jul 2020 23:39:32 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B9kqP1b5kz9sRN;
        Tue, 21 Jul 2020 13:39:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595302770;
        bh=AdJIwGNJIYdl+U/l5eRj9cn/K2SgesHoTlU3Olw/5+Q=;
        h=Date:From:To:Cc:Subject:From;
        b=PhEJHdgOD5kogRu1hsubZHvuoeZ+yf6NMjhEtjPG9rwr7CFO9xVKzY0nAjlA77ome
         nRxcm9YfcxcUgOIy+6PGuW5PssffjvV6sRdeWahMKyPCKhyMINSy7GUNq7XiefyzGK
         xhjKqCVZFwVxds8RTI7TuL8fQw3oTm3Ej9e81R0eU27XWOoiaq4Tuwd8lWaQf+0eF5
         yIzrYW+GYZASc2t+BSRcTEWMNu4rAYABzI/V+9TwfwmzpqDzRq6k1FnE+X7CfCOZV5
         Z6IxnaaKf6/O3YVgnES8wAjRflPQxo1qdVyRtOjHNhykhqlxitvajy2ZtvkLhmbBo6
         3UnuYNRsu3BGg==
Date:   Tue, 21 Jul 2020 13:39:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: linux-next: build warning after merge of the backlight tree
Message-ID: <20200721133926.7e2eeb4f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nPnSCLF+LQVpxJV7QQNy0iq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nPnSCLF+LQVpxJV7QQNy0iq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the backlight tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/video/backlight/cr_bllcd.c: In function 'cr_backlight_set_intensity=
':
drivers/video/backlight/cr_bllcd.c:62:6: warning: unused variable 'intensit=
y' [-Wunused-variable]
   62 |  int intensity =3D bd->props.brightness;
      |      ^~~~~~~~~

Introduced by commit

  24d34617c24f ("backlight: cr_bllcd: Introduce gpio-backlight semantics")

--=20
Cheers,
Stephen Rothwell

--Sig_/nPnSCLF+LQVpxJV7QQNy0iq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8WY28ACgkQAVBC80lX
0GypIQgAmB3rPn62k1dTf31BjDpHNe54tNe4DdX3RH+PVsbl/twjnMo34t2jfCx0
y4TCUyj91s9kAiXDyDnyyP+IxGh9HFLcsVFXiADkejjHFQxKTP8nMJ6Qd74X3bJl
N9OGzvOtKAD1CgZPF6aBZTZaNAD+6y4JBXpVY9EjWS933FV7ouEuptzhKBHmlUD2
YP7tIANXvDvZ5xZHrAhvhHMlyh3YJdiityquurelkLXd/zCSP10zBPE5v0H76XGv
AXEihqJaSeHjuoLbwzwJwFBxlQRf5m35PEsWo90pX3F0ay+38OEwLkIWaATjj0mp
tg4yiGzzsnGsWZA1w6hCEnPCJ3fsAg==
=rXWK
-----END PGP SIGNATURE-----

--Sig_/nPnSCLF+LQVpxJV7QQNy0iq--
