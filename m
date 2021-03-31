Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4910E34FBAB
	for <lists+linux-next@lfdr.de>; Wed, 31 Mar 2021 10:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbhCaIbl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 04:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234054AbhCaIb0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Mar 2021 04:31:26 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C906C061574;
        Wed, 31 Mar 2021 01:31:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F9KKQ0yQHz9sW4;
        Wed, 31 Mar 2021 19:31:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617179482;
        bh=SvQdjWM6eYPBfT80h5JbDlnd3PoZqiXmdriO5Lw+FGo=;
        h=Date:From:To:Cc:Subject:From;
        b=ADFCSaEUY9NbZ2zdNFTV4ouxZTz2XiJnHo+Io8AP957PcL/lxoNNUZA8t15yZ2rsh
         6AZIxyFMQ1SgZnwodekORNT+vsHonI81NSS1QtPKbQ3NNfYYkN4vhSgJX+DpxNqlxV
         RTIo7a6FuvLC+hwYSTZRARyHZ7kY6dqpD9ixRLu7o7cvDHSfR1VGNFMbeZDcLZ6ORp
         3olMDKybUfrNH/RK2ihzCDEPqs3jkiboRLiaEYxbX5nO/4mSc3ehh/t31mxmNipxz/
         Fix+KHMnkdZUfGVvCbedrj29C59bRTNkm1FCQqUWi2tBOj2JK9y0xBQCwt9MFVRZSE
         BSfRnENafTTFQ==
Date:   Wed, 31 Mar 2021 19:31:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-tegra tree
Message-ID: <20210331193121.39f921c9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bpjU4Pv5u+oONOGAOfo==Rb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bpjU4Pv5u+oONOGAOfo==Rb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-tegra tree, today's linux-next build (htmldocs)
produced this warning:

include/linux/host1x.h:40: warning: Function parameter or member 'early_ini=
t' not described in 'host1x_client_ops'
include/linux/host1x.h:40: warning: Function parameter or member 'late_exit=
' not described in 'host1x_client_ops'

Introduced by commit

  cef3b3207ee7 ("gpu: host1x: Add early init and late exit callbacks")

--=20
Cheers,
Stephen Rothwell

--Sig_/bpjU4Pv5u+oONOGAOfo==Rb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBkM1kACgkQAVBC80lX
0GxWOgf+OpSvMNEMxFE1j6oZFmNVXRYZ/zJMlbYwhZ4kIu7hAcWuwi1lxKvhSKy3
bOFPpw+nUNGjLSO1svmqE5EsBaw341ABb5tmW5kHGN8IZSj7Ou5QImU4cpRAQ4by
02dk2giNcVJMWfR1X9FPg0BkNELYTswE16z6za7kjqIzlCJIrW9vIzbk2pV4iIP9
zA08XvoaWXMkROq7V56eIGHEmOuPB5OgsengSrOZIMeQc5UM3ABR+p5xM8pCiRro
RyloiJOF95tdgxtcQx0UoSDz4NgJextEi8UTUOqwFzxWa+WejdtduL9fnXz9eTRo
XyVY8Rz6LwqKl4ld6iwSAJ97szQXyg==
=/Tp5
-----END PGP SIGNATURE-----

--Sig_/bpjU4Pv5u+oONOGAOfo==Rb--
