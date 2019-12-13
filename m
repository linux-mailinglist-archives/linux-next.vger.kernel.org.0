Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE14011DB87
	for <lists+linux-next@lfdr.de>; Fri, 13 Dec 2019 02:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbfLMBKt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Dec 2019 20:10:49 -0500
Received: from ozlabs.org ([203.11.71.1]:42473 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727491AbfLMBKs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Dec 2019 20:10:48 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Yszm6CZTz9s4Y;
        Fri, 13 Dec 2019 12:10:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576199446;
        bh=QaQNCPjrhm4iMDfSZPWX0GVHyRbJ9uIWiiCeWiBA1mo=;
        h=Date:From:To:Cc:Subject:From;
        b=WPxA3E3sntB2OWtFdu0BWRcKvJo3aJOYrP+PK4tZEjSwzTn4UyFbl22WSLZovbhT7
         LqQabh6bVW48H3aunVBgdQtGFCNvghTFucYwHSlUUWBhyvkO1EtB0yfYCJV1b+3Xvg
         ovBuWQTwqPX+bhQ+sjMx1KnvolvkrIVbWqFQLf7D0BHJdVA/C2V0T/6uQvDReDcyN4
         v6/XKBrGddmyFi6RF9eTnMrn/1GED5jUBq9eHohV32WvYeOP7o8cPZ63bqpJcEqByJ
         MxirpSs93NQKlKE6Jvb4n4HkjIEs6dy33+yxAHLegEEPH9dDBUf0xLMbVRSTPPRgC8
         OdK0N91vf6ZAA==
Date:   Fri, 13 Dec 2019 12:10:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: linux-next: build warning after merge of the staging tree
Message-ID: <20191213121042.79ff3f0f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QvuKIug2jb1tP3PsOxKhUPg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QvuKIug2jb1tP3PsOxKhUPg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: drivers/isdn/capi/kernelcapi.o(.text+0x204b): Section mismatch in =
reference from the function kcapi_exit() to the function .exit.text:kcapi_p=
roc_exit()
The function kcapi_exit() references a function in an exit section.
Often the function kcapi_proc_exit() has valid usage outside the exit secti=
on
and the fix is to remove the __exit annotation of kcapi_proc_exit.

Introduced by commit

  f59aba2f7579 ("isdn: capi: dead code removal")

--=20
Cheers,
Stephen Rothwell

--Sig_/QvuKIug2jb1tP3PsOxKhUPg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3y5RIACgkQAVBC80lX
0GzAgAf9FEfA+dO9fcTwRr16GB6V4T/TZikmt0vKPkjQpRVKznns3nuIgkENzbOp
YpS1X+/CpXLJA0ylYsXo50SdcRNCwgO4S5Xb+Tl3k7T7YxL7raRRD9rqlrCyUNhn
SfFDElW+31wFeqt1EOpBp/qO0tQFwBXTOYwu4oYuyG8maVPdn7SzPYBCtkGOq54m
elsbwSt+8WWOvvbnmPocANan/AJaEnNVtsReLshWeG3eVskLQlbRMMDl07c8N2+2
fKPphLgezPMQ5MJL1ue6ukmisJg9RKnXvQsk0s8d4r97ugsI/wVZzHb9hELWPcgA
iND88LkoanBehoL1Mo4NeBdaiV7PlA==
=5SVE
-----END PGP SIGNATURE-----

--Sig_/QvuKIug2jb1tP3PsOxKhUPg--
