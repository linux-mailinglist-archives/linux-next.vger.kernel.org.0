Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69C1118EF21
	for <lists+linux-next@lfdr.de>; Mon, 23 Mar 2020 06:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgCWFYK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Mar 2020 01:24:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56983 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725858AbgCWFYK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Mar 2020 01:24:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48m2qW3LkLz9sPF;
        Mon, 23 Mar 2020 16:24:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584941048;
        bh=VVtxptXrHm7fxbzdp+HNdvCUwHj5djcCobU0ICFzZg0=;
        h=Date:From:To:Cc:Subject:From;
        b=E9FvGKA5OkKCb4C6oTuPcmPRWRvs3XQa7gJoSI2FJjrScn69WCAdOyg9b8A5ZtsYv
         OtuExuyQlTcZ05g7KhoCfNVNWVtWjYViJa+IQ6rI8HZqLumxwXHo56XTDrbXaflC1N
         ryiyYIfKTKvBxbqiN+Kx+WKuTOEjBuWpj7Z6I1LAIv6Yle/L+8OAoqPPUK4/KXCN0k
         9C5qi7il8WgPUr0FQvi1grwzQpaWuTc/5heJMJqREa76eF9kQG2YO7FTDFFruaG61x
         OXlg4tLObZGmrFh/YLM8NFwDwxOWrux7tp4m6S6MFjPUPgYGbdbF1hnSlDjVEc+QJN
         fNaBaH/3/lHvA==
Date:   Mon, 23 Mar 2020 16:24:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peng Ma <peng.ma@nxp.com>
Subject: linux-next: build warning after merge of the rtc tree
Message-ID: <20200323162406.7b1059c1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k/3A=_ND52nCta1sUiwOw2P";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/k/3A=_ND52nCta1sUiwOw2P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/rtc/rtc-fsl-ftm-alarm.c: In function 'ftm_rtc_probe':
drivers/rtc/rtc-fsl-ftm-alarm.c:246:22: warning: unused variable 'np' [-Wun=
used-variable]
  246 |  struct device_node *np =3D pdev->dev.of_node;
      |                      ^~

Introduced by commit

  cd49b579e705 ("rtc: fsl-ftm-alarm: enable acpi support")

--=20
Cheers,
Stephen Rothwell

--Sig_/k/3A=_ND52nCta1sUiwOw2P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl54R/YACgkQAVBC80lX
0Gz9tggAlXepGECLH8DAJnUWBVsJnOtnzS3I002uQ7L3oX5oB0iVX4TRN9PmIFGq
PAfBESdjQLyVnL2+aOKEuIHSLKKYKHCRAkyp4HvLGgCKtQNyeVV08NrX+7/5W8HD
OlLGJp+jr54CXY6/nh4j4NOo2RujufWfZVDFbfpmnCdYlA9ZSc8+ujOs6cEoF3cR
pw6MOT2R87j4uJPM+xL3bfq0cdHY12yHQJN9U7AdStswaMfN0oUghPeM0EJfDyF6
OvpjzNEZjU8DPbuJXuN+/Ad9u0VCrm9sbACqM2wkeXFhb/CDlNlm51DsZPbQhYtm
0CvK0IuShtxfOOyY5MAXollKFWmJHw==
=OG5V
-----END PGP SIGNATURE-----

--Sig_/k/3A=_ND52nCta1sUiwOw2P--
