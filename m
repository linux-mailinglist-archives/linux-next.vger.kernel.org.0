Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 772D81BCF78
	for <lists+linux-next@lfdr.de>; Wed, 29 Apr 2020 00:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgD1WJR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 18:09:17 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43817 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726272AbgD1WJR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 18:09:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49BbQf3cd9z9sRY;
        Wed, 29 Apr 2020 08:09:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588111755;
        bh=TViBikPorOaB5TqqtiAjuNVCMV59yaYrMGN1aLmguKA=;
        h=Date:From:To:Cc:Subject:From;
        b=JT5Jd0qbw+fhNJ/j2gknOeWxYBVasxKL6OpY+3P6SaPAyOmZBtkjvh8yjgPiE4+dZ
         EAMAliZE7yCr33FjBmxZJnT8TjyaF6jd7mNSEXvEy8+tWcmeGC2s64FwzzUpS5/l4W
         VRSVlzjngPagvKJSZiJXf/qpY6nuKMNsPvIqILQtWKVYCSVRm11fFQatZGhBzvMt50
         3WelOBzVW+RM3axmjrVfjFFrth3esLcQO97A9MCTXH7b6DFJcRCJugKgEHCIw++r76
         MlJGD788JC3SnlU8K8DNib/HJyhCfmukidH3lcSzeMxt6MKanPpseHj8JBvbz0eEXM
         P6xmtCCsOvw1A==
Date:   Wed, 29 Apr 2020 08:09:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Amit K Bag <amit.k.bag@intel.com>,
        "Tumkur Narayan, Chethan" <chethan.tumkur.narayan@intel.com>,
        "Hegde, Raghuram" <raghuram.hegde@intel.com>
Subject: linux-next: Signed-off-by missing for commit in the bluetooth tree
Message-ID: <20200429080913.7d9239f4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+0ZH1C3_Cvy06NlFZEqLh7z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+0ZH1C3_Cvy06NlFZEqLh7z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  bf1f79470a62 ("Bluetooth: btusb: Add support for Intel Bluetooth Device T=
yphoon Peak (8087:0032)")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/+0ZH1C3_Cvy06NlFZEqLh7z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6oqYkACgkQAVBC80lX
0GxnXgf8CDdKAMZMqk6c18Yy8RtuFFW1mOxfLm2PttVc92+ypOijdYGRlh/0LzU9
Uji6/9TS4Hd2QVZvQdmjXB/5xNYuF/ioupoWSbD04dCOB9khW92CM0nbWDRHU7VV
6tqgdm0GBzs5ZJFYvus3cJp4M+TeyA5SzDww2ucmg4yNiphrYQXHATtEdUrm/lK8
nY5+mEf1LpMSiQuda1G3nWN2tAMAqjb8tLFYQAHdYg9Sg2XZugpO2fKmUlUADbc8
KXHbJDmV+CYMoR3PXEoQZGjtafB7iUBZFTRJkidf6T3JTgmjX/po4EEcIdqdYM4s
vPzmVgPWDB0kJjua/H6EZEsuVHs//Q==
=Qi8l
-----END PGP SIGNATURE-----

--Sig_/+0ZH1C3_Cvy06NlFZEqLh7z--
