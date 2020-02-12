Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E26315B225
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2020 21:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbgBLUt5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Feb 2020 15:49:57 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:59089 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727111AbgBLUt5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 12 Feb 2020 15:49:57 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48HsG92BKjz9sPF;
        Thu, 13 Feb 2020 07:49:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581540593;
        bh=J4dkHbEB6RBjqAe2DsJvhKK3a5yp+QsKjyiLfWeKdQ8=;
        h=Date:From:To:Cc:Subject:From;
        b=NlAKLCPh3d/AEovh1gYr2h0iCC8F/OVilArU2v3uqrK3EFOXC+GqCW0jq5KoPZZ9O
         /Y68aS/pbVOHPI8cbC+ODN/W0LX97JUIQyIRM7f1J89x7CPCIe3zSMZI6BOWSsIF37
         o9kd5JPAe5xm+OOVODhFSSrajqhqJh82q+GJmfsH3Uc2kepV3tZrvLMxwf1uNnuD+w
         bNqsR/P9Rj/mKaHL6BhRCUkObsNTh6Han8IS+UbUY5O/qw8uAEyAJD21xW09eOFpX9
         aAkgeJTZEcky6gxt0+NKNvQD19/OczGV7VYNu/sbBjgtT7ERCfHw/RWksqP4vbOaHD
         Iq8L6X+ltfpJQ==
Date:   Thu, 13 Feb 2020 07:49:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Johan Korsnes <jkorsnes@cisco.com>
Subject: linux-next: Fixes tag needs some work in the hid tree
Message-ID: <20200213074940.4fc25926@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Tizg3_K0VfuuX+xai=TK+ti";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Tizg3_K0VfuuX+xai=TK+ti
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  5ebdffd25098 ("HID: core: fix off-by-one memset in hid_report_raw_event()=
")

Fixes tag

  Fixes: 966922f26c7f ("HID: fix a crash in hid_report_raw_event()

has these problem(s):

  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/Tizg3_K0VfuuX+xai=TK+ti
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5EZOQACgkQAVBC80lX
0GzFkwf8DVL2KKXhB0IZt+fgPLqZ/8eSIRb6zCgUr7K7z9+sKP7Nl56Zh7G0mG78
3YTuRolnXtlsJHk7UE2L4LPzh0VMSx8CvSVcHt2uan/wNVvMaSvOcWprEvUzYOKA
PiVLjhh6Z30XAxToQBN8RotSciM6fKS96Onys1Nx5EzCutq9d7fWuHUT/7rz0P2s
SqYwveUggnAjGtJUhTt0drIEuGThhT1xJ+BPrY0l2Zig/aHBdy/yRPY77aAU9Nl2
DaeoMGZpHeY11u0vCthK+LGm7L9NPJY1pYANn9RcHjFuVa7ets0wzSw5SLdin6Lb
zHArYw+sjNvF9i1kkQ1Ed8ziD46pVQ==
=yomP
-----END PGP SIGNATURE-----

--Sig_/Tizg3_K0VfuuX+xai=TK+ti--
