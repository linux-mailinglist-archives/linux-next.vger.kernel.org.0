Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3A7C117BCC
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2019 00:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbfLIXum (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Dec 2019 18:50:42 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43457 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726592AbfLIXum (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Dec 2019 18:50:42 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47X0Lk37jXz9sP3;
        Tue, 10 Dec 2019 10:50:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575935440;
        bh=tB1tEE9yZsNC/cIieXkeqYkTAoKYSZQuXenCeTy4aEM=;
        h=Date:From:To:Cc:Subject:From;
        b=DVG3I5AZtu7fc8hfNiPqoS1ZDntDLcPlb1hE+k1IjznrIK8jZy/y7wgsGhdZeduXO
         l/d+1T+t5XINVdIWwevj13MR1vlRBnfBNerqcYj7KOzDYs2nD0GcD11vIhzAv0rV9M
         OO3eWj6rFweX3GmxqhOEeetkVNdOOgCz8EZhtimJzZg8Ef4CHAa2M8r08nsg0TyXGd
         A2ObZpgHiPQepNs3PQWj4GR1940CP1tdYAAp2NSbhb28Y80HVoERI5rWQa0HSZGR7F
         cKXMqY19M44nBzLr0zS4/vLui/tLHBAg8uwpPffMhs6D8ahCO5loftcDXQLirvV5xY
         KGTzG7ccnOqYQ==
Date:   Tue, 10 Dec 2019 10:50:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Moore <paul@paul-moore.com>,
        David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        James Morris <jamorris@linux.microsoft.com>,
        Casey Schaufler <casey@schaufler-ca.com>
Subject: linux-next: manual merge of the selinux tree with the keys tree
Message-ID: <20191210105037.085b3418@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LZvt=Xvn9U/a5nMBHM1SIvx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LZvt=Xvn9U/a5nMBHM1SIvx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the selinux tree got a conflict in:

  include/linux/lsm_audit.h

between commit:

  59336b0f8000 ("smack: Implement the watch_key and post_notification hooks=
")

from the keys tree and commit:

  59438b46471a ("security,lockdown,selinux: implement SELinux lockdown")

from the selinux tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/lsm_audit.h
index 734d67889826,99d629fd9944..000000000000
--- a/include/linux/lsm_audit.h
+++ b/include/linux/lsm_audit.h
@@@ -74,7 -74,7 +74,8 @@@ struct common_audit_data=20
  #define LSM_AUDIT_DATA_FILE	12
  #define LSM_AUDIT_DATA_IBPKEY	13
  #define LSM_AUDIT_DATA_IBENDPORT 14
 -#define LSM_AUDIT_DATA_LOCKDOWN 15
 +#define LSM_AUDIT_DATA_NOTIFICATION 15
++#define LSM_AUDIT_DATA_LOCKDOWN 16
  	union 	{
  		struct path path;
  		struct dentry *dentry;

--Sig_/LZvt=Xvn9U/a5nMBHM1SIvx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3u3c0ACgkQAVBC80lX
0GwzYQf/bWcyUWEOX5e1WKK6yzk6As0CLMr5tBEe/Dy0ckM2VgdzQNWYWVXnpgqf
uwr5VE///GYRdXpsJysES6yppb5ShKnIl0ZE5eU4NrLNYIY9CkCsgoQqMGMgevkM
YaZ0c22Af73cSlV6MTHmdtSJOarYJgqApQsnsS1WvH06d7OBBTZkzYKBpIEozDcu
YaE8PyQ70Y0NE+kBWmVzGYMb0YczVPMLrj5iKFCvOlSRjQT182BxN64HFSfc6xEP
vUDrzJSGjlgKnj8Sj8u1itXfAYn93nGLlt6MjjHRR5mBTFb5Hd2n1vmWVLa/txQw
UkcxXsUO4nAAiNVaX+ns3im30BRFaA==
=1cdt
-----END PGP SIGNATURE-----

--Sig_/LZvt=Xvn9U/a5nMBHM1SIvx--
