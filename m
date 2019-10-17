Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02B0DDB8A1
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2019 22:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729725AbfJQUrr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Oct 2019 16:47:47 -0400
Received: from ozlabs.org ([203.11.71.1]:59667 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728420AbfJQUrr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Oct 2019 16:47:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46vLp74mB8z9sPF;
        Fri, 18 Oct 2019 07:47:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571345263;
        bh=Y9NTtyG93ICNx/4RmlPEWWUOg+j+LOmI7h8eIDtSpSc=;
        h=Date:From:To:Cc:Subject:From;
        b=MhKUAKpyEq0SfQ3LllbS00GNcs2UjSjc9IOLizheGH32ibxZNo01B6SKxIdmOrC4U
         WjCbyq8eM6puCwov7pjmMKY3NojnsrmFPIBkhnx4If3TB0HfuVUxED9G7TVUsBSm2p
         JE//ZabFBMCCW0d7s8MQuF1Q4W8iy38oOEamEgpzVo42xkkQfgp8O8vk0HTJnOXkml
         MUkfXLigtD14px4EEREiSInNONk6lxEKRkz82RaR8Sk4OVcOc49txx3vYC4MAXjLFf
         +YeO7gXm20/HTBKdv+G/Bq91CeFCzVgJ/4AL24At8LEZ4AklXG6qgTheZ/p7ts4YpG
         kE1zXrTnDq8vQ==
Date:   Fri, 18 Oct 2019 07:47:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the clockevents
 tree
Message-ID: <20191018074743.7d2c0caa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mYcb52KoIjXTd9VOuNcMZa+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mYcb52KoIjXTd9VOuNcMZa+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  ca4732de2447 ("clocksource/drivers/timer-atmel-tcb: add sama5d2 support")
  37a66e26c6f9 ("clocksource/drivers/timer-atmel-tcb: allow selecting first=
 divider")
  cc774da47406 ("clocksource/drivers/timer-atmel-tcb: stop using the 32kHz =
for clockevents")
  787b099ff975 ("clocksource/drivers/timer-atmel-tcb: fill tcb_config")
  cef671d1a52a ("clocksource/drivers/timer-atmel-tcb: rework 32khz clock se=
lection")
  3d627ed6be14 ("ARM: dts: at91: sama5d2: add TCB GCLK")
  a21da2eec7ef ("dt-bindings: mfd: atmel,at91rm9200-tcb: add sama5d2 compat=
ible")
  18944dfbe79d ("dt-bindings: mfd: atmel-tcb: convert bindings to json-sche=
ma")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/mYcb52KoIjXTd9VOuNcMZa+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2o028ACgkQAVBC80lX
0GzcjAf7BN6yG3jB7cC8mq6F3YuYUGKnj2x4v9lUjMKZIbzngebVAogxetIAoyM9
w1koS10zzSIgc98xipgWH970Eb+duznT7ao6lSkUjeNdOq20jFRg2OTYTuwvKfWj
oK/lJuy9vdiLIPKbJmh5sH59UMFRngaD4/X0ArShKnGLrXVkBO7n3dEcDK7SWn6/
Org7xg/7/lephaxOrChoXBTs72OBQsVslYDQvCUKXyJfTv52lAGMjSfMshy2Pckz
NmU+YKBe1aaYZdbwedUapaoavaFciculqZ7mxeRAd9tbTgmRSnaY6vxq4CYOLb06
aEOW+M6rVv1I/7pTBtGx/r/JuZbc4w==
=4M/u
-----END PGP SIGNATURE-----

--Sig_/mYcb52KoIjXTd9VOuNcMZa+--
