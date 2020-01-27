Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 272AB14AAC1
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2020 20:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgA0T5y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jan 2020 14:57:54 -0500
Received: from ozlabs.org ([203.11.71.1]:48273 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725944AbgA0T5y (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jan 2020 14:57:54 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4860sX1FkTz9sNF;
        Tue, 28 Jan 2020 06:57:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580155072;
        bh=kMXhVkPXN/dGN5IWbiO3bPA2KIN51Po0G/kn1Ph4VjI=;
        h=Date:From:To:Cc:Subject:From;
        b=jtPFWPoNGACulFqHZn5ULwoPUeebppE75yD7IIeDgnphnqVb2KHJN3mnnBGTRNmAT
         NeiPi/6z1BBcRBToVNRu6vQWCRDDYayWB9w4njbZF54FM2krhkCRaKEnk66TDpvgDR
         JRqobYGvHyxD1wwmw/Ms/coHJ1eJLIo01Kq3qd8rKML+DDeS9OeZu6qcA/Mc/lnUwp
         11cEK1PBXHeqJX/ygFnXh34uNucmd7UD5gex5AMA1pm3qNSFjRYN7T3wCkN15YoVhU
         ruFhedNQkGt98jZUV7VmIMAzBdy3Ylt0fDyOove4im03ranq8lwv1YzyYiU0jCUI9n
         xeSwkJ7YGDcHQ==
Date:   Tue, 28 Jan 2020 06:57:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the cifs tree
Message-ID: <20200128065742.397cd3d2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DZWONxN=.h7HF2CgKZaE/k/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DZWONxN=.h7HF2CgKZaE/k/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  503e9ac76c90 ("cifs: update internal module version number")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/DZWONxN=.h7HF2CgKZaE/k/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4vQLYACgkQAVBC80lX
0Gz1uAgAlqejX7/gXhbKqN9bygvbGEkXkKdEWb0wdyL/KBHrVtMlu+uS9d/ab1qg
5BuYhxt2Knagn5XzMvWFm6PhZlofXfeNHWEp6L/qZ2EsEaEDwt6osnoO0e23AMI7
7x3wbUexsJZ9OSunKsLSVb0g5GqI2q4vVXpXF/IRV8ZyJQh3b9PgOqolrT6kSQye
IG2M4GSTMm5x1/MzpN7AEf0/SL3wUoMhj0JoF5EnNPXIsAfoL9h1gxjkjt+pKuJi
Ba091YsiZFkcI3hCCtQ100ZNBZfn1hPUQEQzgzhWaMdB/+sEbD5wLuuer89aOB8G
i0auhbA19rVPWLFp729ElP/J97WmQQ==
=JHIv
-----END PGP SIGNATURE-----

--Sig_/DZWONxN=.h7HF2CgKZaE/k/--
