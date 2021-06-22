Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9FE23AFEE9
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 10:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbhFVISr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 04:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbhFVISq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Jun 2021 04:18:46 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1179DC061574;
        Tue, 22 Jun 2021 01:16:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G8K3t0H69z9sS8;
        Tue, 22 Jun 2021 18:16:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624349787;
        bh=8roPz95JuEajtrp1V64GuRY4gFVZt8UtOTUtMw5ntKU=;
        h=Date:From:To:Cc:Subject:From;
        b=h1sP7CIwbeiiQVvRraq3oVUtfafC4s5GpOQ1BNJgfhPWQQeYZXHI9GYdG4KuhBm3J
         ViGdTSYQGU30eUd0HbCpDeBg8v7BSAZXEL5qsoVF4bT3VOxcotHZcDYksXOI0OjyxF
         RNkw6xybCB7hVp6AaVmls0Mpw6L+NAAOpv3myKGn108eWgvDdRjm7VtNzXalAj+yf7
         8f8aUywd3ykY67MFROW3GozUobSsLQTMQtS14N7q4cl0b09bzkIf2vvKb9gKi1n/lV
         4D2g3bZ8R9fKfReCe9R8xdHXGk3dsaXP5z2UMGcXdQ5fZWgz2/ZOTKZeiCEzXFrLF+
         IyrnX0YpDmPjg==
Date:   Tue, 22 Jun 2021 18:16:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robherring2@gmail.com>
Cc:     Aswath Govindraju <a-govindraju@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: linux-next: manual merge of the gpio-brgl tree with the devicetree
 tree
Message-ID: <20210622181624.57527651@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+F/Fdewp8riCmgW67LZSuw2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+F/Fdewp8riCmgW67LZSuw2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  Documentation/devicetree/bindings/gpio/gpio-davinci.txt

between commit:

  c601eef1e258 ("dt-bindings: clock: update ti,sci-clk.yaml references")

from the devicetree tree and commit:

  c830b87a761b ("dt-bindings: gpio: gpio-davinci: Convert to json-schema")

from the gpio-brgl tree.

I fixed it up (the latter removed the file, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/+F/Fdewp8riCmgW67LZSuw2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDRnFgACgkQAVBC80lX
0Gx7Lwf/WmJvbJQ8MNkbGzphXAiIlYZGHEEPmCrdZyubBgYZkPo6uksSnmrmPbk0
4FiS9UPEgWeaV77Bnwa4uS/CcIazteaN0FzEl/eg/de3+Snkd9s0yWWgydonNIwQ
A1xfGRQfvOus8P4ze33ASlP5n6hKg+xKi/ckOXw13TqBK45OJdyab7rkhmS0kloH
0gvkDF36wYXTon0lDFEH6LBp7pYBuCpryCy6aYDXmmtE6A9HKq+OaX2mZ2YwSVuz
l2gmfMzd/0YrfmuNQ+j+rlnMQznUcokjF/0gktr5NIR2mpTyEBJKdwyouv+q1PGX
ykMook/FMy57ZA45nYC7HPTsobUyHQ==
=7+9e
-----END PGP SIGNATURE-----

--Sig_/+F/Fdewp8riCmgW67LZSuw2--
