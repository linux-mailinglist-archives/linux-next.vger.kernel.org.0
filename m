Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 194FF40ED85
	for <lists+linux-next@lfdr.de>; Fri, 17 Sep 2021 00:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241258AbhIPWuj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Sep 2021 18:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234289AbhIPWuj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Sep 2021 18:50:39 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD10C061574;
        Thu, 16 Sep 2021 15:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631832554;
        bh=gbzTlzy+kh13tU2NXnrBxnjdwYOUXWpbnyOVVsrF1DY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MA3GIDcz74VshBBt8i/iFoR9Mt09VPcKwviKdsMvNegBxvqZ7Sn0HP7boG7VxM76l
         pMv4feTMFVGuZa9T/860i+dxiAVmSVwc9vJsagQd5ym5iyHpdR17Zf0+TH07jKFo2n
         oRrF7VpANHz9YxWpCdboIjZltfj4Bu2yh/tuPeWlX9zPMjjgdpYbwR5Awg4A2ZTBNz
         NkR7lbIgo54wVlqLWXl2RKdXmdEBH2nlkGTbuk3JKTz1dt1io6r2PrY7pyiSxv5VHx
         oVpn8drm/9yMrEi6NuOhyXncMLLHs4hXur64lmMuIRp+9HOKRAFhpxjo1TJnx+arRR
         m+rlArpX2+DkA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H9XMF5hX1z9sSn;
        Fri, 17 Sep 2021 08:49:13 +1000 (AEST)
Date:   Fri, 17 Sep 2021 08:49:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Cc:     Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jiri Olsa <jolsa@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Sep 16
Message-ID: <20210917084912.070e133f@canb.auug.org.au>
In-Reply-To: <8850F8DA-5C73-4A2C-92C7-FE17ADCD2ADB@gmail.com>
References: <20210916161111.7f44d2a3@canb.auug.org.au>
        <CAADnVQJ+BnWKf61rfDhKsOv05yFRXeRrMs4d443dcSOycaTRcg@mail.gmail.com>
        <8850F8DA-5C73-4A2C-92C7-FE17ADCD2ADB@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZlQrGkVaNPO3aN2nKwocy7i";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZlQrGkVaNPO3aN2nKwocy7i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 16 Sep 2021 18:43:37 -0300 Arnaldo Carvalho de Melo <arnaldo.melo@g=
mail.com> wrote:
>
> On September 16, 2021 2:30:04 PM GMT-03:00, Alexei Starovoitov <alexei.st=
arovoitov@gmail.com> wrote:
> >On Wed, Sep 15, 2021 at 11:11 PM Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote: =20
> >>
> >> Changes since 20210915:
> >>
> >> The bpf-next tree still had its build failure so I used the version fr=
om
> >> next-20210913. =20
> >
> >Arnaldo,
> >
> >could you please push Andrii's fix into your tree asap
> >and then cleanup/follow up with a better fix if  necessary? =20
>=20
> It's there since yesterday:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/commit/?h=
=3Dperf/core&id=3D00e0ca3721cf2ddcb38cf676a3de61933640d31d
>=20
> Replying just now since it's a holiday here and I was AFK.

But that is not in any tree that is included in linux-next (and when it
does appear, it will be in the tip tree which gets merged well after
the bpf-next tree).  I will include that patch as a merge fix up for
the bpf-next tree until that patch has gone into Linus' tree ... so,
someone has to ensure that this patch get into Linus tree *before* the
bpf-next tree.

So, do you see the problem?  Linus' tree is fine on its own.  The
bpf-next tree has a patch that breaks Linus' tree, but the breakage is
not seen in the bpf-next tree because it is base on v5.14 and the
interacting patch is in v5.15-rc1.
--=20
Cheers,
Stephen Rothwell

--Sig_/ZlQrGkVaNPO3aN2nKwocy7i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFDyegACgkQAVBC80lX
0GzJxAf/ckrFHwcLgCpyvXXfCG4/68Uu9AxJzgLyghp810tYflPba9jn7n6f1vux
IYuumNLkDs+IhjLLwcFL6HpivArdFMTNd/db4bMy3CU1ASfQcPCnvXUSxkkPbD/Q
FhddF3BEY89TwxFVqi/1xxSiiIcGrwppgYY6KazIfYWrPNb2EsldB3uQZbiJFrDZ
X4baEQl6paG5Uk2+C/fgdxUAp58Z8IzFO9BInve5uGHEvysH/D0TcxIYO9sXwl1P
izpWjaYQ0B3aCTDV4FbPJKfchu0iOWnWgWsh31frLlyo6dWILgGM3vq6DaaN/6rl
U3JInzGgqU8OEX+Hsyq9YYU6XRa6ww==
=/Jn8
-----END PGP SIGNATURE-----

--Sig_/ZlQrGkVaNPO3aN2nKwocy7i--
