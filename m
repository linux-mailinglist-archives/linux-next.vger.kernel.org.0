Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3BFE345795
	for <lists+linux-next@lfdr.de>; Tue, 23 Mar 2021 06:57:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhCWF5J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Mar 2021 01:57:09 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48567 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229451AbhCWF4z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Mar 2021 01:56:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F4LGs61vJz9sSC;
        Tue, 23 Mar 2021 16:56:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616479014;
        bh=MNdKWp0AB0OYZp87SKqT0Q8Gf0KbvrqQYyQNe+LSX5Q=;
        h=Date:From:To:Cc:Subject:From;
        b=gUqY6mkVdLeLDn/gl8QqOjnfBkI1fm94OSNyUHb6VQPvYltnQyrAl2Vw6Qv7scErf
         aK6SpytP7YRYEmcWWiB8hSLLrokJBOYybRduhgilWaI/o6tmfY0JgigKtEKans24CS
         GWiJ9JNaNlOIJYBo842VS0rVWGxwytp/6ez/eezDIT7WlOq+ty5RrQbuat5MmYxPOd
         bQD7tiMeJO7Qxlpv2MQrEpdm09IG6BsVTKEt+YJTXgtJ+lVFGkUpDWQESlqRWtQ9Mb
         RMPKl01Sz4pmvH8loFIx7gZLgWTAgqrnbg/cRuKuAJsyREM1HiHdwM6WEaZ63uw8mL
         De/uTwHGijs/g==
Date:   Tue, 23 Mar 2021 16:56:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20210323165652.447e12ad@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JsdfzyE0X+4upFylzdXcyDZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JsdfzyE0X+4upFylzdXcyDZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/driver-api/media/camera-sensor.rst:147: WARNING: Error in "c:=
function" directive:
1 argument(s) required, 0 supplied.

.. c:function::

        int pm_runtime_get_if_in_use(struct device *dev);

Introduced by commit

  c0e3bcb25390 ("media: camera-sensor.rst: fix a doc build warning")

--=20
Cheers,
Stephen Rothwell

--Sig_/JsdfzyE0X+4upFylzdXcyDZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBZgyUACgkQAVBC80lX
0Gweggf/W0puABECDP/GY5C2EfCXaI30caamfctOubL76CP+jmicQRZYe0iZTGbx
v9qGmPW9m4QFtcFH7VbjN/GGJsOz+TtOSxT1fQpqisVYWLpUvYq1q+Lv08nYUzAW
B6b/Ez8ZHhIBBOM3GvVKQBi+VtIunV5Ti2bEQlLfQLgcOYuDzVBOsIraF7oR3D0t
dMcqdyTl4/I7jQK8cbZjdeJmLWJfzByXe5QFf6GcVznwAsdlN8BoRFO8znojBCmZ
ARF083fFD5jEKdCmnl3/luUJnA8xB3KuyWKli7OFyliU8JxplLEKoDpUXfdm2dHA
qVbyRqZGCsGsIXKuSVJPvVtaNt7nrQ==
=DBWo
-----END PGP SIGNATURE-----

--Sig_/JsdfzyE0X+4upFylzdXcyDZ--
