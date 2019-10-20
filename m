Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E544DDC31
	for <lists+linux-next@lfdr.de>; Sun, 20 Oct 2019 05:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbfJTDvj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 19 Oct 2019 23:51:39 -0400
Received: from ozlabs.org ([203.11.71.1]:37723 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726125AbfJTDvj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 19 Oct 2019 23:51:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46wm6J0Jtwz9sP6;
        Sun, 20 Oct 2019 14:51:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571543496;
        bh=fKk+rtqo8ZyHj1tnt05IQasNFfo9H6yJtktFr2TMTJk=;
        h=Date:From:To:Cc:Subject:From;
        b=IfM62R4m12ojjJC8SynmCcyWgPMtuDnIBzqohv/fbozrjZlGspZG51vb7J0xSeLrv
         4zZSq+tkL9kn4uVaA6WozxaLdqsz6ZyExyQIML8G0TdatjiuSTHBYyVv3mmh4DiA4i
         tQCGKWIchNsuNyhGW/T2U1efzj1JU7t2L1Nib6EPGukYs//A1nXLASprF8W1RMmsG9
         Xqa+PURNZVBt/8Zx7is7/36J8B6juGEQiV6ScEztTwmOlWgPMI1BvhD0X6NQ8q0sGs
         BAshLatjuyRUTkW4rgVFVt1Tlw4BFwY6/Lit0w3BZwARU0i0KAd8kCC+jdMsMTCPNf
         U+wWqE17/xsaA==
Date:   Sun, 20 Oct 2019 14:51:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Liviu Dudau <Liviu.Dudau@arm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: remove the hdlcd tree
Message-ID: <20191020145134.168cec86@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Uq53qO+ykGPK2pzIwyNHns3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Uq53qO+ykGPK2pzIwyNHns3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The hdlcd tree (git://linux-arm.org/linux-ld#for-upstream/hdlcd) has not
been updated in more than a year, so I have removed it from linux-next.
Plesee let me know if/when you want it reinstated.

--=20
Cheers,
Stephen Rothwell

--Sig_/Uq53qO+ykGPK2pzIwyNHns3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2r2cYACgkQAVBC80lX
0GzJnAf+L/2Y+w359ZUJtcu8v6WEE+GoVpeZNp2F3FHr7gOzsNa3ku8PBfarLdpI
PQ7g7YYZV70zwxXtuTzBEsXvtYPx4iEHM+rhYXxS6Mpf07I64yCeofUclx0g1VCr
cZ8Ef64pK7WOXBHivTDuHyg9gmDPpZeqrL44Y6h88yLJwEzcIMbfcdxsunRW4WEc
OqMNDAN44IPbypjv8nZhJebXz4XK7qTmlNVj94TxqLr9/O/hSOeLbZx3W8CgnBTS
/XambX+dYrzglY4QPqJmYIp9KJlaV0ZIGAncp8uy14ml6Caz5nEAqmmR7thKkqjx
cIGzPMuEm7XOQVvM1ckUjZXJlQQBWQ==
=CXPY
-----END PGP SIGNATURE-----

--Sig_/Uq53qO+ykGPK2pzIwyNHns3--
