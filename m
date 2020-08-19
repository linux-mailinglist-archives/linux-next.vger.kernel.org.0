Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0973249D8B
	for <lists+linux-next@lfdr.de>; Wed, 19 Aug 2020 14:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgHSMLp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Aug 2020 08:11:45 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:52528 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbgHSMLo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Aug 2020 08:11:44 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07JCBbtc046009;
        Wed, 19 Aug 2020 07:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597839097;
        bh=WENuWVjreuPojhknJDBWdvVPzOHMl+zGZW+9BB/UQNQ=;
        h=Date:From:To:CC:Subject;
        b=zAaWzjV6Eno9w36nIwhpM+6bUXJ4f1b9xWuQj9vmsM++hFS/s2M4OWb2l6Bv/8FIu
         JLvCiMYhhesijdAgLMChbW1qxZoSQCGJ9vhqDlSf2/5bXZ8lViNQRsWk3k3zu5CYBn
         XWkp+udr3FnQ2wUDej1CaF5TyS5RBwEKZhkz9Nug=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07JCBbkU017801
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 19 Aug 2020 07:11:37 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 19
 Aug 2020 07:11:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 19 Aug 2020 07:11:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07JCBbVs054343;
        Wed, 19 Aug 2020 07:11:37 -0500
Date:   Wed, 19 Aug 2020 07:11:37 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Tero Kristo <t-kristo@ti.com>, <linux-next@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Request: Add Transition TI Tree to linux-next
Message-ID: <20200819121137.4v3rfabbrleohoc7@akan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eg7o3wfpx4pavrzm"
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--eg7o3wfpx4pavrzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

Could you add my ti-k3-next branch to linux-next? You can find it
here:

git://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux.git#ti-k3-next

NOTE: This tree will eventually supersede Tero's tree[1] which is
currently in linux-next.

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

[1] {old tree} git://git.kernel.org/pub/scm/linux/kernel/git/kristo/linux.g=
it#ti-k3-next

--eg7o3wfpx4pavrzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAl89FtwACgkQ3bWEnRc2
JJ2VphAAjPrMj57f0Gzv7fcO7l0KxXKKJBrSI+4EKOb3XA+iA452lUoLMcHhkQ+n
gBXBr9YYRuffJYLRdBTaikETU/m1R7ozf+tAL5I8+hU0rY4wF4sXV0+DFRVfEKTK
0kSJp117bYfNKNdkY6tRsqUpzq6Trl1ioscyXf0lgCi9zd8aqwefAafWRGdxkShS
LvfowqcfgpUcj30Kf81DZu6F3GVatC74ElAEe8FdGqALqvnYMFPTg7ORD13YAFGZ
aCppgbs/dPGlcd4x+I0yf5xGD5EX94EvlxvhDO5oYkHEmRIS50qM6JPyf+4w4vPo
PLDaUtAxeRoaxV97rzImqWXtQ67U/96GX+HfVLjNCyh7KnQMvCMG7S6WsiGTYlE5
Go9JaSXfSR50w7sgBKg7Kszl8RRCI9W5mLDD/LCBXxW5ZRZMnzMY1TtZYAg4rRrN
CiL6UnKbE0YMm3VSEWQ5do5y7RlcWCiaSBb4KJM5ji1Ei27Arbxk4kgx8z1RZdWH
aQyDt50J7csI6K15kwVnTD1j9w8gBDvQJw5lf6UjY61Cq0jE23hMtXO+sZ91inIB
n45zCe3IGt2VL1axna5kPmx4GmFV0zIlVw5nVIfecwfI0wI2U3OVXJ36M2QEqYSl
/oYTCPbIU/wWd4ypc3PuGux/CzIwi17hWA6NtW6nAJqSAbLUi+w=
=V8aw
-----END PGP SIGNATURE-----

--eg7o3wfpx4pavrzm--
