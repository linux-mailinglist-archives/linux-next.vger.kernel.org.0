Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C81614E7CA
	for <lists+linux-next@lfdr.de>; Fri, 31 Jan 2020 05:12:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgAaEMN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jan 2020 23:12:13 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:50335 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727448AbgAaEMN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Jan 2020 23:12:13 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4883hV3JKJz9sPJ;
        Fri, 31 Jan 2020 15:12:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580443930;
        bh=fNz3+AU8ISEERvRzFWxc2tZiNqkg3kelUGRQSJvLivs=;
        h=Date:From:To:Cc:Subject:From;
        b=TL26u89sOGl3v/V2hIWhRPn5VfLYix/O+RNmrgbCuRL+eyoAyLiWNhUVkpUqvYghf
         XS0Uc3o54DQ6ybe9YA/h0UJehEj6MIsArvRxT4T9NjQLfgijA25vfrpwOFXOoAC1H8
         gM28AcC1HDtTvplp9nOZPGDG0EfZ4RujPpvBtQ7DlhnOALNwvK3Hk+I9uh/mlqJYtZ
         mi/9l2RNxOzm2/Fxery9bSz5xuSwOUSjXSAItxcvjyPR+fgxkCxdLyZ9zQrCRIBHBw
         2wOHR7ZUNtkfz4NND+C0hHjG9xLCkS6pK57UsMykVDmzEs3lN2uo5hzs02ZeIAO7oO
         I8ijhytlRbqjw==
Date:   Fri, 31 Jan 2020 15:12:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: build failure after merge of the origin tree
Message-ID: <20200131151209.37e780f8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GfybL3_=Dh.QX=..tFc3V+N";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GfybL3_=Dh.QX=..tFc3V+N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[At Michael's suggestion I have started doing htmldocs builds at the
end of linux-next runs.  Unfortunately, this currently fails for Linus'
tree.]

In Linus' tree, today's linux-next build (htmldocs) failed like this:

docutils.utils.SystemMessage: Documentation/driver-api/thermal/cpu-idle-coo=
ling.rst:69: (SEVERE/4) Unexpected section title.

Caused by commit

  0a1990a2d1f2 ("thermal/drivers/cpu_cooling: Add idle cooling device docum=
entation")

--=20
Cheers,
Stephen Rothwell

--Sig_/GfybL3_=Dh.QX=..tFc3V+N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4zqRkACgkQAVBC80lX
0GxlWAf/VnhyXcQrWat1iseOQKqe5oHXX8xBVHxCEKaUT/sV5Pt901EBlLN+RI/o
bzuoL1HGUuSFskOlENKVLWtk6Z4Y2+DEyQIGAcbQmsD05XwyIgVS7tkhIJ7xMqt2
Jkc9t//gilhe8Pqgcq9UcwDzbYbdcdURFRBHTSa4MpotTccPoEbZVaWKWH/P0q/b
1mzEi58lzaKOIZym/fEvcNypzO+xc2O7iBgPiz8O541DEVvVkpRq5RS1yHFPy8Hf
rPYPRXcv9eJRsu624wEgu2thPZbM5CX04s4sai1lBVNCHXt6aptUuqARCGfNzgKD
LTdQ/FaaI0OkM0ZXN1C0LzXotpMzxw==
=2lww
-----END PGP SIGNATURE-----

--Sig_/GfybL3_=Dh.QX=..tFc3V+N--
