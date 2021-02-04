Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF89310055
	for <lists+linux-next@lfdr.de>; Thu,  4 Feb 2021 23:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhBDWwV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Feb 2021 17:52:21 -0500
Received: from ozlabs.org ([203.11.71.1]:45635 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229684AbhBDWwV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 4 Feb 2021 17:52:21 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DWv1R1yX5z9sXG;
        Fri,  5 Feb 2021 09:51:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612479099;
        bh=Qmcs7wXaK/oiVBstKKQx3GA71VxIeBSpvxwpqhN+qvg=;
        h=Date:From:To:Cc:Subject:From;
        b=okKSkFUqaBnQOaM3pY4rY3XWgNEV74EE5ca6If+DIof/ycddM7elj1RmQ6gTSjVDq
         wrhKKmuIPh/2mST4RSRsiHCZpoLWBUdmCQd9pjJMynQ+fmrdCmPOBiBS/7LrZrpsQy
         0nMdlDXi9EyWxj8VWG0wJUJKPh/nXNZUKwSCeCiuysgwsaCgt4nJj5pq17+JW4a0Lv
         5CleyvGMxxsD7s0Olpi3Ug4Fav5dMjGqHDkmwMgrXLuFYW/qv7Toj7KN3G0VhOFir6
         yV8NrOxSn45odbcDrnwxzAh1yF7Gz+NliZC7yMHQbqY5Ph5BE3EL3TQ5/FbTmu6EWr
         gCUFM9m6tY5yA==
Date:   Fri, 5 Feb 2021 09:51:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     David Howells <dhowells@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the cifs tree
Message-ID: <20210205095138.317922cb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HRuqvG8r_mQd+PPpTzVyH_F";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HRuqvG8r_mQd+PPpTzVyH_F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cifs tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/cifs/file.c:4290:13: warning: 'cifs_is_cache_enabled' defined but not us=
ed [-Wunused-function]
 4290 | static bool cifs_is_cache_enabled(struct inode *inode)
      |             ^~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  6941febc7309 ("cifs: add new helper function for fscache conversion")

--=20
Cheers,
Stephen Rothwell

--Sig_/HRuqvG8r_mQd+PPpTzVyH_F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAcenoACgkQAVBC80lX
0GyB2gf+O1hhydmt4EtK1N/61FDlC/EP11uMSsvoAIobjKPi7ZMoim3C9DytcFt7
Wo45GFABqoNNoIEl212tfQsXEgtU+mWwTr/VzDL19aBCHfsO78t308Q6vjLQvrP1
hqQIU8hKA8alwcY9OdeMxm+m0M0HPA33ECdStnLuCJ4GZIwqWPeN02taQoLbuzVX
BCUl7v6JszAUfrKDiI/8YEDPFLVeqCznEv5Mb1XXt1vxXEjUHDsnqMoooVc/MGMy
SMwuooq9b0S3uSaCkYGQ2vD3ibQrHsaRFOpuNU7ogz0KlYatbXBE9ypIm30LXn5I
u/PvzBIBEOtcZJgFugQ/cR5z0T9oxQ==
=UMMb
-----END PGP SIGNATURE-----

--Sig_/HRuqvG8r_mQd+PPpTzVyH_F--
