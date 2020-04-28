Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1D41BB8C2
	for <lists+linux-next@lfdr.de>; Tue, 28 Apr 2020 10:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgD1IYp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 04:24:45 -0400
Received: from ozlabs.org ([203.11.71.1]:38543 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726490AbgD1IYp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 04:24:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49BF7H3RHtz9sPF;
        Tue, 28 Apr 2020 18:24:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588062283;
        bh=ZTEAB2ghlL2JpngXHEexyATntNK/jUz/ylLs//+sIHQ=;
        h=Date:From:To:Cc:Subject:From;
        b=PjmBwalD9ArUvWOF41zB1woAnMYoLdzGWLCX0UKD0k1kmwVyvFNhEhQeaDV5b+2z2
         2Txs2XPeEyp/KNrDDvUPOWk3/SMK8gJmw87MeTVU+GQHFThoe8TR6mqx+K01MePpdp
         w+RpnF+SdkX6fL4rAKbx2r1Y53R5zDdcr7xWYmGE3sTAH4Ezau3d6HB3HX56vGtLKS
         W1xykujL+5QndPA8llZr+IH6Utz9TdA2LdF1/h0U1V1bgdwWuj9jQdTIbPuwcVZW1w
         amYEHnKReKLGU7YG5kwzy/xt3jWebiqw8UTwS1iVoKdKH1ZQ5RA4gCduCaTdfbIB8j
         rY5MuWXYlkrOQ==
Date:   Tue, 28 Apr 2020 18:24:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the input-current
 tree
Message-ID: <20200428182441.3deea12a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kOkqLegfWM=0Ard+Q3l4iz9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kOkqLegfWM=0Ard+Q3l4iz9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  f4dec2d61609 ("Revert "Input: i8042 - add ThinkPad S230u to i8042 nomux l=
ist"")

is missing a Signed-off-by from its author and committer.

Reverts are commits as well ...

--=20
Cheers,
Stephen Rothwell

--Sig_/kOkqLegfWM=0Ard+Q3l4iz9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6n6EkACgkQAVBC80lX
0GyVDAf8Ch233MbxaIzmMagsf5o6FylYGcKSh/8o+5MF7qKaX7ozevTSG6AGtvKQ
VJ7IluU+w47b/MxrHUA7815i5DBFdPdrM/x3IBylknXM5b7BYBcuDlUxB8aKfEfb
bfErJrJDCNNuZQ/aiFxRlseJ71U8zf9NkQ5t8srSg2w67n5UDM3qz+9vFiMlCG9U
3vpwOChrw9G9vbJSokDK+wx+gD8/zDkMYEI1o/vn1mAkOHkc2c0atOMSrbongHdC
9RCL8wZlpnbiZT9v+IhqT6OfbLTYYWKySLUsR959NBllNb8wI/nV7RQ/otqvV0ao
13f6PRsvlQ7hj4n5E/fBiYzq4dE3EA==
=TnWo
-----END PGP SIGNATURE-----

--Sig_/kOkqLegfWM=0Ard+Q3l4iz9--
