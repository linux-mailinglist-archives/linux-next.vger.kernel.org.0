Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1621B43288D
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 22:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbhJRUnf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 16:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbhJRUnc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Oct 2021 16:43:32 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42580C06161C;
        Mon, 18 Oct 2021 13:41:21 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HY80v5v87z4xbP;
        Tue, 19 Oct 2021 07:41:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634589680;
        bh=h5mqZCkGGQIMnUa8fz7ccWbQq7gWUaHg7i5STy2aJIs=;
        h=Date:From:To:Cc:Subject:From;
        b=t2KNzf9r/5KcDCAZAkQWTrfGjIkASw6wId1v+NshgRGBjST2cnBw0a/LL/gXv/WJK
         N7knBvogqiZHQLh2+DENCG2J+9dkup4i0kDDX5RwasmNdUPNEHbG/0MuifQ7dN7wf9
         TWLplDhfs6hQDSYfTF5slXv4ZjlGSwzg670Et8ZE0iln0m9G7jfWSkMgdkfoeWvn8A
         kUTUzmCk3aCZTsvq1QA1CjhY4/RzLeU4bM5GsaZE2w75KI77SubmMx67/M7U/3tCSk
         J+h2HtooLTSIkjnDpYrraGR7Q9/do48OaNA5XZudpEEln3pdaeda2nDY9BP3Dc/Nhz
         iCFBYNIHtki4g==
Date:   Tue, 19 Oct 2021 07:41:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Bart Van Assche <bvanassche@acm.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the scsi-mkp tree
Message-ID: <20211019074119.6e180896@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fuIV8MTANc.=PpBsb.hLN53";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fuIV8MTANc.=PpBsb.hLN53
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi-mkp tree, today's linux-next build (htmldocs)
produced this warning:

drivers/scsi/scsi_scan.c:129: warning: Function parameter or member 'dev' n=
ot described in 'scsi_enable_async_suspend'

Introduced by commit

  a19a93e4c6a9 ("scsi: core: pm: Rely on the device driver core for async p=
ower management")

--=20
Cheers,
Stephen Rothwell

--Sig_/fuIV8MTANc.=PpBsb.hLN53
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFt2+8ACgkQAVBC80lX
0GxxmQf/SR8ah6PsNLSd09STuDR06IgyWf7Wcv6+sKu2PhjqLT3gR2k496rq/ai/
2qb7KLuKlOY8aly9F0P5cYjyzBC88thaKqjMo/1XLYnJ+coTUasafk9UHcw1VGYJ
/UeWFyWOChhxMsLIV7AvSwtBoxUOY964nhMNOQlS5MCs1po0yd3Dq+Ugn2jWztzx
i0vSLSf2A82Go0Z0m/HgSoY6vnrz/ciCwVteYPAgC5xYF8zkUuL2Ui2rroq0RawT
gRhs6Bz7TW398VoI6ycM55wPvcG8UvlRcht9fYGK/UQBd6SFoCJ451LBYcuu5Z+8
qeDrdyJGpbCNU/3z0qDHZvBPKEWKSA==
=ah0y
-----END PGP SIGNATURE-----

--Sig_/fuIV8MTANc.=PpBsb.hLN53--
