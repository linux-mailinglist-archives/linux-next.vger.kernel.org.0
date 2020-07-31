Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E567E234378
	for <lists+linux-next@lfdr.de>; Fri, 31 Jul 2020 11:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732196AbgGaJmK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 31 Jul 2020 05:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732140AbgGaJmJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 31 Jul 2020 05:42:09 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9BDC061574;
        Fri, 31 Jul 2020 02:42:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BJ2P95zscz9sRK;
        Fri, 31 Jul 2020 19:42:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596188527;
        bh=E7SYofs3sMW60tu/UxfrKDzGsA1UHnaHaqiI9IRnDCE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OX7uox3ieemeIFlj4JzZZPDg0Nc2CggTVvpwCebcwFw2EZibEIbbIU53OXnw2rr8V
         bmBGOn3oFio2eSIdoLcViGP88eSvT9wDmeJDuGvch1kfDpNAwBTbjnQttQS/3nZAdF
         n8Vj0tUejgEYGnyN/TH2RcxrqJVaOvNIpr3uPdpof9S3PIHbgiwHZfY/G+PSRajCFG
         U521TKfr1WHLCjWswW0McSlXnX13S384/1CN3YJnJ60tDjMH2m8Z5qUY737CIv0sC6
         lwLY1jw/6kA7b3wS2DK2GtZ5EIoZMAXqliUSpKDZs7c82KsbJYw8gqgUz9WJhefRqb
         1CH7s+MHSdZ3Q==
Date:   Fri, 31 Jul 2020 19:42:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, lkft-triage@lists.linaro.org
Subject: Re: linux-next: Tree for Jul 30 [build failure on arm64]
Message-ID: <20200731194204.1db950e4@canb.auug.org.au>
In-Reply-To: <20200731090022.GB12930@lst.de>
References: <20200730214659.0fbfdfc4@canb.auug.org.au>
        <72b073ba-ee41-1a1c-ce6c-ffd8b5936b09@hisilicon.com>
        <20200731140842.46abe589@canb.auug.org.au>
        <CA+G9fYvykg9Ly=tRXLrf4hvd4siYKAt5eM0EMnwMgqVDHnbVYQ@mail.gmail.com>
        <20200731185354.70926525@canb.auug.org.au>
        <20200731090022.GB12930@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c0WH2LaAi1TEoKiPoKTkYm3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/c0WH2LaAi1TEoKiPoKTkYm3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Fri, 31 Jul 2020 11:00:22 +0200 Christoph Hellwig <hch@lst.de> wrote:
>
> Please just drop the branch for now.

I will revert those 4 commits from today's linux-next and all Al needs
to do is reset his for-next branch to its parent.

--=20
Cheers,
Stephen Rothwell

--Sig_/c0WH2LaAi1TEoKiPoKTkYm3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8j520ACgkQAVBC80lX
0GzV8wf+OMAo3yzw67nuD1HXpg7J0cniGhaLNEZgsmnpcDmx141rZubVlhDIlqcI
M7ehnnLRU42941YvFYHJpFHzIBxKDAKovv7rCoDb///oQLTCUsm875F5xcXSgrdv
Pq3nI3+NvPOOe3p5MzzIVKrbwzIzrdZTMcw4m7Kbqd0Ss2iaV5njoM/Q45fCj7/8
OC0UXDW8Roz0Gw0Oy8fXGY1X7J4ZNFz5RBIxr96VacTKXDNEZMnqD/T1oXKAtjby
+MPscqToVP6RGrpeIzWwrdCEaEo0GvyMW+8l4/Hn/V63dDrMaBRhF+17mSmYJk9m
g8FukOz0RD91f3yi6hfwUxgQRhTskA==
=uoE7
-----END PGP SIGNATURE-----

--Sig_/c0WH2LaAi1TEoKiPoKTkYm3--
