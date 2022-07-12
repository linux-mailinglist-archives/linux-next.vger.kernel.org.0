Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4254157295A
	for <lists+linux-next@lfdr.de>; Wed, 13 Jul 2022 00:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233026AbiGLWbV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Jul 2022 18:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbiGLWbU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Jul 2022 18:31:20 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14639C6352;
        Tue, 12 Jul 2022 15:31:19 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4LjFpW41QTz4xvW;
        Wed, 13 Jul 2022 08:31:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1657665075;
        bh=S5nXVGMNT9peFuB+HPhh9tJuDfhvESafuMqcvYmquH4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=S0htvMsHJ7gbYfv8j9nKQNbYWKHLIgtxdD8LeBq15DzpAVBKphqykKCG1A7a2z9jz
         c20OkvTpv+FcOf9m1sCxO4SohxAbk+cu+89Hv7yI3dqunEFRT6aJ2G1uZN1ApzoPYF
         yP2fzu697972K7TwQXN2DzEthipzcc2H9z03cqz8N0pjpvVgs1UDdgSDzQ+q1FLhqp
         9wO9dfh6L9iTo4b9VV+0RMda1lHCfnkWQeEI3BmUVUQegsnpTDyWOk6EjHey2HlpmR
         B3cgP4Mg6RbXHbOtmo6J6bTAmzzBgmWD8gGO3pe1QnACZTVsJckHSpy4ifJtAx8/kz
         pkZHOARlRf+Sg==
Date:   Wed, 13 Jul 2022 06:18:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Moore <paul@paul-moore.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-security-module@vger.kernel.org
Subject: Re: Updated LSM tree for linux-next
Message-ID: <20220713061849.1fd8449a@canb.auug.org.au>
In-Reply-To: <CAHC9VhTpe=oXHFxVW00QsiXEqkGbNTNjOW3oHMyAcUopAk111g@mail.gmail.com>
References: <CAHC9VhTpe=oXHFxVW00QsiXEqkGbNTNjOW3oHMyAcUopAk111g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pPzA3ZQVHgS7hLcOITs5hnr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pPzA3ZQVHgS7hLcOITs5hnr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Tue, 12 Jul 2022 17:52:29 -0400 Paul Moore <paul@paul-moore.com> wrote:
>=20
> We just changed LSM maintainers[1] and the LSM tree has moved as a
> result.  The new LSM branch for linux-next can be found below:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git (next bra=
nch)
>=20
> Thanks.
>=20
> [1] https://lore.kernel.org/linux-security-module/165731248606.335227.155=
03387932450699761.stgit@olly

Updated from today, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/pPzA3ZQVHgS7hLcOITs5hnr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmLN1ykACgkQAVBC80lX
0Gxk4wf9Fg6rg7oyp00UtJ9FOJyKpixVJYseq8oKN3kksn3lR6XJO+yFaFFM/+32
kNszpK/6NqQ2fRzUwKKili3S4lvkbGXodwxPcaOyEMIWs0h0jg3gMhDazWCOAeFX
PaQRm6vzt6yMnKo2arXr0kLeDLz7DUtjRXrXUxBoBV9I6k8PUHc9zX38Y6smvymJ
LPUdJYPDfYdDbZnqsnLey4cWbdzdDt1Uj2PsMLA8g0MJ9y66XiTCkwbGSN0iz4mI
kjgXmieZoerF8LjSRxO0mkHt4uPhWFHYPMrvv8wt4WeZEpo9XDWluFVaftcytXcj
md5uV1G3Ze/UO9/V42UXGPvzNZAflg==
=vMn3
-----END PGP SIGNATURE-----

--Sig_/pPzA3ZQVHgS7hLcOITs5hnr--
