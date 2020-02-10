Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21F8615852F
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2020 22:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727414AbgBJVo6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 Feb 2020 16:44:58 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:40895 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727385AbgBJVo6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Feb 2020 16:44:58 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48GfZb4QZxz9sPF;
        Tue, 11 Feb 2020 08:44:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581371095;
        bh=pFYPa389Myh8Etid3glnG3ZLrUhuvH/ahhE3Z1NHmko=;
        h=Date:From:To:Cc:Subject:From;
        b=e+l08ZvJOftRjq0SpqSNch2S8Gaon2mQmEglbUOBX62JWUrCpxvanEKhW+3ZvsaxJ
         +aSUid4jSeDSHX4r/oBsKARiAIwefXz852Txvx9mnWWh4ctwsCePfrtp9VsQuIqDzK
         Rjj4W7bIN1vSNi/FOfOX2lFSJrVd378HmmQKDhzvU8z6nrZLqiH4S+uF7BjTWoSuA1
         oJweNchQuglQF/aLNG9ZS5S+aAeWvsaAiA3P9Sia4xXmdd/7cmX3RVOqJ4pvZoBsXZ
         Gbg61fzL5r0aKha62eRqJ3ow2lhQZMmiT39kgQQC/nohAKz4Tet93ZeiDavXTDqS/U
         Q4eN8Wa0f1PKQ==
Date:   Tue, 11 Feb 2020 08:44:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Vijay Khemka <vijaykhemka@fb.com>
Subject: linux-next: build failure after merge of the aspeed tree
Message-ID: <20200211084449.05e3b3cb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//uccmwmo=OMY=wvpBR7nK5B";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//uccmwmo=OMY=wvpBR7nK5B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the aspeed tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/boot/dts/aspeed-g6.dtsi:322.35-327.7: ERROR (duplicate_node_names)=
: /ahb/apb/syscon@1e6e2000/interrupt-controller: Duplicate node name
ERROR: Input tree has errors, aborting (use -f to force output)

Caused by commit

  091ff5206ef3 ("ARM: dts: aspeed: ast2600: Fix SCU IRQ controller node add=
resses")

Also these warnings:

arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit addr=
ess format error, expected "40000010"
arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (i2c_=
bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address must =
be less than 10-bits, got "0x40000010"
arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit addr=
ess format error, expected "40000010"
arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (i2c_=
bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address must =
be less than 10-bits, got "0x40000010"

Caused by commit

  a59b1792adf1 ("ARM: dts: aspeed: tiogapass: Add IPMB device")

I have used the aspeed tree from next-20200210 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_//uccmwmo=OMY=wvpBR7nK5B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5BztEACgkQAVBC80lX
0GzldQf+JvoIHOKolA59g+PX2HyBgvof6Vp48UXcTxJEmPXGH+xC7Wr6P7jA3Q9/
gJYdvKDqlRVMiUZsxnUFLWQ1FZ0c8lA89TRUclvTXvkvKXpxbNy8KrkZ5EzV+qhE
Oc65dPyCYakQN7wOQmYO5pc/TZq7xTeuqkt53CEpw0FufYUS4thUXwOLhvUf5ce9
uyGuBmdyACi+LREuH/2EWJPPWK+TlTH8cgxm/5Lan+h2WlsWsB9393CXYk9leBzQ
NU2bEwuG4Dl1QFY0qcZOIz4qfOvNmJ1Uyr1pqFuEUTeNtXSQb3PEN5kervq29/PN
MHERhjzJn2LGW2MoqtiOXuWMa4hLOg==
=c5uw
-----END PGP SIGNATURE-----

--Sig_//uccmwmo=OMY=wvpBR7nK5B--
