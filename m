Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9E812A8E6B
	for <lists+linux-next@lfdr.de>; Fri,  6 Nov 2020 05:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725616AbgKFEfj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Nov 2020 23:35:39 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:56507 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725828AbgKFEfj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Nov 2020 23:35:39 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CS6yD41g9z9sPB;
        Fri,  6 Nov 2020 15:35:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604637336;
        bh=xBtl7k0rmWJvX548H4vQ/7GQgQ3YW76iUrdhiEeVgoI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=d0lvXCCXQnisW7VbidZb7Fc1Jr8+BVx+qlKc29fdsN810+MsD3GNM0O9Jpsp5cXhc
         8Pqq5buncqA5AQkyJMhNtAAAdAcsZR98csy4tmcn5a7oTVKPv6thkPRYswT9/WyjUI
         XJ1V0V7rEMrJISeYVQR15PV9yO2kocpjDfz2/4Tu4Vz1h2Z/bhevmv1PM/8qNRLwJu
         sPV5ahgWMes5fjvoH3zrkecULi+YZMZufycKEQPJ0UFeu0ybVUvfe0WUsvNnp1iDr8
         0TrqdG38CbyIj9JolAxhBsdjZV+uYSemimL6U62nJ0sp1NRYMA1wBcvYeSHeZVnmon
         2c472tAZnShWQ==
Date:   Fri, 6 Nov 2020 15:35:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Balbir Singh <sblbir@amazon.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20201106153520.4f884ee1@canb.auug.org.au>
In-Reply-To: <20201105180600.08137bc5@canb.auug.org.au>
References: <20201105180600.08137bc5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OBF/5owD_Wm7VYiM1T6xAnO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OBF/5owD_Wm7VYiM1T6xAnO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 5 Nov 2020 18:06:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> After merging the tip tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> Documentation/admin-guide/hw-vuln/l1d_flush.rst:25: WARNING: undefined la=
bel: documentation/userspace-api/spec_ctrl.rst (if the link has no caption =
the label must precede a section header)
>=20
> Introduced by commit
>=20
>   767d46ab566d ("Documentation: Add L1D flushing Documentation")

Sorry, I forgot that I had already reported this last week.

--=20
Cheers,
Stephen Rothwell

--Sig_/OBF/5owD_Wm7VYiM1T6xAnO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+k0ogACgkQAVBC80lX
0GyB/gf/dyZnkbFZEsAM79NXiZS6OEv2LKsNyyvwON1WTBYZWSwWEgAyQSv3vZso
zcS9U2xdXHT4K6YPKbvmrmZsNKLHN90S2WsqtJl/joTHVHeH9a8ZddnrkNJ2WLyq
Cw/YNzSjurAiFo86r+EzwE+xU5ZMcNDjqUIWrbZtakHwiCZwlvdbc3ZBbMjitlKh
Om+evYvA3M2MInstJhGyKwf+ZtRVNm55wsz3dNMn72xusGaQntab5vBOWY0xHVuV
hFHF+Abu7i7fBF0Gy7BtgikFqvyXuIUEyZWBVJmFPLtxkM9y1frfFXAH0dbeFviM
FLhaUXHNLkyIex393BqfkgO2M4YsrA==
=UN5a
-----END PGP SIGNATURE-----

--Sig_/OBF/5owD_Wm7VYiM1T6xAnO--
