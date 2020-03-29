Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5F119707E
	for <lists+linux-next@lfdr.de>; Sun, 29 Mar 2020 23:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728850AbgC2VTl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 29 Mar 2020 17:19:41 -0400
Received: from ozlabs.org ([203.11.71.1]:53997 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728724AbgC2VTl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 29 Mar 2020 17:19:41 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48r7lF61nRz9sQt;
        Mon, 30 Mar 2020 08:19:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585516779;
        bh=KrulLFYhw16y1Ijj99I4oFWmBWK32BI6QI2Vfin53Bc=;
        h=Date:From:To:Cc:Subject:From;
        b=LK/4nFQ6nWpRmO2eXt/bWBq0FU+ELYAenhhf+WYKk4WkmCNzowu17wHtiog7h+GKx
         2cqrhGIZJ15mZ4gVI2fBMN3/eZXc2lTz131aZGEwsWVWWv/+HfHkRmJUVGqOBz9zYV
         L4/COFvzifAHJLRUu+k+6omjXf+5je2iLkMp98ShIHOg3POoFumHXFAuzCFQXmKFi4
         g7onvC4t4ZtGFp4NiOsqvYQ5Up+shPjq6LrmbZz43oJvbwScSZpChjEVxlnUJNqxo2
         3lcePpJVyNzyacihYiDYPQZZFQpsId0DG8cwEchhmlOKULzzhAP+AmRYaKxi66KF/b
         VqfM2NfQafc0w==
Date:   Mon, 30 Mar 2020 08:19:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Benson Leung <bleung@google.com>,
        Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gwendal Grignou <gwendal@chromium.org>
Subject: linux-next: Fixes tag needs some work in the chrome-platform tree
Message-ID: <20200330081935.5bd8364a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zdEPmWHZEidqE6zaOqi9FP_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zdEPmWHZEidqE6zaOqi9FP_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  5ca22c7cae55 ("iio: cros_ec: Use Hertz as unit for sampling frequency")

Fixes tag

  Fixes: ae7b02ad2f32 ("iio: common: cros_ec_sensors: Expose

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/zdEPmWHZEidqE6zaOqi9FP_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6BEOcACgkQAVBC80lX
0GzsEQf9E1jw1P8aiKWQyTTnMi+CFk+IJgr1RowDzU70cYLngbUv5fM8JK/7IqdB
1TS0o/e+k4QnHxN6LecbvLlwn/AHYNzYG+QKkCHlRDTx+qv4C76CO4y1ODT6TXmq
XYdn6xt744/Bj3hH3ho5V7wA7mx0fBa6uMpxOsft2Z8IfJo9N7IwkhMQkru6bgto
5k+gHVB6H8cuwpx4OW6HS+tsbVyKYNDpJneIbQ/gAVySoYRwocgp3GeMap7xjsbg
rYvojXKJiKJLLrfkfzpjBvi6ehnU/MWDBUCQloo1zSzf6H0q1ci7SeAj8VjWPTj2
OedpWv+Ia7mHQPQcn1OHjodcqcRYJA==
=/4Uv
-----END PGP SIGNATURE-----

--Sig_/zdEPmWHZEidqE6zaOqi9FP_--
