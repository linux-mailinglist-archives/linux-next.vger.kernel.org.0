Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95A2333AB06
	for <lists+linux-next@lfdr.de>; Mon, 15 Mar 2021 06:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbhCOFgA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Mar 2021 01:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbhCOFf2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Mar 2021 01:35:28 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72604C061574;
        Sun, 14 Mar 2021 22:35:26 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DzQ9k6v6Bz9sVb;
        Mon, 15 Mar 2021 16:35:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615786523;
        bh=z6wwIedYjzlQAVPPXxaQ+YdEyLrVrL1gNsHxbmxPAQ0=;
        h=Date:From:To:Cc:Subject:From;
        b=pJhAAKJEdmBjDFtSHaOboBHQqFBI2LEKdmmRwuFMXnZzmAdpe3Ew8tEOV7W1Zv22g
         NH/IVTsNya6Xe25JpBWddODIvB8FLrsHwXqqcwOXovFRdrY+Megk/CMsN+EkYQQfVc
         DNY34stGoVnwtIomTkkSj7aQXXLBGRcrnLdMsmy3FmVflLaBpmsxmrEVnI2DAnp4Uy
         fLfvpnjWi3yGVZytTsY11eZRmKnRoL//MOLt3L6UDkR+RMS5YDCDX4Rx2su24O037M
         hL36eDo5+gSWsFOZFFM8eHi7YeJXS3rxYFAx4kc0fx+7+wv5Lck4iSm7MC9LDcbSu1
         gMUv7vet8Nw7w==
Date:   Mon, 15 Mar 2021 16:35:22 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Minchan Kim <minchan@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20210315163522.589bc67a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MAiB+h=/53PYpmPRTceivHH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MAiB+h=/53PYpmPRTceivHH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/ABI/testing/sysfs-kernel-mm-cma:2: WARNING: Inline interprete=
d text or phrase reference start-string without end-string.

Introduced by commit

  439d477342a3 ("mm: cma: support sysfs")

--=20
Cheers,
Stephen Rothwell

--Sig_/MAiB+h=/53PYpmPRTceivHH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBO8hoACgkQAVBC80lX
0Gzabwf+JtxLFlmrXapSiCfdKmH7v7oDKhX1zL96Pb1N/twyAIAElmF6h+Tthzw3
jCA4h9CRqRg/c+Tz/HbwVEVLlnC2d41ox8MKQVQZmuZLumxPm+tIcT/9TtiiH8Ce
YX1+buYwCZ+I2ZSgL9hWjZQNCo5TPIQtztq/QuJSDPVaepZW+QnWFBGfz2zV2Pbr
CzE+Yas0tVdzK7yVdyjzX0XhNu3Ey4IlFXq2d/CReolv7Eio7aWqIxPGRFBVP/HS
gugy/XX/nb9a+GwyB3mmZLgWM3tWJGIz+NlIF6a5rtoY7EJGeEFzPhM8P1zCUQp3
/GUUQ2J+GGWVYRcit8zRUjoTcnBwpA==
=H+yX
-----END PGP SIGNATURE-----

--Sig_/MAiB+h=/53PYpmPRTceivHH--
