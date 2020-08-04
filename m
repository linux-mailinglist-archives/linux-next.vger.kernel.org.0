Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEE7E23C1E7
	for <lists+linux-next@lfdr.de>; Wed,  5 Aug 2020 00:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgHDW0m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Aug 2020 18:26:42 -0400
Received: from ozlabs.org ([203.11.71.1]:57247 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726282AbgHDW0m (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 4 Aug 2020 18:26:42 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLq9S632vz9sR4;
        Wed,  5 Aug 2020 08:26:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596579997;
        bh=SDxUt3jLGE+9ERQ0nln2YTixtJIxts89+JgXVcjR1aI=;
        h=Date:From:To:Cc:Subject:From;
        b=ko7SWMqBWyTCGyfEuZ2kY/YUjyOTfBdueIFT/cgbtTYbQMTX4X362d26G5fEsPtsv
         eoLoulBU87y54HU/nEz1RUQeL1RC43GMkW5Nm1TMOoIOBv21hjnrkCYIcov116tZUF
         KWUpFUYanu/K+l3/YyJKznIOAhJuYgHEJS1h8nukqL/w0M2U64r+YJMekrY/7PGZwN
         KhnUaqiKH0jwQx1zB4JrRVDlHT7tZZs8SKADrWd3Kpd2zJwmuetxjEvZkOxTXFX+h7
         EA+j3+yJ0gOsrzBq1t+KXYMr+Qf5GeGEI1DQzPB7UnsR8MqTCYHnL8RNe6ou9yKQp+
         keRjLoqoQ2jKg==
Date:   Wed, 5 Aug 2020 08:26:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wim Van Sebroeck <wim@iguana.be>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: linux-next: Fixes tag needs some work in the watchdog tree
Message-ID: <20200805082635.6cbf7f2d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6ydXZ6d7W_6yPnSzdud_eU2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6ydXZ6d7W_6yPnSzdud_eU2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  95d0c04e0cf9 ("watchdog: f71808e_wdt: remove use of wrong watchdog_info o=
ption")

Fixes tag

  Fixes: 96cb4eb019ce ("watchdog: f71808e_wdt: new watchdog driver for

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/6ydXZ6d7W_6yPnSzdud_eU2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8p4JsACgkQAVBC80lX
0Gyx7wgAhBvxVC1rfRqDUampfqyaD9fJcSGcmD3vS3fpYXI/XjTAWm9heks06gfu
TDklpM27bhO6Tvha1Kh9beq84SWl2cIQN2Iuf7smL7TlpZtqHvVBbpU8XqBoCaXX
eDffmRfeZfnrlHMgh5HWeOmbt4jAF7e/gh7EGH0mzvv5W5snATAybwdWDh20CfU7
2CoCFbjMieptQVmGJ+ckFx7PEdpYhnjFpLNbMJGYLGZpCs20NV1K2UznjTwPzGdM
YCteCo0RcAJYdiDN3GnWkzHJ63WS3U3zXdDq62hBNuvbxcy3S81cWvo255FDplAm
8qQXANflphdtqE+VXSPdB4F0VQCMJw==
=0pBm
-----END PGP SIGNATURE-----

--Sig_/6ydXZ6d7W_6yPnSzdud_eU2--
