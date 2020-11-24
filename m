Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 196E42C344E
	for <lists+linux-next@lfdr.de>; Wed, 25 Nov 2020 00:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730163AbgKXXDp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Nov 2020 18:03:45 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33783 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729626AbgKXXDp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Nov 2020 18:03:45 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cgfhb1T0mz9sRK;
        Wed, 25 Nov 2020 10:03:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606259023;
        bh=4Sw3XF+SknIbrZtfycH1VuQQnCCvYauWpqSV2HXflCw=;
        h=Date:From:To:Cc:Subject:From;
        b=hwBu8DOvZEaKoSiQ1Tm7TAlDBCEF9jAi9RZTxM8SC/9uX1XgG4BRith70IpBTbo76
         oCT4eLhfGkk6NtFcXzrPdM3ryCTgAredX4ILraBfWU8xvTJEfvCb2XzvYJOc2kg0Ho
         UNRlwkaQsb2ch93YUnUCx+kPWA3mEwNvt6HQ9ObuMwoAN1adKfkrIewZF4kvMdQPyf
         5ZPOZLMQyMfCL+rxpXy/WM/bfuWP1Q03g85OhRn1gwUIAxEkH0skrlNFYF/BFL1Uh8
         1PHqtRrUr90JU38/TAYfZFtye808WuJOErb6t/UMtQqCOFxRb1MLbGyg4+BuBv9Whx
         87j7dlG4Th5nw==
Date:   Wed, 25 Nov 2020 10:03:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Chuck Lever <chuck.lever@oracle.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the cel tree
Message-ID: <20201125100342.4a758809@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SIUKtjzKFTabfPJ4tP=U8G.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SIUKtjzKFTabfPJ4tP=U8G.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  287428e8d11f ("nfsd: skip some unnecessary stats in the v4 case")
  6f76e787daea ("nfs: use change attribute for NFS re-exports")
  9fb0a61fedf7 ("nfsd4: don't query change attribute in v2/v3 case")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/SIUKtjzKFTabfPJ4tP=U8G.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+9kU4ACgkQAVBC80lX
0Gy0PAf7BnquXg5j22Eh7gzyQ72l+0C9x8+sPjDG04tnko67KRVgoHX9d+Vme1aM
PHKnCE56Aq4ktYeDHcZO1y/1E1DcNEiWeZkuZVgXpoL1tRUrOxHbckAPQypM4rgA
jZSSzxLnIV4KGBn1klZlnKoT/8m774LroElwkrygtCpCTd/48jnxl0MYLYPLzVwG
6nx02hiIQ74JO4fWl366X25tVDxZm3tfNfr1qCDiBmwVPZ3p+Qay3f1iceLG5F9j
AB9x4wAGqynwwW9EjEOf9yGdhJ9w7qt10FR0nFeIY2kfhiMHouCluhwtxHL0dFC3
TT55Q1kPL21Q5Edq5FElGiOyHmzJ9Q==
=UA2O
-----END PGP SIGNATURE-----

--Sig_/SIUKtjzKFTabfPJ4tP=U8G.--
