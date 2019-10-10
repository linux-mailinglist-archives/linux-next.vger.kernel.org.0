Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E42AD3299
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2019 22:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbfJJUmr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Oct 2019 16:42:47 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54777 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726423AbfJJUmq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Oct 2019 16:42:46 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46q31b2707z9s7T;
        Fri, 11 Oct 2019 07:42:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570740163;
        bh=qtc1L2zwADd9HeaO41rnLWdsx91qAZrQvTXFUpW/6xA=;
        h=Date:From:To:Cc:Subject:From;
        b=J9fW37+bGgkr39aHkWqlrS4qo8fh52uQbHxsfeP9DGcq81a42ccQ6OXJpcLqQFmIP
         PYuDOj6iVns8dg/3DzPi+BFtdFf4ZInirllYrhOgc9fxAhsU9OFpiyK+h73QvbwAhB
         vV01OdfWM3ig1PHXsmtpqFb5Apr9sPBeoR+dhIJkQidWvuiOmVTV/HoecY9hmwiSyJ
         4oS65i7ugI/Vxw9dZumHCTL876wTxcmYEH9XRWb1bAyGKJn71pbl2okD6dSQ3kbZls
         8kr5+Tlhwz28E8/FAqPDYKVSKos0RDRDrOI9rNaZIkQKH7CpiWDxZ6eLHG5ERJITZm
         FNsBYq2xIWfSg==
Date:   Fri, 11 Oct 2019 07:42:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: linux-next: Fixes tag needs some work in the staging.current tree
Message-ID: <20191011074242.3d78c336@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9Xgc_Yg8o_=SwmYIH8dZrkT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9Xgc_Yg8o_=SwmYIH8dZrkT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  85ae3aeedecc ("iio: imu: st_lsm6dsx: forbid 0 sensor sensitivity")

Fixes tag

  Fixes: c8d4066c7246 ("iio: imu: st_lsm6dsx: remove invalid gain value for=
 LSM9DS1")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: 0f7e17286b45 ("iio: imu: st_lsm6dsx: remove invalid gain value for L=
SM9DS1")

--=20
Cheers,
Stephen Rothwell

--Sig_/9Xgc_Yg8o_=SwmYIH8dZrkT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2fl8IACgkQAVBC80lX
0GzPSgf/Y835Kb3HaLqwCX3Inv5fcce69drQlBXOZjvdEmsqgIvVDHtpSYbYnwHW
I+/eT3Oe4IxvKA1hm+6Lib7p0vQJ446hnP7RVZxdfGg1UwVjSKFH9AEyQgsk9vEc
laLz5/YzeIdbpUjm6yTv268bvc8+GivTZ6dI393+v3z8anRD1Qkm81Jox0m/I1oc
AjzMIP/2L97nF/RK9fRoDSDoyKl1b2MwXGvQfTV11ICJLJrUfZoyCuSuVaJ0+muE
vj8ZO2FvKdUi0xlCGVCAjfG9BRc8QAfg8JiVJDWDr8OKz9OUONEJEqeMwR8ZHWG6
r/5/sM+HeUTlLJP9UqNJ84T9JRhwQA==
=wB8a
-----END PGP SIGNATURE-----

--Sig_/9Xgc_Yg8o_=SwmYIH8dZrkT--
