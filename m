Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 122D6418E5E
	for <lists+linux-next@lfdr.de>; Mon, 27 Sep 2021 06:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232333AbhI0EeK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Sep 2021 00:34:10 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:52141 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbhI0EeK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Sep 2021 00:34:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HHqVl251Rz4xLs;
        Mon, 27 Sep 2021 14:32:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632717151;
        bh=w2+R9XaPibyCwkD0iprK5UkQK3OqdJjqqlfa/sURXn4=;
        h=Date:From:To:Cc:Subject:From;
        b=J8pzpRX7H8/lPAXjkB1yt1WmhGV0OO9u9kPjbL/Dpnd5lMWBpRtv1BbgiKLyv/2Tw
         H7c8kVaNQWavjhkr0GQVStt88YuPFsp1ffAMXO+TvxLHmAd02v080JNvc9nhVvNpoj
         aWM8TN3tuDTjfC0+vREbUa3dnBGAyY+MrhbrddwrsRtp1mE2yl7Q+IoVkteRRPpvIP
         koLDoMq2zHx494OptHycTgMnySdCWKqEV80o+3DWH1/AZsC/9w3w8W5f3PoKBQ5j1Q
         BmF3U12wUeAXjiBcPPE9yXiMXivN+MGmisDa5HHq+WmiSeDYOehyM8f926m6cceE3V
         vt4bNLjUQVUqw==
Date:   Mon, 27 Sep 2021 14:32:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the crypto tree
Message-ID: <20210927143229.543749f4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P29dkSL_fBM3tSXOKPnorv6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/P29dkSL_fBM3tSXOKPnorv6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the crypto tree, today's linux-next build (powerpc
ppc44x_defconfig) failed like this:

ERROR: modpost: "crypto_boot_test_finished" [crypto/crypto_algapi.ko] undef=
ined!

Caused by commit

  adad556efcdd ("crypto: api - Fix built-in testing dependency failures")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/P29dkSL_fBM3tSXOKPnorv6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFRSV0ACgkQAVBC80lX
0Gx5CwgAg12fkQIZFLPrJ85C+Rg9xdH0xDeUR8sZdZZDcJ8EXv0DOdsAUu6Rg4Y/
a51kHt5m2vyH+FWEGa4LLJwKzf8z14GaagNNeg1u98x51rc5taoeF7xQfkJBCVAm
nvgkp3HeiIJAxc1YkRHAXoRpsHr2TSKb26Q+vdLgB556DXRqLcsTL7osvZXvorbs
BW07+ieHzyDxQkjNF/olbAPwfYkM1r38BxHhxZ6rMloaNreJU02n42t1ICRFtnqO
X6tkdNqRqGG/6UD6jj3iogekQHf+7PRZd/9MQJ9mtN8PsZ9t/9PNEEKdIGt7C6wu
3szr3PrPSbO3ThhrcLx4t56aZNsiZg==
=Csqp
-----END PGP SIGNATURE-----

--Sig_/P29dkSL_fBM3tSXOKPnorv6--
