Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1142DA0D2
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 20:51:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502251AbgLNTtd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 14:49:33 -0500
Received: from ozlabs.org ([203.11.71.1]:58217 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731027AbgLNTtc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 14:49:32 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvsQV0N0Cz9sSC;
        Tue, 15 Dec 2020 06:48:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607975330;
        bh=/XUJ/f62xB+BtpCeFkBYMW89n9Z307JH8sKXLrbJbGM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DZfXFXs/55hetcedt1lkjHV92lrM+RYzpM0tWfARwjw8wuZP3zbSbYxdlaAf4WEvd
         pjX3/3+DAOpKsmIxceke7zeVZXX2GvM5+tUsldGv9zeEef6tVcVBZuAVk9kj4pjrW2
         IpW0tsWuwuVoEeL+QjiuDeVYEAagg+KU3gvN4QvyhOIWLlRtf6iuQl4pVw5C2yUaKS
         HU3mOotY8WZo5oRx7op7OETgbXAfZEVcxas/jwaESZwVvS63R4aNSg9Z/FyCahffWQ
         X8HR3J2YEg3c9QATSnJXtHa3TLn8Kds5Ok1HThJeKPFTCMvZGE8wXebUi9Vx8oCvbN
         SCyjbsuRod5CA==
Date:   Tue, 15 Dec 2020 06:48:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the parisc-hd tree with the
 asm-generic tree
Message-ID: <20201215064847.3676d9bf@canb.auug.org.au>
In-Reply-To: <20201102123841.39eb4216@canb.auug.org.au>
References: <20201102123841.39eb4216@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qtK.EFTpCXVkUm_tXdqZ3k7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qtK.EFTpCXVkUm_tXdqZ3k7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 2 Nov 2020 12:38:41 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the parisc-hd tree got a conflict in:
>=20
>   arch/parisc/kernel/time.c
>=20
> between commit:
>=20
>   686092e7daaa ("parisc: use legacy_timer_tick")
>=20
> from the asm-generic tree and commit:
>=20
>   3b7ab4a74a2d ("parisc: Switch to clockevent based timers")
>=20
> from the parisc-hd tree.
>=20
> I fixed it up (I effectively reverted the former commit) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.

This is just a reminder that this conflict still exists.

--=20
Cheers,
Stephen Rothwell

--Sig_/qtK.EFTpCXVkUm_tXdqZ3k7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/XwZ8ACgkQAVBC80lX
0Gwz/wf+Nkz5FSqhuNAExXPlerbEhnCScJloRr+ULcBr+2AEhQMP8G4UQzbOwm1N
Vdd4IGZYK98SoMMqXtsXSZqRPpeB1+kw5nfbIuoHnw9s0KFQRcIR+pAaBV6SL8b7
ssP8NwAwYiMGMBI3KtdZhy/9/qt8hgM/1akOoBv72KRZmZ1qvW/FX/zJzRtYqGOg
k4GNRCzRly+PUdtXn1XvhWaXQHj89v07Rmzlt5oAIA4YeBFiN42fd9/WtEb+zKID
cgUZ25xxrm+4FCA+nFcv8qA1CxjBR2wIAJH2iwX1yYMudhWYB40/UTCyuP2i+vJP
M0G8yU+a8ZNMPDX4sobJh1YfcYBGmQ==
=wrK2
-----END PGP SIGNATURE-----

--Sig_/qtK.EFTpCXVkUm_tXdqZ3k7--
