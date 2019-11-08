Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5613F3FF8
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2019 06:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725730AbfKHF3d (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Nov 2019 00:29:33 -0500
Received: from ozlabs.org ([203.11.71.1]:43249 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbfKHF3d (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 8 Nov 2019 00:29:33 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 478TNV5zS5z9sP3;
        Fri,  8 Nov 2019 16:29:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573190970;
        bh=1Uh2ku2+k8gcUt6gizq9uCnrRG90WIZEX5lLPwU50N8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hAh4eFkW3IUb1l71xysOePGCFZkL90RLtsRMoYFqQFTOwCM3d3q0UbpnVfIB1VbY7
         YPlJbARFY8mLWmhEbJvmeyXzg2EBuNaftfRz9Uwiz6xJsvsIdPEzAUKD8tKzEprlhB
         XIx5/FX4niX71UOvi2h0nuKDfOKYY2cXSTjjN+4aBcAtLBXVT9sXqI5lx1NMB6xBmO
         H3tY03bOexKGyG6qZO9a67xH3cmk6b+bO1Kl3WVxaQHJN3nY5oCKuE81Ke0DOhDYh3
         frtWz5Z6ct7GcJ6I0XPlulhz+w45IZxuVXSrMnguUftxO+SixIBTCWPia8DLYg/Mn0
         zDSJ+4bLXjS9g==
Date:   Fri, 8 Nov 2019 16:29:29 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the rtc tree
Message-ID: <20191108162929.2aeb6f5d@canb.auug.org.au>
In-Reply-To: <20191030154105.16a2797f@canb.auug.org.au>
References: <20191030154105.16a2797f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ro3pjyR_8Us4=bHzXNMr+Jl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ro3pjyR_8Us4=bHzXNMr+Jl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 30 Oct 2019 15:41:05 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>=20
> WARNING: unmet direct dependencies detected for FSL_RCPM
>   Depends on [n]: PM_SLEEP [=3Dy] && (ARM || ARM64)
>   Selected by [m]:
>   - RTC_DRV_FSL_FTM_ALARM [=3Dm] && RTC_CLASS [=3Dy] && (ARCH_LAYERSCAPE =
|| SOC_LS1021A || COMPILE_TEST [=3Dy])
>=20
> WARNING: unmet direct dependencies detected for FSL_RCPM
>   Depends on [n]: PM_SLEEP [=3Dy] && (ARM || ARM64)
>   Selected by [m]:
>   - RTC_DRV_FSL_FTM_ALARM [=3Dm] && RTC_CLASS [=3Dy] && (ARCH_LAYERSCAPE =
|| SOC_LS1021A || COMPILE_TEST [=3Dy])
>=20
> WARNING: unmet direct dependencies detected for FSL_RCPM
>   Depends on [n]: PM_SLEEP [=3Dy] && (ARM || ARM64)
>   Selected by [m]:
>   - RTC_DRV_FSL_FTM_ALARM [=3Dm] && RTC_CLASS [=3Dy] && (ARCH_LAYERSCAPE =
|| SOC_LS1021A || COMPILE_TEST [=3Dy])
>=20
> Introduced by commit
>=20
>   e1c2feb1efa2 ("rtc: fsl-ftm-alarm: allow COMPILE_TEST")

I am still getting these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/ro3pjyR_8Us4=bHzXNMr+Jl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3E/TkACgkQAVBC80lX
0GzZjQf7BJLsmDAO7lh+UDRKbSXPu5n2hUQLbhXCUqON+WDG+2kqEiHeGnL1mgpc
Vi2Q5QuEUpyT5o7jdO8fmWvpZCU0y++SZIBRbuf9hU53BvquwG+JEM0eMrtLxKQr
Ln94TKG9HdOjHCTmc4kUXd7z3nCQ9zg8EjXsUwcsdqCfrLe9dzDn/V+A59OGxJ4V
Ieo1H5dbUREV36vRymMOMj5O2SE1LMKbOPcbAwSOC85ZbWrqZSaPFg1olSVnwYwz
EZE/hLs+sjqmhT/iZW43m6ey1C1YQFtvIWn/sOksyJtNfTnnDmQhH9jHQlofs1NZ
bPoxW3mapyqAMT6hxVNyWWAEmc90CQ==
=bCmC
-----END PGP SIGNATURE-----

--Sig_/ro3pjyR_8Us4=bHzXNMr+Jl--
