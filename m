Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC6D159D3D
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2020 00:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbgBKXfw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 Feb 2020 18:35:52 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:52385 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727847AbgBKXfv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 11 Feb 2020 18:35:51 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48HK051YT5z9sP7;
        Wed, 12 Feb 2020 10:35:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581464150;
        bh=GTDMm9bixoxs59OHRLXKRc/qcP05G8swpy0USVnSet4=;
        h=Date:From:To:Cc:Subject:From;
        b=Qfd9EVgziSd6IdlBceteCAPgeKGv0rMgNi/UOBFQYJ7h5dGR4C/H9Nos7Ow94JlQz
         yM7nFqLs+HFSYoux5acLUnWmNUxYJb3X6pbrHpj3zRM3kzksKAk2LiCfNlEqZzDC+5
         OmGFCXo2wsAoVOvv3bzH1xX1HazOKDEujDuPcJdsSSd4H2PfNQqKS77EZO1gTlch3d
         +657VXXE7sC7TgdMwWAxwG+73AeDeHmvh1b4gR4f1SNVZBsZM8yJvqAKYQL/zVygJy
         q4LwoUcC/bosQuX2a1OAqv+tfghgIEQWn1dV+EdLSq3AIG3Arf14e2OYc+o6WThrA4
         uNcL+6VIoI5vw==
Date:   Wed, 12 Feb 2020 10:35:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Moore <paul@paul-moore.com>,
        David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Richard Haines <richard_c_haines@btinternet.com>,
        Christian =?UTF-8?B?R8O2dHRzY2hl?= <cgzones@googlemail.com>,
        Stephen Smalley <sds@tycho.nsa.gov>
Subject: linux-next: manual merge of the selinux tree with the keys tree
Message-ID: <20200212103548.266f81fd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8D7pIb0mymG=p1q9YegKMMJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8D7pIb0mymG=p1q9YegKMMJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the selinux tree got conflicts in:

  security/selinux/include/security.h
  security/selinux/ss/services.c

between commit:

  87b14da5b76a ("security/selinux: Add support for new key permissions")

from the keys tree and commit:

  7470d0d13fb6 ("selinux: allow kernfs symlinks to inherit parent directory=
 context")

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

diff --cc security/selinux/include/security.h
index 5353cd346433,d6036c018cf2..000000000000
--- a/security/selinux/include/security.h
+++ b/security/selinux/include/security.h
@@@ -79,7 -79,7 +79,8 @@@ enum=20
  	POLICYDB_CAPABILITY_ALWAYSNETWORK,
  	POLICYDB_CAPABILITY_CGROUPSECLABEL,
  	POLICYDB_CAPABILITY_NNP_NOSUID_TRANSITION,
 +	POLICYDB_CAPABILITY_KEYPERMS,
+ 	POLICYDB_CAPABILITY_GENFS_SECLABEL_SYMLINKS,
  	__POLICYDB_CAPABILITY_MAX
  };
  #define POLICYDB_CAPABILITY_MAX (__POLICYDB_CAPABILITY_MAX - 1)
@@@ -210,13 -214,13 +215,20 @@@ static inline bool selinux_policycap_nn
  	return state->policycap[POLICYDB_CAPABILITY_NNP_NOSUID_TRANSITION];
  }
 =20
 +static inline bool selinux_policycap_key_perms(void)
 +{
 +	struct selinux_state *state =3D &selinux_state;
 +
 +	return state->policycap[POLICYDB_CAPABILITY_KEYPERMS];
 +}
 +
+ static inline bool selinux_policycap_genfs_seclabel_symlinks(void)
+ {
+ 	struct selinux_state *state =3D &selinux_state;
+=20
+ 	return state->policycap[POLICYDB_CAPABILITY_GENFS_SECLABEL_SYMLINKS];
+ }
+=20
  int security_mls_enabled(struct selinux_state *state);
  int security_load_policy(struct selinux_state *state,
  			 void *data, size_t len);
diff --cc security/selinux/ss/services.c
index 7527292fb31a,e310f8ee21a1..000000000000
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@@ -74,7 -73,7 +73,8 @@@ const char *selinux_policycap_names[__P
  	"always_check_network",
  	"cgroup_seclabel",
  	"nnp_nosuid_transition",
- 	"key_perms"
++	"key_perms",
+ 	"genfs_seclabel_symlinks"
  };
 =20
  static struct selinux_ss selinux_ss;

--Sig_/8D7pIb0mymG=p1q9YegKMMJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5DOlQACgkQAVBC80lX
0GwiPgf/auW4k7yw0S0+MDcf//CKf28gGDvPV+KWb7gZ47yymYPmIaufYWwSxr+v
bi3YogTZxrO3sdL7dlb/6mwAhRL9sX62FtN3YJq8XYbzDpzJqEtd0DHPDeXjQ5wH
VAv5UHLZ8S0ekbToCeGoCb8PYylzKz9dab8LMmd91jrb2XNSPMiUis8w8CVGANvf
Q1lEJNhKTfYx8UrPf6FXBH3ks9CWHKDqp+GTPHwgA23plG+G3+HMid9zoVTHxSt+
RuOGGFLYl78UK/MhQkL0USAtrqF4UTYDNa+NpLCtocv478WZ2J/uMXxGpfeFuKHC
H4IJVHpY7q3buuZwL8NK9XBOAXa5bw==
=wdAn
-----END PGP SIGNATURE-----

--Sig_/8D7pIb0mymG=p1q9YegKMMJ--
