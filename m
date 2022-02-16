Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3B04B86D9
	for <lists+linux-next@lfdr.de>; Wed, 16 Feb 2022 12:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbiBPLj0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Feb 2022 06:39:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiBPLjZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Feb 2022 06:39:25 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A8F21289F;
        Wed, 16 Feb 2022 03:39:13 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4JzGFS4qC7z4xdL;
        Wed, 16 Feb 2022 22:39:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1645011549;
        bh=Egw/62UndvF/rSgoiC0v9UOOeoa36BkLsTqXaQwqXJs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hk6pjK683tnT7c/587MB/rLJwW2MCHE6WC0ljzTBa0wMORMmbFz/t2WQ0wVvIvT/s
         EHUjdNOB3I8zzT/63WlLqj+pSzqzsZZQo8oyBGXYZqzYaXy/MuyVBbEisbLr2r3TdE
         i/ixabbDKcNGCrqDmbqSbjus0HE9Y/vR5EAa5NpKQM1h3N+VC40kBaQj/ac9op2RCJ
         PhhjcUezz1pAO2Xos2B8pQ0tBKTBkEL5ZXZL53QpKMfPpZNbtbskdKW4f9RLHDlJWY
         gcPSnNSY9s+Rq0jMJUCHIMDkidVOOtbSeM9mT4KVB4u7KCubenwMT9jxSAiE0gD8Kc
         Fe6tNgjh7cknQ==
Date:   Wed, 16 Feb 2022 22:39:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sachin Sant <sachinp@linux.ibm.com>
Cc:     linux-xfs@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        riteshh@linux.ibm.com, linux-next@vger.kernel.org
Subject: Re: [next-20220215] WARNING at fs/iomap/buffered-io.c:75 with
 xfstests
Message-ID: <20220216223906.173b7f41@canb.auug.org.au>
In-Reply-To: <CF1506AF-E82B-412B-BD7B-A9F0B9971CB3@linux.ibm.com>
References: <5AD0BD6A-2C31-450A-924E-A581CD454073@linux.ibm.com>
        <20220216183919.13b32e1e@canb.auug.org.au>
        <CF1506AF-E82B-412B-BD7B-A9F0B9971CB3@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1.Lit0Q=.I5R4ggwSR6QO0=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1.Lit0Q=.I5R4ggwSR6QO0=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Sachin,

On Wed, 16 Feb 2022 15:17:14 +0530 Sachin Sant <sachinp@linux.ibm.com> wrot=
e:
>
> >> While running xfstests on IBM Power10 logical partition (LPAR) booted
> >> with 5.17.0-rc4-next-20220215 following warning was seen:
> >>=20
> >> The warning is seen when test tries to unmount the file system. This p=
roblem is seen
> >> while running generic/475 sub test. Have attached captured messages du=
ring the test
> >> run of generic/475.
> >>=20
> >> xfstest is a recent add to upstream regression bucket. I don=E2=80=99t=
 have any previous data
> >> to attempt a git bisect.  =20
> >=20
> > If you have time, could you test v5.17-rc4-2-gd567f5db412e (the commit
> > in Linus' tree that next-20220215 is based on) and if that OK, then a
> > bisect from that to 5.17.0-rc4-next-20220215 may be helpful. =20
>=20
> Unfortunately I cannot recreate the problem consistently. I tried same te=
st run with both
> mainline as well as linux-next20220215. In both attempts I wasn=E2=80=99t=
 able to recreate it.

No worries, thanks anyway.
--=20
Cheers,
Stephen Rothwell

--Sig_/1.Lit0Q=.I5R4ggwSR6QO0=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmIM4loACgkQAVBC80lX
0GxSfAf/R/U7hR+s4IMzwJpJGvfwh3de8T4tAUVBw3EQuYtdDbYOWeuU5160vFzz
DiEDtTsAPxMXHT+nTGQJBItacqXfilXEtbMjhZXxbhsGVdnjM0fcjEwII0m02BQ1
lOvzTeKuUo2ypeSG123lt524LgaNv4TTut7d3P7iJ6Kyujh24Q2fY6hle9UyRsqS
kJIJ0EqiyARURqDx+cDV4Qekjx8NpKA6jXGAFTX9CHHzt+NFAMHuaU90IRItJmtP
BpruTqAcx1AuN3MJcm1qQM7V3r8r7ROrxW5WQkQiRugycqRvEjXrQebnaFnMdWvf
fskkIN27xM7lP+2cjoFckgtKBvmSFA==
=ixok
-----END PGP SIGNATURE-----

--Sig_/1.Lit0Q=.I5R4ggwSR6QO0=--
