Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA51322528
	for <lists+linux-next@lfdr.de>; Tue, 23 Feb 2021 06:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhBWFUi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Feb 2021 00:20:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbhBWFUi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Feb 2021 00:20:38 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3178C06174A;
        Mon, 22 Feb 2021 21:19:57 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dl6n44pSyz9sBJ;
        Tue, 23 Feb 2021 16:19:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614057593;
        bh=TpowVDnhVXNupfN/6vkyetnseFMr7gY+kYwiir+ke2U=;
        h=Date:From:To:Cc:Subject:From;
        b=ov9r/evGi6rLzSP6iHHKiaKf9ybwYetirbI1J0OCDjhX2L1noSEmljBPXR+7gHg+h
         K43kb+wafCvJSg9yvTxbXvgtSGSwYAlnX1ZV727H0aaVNGVkq7rZ2cZEQchu5Yuf9n
         pRJYfg0HDA62k8npIgoN81fh+j0m0pp/e7MX3XC/MTGIKMaBml+YllKxJiPFt7E4KB
         grp8V3nlOFR9MtqQR9ccbdtBhmwyhr7w8ZaEnZIn4qnvcZ8evJKNhQurj49dQ0cGWR
         Or47CzvfRXul+cN0p2ZpnAFTWzb/IRiQVJ+JGP8psLChqKL87w+FYhuanQxti8sXHT
         LC8Qzn9wfG3fw==
Date:   Tue, 23 Feb 2021 16:19:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the jc_docs tree
Message-ID: <20210223161951.4f79503c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ynt8l9lq2YMb08QjQzlpAWP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ynt8l9lq2YMb08QjQzlpAWP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the jc_docs tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/filesystems/proc.rst:697: WARNING: Unexpected indentation.

Introduced by commit

  93ea4a0b8fce ("Documentation: proc.rst: add more about the 6 fields in lo=
adavg")

--=20
Cheers,
Stephen Rothwell

--Sig_/Ynt8l9lq2YMb08QjQzlpAWP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA0kHcACgkQAVBC80lX
0GxQrQgAmqF3W3SMdFD3qRQBcryB1b3V4XQqiJRr5srHLGfTJV5n0aWFHIEh2ixQ
r3sh8vLAx+87qfhN6J5Abx/SoELPMUzKQJ5PcivbjrGNnXXC6CVy3Kj1Fow0lTwN
SDX6wtypUinz6Bz5SPardDfyDSlZh4ckFjeHbsH7vBXVJYLyp+5e+Wmr8yAsl4K/
TAaEadcmqUOumIq3eVjmClDdXSvP+1VRE4428L30z7dTecVzBGum0ODdZT3Y9xRG
ZW8Z55hE+O7GwpjUgROna8uTAsZYhQpYZkvcH4KXfZjEV7+So3kIYMI07//Fux6m
WBUBITGC9We/IINSLldkHbRHyiKYrA==
=NiEv
-----END PGP SIGNATURE-----

--Sig_/Ynt8l9lq2YMb08QjQzlpAWP--
