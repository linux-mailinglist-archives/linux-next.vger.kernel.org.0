Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A02D1B5803
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2019 00:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbfIQWc3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Sep 2019 18:32:29 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:33452 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbfIQWc3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Sep 2019 18:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=cQQ12SvcJIgjgkAsAj9BE9f4eo/J2keRBEPn++oKwlg=; b=TsX5fmdalIgP/b3/IAr0l+xQp
        Bv2yUwLoZmvq49BeURuo4VVWhbbEL/4PjQThXH9F3hYgiYcw3JVkkjeMzouAJK4wSDucnh4zqEhfG
        +Yk2QibEi741XUPklfR4ib3jGmaMoMaWq0BFLeo4Vr/YN1svkn4KztWLnjtodobduMaDU=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAM1L-0000tU-BU; Tue, 17 Sep 2019 22:32:27 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 36A2F27428EA; Tue, 17 Sep 2019 23:32:26 +0100 (BST)
Date:   Tue, 17 Sep 2019 23:32:26 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Kees Cook <keescook@google.com>
Cc:     "kernelci.org bot" <bot@kernelci.org>,
        Linux-Next <linux-next@vger.kernel.org>
Subject: Re: next/master build: 218 builds: 6 failed, 212 passed, 11 errors,
 640 warnings (next-20190916)
Message-ID: <20190917223225.GC47411@sirena.co.uk>
References: <5d805425.1c69fb81.212fb.3cf6@mx.google.com>
 <CAGXu5jJRmPn1o+znjE8ca4jmauwAC0OSdsoDcBEN52LATx7vbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Content-Disposition: inline
In-Reply-To: <CAGXu5jJRmPn1o+znjE8ca4jmauwAC0OSdsoDcBEN52LATx7vbQ@mail.gmail.com>
X-Cookie: Have you locked your file cabinet?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 16, 2019 at 08:48:14PM -0700, Kees Cook wrote:

>   HOSTCC  samples/watch_queue/watch_test
> /usr/bin/ld: cannot find -lkeyutils
> collect2: error: ld returned 1 exit status
> make[3]: *** [scripts/Makefile.host:107: samples/watch_queue/watch_test] Error 1
> make[2]: *** [../scripts/Makefile.build:509: samples/watch_queue] Error 2
> make[1]: *** [/home/buildslave/workspace/kernel-build@2/linux/Makefile:1669:
> samples] Error 2
> make[1]: *** Waiting for unfinished jobs....

> It looks like the keyutils development package needs to get added to
> the build roots.

Yes, I'd already reported that to the people doing the containers,
it's sorted now.

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2BXvkACgkQJNaLcl1U
h9CoUQf+K84FrjDOR+RUr/11QXuGPGyxjpQ6ZyOs4Rw8J/6gFquYl6KMHD8NDOxI
8BJuYON86UjNL7GeVK5j4A25CCNysdBu8p0Ws9Qxeup6c00uz+0fm1/fEybtgr4T
6d6gAACrDJvUJY3NR5i5nK9LRTLDmnGrkVdY/oQOmJtfQmLoITCU3yzU6t5n9n10
Kf50EBIW7LYD7LTmMblRdmxmoVM6S80xJ04OFuY5O5HubQEc1WhMWlfE9QWWsNCo
UKO2vfxyEQeNPmIp6+80yWLiqvd5eKKWflhYQOc2iML6bA5h4QnGPnssh8OgHiuv
yvJWKL6j3zW2XCr4j/y+1LNwyP8PYg==
=RjFj
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--
