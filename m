Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB3F52D5162
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 04:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729296AbgLJD3u (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 22:29:50 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:53849 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729094AbgLJD3u (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Dec 2020 22:29:50 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Crzsv5pwSz9sWR;
        Thu, 10 Dec 2020 14:29:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607570947;
        bh=d3yp0d/0ijFXQAuwF4vOEsf9q9gYN331bvla662P5TM=;
        h=Date:From:To:Cc:Subject:From;
        b=gwxm3bbIxQq2a6fJlFDVpCKWaPi7D8y8eVqSwssNsILhTHvQVuePrXo5w8Z9YFWXO
         Pyc+7k0uzzpch4794kYhAWd4ZKsjB7jtDpxv2Fs+DSla7rnmWV4K0ba8dgocUf/6Ql
         Rm0UtyrSl79ufaAlS2c+PGYDK4nGwrzz5zCt04Vi+GBkx3KNTiy3INv7AkH40T8R59
         YbUx1WqvK07V/4fwvnTTrZ8mx6eHkxkJ4Qv6KgrqSIIM+NgB3qGbtqc9XWCAIxp9NJ
         Vrk0cqn+WdcOvXMv+iRB20CLC3cox/4Gy4pvcNMAf2DSlQSS5tM1BXK66wOBS79pfM
         RoQqJUfz7BfSg==
Date:   Thu, 10 Dec 2020 14:29:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the devicetree tree
Message-ID: <20201210142905.6c2be2fd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sizPNbhHi9TKWAFmdf6/l0S";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sizPNbhHi9TKWAFmdf6/l0S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  faf724c90798 ("Documentation: DT: binding documentation for regulator-pow=
eroff")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/sizPNbhHi9TKWAFmdf6/l0S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/RlgEACgkQAVBC80lX
0Gx8hAf/VFmQ0+c4OCAJaFc2S7042LfPwJ1J4O3HtPK7yD6oVmfFWq9hkIwuAlKP
k6VwOPAzA+iqzLqYeqMSfFNR3U9pZcyS1yW06J9MCXThgcgddMglUT7yaO+KS9AK
Dm92hLvGfCkjGVK5As7R0WU2FAWW/iBawRk6u95LVs4qCUienzse0VrlybPeufcU
wwhTfOl+2usu+OJ692vn8hNnsK9wXZ1N3CZMxGH8oFZUx6SbOlVzEsC0kekJ+pBW
NIr/ZYMY41VGm7iv938VoXOJfsMt5KuHLOJ4NIizx4LO8HfCh7fXr59a0QeRhjeW
jlcz4d2+Q9soedIhs36qnqi8Lq3Bzw==
=wTUQ
-----END PGP SIGNATURE-----

--Sig_/sizPNbhHi9TKWAFmdf6/l0S--
