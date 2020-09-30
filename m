Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E160227E916
	for <lists+linux-next@lfdr.de>; Wed, 30 Sep 2020 15:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbgI3NBW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 09:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgI3NBW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Sep 2020 09:01:22 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 633B5C061755;
        Wed, 30 Sep 2020 06:01:22 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C1bww1lB0z9sSC;
        Wed, 30 Sep 2020 23:01:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601470880;
        bh=X6xiN2I+x6wk33yKc9ZJAYAQCXgB64u04V5muRpUoDg=;
        h=Date:From:To:Cc:Subject:From;
        b=qwGdwRznymrwuPS6IRWjx4VDBTL53v4BNJ+IKZeXNXFaEZ3+BUfI6AE657eO8vX8M
         MVZkz/1XYEWEyQybM/QyvJzWY3jPf2b5ab9QfPUdkMnYUUMMf/vIaSwgz1qS1T0E13
         gGnyUxIyQjfKZBleJCe5ZbNmSXVpJ7qCxKgRsxKhBFaF7SuV/EPpRd3HFPjGKSbNrA
         T9AWd0z9K2vPIs7Mq29SSmm1ZsFWVRqM+KlQmbGLbK/5qCtn6AIyPMVHN7zmHZ2BQb
         QtINCsuidDzI+xHoB4UI4htHx7S+fFWq/8V1hl13qQUfgGRdpV6p+U4G6GjL8Dkvxl
         ik+8gcf+5YjCQ==
Date:   Wed, 30 Sep 2020 23:01:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: linux-next: Fixes tag needs some work in the pinctrl tree
Message-ID: <20200930230119.4ca24210@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VTB.ucLalxn6JrQwhO6XpBU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VTB.ucLalxn6JrQwhO6XpBU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8947391f77c8 ("pinctrl: qcom: sm8250: correct sdc2_clk")

Fixes tag

  Fixes: 4e3ec9e407ad5058003309072b37111f7b8c900a

has these problem(s):

  - missing subject

Just use

	git log -1 --format=3D'Fixes: %h ("%s") <commit>'

Fixes: 4e3ec9e407ad ("pinctrl: qcom: Add sm8250 pinctrl driver.")

--=20
Cheers,
Stephen Rothwell

--Sig_/VTB.ucLalxn6JrQwhO6XpBU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl90gZ8ACgkQAVBC80lX
0Gxfngf9GBGBzxfE9TRaaqboItuOrSnPdq12dedvIE24bcOcU+tv24/QO/LvVj/j
JHovNKqo6XO5H+Ckt3eiI2NML1xfi/hKbcB+qVgV7vka67EMymL8MWRcngs+j6fN
GGwhh+5L5zALCWToQmHXGTs3eCQAVPDvLQVpw+aSfUD5IRwQNGAEO0dDAMeQRe3M
ROBydeACGXBn59xpyV9zBNTNxs33GczF3YfAYTMTGnBgRKl6Jg88ag5zvw/XUTr8
TxB853+1oxPAJSVS7mq4iiVRp4Y9dePMc2XxReHfQZuqOdy8+hZZdf4+a3JAMrsZ
pNYGPLKxw9WooSq4S7QzJF9ibdLIMA==
=qIpS
-----END PGP SIGNATURE-----

--Sig_/VTB.ucLalxn6JrQwhO6XpBU--
