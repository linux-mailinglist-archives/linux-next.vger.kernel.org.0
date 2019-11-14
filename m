Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E109CFC278
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 10:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbfKNJV1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 04:21:27 -0500
Received: from ozlabs.org ([203.11.71.1]:56703 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725977AbfKNJV1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Nov 2019 04:21:27 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47DGFJ1C1Wz9s7T;
        Thu, 14 Nov 2019 20:21:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573723284;
        bh=Su9SciTG5y8VlxFFPshZ485bk7lrNMhM9K3kUHG2sRQ=;
        h=Date:From:To:Cc:Subject:From;
        b=KCZxPz6uOlnMxW52o/7PWKk7Si0rLcY6YQtAKWjMovQSKPbnyapuXVL6FkVMNW1X9
         s2vcdpULnyAeQwBl16MEF6RrIV5uA7JRRxcYvUixkh1dXrzn9IzKQ9ot5wnGOrV2VV
         Yf/gIsY23QqanWOjXBDL75ShuNIeNDdseBMpMByri0tcxmquWtPD0h7JopnEVIqrFQ
         dlwzhFa5AFBCcyHicGzDSPRoAV6gDgBOmXOFvLhrj/usjlhSzgrWnrj7TFI2rjg7f9
         1IgzO/Pfw6YQaa+ZIk+ivRuuPXHQYcvbS2+/O/7U89rmSuUPTv+IdlY+9sv6u25t68
         vgpT6MdicoYIg==
Date:   Thu, 14 Nov 2019 20:21:22 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: linux-next: Fixes tag needs some work in the arm-soc tree
Message-ID: <20191114202122.0f38eab6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h4bRdnJqf._UF0UZazA8wl5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/h4bRdnJqf._UF0UZazA8wl5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

n commit

  9a6edfe32f37 ("firmware: arm_scmi: Fix doorbell ring logic for !CONFIG_64=
BIT")

Fixes tag

  Fixes: 823839571d76 ("firmware: arm_scmi: Make use SCMI v2.0 fastchannel

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/h4bRdnJqf._UF0UZazA8wl5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3NHJIACgkQAVBC80lX
0GzlSwgAjoiDtqoUq2bkVMFZkO/8ZZdHgoNLzkX09oU87yoReHG8Ljw3z5b4pTCd
t1quaUWwTxudkyIzZk3xy1p4MCiAjJ+HGgEV9UM77VF+2ZCqjZEnYAspiQC2MevS
RSgmLE4RHfvrJ+6dfAHnw0K49bqhgB0pvdr7tgIoxBrS7gwofx0Dvk5jYHFQL3hv
bMipMsV7y6n5TbA9Uckm+h+5tKIZdgUZF91D7HFnHwMALslTyyJE6exS7OeqWqzy
8/5ZaUtU9e2FbBggSCMvj1h415HisgDMxEgJjrJ2evrVWwUKpQ6XRw0LJxvH+qQb
n37OjnJ0TmKP4cNkUZewx2xdQXQAFA==
=fc37
-----END PGP SIGNATURE-----

--Sig_/h4bRdnJqf._UF0UZazA8wl5--
