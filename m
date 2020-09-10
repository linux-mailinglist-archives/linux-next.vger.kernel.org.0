Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE0BD265533
	for <lists+linux-next@lfdr.de>; Fri, 11 Sep 2020 00:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725308AbgIJWtk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Sep 2020 18:49:40 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53019 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725275AbgIJWtk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Sep 2020 18:49:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BnYwx3glwz9sTv;
        Fri, 11 Sep 2020 08:49:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599778177;
        bh=D0wT8rCItM8P34R94vyNSuZpJ206Lk3UpwgUUjtxuqY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=f1XUk9qZGKFbwTRCOdhSYE3ySZluEIBPKgh2UM+L+I07B1AmyY9RdQHmoWjzpXtaQ
         bJhHnBpxsZma7lbscN2ru9vIOk+SrmPBsuEaD9d+appPTD9hCTXKNrso/M1r5zR3Os
         2l8LkYvJaWbWJCLQkKJD7HENAhjFAlIjARrGkJ4IVuFWIJBlWqYM7QpQKpd3sNZYeS
         CTBKVYIjTfq6vu+ZOtPiSjjOlDfYgx6hwS3vRgsG1z9k2yYxmArzpLGanM3GCoZsmc
         cnuBWE/g1BgseeX1n3adN4p11eNY59A4yNBNQ5YfBDR7iRNaLf1uVG+W3EndfClYg/
         h4RAjRrrwYgVg==
Date:   Fri, 11 Sep 2020 08:49:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the iomap tree
Message-ID: <20200911084936.346f3b95@canb.auug.org.au>
In-Reply-To: <20200910223120.GE7964@magnolia>
References: <20200911080314.4849d3b5@canb.auug.org.au>
        <20200910223120.GE7964@magnolia>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.S+IIAEhW5iTJXRm5y+.2lV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.S+IIAEhW5iTJXRm5y+.2lV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Darrick,

On Thu, 10 Sep 2020 15:31:20 -0700 "Darrick J. Wong" <darrick.wong@oracle.c=
om> wrote:
>
> DOH, I accidentally pushed the debugging patches and other crap from the
> tip to kernel.org.

I thought that was what it looked like.

> Er, if it's not too late, I rewound the tip of iomap-for-next to where
> it's supposed to be.  If not, I guess you'll catch it up next week. :(

Thanks.  It was not too late.

--=20
Cheers,
Stephen Rothwell

--Sig_/.S+IIAEhW5iTJXRm5y+.2lV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9arYAACgkQAVBC80lX
0GzKrwgAoNd3HMYrvK3FSPDXa/uvw314bGMivVXGjFG0PdAaEM5U4n5SBImi+RXi
eRZOU7UgNtbqLMdyT3NoLUJDH43b1Yi4hEuAQ8uoLooZM3jAXgCLMvW97t5Xe4BQ
txEjelAdjmSMCkj1p6g2eSBRo93+gwB0xbMU9xVzeUz8izIfjwT3g74cWOMZL09i
biusU6F5mNizmZyfMXCHCbpNmXrYriJyF46iGBZwckVcO1YB4ntRAWD+1bFFmplV
f7gH3eqETrob5Q4CZcWOltEf13EK0dr5C52yebEsZFO9P3xgeC8SvXlH3E8Arabv
Ud3Q16iGZ8n12Yun7BCrnAWgV5HL2g==
=de8A
-----END PGP SIGNATURE-----

--Sig_/.S+IIAEhW5iTJXRm5y+.2lV--
