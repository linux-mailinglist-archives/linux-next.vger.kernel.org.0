Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B6A2D4CC4
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 22:24:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731285AbgLIVYA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 16:24:00 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:48509 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726877AbgLIVXw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Dec 2020 16:23:52 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Crqlf1bzfz9sW8;
        Thu, 10 Dec 2020 08:23:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607548990;
        bh=tgGr41qygwR/e2OuK8KeseYB6sxiXzwtlgnDC8O/mL8=;
        h=Date:From:To:Cc:Subject:From;
        b=JTf/lRas+/Q0DsXHAidmBXdDuOZ3IkseHdeg99NHWpaBA+5h9eM/It3nbwd60L3rt
         ZThC98G71gN7xFc3v7Az2bvhiG92Z7lVq89ZnVHKOBVASOs1S5wRL/DatbTcP+aoNS
         /LW3E6GsKjIsNC9CODzBN/t68uOyCm/z7Kvtzx2QUwr42vSha1V6esZZgaU+3aif6Q
         N0Sd7OrEkCyPnuTu9ufQTYZBtGUPU/HpjHT7WhVdP7G5KwCUSnDv40O+kvtEYp6h9X
         nqi51XVHnD5bYC6Saola5CjfrHvwiVChlFGMSiV5Upog8OZGEJIOsPYptGoTw1rEb7
         Gbi76OAK+WqNg==
Date:   Thu, 10 Dec 2020 08:23:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the cifs tree
Message-ID: <20201210082309.73935d33@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VQo8NBrrP/lqE6/YL_4ejtL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VQo8NBrrP/lqE6/YL_4ejtL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  d24e661920cb ("cifs: Enable sticky bit with cifsacl mount option.")
  4bcfb51f82f0 ("cifs: Fix unix perm bits to cifsacl conversion for "other"=
 bits.")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/VQo8NBrrP/lqE6/YL_4ejtL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/RQD0ACgkQAVBC80lX
0GwAYgf+LTMpU2FrX45msVb/bclME60XH44G8K8n37PWw7I5V5mZDWRxZI0cU5dK
5t5ZofhQXZLVLRmKo/fHG6tXl+7+03Wx9iJOasXV0p0LIzkZ7bA2uu9VYKRlsxjf
78ytDAdGB4OcMmyIMcnik7SK/jyGPcpBXQWfaU0TZEKXJe48D7WWONjRjbi6RR9j
nSquQgRBhpK9HkM81fExJUdr2muV1kCqZvweIhgzeuiP+7tbBdL/0q8FXzDZPMr1
VHLuT3OE8KbuLJ0gbOl13XQBerMY49vOMdUbMpxW5hQvNTqrEgDeSHBvBGX87W1O
avmMANGfo8N0oypMYNBnaZ6ZCDsA7g==
=4v4E
-----END PGP SIGNATURE-----

--Sig_/VQo8NBrrP/lqE6/YL_4ejtL--
