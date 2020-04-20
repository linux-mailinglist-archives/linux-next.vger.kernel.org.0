Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8941B1A29
	for <lists+linux-next@lfdr.de>; Tue, 21 Apr 2020 01:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgDTX3k (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 19:29:40 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55825 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726123AbgDTX3k (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Apr 2020 19:29:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 495jb56DRzz9sP7;
        Tue, 21 Apr 2020 09:29:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587425378;
        bh=Oz8B/YiyUcpsfx3kIDRtYsg6/ZRylQFGzQ5UXzNBOes=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OOpK6S4vQ70QkTjJz697DKCPuEYMCErJDtoWlQLSZVZMSsyw8WsRvsTo32se3ujYm
         XCphKAFg6vLz5WkMSS0YzqV6hp2n2vGRw/FXPlRwHjM1PMBEbGazSreCm3b4bfpz+5
         3mASIpAxScDKbQXR0EEy7rQKf2T1wYBvu2YKlKUnaMU4HOYiTcCEllBrUAEaBMm8kK
         1YJ7ecopherjtriKiVgaLPSPKBNiakE8jM5mWPpIdpIR2PG8+xAylWbDcPGljw7ap3
         9dqwOEmQjrjiVgi6cFLz2EiDgfT2RtBctPaAYs0OhSY3Po7K6cu2QoT1jSftZYi0IG
         c/pIpNg8lgxpg==
Date:   Tue, 21 Apr 2020 09:29:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: linux-next: build failure after merge of the qcom tree
Message-ID: <20200421092935.21eeb395@canb.auug.org.au>
In-Reply-To: <CALAqxLVN_MZ7XWsg99dhy1=Vde_XSCHey78mrxRuu7a_THxYYw@mail.gmail.com>
References: <20200415104152.4d770116@canb.auug.org.au>
        <CALAqxLVN_MZ7XWsg99dhy1=Vde_XSCHey78mrxRuu7a_THxYYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cA_Ha6r06lEpuS6bjq2ampG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cA_Ha6r06lEpuS6bjq2ampG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 14 Apr 2020 18:18:11 -0700 John Stultz <john.stultz@linaro.org> wro=
te:
>
> On Tue, Apr 14, 2020 at 5:41 PM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > After merging the qcom tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > drivers/soc/qcom/rpmh-rsc.c: In function '__tcs_buffer_write':
> > drivers/soc/qcom/rpmh-rsc.c:484:3: error: implicit declaration of funct=
ion 'trace_rpmh_send_msg_rcuidle'; did you mean 'trace_rpmh_send_msg_enable=
d'? [-Werror=3Dimplicit-function-declaration]
> >   484 |   trace_rpmh_send_msg_rcuidle(drv, tcs_id, j, msgid, cmd);
> >       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >       |   trace_rpmh_send_msg_enabled
> > cc1: some warnings being treated as errors
> >
> > I don't know why this error only started happening today.  However
> > reverting commit
> >
> >   1d3c6f86fd3f ("soc: qcom: rpmh: Allow RPMH driver to be loaded as a m=
odule")
> >
> > fixes the build, so I have done that for today. =20
>=20
>=20
> Ah. I'm guessing the newly added rpmh-rsc code depends on rpmh being buil=
t in.
>=20
> I'll take a look at it.

I am still reverting that commit.

--=20
Cheers,
Stephen Rothwell

--Sig_/cA_Ha6r06lEpuS6bjq2ampG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6eMF8ACgkQAVBC80lX
0GzkOgf/Whhn3RN2axuB7dm/PGdqYfTeIRnZ5tumbLISeRis4cdIoatRwRHAxn4M
FIwk/eUhwqt2l3HAFTa1Ga5IPNAGyNSRCwDrJ+3IhFqcmsCHjj9p2ju4brK/KRzo
5uziQvP/k3/1P8yXj0vX9G7yzbqwRd/68LUl2VWlLPNCWmJR4aujK/PWQLHK3rdN
dwVUEkeF9hGuyek9BvsumgQxDj3uOo2fzcz84tbx+FhkZQTHDCuku32Gs4uApzCJ
0euo/5vElTW3VNIenoJf1gUsdeEYS0V/7dUNEKpEX++vXGidgeTC7zFUXMA7JZgE
mud8HyzLJPSrwVlEY5+7sS2e4Tj4qg==
=31eL
-----END PGP SIGNATURE-----

--Sig_/cA_Ha6r06lEpuS6bjq2ampG--
