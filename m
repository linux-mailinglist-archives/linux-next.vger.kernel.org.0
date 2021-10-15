Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D58D642E736
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 05:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233868AbhJODbc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Oct 2021 23:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233865AbhJODbb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Oct 2021 23:31:31 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA517C061570;
        Thu, 14 Oct 2021 20:29:16 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HVsFN3llHz4xbG;
        Fri, 15 Oct 2021 14:29:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634268555;
        bh=ijeEztnemmifUPa/zn4Fpl8tfExKGh4N3DEZiLWjcD4=;
        h=Date:From:To:Cc:Subject:From;
        b=KqDju7o3OjX7g9tu34elJAdt+HNHm6efFfotBPeVqQAIWcLCaUMIfg7Dc/7amzFoZ
         6OZ7Iyldr+JxaW7p15wgjWNn9mzuwZhMezEIe+JqqHTds2PuE84mPpRuUM2GJgHToE
         +sEpM/8PZhirPE/kH4GOSK4Ioy+tyZXdJPwx0BkkdwHoQyGyNqAD4Lw9Tay7SYRNPJ
         HcRT3uXwiYa7P/3VgsnZ3KMqfWqYAGCDkRCb/U+eO8fZoMgVxXTrLoH+VHRwGmmj6b
         drSO0FB9C9XPcA6msCrIEz+eLTrtx/79GSrx0bDE4tdaemp23RWkImSw9jhZne8rLh
         1To0OuExjK2AQ==
Date:   Fri, 15 Oct 2021 14:29:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Moore <paul@paul-moore.com>,
        Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael =?UTF-8?B?V2Vpw58=?= <michael.weiss@aisec.fraunhofer.de>
Subject: linux-next: manual merge of the selinux tree with the device-mapper
 tree
Message-ID: <20211015142910.0f78c326@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MdivLPCUJl6zV_BkBSOsqXD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MdivLPCUJl6zV_BkBSOsqXD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the selinux tree got a conflict in:

  include/uapi/linux/audit.h

between commit:

  c1d7fa96e74b ("dm: introduce audit event module for device mapper")

from the device-mapper tree and commit:

  5bd2182d58e9 ("audit,io_uring,io-wq: add some basic audit support to io_u=
ring")

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

diff --cc include/uapi/linux/audit.h
index 6650ab6def2a,ecf1edd2affa..000000000000
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@@ -118,8 -118,7 +118,9 @@@
  #define AUDIT_TIME_ADJNTPVAL	1333	/* NTP value adjustment */
  #define AUDIT_BPF		1334	/* BPF subsystem */
  #define AUDIT_EVENT_LISTENER	1335	/* Task joined multicast read socket */
 -#define AUDIT_URINGOP		1336	/* io_uring operation */
 +#define AUDIT_DM_CTRL		1336	/* Device Mapper target control */
 +#define AUDIT_DM_EVENT		1337	/* Device Mapper events */
++#define AUDIT_URINGOP		1338	/* io_uring operation */
 =20
  #define AUDIT_AVC		1400	/* SE Linux avc denial or grant */
  #define AUDIT_SELINUX_ERR	1401	/* Internal SE Linux Errors */

--Sig_/MdivLPCUJl6zV_BkBSOsqXD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFo9YYACgkQAVBC80lX
0GwbDgf/SmU119soESbHZepHF5fqqeVEtr5d20hlOSIXOKd4cQWUiizRe3TEAete
AWkqZqiZYdEMfS/mtjxJ5laZUVUdoPsmbEyKK3hE6UIuP/K1Kf3fcImyyQQXmVgW
Ks2OUhgejyZJ9AhPVqZouFUpU5w/iLz8+JZq7uP2BOJb/zEWPhpJnihExTXGLkOs
mBnJO8imnk7YfHplb8LFeIBkDv4cmEG/qxYAxpCjfiG/Qax1K0FodsfR9WZQY8lg
5k4TjCEiTneHgDKJGO2M6DJHvrS4A6uBP8EzJR1BRCCjrjx/zq8xeQtru5laEQSp
WHZRIzsvqOrLScUipA89U4wOyMF6UQ==
=mZvz
-----END PGP SIGNATURE-----

--Sig_/MdivLPCUJl6zV_BkBSOsqXD--
