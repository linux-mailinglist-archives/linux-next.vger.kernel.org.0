Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF6B3E5B32
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 15:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239546AbhHJNXI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 09:23:08 -0400
Received: from ozlabs.org ([203.11.71.1]:37463 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241125AbhHJNXI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Aug 2021 09:23:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GkYXh56l5z9sRK;
        Tue, 10 Aug 2021 23:22:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628601764;
        bh=NFwioJRExZKheUfbSG5XQmLDZTya4JG8A68oX5rmLEo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Ig5DIzGWOnK1TngS/e/zWZ1UHmcvM7734X5g+7Koyo/dW/t/YtN56dfgS7hCT2RMg
         mugJjYBeXK9nDsg2+s5e585xiO3/P4VdjGgRTWZPBzSYAkhlzOVIJqiQ/NUl33Zk0F
         JuY+weskooejJ0KSK+5f/9ze8/MLV4jJmnym42GJk0lUzI8kz3eVffGYV3a7ERs/ev
         EqF+sIoIVBQBIabiEpa/Hvqc+7jQeC6YlKtg84CaPZk1eDK6tImjHtR5sQcwIa3385
         tFE0tEmHBGsdp5O60QaG7oN1QtLIwJSIleFYEIp3fbDkTcfUs9nJrTp1/Vy8UEdC4D
         qD6pOqVZsOUtw==
Date:   Tue, 10 Aug 2021 23:22:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20210810232243.24fdd7a9@canb.auug.org.au>
In-Reply-To: <20210810125813.GA9836@lst.de>
References: <20210810203135.7eb7b01a@canb.auug.org.au>
        <20210810125813.GA9836@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eiVGTQQV1cv4narcLUfkCOg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eiVGTQQV1cv4narcLUfkCOg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Tue, 10 Aug 2021 14:58:13 +0200 Christoph Hellwig <hch@lst.de> wrote:
>
> The patch below fixes it.

Thanks for the fast response.

--=20
Cheers,
Stephen Rothwell

--Sig_/eiVGTQQV1cv4narcLUfkCOg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmESfaMACgkQAVBC80lX
0Gy/Igf+MvufYbtjn7fr7rZvIDYiJD4DvRZmeP5vnMOpah8egaxgn51Z7EI6pWLL
Uk6qYIJiiPeyc/9bTDMQ7FwKCQ60TktnNIcfB7Q/JXlG5O2DWG1w3JI5h/ei1+m5
lBiafe7XBSj4H7+WClSD0RInD47255NDkzTnWDF2uRfPAdBvH+aUVWOlsxZpi48M
2Ie4HYC9Q134q/Gaa+eELKB3lj5X856krHdnPev8gUtNO9EZbVCH+77uTEb67EhM
7E0o2QsirfKFPlOF4owcGAYTA1tXaVM+twQE7Hl+02UoPM5LKfkKF2kLN2xWfgDh
6Mtb2rCVTY5lE4iwKy/prFhAgLm0iQ==
=AlNu
-----END PGP SIGNATURE-----

--Sig_/eiVGTQQV1cv4narcLUfkCOg--
