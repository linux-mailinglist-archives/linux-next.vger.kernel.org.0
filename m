Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD1B67D8BF
	for <lists+linux-next@lfdr.de>; Thu, 26 Jan 2023 23:48:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232798AbjAZWsa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Jan 2023 17:48:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233099AbjAZWs2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Jan 2023 17:48:28 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D060448593
        for <linux-next@vger.kernel.org>; Thu, 26 Jan 2023 14:48:27 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4P2wpx3zjnz4xwp;
        Fri, 27 Jan 2023 09:48:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1674773306;
        bh=g9nKLiiW6Y2vrzmuiewxApSWXApW9qNsgBOtRA5BByk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=W4A2jzXYTXJ7m8qsE9c7pd5yEZ/JooPfSOVrjKTRXaQFoqJlHUQpwEAndP/lGTK4H
         Dl3Mskbz84OXimdfKxJHQf/Heizio12YqY4Nm9l5UfDIM//U/RGQUqXUH/rtRpAKAQ
         +LNdMigfSrFAi1ATm3WBNTBs1FRA3Y/pR1HKhZ215oglmiOAbhKQegIKReL12YRs1E
         ZHZHPv1gmJZsy9oRpz8Zm+nxok9nP6OOaWGKbAvgZc6wY775FXdUc9HEI6m3HpXaNF
         Lfca0Exys/F1ozfzbitklrQCOBpXuW71mo/I9nTP+aTb/gaR5QGgbr2hOXvcfTKFdZ
         2I2pIAph6Jk6g==
Date:   Fri, 27 Jan 2023 09:48:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Eric Van Hensbergen <ericvh@gmail.com>
Cc:     linux-next@vger.kernel.org,
        Dominique Martinet <asmadeus@codewreck.org>
Subject: Re: Re-add v9fs/for-next branch
Message-ID: <20230127094824.718dd737@canb.auug.org.au>
In-Reply-To: <CAFkjPTnULXdFY5tFrBHD6exgJt-3gszkm8UBsu0DeD2Xa_inXw@mail.gmail.com>
References: <CAFkjPTnULXdFY5tFrBHD6exgJt-3gszkm8UBsu0DeD2Xa_inXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FUBHDoRBls4/dfb6wOoP5xw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/FUBHDoRBls4/dfb6wOoP5xw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Wed, 25 Jan 2023 14:25:03 -0600 Eric Van Hensbergen <ericvh@gmail.com> w=
rote:
>
> After a decade hiatus, I was wondering if would be possible to add my
> for-next branch
> (https://git.kernel.org/pub/scm/linux/kernel/git/ericvh/v9fs.git/log/?h=
=3Dericvh/for-next)
> back into linux-next.  I'm going to be doing quite a bit of work over
> the next few months fixing up performance and have already coordinated
> a bit with Dominique who has been doing much of the heavy lifting of
> v9fs maintainership over the past decade -- but is worried that he
> doesn't have the bandwidth to keep up with a high rate-of-change.

Added from today as "v9fs-ericvh".

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--=20
Cheers,
Stephen Rothwell

--Sig_/FUBHDoRBls4/dfb6wOoP5xw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPTAzgACgkQAVBC80lX
0GwVIwf+NjVgbwZl2TdVtbPCqsRgAAaTseeLqhwHEWMIMTUraKMVPoFyYoIyC4dh
dGkS0KpuudIdz4vPJAhPHLbTLnYsglt30vhQR0H+wxVAMMyoFEqZFvFYGC39SKda
Q4d5ysMEwVZd0Enr2hoQrZVRCcpTbWkk7KsfNpI79nGQ0ZPd6UbofFOqEqsZzMJP
2nBWfoljzGx74+LY6b7wAvktvW+R5PQg0d7U2CD2BpzYqhuhcItesEYMuzrvW32q
tsjE4uu6TnSE46TJBP1uatYo5LFAUDijkVslSSCUbb49v57xW/BDzCuv87Mj2weH
k0gc7P/cxWX0i095f0ynXXv/7bosyQ==
=8jxb
-----END PGP SIGNATURE-----

--Sig_/FUBHDoRBls4/dfb6wOoP5xw--
