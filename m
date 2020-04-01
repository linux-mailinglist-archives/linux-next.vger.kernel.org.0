Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D528819A303
	for <lists+linux-next@lfdr.de>; Wed,  1 Apr 2020 02:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731438AbgDAAmm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Mar 2020 20:42:42 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48681 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731331AbgDAAmm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Mar 2020 20:42:42 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48sS8Y2hdVz9sRf;
        Wed,  1 Apr 2020 11:42:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585701759;
        bh=WFELNxBHacJgMgQN1O6WllAKJIxtYTe1/pd8jb5qX6Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Z6OECtHM8wlQiLhq8UOE3HRa3cq+Vq7bjRoLNfPvDURV3rhLtQNcC/JdTsnrhtG0d
         rYJvGR21BDgPnyvzI4ikNe0x3PaKIJuKQzFw9/YUkXyljLNovAf2DuyATPZolSMRdG
         pW0DXWR34lEFH9+JgZXe35s5ypKuwxXyMCu5Adg45Ne8xVSiQnW/hLNaBsFbGPznLl
         6jfPg1FnSBxwG0dJ35yzKjVK2GLQVStl/C82mqCxtmHCpMdlZd4A9BZEKSfKjMffHi
         vpcItnixSsk+Z4xlugqUNAWXBZtH1a5RzvihkeIavu6bsVNDZzidVbGbE8hjS7i34m
         l2Djhjk0cSIuw==
Date:   Wed, 1 Apr 2020 11:42:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Willy Wolff <willy.mh.wolff.ml@gmail.com>,
        Thara Gopinath <thara.gopinath@linaro.org>
Subject: Re: linux-next: manual merge of the tip tree with the thermal tree
Message-ID: <20200401114234.7b34320b@canb.auug.org.au>
In-Reply-To: <20200325133240.50370c2f@canb.auug.org.au>
References: <20200325133240.50370c2f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kF/YPUadqgcYAQ9mWQXedRG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kF/YPUadqgcYAQ9mWQXedRG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 25 Mar 2020 13:32:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   drivers/thermal/cpufreq_cooling.c
>=20
> between commit:
>=20
>   ff44f672d741 ("thermal/drivers/cpufreq_cooling: Fix return of cpufreq_s=
et_cur_state")
>=20
> from the thermal tree and commit:
>=20
>   f12e4f66ab6a ("thermal/cpu-cooling: Update thermal pressure in case of =
a maximum frequency capping")
>=20
> from the tip tree.
>=20
> I fixed it up (the latter seems to include the former, so I just used
> the latter) and can carry the fix as necessary. This is now fixed as
> far as linux-next is concerned, but any non trivial conflicts should be
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

This is now a conflict between the thermal tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/kF/YPUadqgcYAQ9mWQXedRG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6D43oACgkQAVBC80lX
0GxtnggAi9sU2S4vvZ+S5pn+h+DvVlADmdzCqrCFv2TzB/GQ9XXnXD0oPflPG0Xl
NBVH1rYBTOCnuzsb+wHiDOmG2tlAmAv/qvOdmr09OrZFZktHcNuG8yLORzeQyV/Q
c6bKkb6UTQn58TT+lSKzr9f4x5GvYHP7e6gmsjs8KnDBsMdbAXabiYJVx7t/gWrx
qQUp5fInN+4FPXBL1Uu31mLy9n03Il6vmqGrnUZhKMLPa4RGPFKUEmjsJMcIkzC7
70yzJ3/Bl35KNXthKrI3K60Vnm/MeKiB9qI4lE8JmwOPCTszLUVX2UyQJNwdiaSC
maEotRQQAJaxtCkGvBacLe7udnkHFQ==
=3Qm3
-----END PGP SIGNATURE-----

--Sig_/kF/YPUadqgcYAQ9mWQXedRG--
