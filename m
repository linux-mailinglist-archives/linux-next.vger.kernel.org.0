Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1708B1D703A
	for <lists+linux-next@lfdr.de>; Mon, 18 May 2020 07:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbgERFQk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 May 2020 01:16:40 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55001 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726040AbgERFQj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 May 2020 01:16:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49QS112367z9sT8;
        Mon, 18 May 2020 15:16:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589778997;
        bh=MOcOHwCqAPKPIJ5vfu986UmWMAUWdy3PYgohwBbHW/U=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Iggbw1M3Qc0uZfLtvUlw8Ll5OFbohTvGalzlyXvlA8bPwK3x5BTdI7HyAS+2PBYz7
         zkbIGQmM59HVkwqIgwBkLJPZBuJ3+K6gFMy55EMV+GRopTwSz/bmiLy3PE7o8epHie
         GSWHLOqbCUWOMKB0vKxE66LSJmnVTLLOHRjHONccXU7JYxxH3Na+OruZJVNvvUnB/+
         OjPP0IDUqNc+CDWznrp9EvDGXGQk6dGpptg80qHJ+Vxpx7Mxgae4mAcpjjS3LdqLMi
         W01Y1XDqmLM7PH0UhLpk7GO1v+Vk7lbWla3sBLDNKM0ft/jjOH9jl+DVlC/j3wfS+9
         vRieXap3zWYnA==
Date:   Mon, 18 May 2020 15:16:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: linux-next: build failure after merge of the qcom tree
Message-ID: <20200518151635.5b36916b@canb.auug.org.au>
In-Reply-To: <CALAqxLUub7SqPQbKJ+OnPtcQhLiu0aFD9YudhDtDfDLNXL6smQ@mail.gmail.com>
References: <20200415104152.4d770116@canb.auug.org.au>
        <CALAqxLVN_MZ7XWsg99dhy1=Vde_XSCHey78mrxRuu7a_THxYYw@mail.gmail.com>
        <20200421092935.21eeb395@canb.auug.org.au>
        <CALAqxLUub7SqPQbKJ+OnPtcQhLiu0aFD9YudhDtDfDLNXL6smQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xNFlgL/BKb6giVD=IXy_fnh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xNFlgL/BKb6giVD=IXy_fnh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 20 Apr 2020 19:41:56 -0700 John Stultz <john.stultz@linaro.org> wro=
te:
>
> On Mon, Apr 20, 2020 at 4:29 PM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > On Tue, 14 Apr 2020 18:18:11 -0700 John Stultz <john.stultz@linaro.org>=
 wrote: =20
> > >
> > > On Tue, Apr 14, 2020 at 5:41 PM Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote: =20
> > > >
> > > > After merging the qcom tree, today's linux-next build (x86_64
> > > > allmodconfig) failed like this:
> > > >
> > > > drivers/soc/qcom/rpmh-rsc.c: In function '__tcs_buffer_write':
> > > > drivers/soc/qcom/rpmh-rsc.c:484:3: error: implicit declaration of f=
unction 'trace_rpmh_send_msg_rcuidle'; did you mean 'trace_rpmh_send_msg_en=
abled'? [-Werror=3Dimplicit-function-declaration]
> > > >   484 |   trace_rpmh_send_msg_rcuidle(drv, tcs_id, j, msgid, cmd);
> > > >       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >       |   trace_rpmh_send_msg_enabled
> > > > cc1: some warnings being treated as errors
> > > >
> > > > I don't know why this error only started happening today.  However
> > > > reverting commit
> > > >
> > > >   1d3c6f86fd3f ("soc: qcom: rpmh: Allow RPMH driver to be loaded as=
 a module")
> > > >
> > > > fixes the build, so I have done that for today. =20
> > >
> > >
> > > Ah. I'm guessing the newly added rpmh-rsc code depends on rpmh being =
built in.
> > >
> > > I'll take a look at it. =20
> >
> > I am still reverting that commit. =20
>=20
> Yea. I've stirred up some discussion on it, but its fairly
> complicated. Unfortunately I suspect it will take some time to confirm
> and justify the change I think is needed, so I think reverting this is
> the best short term plan.

I am still reverting that commit.  It is probably time (we are beyond
-rc6 now) that it is either reverted or fixed in the qcom tree, please.

--=20
Cheers,
Stephen Rothwell

--Sig_/xNFlgL/BKb6giVD=IXy_fnh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7CGjMACgkQAVBC80lX
0GxypAf9H9YutKQA/dPMaXbwsPTzllWB8s/3bF5Xi16/yUmuBAwXBMEpkBr2+CwY
Nauzo+0p0RUPc5dPM6nI1oUStHrm8gW9mmveIB3Mm6WaLKzbfdjS9+x8xirtumOS
YrXoK1sypYa7rEA4JBFpLzm7LANTYY7bVqq3e/VQChVOcb92bPzLbp9NOIBJ7/7g
OF92/8h7Jzfy4Uq2g9+tuaU8c3ySADPmyKQ8u8qalyk0jKT1X/wmrGRYujNKComB
EeL7YE4PQpytlCPMOoLhJgPx67izNzQ9nrhmF1P8DC+ugoLe7Fbb9lMakZavEnWN
DofK/UMR4g3SaWhO+Hp6fVGO4+i8BQ==
=b8Uk
-----END PGP SIGNATURE-----

--Sig_/xNFlgL/BKb6giVD=IXy_fnh--
