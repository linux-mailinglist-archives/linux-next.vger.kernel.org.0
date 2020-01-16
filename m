Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9310F13FBF1
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 23:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388007AbgAPWCx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jan 2020 17:02:53 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:44979 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387539AbgAPWCx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Jan 2020 17:02:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47zJ8q4lk1z9sSn;
        Fri, 17 Jan 2020 09:02:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579212171;
        bh=pv8Q3HOS38HCAHqBfnCQ+EVnANNpsImx4iZ8jwZYnXg=;
        h=Date:From:To:Cc:Subject:From;
        b=cWuckLUjN8I4uSwaAr0c3c74m+C6/n1WaOYmH/Xm4fc3xGz9sfh8RLtE6UWtPq0J6
         6Q9DkQfCsh52jokK6pqzPsD+WFIOCDdT7GxtpdFfNvh6XdKZoKDNEMxZsN988TKLo6
         RszM57KT7ZGOVdiyXnNECc7KC39yPpMUMXhTrHL50ACacGRwUiFQQhJi8ly5VuOyBv
         lUP1c89HiI46bPyz8QwUAh+H4i0WWQcvWFbOmE/T5D5X8HA6mCfpFFOQjSZeroNUtf
         eKzN4iMD+e9+rj8HYnA+zG2cDciNtQ05728gTTMguJnavHMQpc+druZv+CBPpP6uVn
         2ouWRYKh1kdBA==
Date:   Fri, 17 Jan 2020 09:02:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Moore <paul@paul-moore.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the selinux tree
Message-ID: <20200117090248.392f40cb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aoVM0yRI4n8jIqPaFIoDWjX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/aoVM0yRI4n8jIqPaFIoDWjX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  6bae00459f0c ("selinux: do not allocate ancillary buffer on first load")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/aoVM0yRI4n8jIqPaFIoDWjX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4g3YgACgkQAVBC80lX
0GzYrAf/XbUUZrpbMXNJH0bUpse3RM/zNAdAYlY4/KSp2a3NEwtJyOSNAt8DcLXN
8y8WLyWIxlhS4UT/9LSnBix7NpsZM+Iesy01qEbAMoeQ1Y7/sMeD6Dyu2Uu33kSb
AtXVTeqOMs6go9rgA6SAFsnXvLYHc08cJl07HfdGqLzY4A6Em1Aj/Gce2PucnPLH
hsZ/2w6hINnuf0FhOSvy4X/nm24WHZO435ZTD4o1YSYi2kNr5ieHqrkd6E4quYKa
mGw5cFlwX+j5S+gWUUrSndap5tmrSFNFsk0tjFabPWLJImkGW3OFgdOos9tI3qGj
/rkqMC7ajtEW8RWrLzZtFviqV7AkYA==
=GTbr
-----END PGP SIGNATURE-----

--Sig_/aoVM0yRI4n8jIqPaFIoDWjX--
