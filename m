Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7F33BD6DC
	for <lists+linux-next@lfdr.de>; Tue,  6 Jul 2021 14:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234681AbhGFMsb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Jul 2021 08:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238118AbhGFMs0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Jul 2021 08:48:26 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE898C061765;
        Tue,  6 Jul 2021 05:33:52 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GK26P1v4dz9sX1;
        Tue,  6 Jul 2021 22:33:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625574829;
        bh=VGuOeIqkazX8k29lkDzUILpLEfjuYJcx8ISaTeaCME8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HWW7gTj27qzjWR4gfnWEWYl7wMXYPbOpKMl0YmaZI1vhQ1ci6BeQ1lhH0EdwD7GGy
         MoNIbq80xB7wGr9urSzkufIasyTLq5qUJFKD1LjiIYSHx4CDTqOnmerGFuZ3DmmzYo
         W1JAbQH0Ts+xNcahg1ygz9Bz8cvcqz9ncmbBKEhxvlXO4kNKiM4DbPqRvp3M4Uw1Bj
         hKuwtGZPScgbOMijJqfSHSG7o5L7lYlAwe9dbodouNq6wgcwbdwmzGH9yEXJDfrrV7
         OQHY2QEwNRqd1yapSwg4F83AlLPtTmUvcyjjuFzB8+KmPqc8SQCHb64g8WxA4LlLA6
         e+ZJug+FmVXxw==
Date:   Tue, 6 Jul 2021 22:33:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc:     linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: linux-next: removed trees
Message-ID: <20210706223346.2792923c@canb.auug.org.au>
In-Reply-To: <20210705220935.4d24a7af@kant>
References: <20210514123221.7c21393f@canb.auug.org.au>
        <20210705215743.40b26667@kant>
        <20210705220935.4d24a7af@kant>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pC15r9W+6cV18QOuFaK9qls";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pC15r9W+6cV18QOuFaK9qls
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Mon, 5 Jul 2021 22:09:35 +0200 Stefan Richter <stefanr@s5r6.in-berlin.de=
> wrote:
>
> On Jul 05 Stefan Richter wrote:
> >=20
> > Would you be OK with adding linux1394.git (for-next branch) back to
> > linux-next?  There are two patches queued and I am finally aiming to get
> > them merged. :-) =20
>=20
> (PS, this is for the /next/ merge window after 5.14 is final, not for the
> current window anymore of course.)

In that case, I will add it after the merge window closes, please
remind me if I forget.

--=20
Cheers,
Stephen Rothwell

--Sig_/pC15r9W+6cV18QOuFaK9qls
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDkTaoACgkQAVBC80lX
0GyA0wf+JRzscs1JUh1m39W6cLntSS4tpIf4W44QwhiA6FU0jtPZx1flPQ/D14a+
5O6Z/AGeObZzcpTUCEyyU6BfwX5hXYvqK5z9OHbi/Ans4IQ+A0zBS0zgbqvn7o6Z
tBf+iEl88qs7q6T4B7IQwyCPt2BnbLgg+SlYMC/FMjm4MjHxWT2QvTkTOrIxMsGM
cMdHZLaojGpVAdW1prF++rMLHyDaD6wLr88PHzWzIV34zXsd85O4ij3bgr+QkSy/
jEyl6vOIdG5RksPlRbTAACSiiQWFVym9ANQ7jjTeTvwEtf5ddjN9Ef8DMutflLig
sDL80l0gdQXZ+uw9SyLmAw+Tzr34bQ==
=MqA3
-----END PGP SIGNATURE-----

--Sig_/pC15r9W+6cV18QOuFaK9qls--
