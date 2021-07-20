Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872443D0503
	for <lists+linux-next@lfdr.de>; Wed, 21 Jul 2021 01:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbhGTWaJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Jul 2021 18:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbhGTWaF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Jul 2021 18:30:05 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F2AC061762;
        Tue, 20 Jul 2021 16:10:41 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GTvZj6WnRz9sX1;
        Wed, 21 Jul 2021 09:10:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626822638;
        bh=QTYN7KKRV+LXieSOXxO731VmB+JNarv9cNp4faA8WS0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ebZ7xjQPHhlXohP4VQH5tElM0z3o+XbN7zOpSjnxN1VC0w/O7mfz+9kG/VJidVZw3
         T68yh71wAE6NVENyNT4t3U1lAT0mxREu5a+/Zp9kiuWatJto/CPzGlwHq1ghvNRvYJ
         LmUiK0DenttcQQCDIke/AyGvSaXhc4Qg6EPLfUyyCSH1N2yOosk76huH3B2Vf0SjrL
         LRJQKIB4h3LAnRymtbw2kPyT22YpOzwkC2k1jCRnIZTurjhZG1rOblT7sdlliMG4Tm
         BCsqzR6qV/CxC8UWqPYytDiIgweSFmil2w6Sh1DQFQAX6yOgqVoP+MvEIdG0+A+3Go
         sUnMkCbR3sgZQ==
Date:   Wed, 21 Jul 2021 09:10:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Alexey Dobriyan <adobriyan@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20210721091036.443dd942@canb.auug.org.au>
In-Reply-To: <20210720140339.cfdf2932cbd750e3af19ada2@linux-foundation.org>
References: <20210720182339.63c55429@canb.auug.org.au>
        <20210720140339.cfdf2932cbd750e3af19ada2@linux-foundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EJnitwWaWRo0VTQpCtzaku6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EJnitwWaWRo0VTQpCtzaku6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, 20 Jul 2021 14:03:39 -0700 Andrew Morton <akpm@linux-foundation.org=
> wrote:
>
> On Tue, 20 Jul 2021 18:23:39 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
>=20
> > Hi all,
> >=20
> > After merging the akpm-current tree, today's linux-next build (arm64
> > randconfig) failed like this:
> >=20
> > arch/arm64/include/asm/neon-intrinsics.h:33:10: fatal error: arm_neon.h=
: No such file or directory
> >=20
> > Also, the nds32 defconfig build failed like this;
> >=20
> > arch/nds32/include/asm/nds32.h:13:10: fatal error: nds32_intrinsic.h: N=
o such file or directory
> >=20
> > Presumably caused by commit
> >=20
> >   6f4266a78a4e ("kbuild: decouple build from userspace headers") =20
>=20
> I'm seeing several reports against that patch so I dropped it for now.

I have removed it from linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/EJnitwWaWRo0VTQpCtzaku6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD3V+wACgkQAVBC80lX
0GyMrQf/VUcrXTwE4YSmCteLTRd/hJts2aShAaVFvtV1/MEWkJ70lhTZNR8LGFDx
CzG3ChXIPBXS4W2vOh1+gI30UYvjM1H+UkwZRbygWbdZ+QHurtj8Lh+TAZ8msLFT
632fTEvJiHNWxkBVArVdtTTUSQx32NtyfEiZVIT6xwt3rJjDGvOTU8nB7psyXO3E
fIocm2/cvNp0D8HLhgeJ4umcMuD4AumewefLR48q6iIoPfoSQNUy0sJqpTsL80mT
0D48mFtpN1h0RcxByIQtnlpfC+RU/LX4MXgkdQPLPRgVSR1aev7CsjSmQD5mxSxq
umu9o3AI9iyY5bd6fgKCZJiWEKD2nw==
=3fuY
-----END PGP SIGNATURE-----

--Sig_/EJnitwWaWRo0VTQpCtzaku6--
