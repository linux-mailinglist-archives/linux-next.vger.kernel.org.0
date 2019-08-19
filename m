Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD0791B84
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2019 05:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbfHSDiF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 18 Aug 2019 23:38:05 -0400
Received: from ozlabs.org ([203.11.71.1]:51721 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726261AbfHSDiF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 18 Aug 2019 23:38:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46BflG0PC3z9sMr;
        Mon, 19 Aug 2019 13:38:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566185882;
        bh=pfE96AOV53zCFu3hWt4w3XO1oPkFG1UhK4ts9unRChc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pYKYbcmqpzDegqPL5gcbTJSqtA6y+7+lz+dU1R33GjKunQQeOUuLxlaMdxgJFLqeK
         KEtleHNJgcl/22ntH63rHhADVPB4QHb9mGzCiGcICwIIE0mMGOJlHD6nLXo3dHbZ/q
         LOar0pBB2jVPaqajTBlnOWSplT60sVaR1XqigWtp/V1GRb1i/XQzhiZcPk4PLZuTbd
         L0T3fE+dHx30gL0Hq9u+4zszi+Ww6g8tZmfWUz7P9rBeGZvdJo832EQBPPigUWtF9A
         uwnty3dhPXK8RRZx8UcDjxUw+j8UoV8moXSE+SiBoztwhqBTjYqEPeq2RYFTM6Vfwu
         ya9jR73hhsklA==
Date:   Mon, 19 Aug 2019 13:38:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Morris <jmorris@namei.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthew Garrett <mjg59@google.com>,
        Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: linux-next: build failure after merge of the security tree
Message-ID: <20190819133801.3f5108ed@canb.auug.org.au>
In-Reply-To: <20190819132119.7349e881@canb.auug.org.au>
References: <20190812145823.63d77573@canb.auug.org.au>
        <201908121033.BFBE9516AC@keescook>
        <20190819132119.7349e881@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QRI44r81h6.Y+Cx/C24Zn04";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QRI44r81h6.Y+Cx/C24Zn04
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi James,

On Mon, 19 Aug 2019 13:21:19 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 12 Aug 2019 10:34:17 -0700 Kees Cook <keescook@chromium.org> wrot=
e:
> >
> > On Mon, Aug 12, 2019 at 02:58:23PM +1000, Stephen Rothwell wrote: =20
> > >=20
> > > After merging the security tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like below.
> > >=20
> > > Caused by commit
> > >=20
> > >   45d29f9e9b8b ("security: Support early LSMs")
> > >=20
> > > I have added the following fix for today:
> > >=20
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Mon, 12 Aug 2019 14:54:20 +1000
> > > Subject: [PATCH] early_security_init() needs a stub got !CONFIG_SECUR=
ITY
                                                          ^^^
for

If you do decide to apply this patch, please fix the subject typo, thanks :=
-)

--=20
Cheers,
Stephen Rothwell

--Sig_/QRI44r81h6.Y+Cx/C24Zn04
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1aGZkACgkQAVBC80lX
0GxSVQgAiFpY9Pi7VmIDE/pnpdfJtzjv3hszMpqSNEI6uCR+MNHwZ2YQcWyqRVId
HIXrFfo1SP9rKX7in1Cnjdjn5D8jZOMXrVpS5s6quQngxQojcbit6hFHo6GGJEoY
jOrMaEd18UgoJZ3iZDLFOKiSIQ32cvWgZwwd76UgnGGE8ua0fWVeMBCv1eC1uxN3
logU+tYT705qVxOwq5sOea9ZLo+N+eQoYPXKhfGxdLP9jHMwcf0eIertiS8PfLEd
hWuR5mZzH5jLaDT47ecioiiNCdOoazJlDg5CsJXU3ujVzKKTkIVMQybghgtW/RUN
4r93D2YPw/qi+d97Dx82aZ3huMo+iA==
=OvXx
-----END PGP SIGNATURE-----

--Sig_/QRI44r81h6.Y+Cx/C24Zn04--
