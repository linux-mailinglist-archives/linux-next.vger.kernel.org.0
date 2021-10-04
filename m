Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92D7E42193C
	for <lists+linux-next@lfdr.de>; Mon,  4 Oct 2021 23:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235294AbhJDV13 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Oct 2021 17:27:29 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:49117 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235594AbhJDV13 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Oct 2021 17:27:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HNYfV5tf2z4xbQ;
        Tue,  5 Oct 2021 08:25:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633382738;
        bh=IuG+gfnOExVL8+7l3OPMHkc5cerG2YazXy5EYdgv1hY=;
        h=Date:From:To:Cc:Subject:From;
        b=XrHXi5bCO6Br2aaGZv9AaKGSO9ET9w/gKE835sUsB/ZGn3cf690B6p7C1ZVexzP3S
         mqPp+mhyGqAxJRZ97ac4SguZt/pE/eqlpGDstt3ddaLABtovBgxmRZkJn8z8xqfCif
         cXgH7RFDWOBqHKOrA0vNlK4OYokLEzT2eFvX3kt/S0DOp3VXOENzDXZUX//RUhfxuZ
         lnIDYuRy/mpgtJ/GKZZ9poJ30PKAjsCA0tRURve+2Rw2HxJRg9D8Nzf/sz05vsSIKo
         GQ8BTPbK5BgsdZPfVIuVbS5FzUXy2yzYdOmTszxSQQEvbA5JS1e4It5Q9gTnSpl0Cb
         ibzUo/XctvgjQ==
Date:   Tue, 5 Oct 2021 08:25:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the drm-msm tree
Message-ID: <20211005082538.6c375d42@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T/1eggeLMaaS=rnIdvXinVg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/T/1eggeLMaaS=rnIdvXinVg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fixes tag

  Fixes: 86c2a0f000c1 drm/msm: ("Small submitqueue creation cleanup")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/T/1eggeLMaaS=rnIdvXinVg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFbcVIACgkQAVBC80lX
0GywVAf9HjgoGMDX3rfTtxS8PUiPQrYNwKBMDGBYJIfvOhzawHg+d4/ye5cocwmM
fRKSV6bLnNXtU63ZNnL6lUC6QVt7z7eBKAiEnVyyW35flVXAB7vCXQKd5HEvSeQT
fKVO5W4V4Efesh2GPxSksvN2QMjdrldwTQshQQ7oOYMOpYUfk+J6bZcO2wFA/Xbz
N+2NLuY6Xmw6RChmZxTxRTqUxuQZ7aLGtpj8IPN9d8aDJrXAnd/sKzeTVgGGbtbd
F4P4QeJ64Iu4+ksEvKcax3M6vUaG0oE3TyxkhYiyYb96Bnfruw4xAlSpBU+xXbEV
woWG5966P/8/itVFc6MUCwAyAtg3kA==
=RZXA
-----END PGP SIGNATURE-----

--Sig_/T/1eggeLMaaS=rnIdvXinVg--
