Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A228262833
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 09:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbgIIHQ1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 03:16:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:32819 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725922AbgIIHQZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Sep 2020 03:16:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BmYGb3PBQz9sSJ;
        Wed,  9 Sep 2020 17:16:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599635783;
        bh=kvb1VwlSZi2WG9vR7HApuQMTp0EBaflFlCw8hgJNa60=;
        h=Date:From:To:Cc:Subject:From;
        b=tABLfScPEkdDVjydaDLDmRghQIjeYuCJDoMvHOeT6YzXYUOgQJOMYq/xUlF5Rcobl
         wuG5JHI9ScRq6mEt7/k3Hsv6BzbyCDkRcPlGY/hUgARE0wTDwDe63GA2ieB5LV5Jn+
         Ac42i5Hi7CGcLoBbinaUm69DzG+YJbkyFb5V9TNtaWe0xImOO6RjAIkAFzIJyKptdz
         dbkM8BqIUHpC8iVz8kr1eK4/rxWt/ybnJduvW80SH70o7ialzLHOIu8sgnceK9CE4t
         TfUBDvrboxS7ULrmRHY9GIkkIfHocgwQ+pDVxpDPD8Wkyx21zr4EKmdJGq/IFqLdok
         LT95OY6fTbOVA==
Date:   Wed, 9 Sep 2020 17:16:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the staging tree
Message-ID: <20200909171621.28de7d12@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k9zhaNKq+cE6XAvPO=FmWMo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/k9zhaNKq+cE6XAvPO=FmWMo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the staging tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/iio/adc/stm32-adc-core.c: In function 'stm32_adc_core_switches_prob=
e':
drivers/iio/adc/stm32-adc-core.c:598:5: warning: ignoring return value of '=
dev_err_probe' declared with attribute 'warn_unused_result' [-Wunused-resul=
t]
  598 |     dev_err_probe(dev, ret, "can't get booster\n");
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  ce30eeb613cb ("iio: adc: stm32: Simplify with dev_err_probe()")

--=20
Cheers,
Stephen Rothwell

--Sig_/k9zhaNKq+cE6XAvPO=FmWMo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9YgUUACgkQAVBC80lX
0GzFGgf+Psuy9dmjbKNHIBx/hekS5Azod8U6SF9tWRHrTZiZa2pVYsFJYyDDN8cc
AqhOyGMHu9kkAnWd6aVxlZfUsneL6TuBvU88HDh51Oo4Z4JrV4jurz9HPLOiAkoy
KXCn9yrAz2MtBm/EZP5Tk09oOA1ESv2vgAQ8yvYALSBabGzuTEJDzVZYRIWf1XCI
CQHVHbzhCNj1cCGzk5JzPaf1XIibeiDGKQgoLyqNMCXmx06tftYVW/oQkjFo3XWl
T+cdtY5laCs/2zJ6MWONdctSX0jlJQgR6qsSxJLSJkea2QeTt4kBL3y+geSRielV
Ejy3l3q0/ZPPhuOjKZ9eDA2wiUzTCQ==
=xrwh
-----END PGP SIGNATURE-----

--Sig_/k9zhaNKq+cE6XAvPO=FmWMo--
