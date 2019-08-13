Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDB68AEF4
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 07:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbfHMFuw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 01:50:52 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45541 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725781AbfHMFuw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 01:50:52 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4671zF4SPvz9sNm;
        Tue, 13 Aug 2019 15:50:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565675449;
        bh=qpINZH0B5xzP9KIPSj0jK+2U327HYmYRiv+1TsnzLOo=;
        h=Date:From:To:Cc:Subject:From;
        b=rvs6l597rWxoZqj4RJ88SaWLsSlpe4QsSsqfSqYULmrNBErov6E31FX9TR0LiSSJr
         FMtgL9q3W5olVGtNGmpXhx9QbpLRax7Wy0ZkaDN2YQmiBjfWsesAZyyZaSmMLy0MZC
         Iyasb5tJNEKKMbZo4N4wD5k14qJ7k+/niXm/2nV+CTlf22FsMQah1dgDgebRlyi308
         IgoJpbtFnEsqbmTGdxiAPCeXVSgN3FBNNI3o4j+ZhKGErDALJhOGFqhaG43fuRJS8y
         FKI5VKXiOFU9gRhIZPrjfBGb+1ptT4yqxcLMdtHIRQpBh8t4apS59Gr4dc1hVovq2h
         ziaQMJSTgDHSg==
Date:   Tue, 13 Aug 2019 15:50:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: linux-next: manual merge of the driver-core tree with the rcu tree
Message-ID: <20190813155048.59dd9bdf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1nYefZ0.MqaB_IxjSpLFB_t";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1nYefZ0.MqaB_IxjSpLFB_t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  drivers/base/power/runtime.c

between commit:

  4a3a5474b4c1 ("driver/core: Convert to use built-in RCU list checking")

from the rcu tree and commit:

  515db266a9da ("driver core: Remove device link creation limitation")

from the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/base/power/runtime.c
index 50def99df970,45a8fbe6987a..000000000000
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@@ -1642,9 -1640,8 +1642,9 @@@ void pm_runtime_clean_up_links(struct d
 =20
  	idx =3D device_links_read_lock();
 =20
 -	list_for_each_entry_rcu(link, &dev->links.consumers, s_node) {
 +	list_for_each_entry_rcu(link, &dev->links.consumers, s_node,
 +				device_links_read_lock_held()) {
- 		if (link->flags & DL_FLAG_STATELESS)
+ 		if (!(link->flags & DL_FLAG_MANAGED))
  			continue;
 =20
  		while (refcount_dec_not_one(&link->rpm_active))

--Sig_/1nYefZ0.MqaB_IxjSpLFB_t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1ST7gACgkQAVBC80lX
0GxkIwf/RKcNapz1s0KgN07iFZEuqOaFI4Edk12vMUagFPyrP4YbML17hSCwKhRa
mvKlV1ZFa1M9X8JModU4ZKvmhKJv4FiRrvwglYwH/VbbNZ8Z+L2rb5Jxds+ias07
hh0EKuo4p9TlUiwtnhTqlKfMRqfVKrQqgIzRxt0wGj7B5i+Pvqh+KA0/fWN4xcyE
oEiSoh6cOcDSl1Ond6bFBPgR7wgmIE0ZCqvDXAoywhuJD5PoIpy/uEqghiBUMwJH
hxOE2Bf2A9n1M6w3+4hF0vjUTa8t+YDidCMAaYflcpLERg+2EKi74PDUNwFrNWV3
U7erm7E1y/P4bpS25iVoQyqL/fSYTQ==
=onNh
-----END PGP SIGNATURE-----

--Sig_/1nYefZ0.MqaB_IxjSpLFB_t--
