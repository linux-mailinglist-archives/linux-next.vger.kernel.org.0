Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEE0D5BD6A4
	for <lists+linux-next@lfdr.de>; Mon, 19 Sep 2022 23:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiISVxX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Sep 2022 17:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiISVxW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Sep 2022 17:53:22 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA4E743E72
        for <linux-next@vger.kernel.org>; Mon, 19 Sep 2022 14:53:18 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4MWdhr2LLKz4xD1;
        Tue, 20 Sep 2022 07:53:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1663624397;
        bh=0qpG1+BK/leDKYCrr71DaFA3CpugTJTt1W69titvYMI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=K2qR9c0WPFozVm1CAKLswzIEtqCeGHR4EUJPNHHrh2omtzpqTkhS073bQoioZvOXh
         UOSAhQxdAUMj0Cqu3X0eeI0X3U8Kd7+sHJTwiveFb6ooEy8JdgRB3UjQDaF0LrzDL6
         NplvvNLjp9hQZFxdHB/WPIN7jgmD94LI6YbEVrUs83NStSA4j+s7qoFD5pe/oGGZCo
         iof13CVWCIHY71eOzA8pMdOMQX7t03nxWS7SEhCBa/ksTfRRGoQmqtVNoTlOFsti+M
         Q35TE2kJ90QTc9zRk3CUVPmob7ZzXXxRPPOUlFgMH3eKiRL+zKrpwqoFQnbCmaGz5E
         TScO6zuP3Mmuw==
Date:   Tue, 20 Sep 2022 04:00:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Richard Weinberger <richard@nod.at>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>
Subject: Re: UML next tree update
Message-ID: <20220920040046.36c17bea@canb.auug.org.au>
In-Reply-To: <440491920.241014.1663618325760.JavaMail.zimbra@nod.at>
References: <440491920.241014.1663618325760.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Qph8p5cfGEUCiZ2bwgXYt1a";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Qph8p5cfGEUCiZ2bwgXYt1a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Richard,

On Mon, 19 Sep 2022 22:12:05 +0200 (CEST) Richard Weinberger <richard@nod.a=
t> wrote:
>
> please set the UML next trees to:
> git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git next
> git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git fixes
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/rw/uml.git will be no longe=
r used.

Done from today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Qph8p5cfGEUCiZ2bwgXYt1a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmMork8ACgkQAVBC80lX
0GyL9Qf+Ma6VjlhKS3jgNuIO4tTI/LxBHzBB2PBvi9AVRXw6NOkiDpH4Cajxkyez
RFMH0ZVgi9wurpHf4Cv/lgnQuiks/KrAI27WgeKC8u+FlvnHAisLOEqWNqkLsnWa
JqkqP5OSZzO/UboU6EYsIzMC6W9NrkxjHWjBzlyAwW52xfRpOOrH29uihM1Sski/
lxXp6z2FoZ7xcLD24i8FXkm5USoROHRw1RrKdIXgprkZsrsklts3HtkssqRTobKP
H9wSXPYjN54vqR3KhZM3tVoqiDublRm8Km7Q6mCYOpBj3sIp5vNKjpSfW6j2Y8vL
70QTjqUprgqXtcBW52jy00zwgzwrCg==
=t0Op
-----END PGP SIGNATURE-----

--Sig_/Qph8p5cfGEUCiZ2bwgXYt1a--
