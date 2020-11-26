Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 056252C4F00
	for <lists+linux-next@lfdr.de>; Thu, 26 Nov 2020 07:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388186AbgKZGy4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Nov 2020 01:54:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732132AbgKZGy4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Nov 2020 01:54:56 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D92D9C0613D4;
        Wed, 25 Nov 2020 22:54:55 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ChT5n0XF0z9sRK;
        Thu, 26 Nov 2020 17:54:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606373693;
        bh=PIy2B+27qscNcUBaGu6uClIQGjpoerBxYv6aW21G/So=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UWNRKfrNrShdAO0zfes2W0ZfMS77yTDHgFV+j602JJtkZJexp+rXcujSZePARabo1
         AAoHEaXtfVE1jILLC5ZG5+os+lnX+RQqYkL8vV8Q1sZHBfD4m5LqT9QaGBo5svHiR1
         JQ5FEVlzmP0wQBgpcZuUgZTYTTXac0iAlnxlZ6K33MIrUO6RQ+ScgDhdTH1CIAGvpl
         0Wqdpsk/58zSW4qO/RXlPujadOicHD09rkbrcyM5+0qV/rIOlS0JKJXTUEeN4kLmjV
         42EKcqFKzTmm3EeJFSy190f90IjxooZ/4XFTZMTIhkPewUMKZQ8StjBAJaTJ0zoCDe
         M1mcQ8k3lv7Fg==
Date:   Thu, 26 Nov 2020 17:54:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Sean Young <sean@mess.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20201126175452.4ff300db@canb.auug.org.au>
In-Reply-To: <20201118162934.6a12b8f2@canb.auug.org.au>
References: <20201118162934.6a12b8f2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s_HGkG0QE4p6S4cG40iiWej";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/s_HGkG0QE4p6S4cG40iiWej
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 18 Nov 2020 16:29:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the v4l-dvb tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/output/lirc.h.rst:6: WARNING: undefined label: rc-proto-max=
 (if the link has no caption the label must precede a section header)
>=20
> Introduced by commit
>=20
>   72e637fec558 ("media: rc: validate that "rc_proto" is reasonable")

I am still getting this - despite commit

 cea357bc2571 ("media: lirc: ensure RC_PROTO_MAX has documentation")

and today I got a second copy of the warning ...

--=20
Cheers,
Stephen Rothwell

--Sig_/s_HGkG0QE4p6S4cG40iiWej
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+/UTwACgkQAVBC80lX
0Gw8hQf+JnTrENeRko2Sp5F57+yLyxsh6Bc120r6O7hFxFRPryTMAOM3652oInsj
zA4M1CgtYF4tL4Gcxx9GPVJMmlKsPuabkM+j2nZJ0Fe36fjelrPhh+NdhtJGPn57
DP6K8c0mSvtnkBxw7s4Dbryks4ZxzdKfO2LDdKlEM+0Wg2zIdePqVmxyGsG6gCnX
Kgd3DA2WzdqakVitY8AOGak5JTlXYHna4tUqmusi81TfUzynVN2TmhneRY4nmNZp
7fKBrYD9YHHgCXV0X86pzNkz29CfdmQ/S/diYLfk4SRpaZjBAF6gBrEqszUSrVHM
OpJR+uqSLLi0asca6TDo7BqCi02+Iw==
=PJif
-----END PGP SIGNATURE-----

--Sig_/s_HGkG0QE4p6S4cG40iiWej--
