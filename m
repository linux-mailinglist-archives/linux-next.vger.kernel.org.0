Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6377D185FAF
	for <lists+linux-next@lfdr.de>; Sun, 15 Mar 2020 21:12:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729084AbgCOUMm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Mar 2020 16:12:42 -0400
Received: from ozlabs.org ([203.11.71.1]:37717 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729081AbgCOUMm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 15 Mar 2020 16:12:42 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48gVwS2QKZz9sP7;
        Mon, 16 Mar 2020 07:12:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584303160;
        bh=T5p7qsdMSbtIslBz+IZ/R1FX6AlWSXNTZGgfkCMkXnA=;
        h=Date:From:To:Cc:Subject:From;
        b=roghQ77Tf/swP68aZN7tG7UG8wcer2zycmAfCgVjDC9W4d1gTh3JIrJdcBuw4syTM
         n40XKhIpV4dxqVTIuamaCEn4sBakok/XEmCXC+Xm87sV1HaIS1M/FENMxiEsrD0A0a
         BHFVc/I2NhOLjmhWpeoLRSjPv57gB035JhlbW/tAxom9yMuW5C6Ym9X477HtBpY03F
         3SE41lic00IkaUhnC2YSP2K0CXsSRsna1Zk+Q/HzJlpACzs4mpUtohyI9NFvLG9xle
         tuCbcnXT2MQ7K4xOJzUBOiyuzJEPZJ8HzKgNtSR1/BFcl8+6BTuTTQUg8//BctqwPe
         UwTvTH1eyuDig==
Date:   Mon, 16 Mar 2020 07:12:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: linux-next: Fixes tag needs some work in the usb-gadget tree
Message-ID: <20200316071234.3e0bce06@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xcf=cdoDQKABwzFeZT1ekMP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Xcf=cdoDQKABwzFeZT1ekMP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  238d76021654 ("usb: dwc3: meson-g12a: Don't use ret uninitialized in dwc3=
_meson_g12a_otg_init")

Fixes tag

  Fixes: 729149c53f04 ("usb: dwc3: Add Amlogic A1 DWC3 glue")

has these problem(s):

  - Target SHA1 does not exist

Perhaps you meant

Fixes: 1e355f21d3fb ("usb: dwc3: Add Amlogic A1 DWC3 glue")

--=20
Cheers,
Stephen Rothwell

--Sig_/Xcf=cdoDQKABwzFeZT1ekMP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5ujDIACgkQAVBC80lX
0Gz6GAf/eED2aBxU5Am16xpi3iuSkpHZss12ezWsbOyzIt1flEysxgxgysjvhFMc
B3iLO5kFGBi+4HYcxrQzr/9lYZgzVwpeS3Yp+RikP2sBSmu6DkaK9n8f+mPQPyBM
9LqPPWMUDgDRxqbcLSzJV+kjM7Jrbm9fCmPwWhWZTyqc5ZRwvSN2Kt6TwzhoGTF7
d9yq929gJvJ6sNB1K/AUjoPCS74VGp9yqFGVUQ8UHiUN1qQUhWvjP5LH5vcVfKYq
2jYR892oA8rpc34yQJov2d36D7PKDwqgEnwVTYxV//R3On7lZ/2AeK8P77lzCAeQ
dChf4boP7W/7TkQhqNFJyDlhO5ZQAQ==
=nvgy
-----END PGP SIGNATURE-----

--Sig_/Xcf=cdoDQKABwzFeZT1ekMP--
