Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 733DB1379D6
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2020 23:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbgAJWor (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jan 2020 17:44:47 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:59011 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727299AbgAJWor (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 10 Jan 2020 17:44:47 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47vdMw3sdGz9sP6;
        Sat, 11 Jan 2020 09:44:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578696285;
        bh=Apvk3yrpOhiX5OvarieBn2JJQfdeDB4VG1WdLXCTCyw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=B1uWpHd/0spnE56yycJEFVUDcxrDoYwdIHjjQ4hcwSjog1tSFO6uE9SIlcdFEkNKu
         0ZnEAnAVR6ckP6E643UpXOwk3unadJUlUl/HtdCezMD1HbaLMHbrO/A/sEQQbDmWgl
         JSA7KZ9agHjy5iAt5ZZ4z3IA7OP17aFjAwBz4wE9OzxQAfMPO3qGY4w/SmhH02Kbtj
         Ls5mddxqHFzXBt0GhiGjzQ0Bncm271wFml8EbCHoDlJWf56qV3zGAJpcTiXFDd3vuD
         3Y0MW7Z3lDHmWjStcOIQsFeVGaXEruyUA+Uu8RFJIQTxwDPUHu6N2q/m24I9z8V8Vl
         GWLZG8ekW1g3w==
Date:   Sat, 11 Jan 2020 09:44:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Carlos Maiolino <cmaiolino@redhat.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <20200111094427.4c875a90@canb.auug.org.au>
In-Reply-To: <20200110110353.klnooeqv4b6ipxid@orion>
References: <20200110175729.3b5d2338@canb.auug.org.au>
        <20200110110353.klnooeqv4b6ipxid@orion>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Mlis1=vKdeNGCdq4xnpbc.J";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Mlis1=vKdeNGCdq4xnpbc.J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Carlos,

On Fri, 10 Jan 2020 12:03:53 +0100 Carlos Maiolino <cmaiolino@redhat.com> w=
rote:
>
> Eitherway, I am not 100% sure this is the right fix for this case, I reme=
mber
> some bmap() users who didn't need CONFIG_BLOCK, so we may still need to e=
xport
> it without CONFIG_BLOCK.
> Can you please send me your configuration?

It was a x86_64 allnoconfig build.

--=20
Cheers,
Stephen Rothwell

--Sig_/Mlis1=vKdeNGCdq4xnpbc.J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4Y/ksACgkQAVBC80lX
0Gz9lgf9Htt8ftvZ4BlviyTTQNomQeDxppmoLs3SYfj9tC2CJuZ1Rj4/pjsibtON
weNP4H2F1JM0Y+2sLWG7uq2h4WV7v00G5ACYCTQSaQxqMqexZji/xzVrI9/RCBwM
nwME9Y2EJtHU066dUV8aX3fxohAs6ySrxVYx69bzcOHEGG2ITxKS88Zut4cCaNmE
+I028yiSZEZDMNBL6Ldl+ZOLYwdpDCHecp4useDAVe6+EJksluWDJ0i7Wn4QZqo/
kwWehgExt8xTS0V6TTpF/JLlbBkQmF5AEBJy3hksI5KqqupKyHeRhRvkdM1EpmjE
bg6m5EGN32/mpmElGT/40Nq4j3N6xQ==
=4tNp
-----END PGP SIGNATURE-----

--Sig_/Mlis1=vKdeNGCdq4xnpbc.J--
