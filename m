Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C33E86DFD
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2019 01:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732796AbfHHXpL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 19:45:11 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37053 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732375AbfHHXpL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Aug 2019 19:45:11 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 464Q3922Bcz9s7T;
        Fri,  9 Aug 2019 09:45:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565307909;
        bh=NSkPVWldGt4P2hzDtJFVflu40lPbTWO6uAJqAgGGU1c=;
        h=Date:From:To:Cc:Subject:From;
        b=DgZUYcLulKh3pjmFBY/SE0XoyC9TYfk90rvo708Ishme0Hk9eJSrnhboH0c2Quo95
         c7dgnbNJf7v/krKfYEQrZl+TDUkz23o5O8rTrmdSIuFmDZCmy61nnrj4bp7YW/mwos
         /0NaBjunkTAQhkcDKmLDGFp7op9FOON8ojCibLj9gpbEsX9EEvmBLxzfmMygHl6hKa
         Z0uclZQnIiI8n0TmTnFCZHa/vhqECfNAHfiQXVGd9YaqVv8zLS/fe/44972TeWD5S4
         gIT4CLPBUghyJfRdnEgjxBtRGvECL2P63b1WaGQbnDS+JmsCCBSRrQfzQ1Vm4lrxgX
         thzkLGtRQj7fg==
Date:   Fri, 9 Aug 2019 09:44:51 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the afs tree
Message-ID: <20190809094451.45f70a76@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MG03q7oogy8Ccw+L0uhMYjs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MG03q7oogy8Ccw+L0uhMYjs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the afs tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

net/rxrpc/rxkad.c: In function 'rxkad_secure_packet_encrypt.isra.10':
net/rxrpc/rxkad.c:269:9: warning: 'err' may be used uninitialized in this f=
unction [-Wmaybe-uninitialized]
  return err;
         ^~~

Introduced by commit

  b214b2d8f277 ("rxrpc: Don't use skb_cow_data() in rxkad")

--=20
Cheers,
Stephen Rothwell

--Sig_/MG03q7oogy8Ccw+L0uhMYjs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1Ms/MACgkQAVBC80lX
0GyNPwf/V82BzHKhErWvWbB8tIpOrX2x+CzPq3u6CcKOg+sSXzUsffMhZqb/H2St
lqBeHs183CFxao1kEMtgb4pVLF/tKyK/N5+wXyi/y74kk6i7/KoKeViTjQ8Rwim6
CtPtH2UcD4F0nBJEXq6NbC5TVxdJuYk2h8x6yVmfvM9ABjek2Jl8iosL03NZJip3
OwLrEY6HoYtIMNxVNC5N7DjG3+sIOdB3frh18d84MPHzGqYUOvrsUi/13mqj9hYx
YAXOT3TZnN0zD1r2zQ54SfQiyduHUtZEqzzAj4+5+B44VwM03Z6DMwZsbBFSIEcG
kLbqxFNL9f/iHh+24+WkJ4NrlymSbQ==
=iVZd
-----END PGP SIGNATURE-----

--Sig_/MG03q7oogy8Ccw+L0uhMYjs--
