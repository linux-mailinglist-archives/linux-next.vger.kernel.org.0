Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 408DC3A789F
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 09:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhFOIA5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 04:00:57 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43345 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230223AbhFOIA5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Jun 2021 04:00:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G410p5khqz9sW6;
        Tue, 15 Jun 2021 17:58:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623743932;
        bh=NKVKjBYNPvU82x0BXRwpXstJOwPhOUJbJk2zgw3SnfA=;
        h=Date:From:To:Cc:Subject:From;
        b=UMtNX4wT1hKgIv8USGXf/SphQqpfkzpbex2Z9Bu4/GKdXeP8piB+i7DIG1TrWSEdE
         r7OCUL3mj2Au7VqfbKh6nJqnMyfCzhu46T2u5FShEWd/YWovgQC+L3tJlO4ckMWarI
         VJnnrry7rT3fO6CGZeEo06t+aUgMf/kU5luZ/3aSwZx3IE9bFr9tpBgwf/N00GrDyx
         nrgqJEMQy8gD0BE78DHZQ3PqIc9zPQirxymTIBNa1cpFe5ay/47ygoU0EwjR0o8uP4
         N+85JczxYj+zbn5nrG2CcI5e8NMDSrDV+GhnX0jVz762f7p8vA6KxDCIzkDoEfdY1I
         O4527HR5Fmqkw==
Date:   Tue, 15 Jun 2021 17:58:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steffen Klassert <steffen.klassert@secunet.com>
Cc:     Florian Westphal <fw@strlen.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the ipsec-next tree
Message-ID: <20210615175849.03ba30f1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WY3tjy8uNFh+fZXXXfTHbTw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WY3tjy8uNFh+fZXXXfTHbTw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ipsec-next tree, today's linux-next build (powerpc
pseries_le_defconfig) produced this warning:

net/xfrm/xfrm_output.c:140:12: warning: 'xfrm6_hdr_offset' defined but not =
used [-Wunused-function]
  140 | static int xfrm6_hdr_offset(struct xfrm_state *x, struct sk_buff *s=
kb, u8 **prevhdr)
      |            ^~~~~~~~~~~~~~~~

Introduced by commit

  9acf4d3b9ec1 ("xfrm: ipv6: add xfrm6_hdr_offset helper")

--=20
Cheers,
Stephen Rothwell

--Sig_/WY3tjy8uNFh+fZXXXfTHbTw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDIXbkACgkQAVBC80lX
0Gy9AAgAivE/UNF6Ief7GdGvVDQXmNFz6n9SK2DSCVHlY9Goc+WmcD2PKkcY76Ol
yXlT1kO6o/lj1HOODJfFVd0943ZAgKPqdkgvXo94RMjSwvCkgbISCAL6+Wz3/1/O
N5gGjPylxzUUSUxcC7g5sbdPw/FzhFOawx0tojOtrCivjST8Qd5YZeqVTEGYDVzK
5+YcQTmQpIs+w26LnppXN8BMTe3ZHD7jV/iBai4W3ZjCOxDX/bZq2Cq71D0jffJr
ZGscH2C7xxL+oMy/mVAUxLhFTSGZLhFGPb/Iucbv2xjnyJttpKhlMglDzs/tRKgP
EBppCH7c7WUM3Rai1BeSNsWGGnbyrw==
=KCfc
-----END PGP SIGNATURE-----

--Sig_/WY3tjy8uNFh+fZXXXfTHbTw--
