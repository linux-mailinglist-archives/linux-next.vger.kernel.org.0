Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D30B11F72B6
	for <lists+linux-next@lfdr.de>; Fri, 12 Jun 2020 06:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725858AbgFLEIH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Jun 2020 00:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgFLEIH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 Jun 2020 00:08:07 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3090C03E96F;
        Thu, 11 Jun 2020 21:08:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49jnJP1497z9sRK;
        Fri, 12 Jun 2020 14:08:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591934885;
        bh=btx2G+Wd/ZrtuUXpJLDzgTElT+df/iqxxP/g1ExxBhA=;
        h=Date:From:To:Cc:Subject:From;
        b=mprTY/fGHAv7dI1Etu8iZfg0lvCG8DPHiwPKE/Gc1+exB6BaKcmtIBN5O5Zu8/ZUi
         lZc8vMiBgH3/0HdO2P+S6cyDe3KfzxH2EqutIwVcubwqOXCQOm350S9VVtS/5f6xLO
         sDL612eypUXw3YH9uiPw074gVFK15zfdzGbqEsHCyHIZkjlsvotreLXwv8TSdzXGmC
         WyP459YeatFNg1QutWmc0MS4W++DzuXJNoelHJhsJ18A3JOhgD3i7wpX+ojauAUXRD
         rnEXNr7Ml4pFz944R6cIcmlgLO5lsYxoY2eJT3n+cmC9NqfqnQjkZiVFCX2R9wGEMf
         hCzFZR/D7jmOA==
Date:   Fri, 12 Jun 2020 14:08:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ritesh Harjani <riteshh@linux.ibm.com>
Subject: linux-next: Fixes tag needs some work in the ext4 tree
Message-ID: <20200612140804.71e6e326@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A/PeztafblhcY45c2E4FIRf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/A/PeztafblhcY45c2E4FIRf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  811985365378 ("ext4: mballoc: Use this_cpu_read instead of this_cpu_ptr")

Fixes tag

  Fixes: 42f56b7a4a7d ("ext4: mballoc: introduce pcpu seqcnt for freeing PA

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/A/PeztafblhcY45c2E4FIRf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7i/6QACgkQAVBC80lX
0Gzk7Qf9E4+vUHLZ2jFD1LTh6czj+ryrLbQyd9hDJ6hbpFoug5c2etxUFdZdbskt
rsDKWA6gtA8KrcDvZWM1ntSh7R668v/X8BXXTUNrJuWA8toeTDKPljSDXUfK6OEI
N14oJFbBgo7678UkjhqyuxP9SETDZEccHu8qLtNUpdAo3AKNWcODZVpL1WVdnrH9
h2YILmMRelGfl0n8kglXbKR/JUqtWUTGzZGSPhT8FR1Ey1nTFKNxed6dFvE38in7
Y96JbKiGOOVZenk+CRfYS94K7OnJx3O48oxix8QCZLcpEDc0WxjKYlBnKYCh6YyM
BNLKRM1wIbe6bLQ1shyEr2y3D2Fm+A==
=Ldts
-----END PGP SIGNATURE-----

--Sig_/A/PeztafblhcY45c2E4FIRf--
