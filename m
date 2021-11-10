Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 488E244CB7D
	for <lists+linux-next@lfdr.de>; Wed, 10 Nov 2021 22:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233497AbhKJWAj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Nov 2021 17:00:39 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:56667 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233218AbhKJWAj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Nov 2021 17:00:39 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HqJcY3V0dz4xbw;
        Thu, 11 Nov 2021 08:57:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636581470;
        bh=LXaLTfNPSqg2YHBBxx7bwVvYha2FAuo39XdXtM+fUYo=;
        h=Date:From:To:Cc:Subject:From;
        b=M+Zm8IfTXJ1gonVsRzgYwys8g/fxWeGmBUUcKIzUeiEw1HhP6yMM5DPl4zEmQFEra
         HP5eBo6SbufNr3Nqd1QliRPhXwlObNMyrsT5GCQlD6wIs6Fp24upEpRVtude7qp+QH
         PSWHpSSMRd/VmAFsO8lgx1xNdEu2RVfZJhQfl8pDoP+VpuG0IHGjTrk+Zen15smm4T
         RcLkG4o8nQ5QM2gF44Zpup2Q9yi4P3e3p7DUoFwsUVn+0lRTZMq/VbZ/BWGfx/PWCO
         DMIk+1c2jwpNQCHXcDWtrB0s3U8BMG+fimSjkoKU9tBFWYyMRgvrt8S6NcUXr8k9y5
         Xl8xfajUctXlg==
Date:   Thu, 11 Nov 2021 08:57:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     "Paulo Alcantara (SUSE)" <pc@cjr.nz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the cifs tree
Message-ID: <20211111085746.46746d4f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MG692s2akANc1mz/MXD1yu.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MG692s2akANc1mz/MXD1yu.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cifs tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

<stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [-Wcp=
p]
fs/cifs/connect.c: In function 'clean_demultiplex_info':
fs/cifs/connect.c:841:2: error: stray '#' in program
  841 | +#ifdef CONFIG_CIFS_DFS_UPCALL
      |  ^
fs/cifs/connect.c:841:3: error: 'ifdef' undeclared (first use in this funct=
ion)
  841 | +#ifdef CONFIG_CIFS_DFS_UPCALL
      |   ^~~~~
fs/cifs/connect.c:841:3: note: each undeclared identifier is reported only =
once for each function it appears in
fs/cifs/connect.c:841:8: error: expected ';' before 'CONFIG_CIFS_DFS_UPCALL'
  841 | +#ifdef CONFIG_CIFS_DFS_UPCALL
      |        ^~~~~~~~~~~~~~~~~~~~~~~
      |        ;
fs/cifs/connect.c:843:15: error: 'struct TCP_Server_Info' has no member nam=
ed 'leaf_fullpath'
  843 | + kfree(server->leaf_fullpath);
      |               ^~
fs/cifs/connect.c:844:2: error: stray '#' in program
  844 | +#endif
      |  ^
fs/cifs/connect.c:844:3: error: 'endif' undeclared (first use in this funct=
ion); did you mean 'gendisk'?
  844 | +#endif
      |   ^~~~~
      |   gendisk
fs/cifs/connect.c:844:8: error: expected ';' before 'kfree'
  844 | +#endif
      |        ^
      |        ;
  845 |  kfree(server);
      |  ~~~~~ =20

Caused by commit

  58b90aa95977 ("cifs: support nested dfs links over reconnect")

I have used the cifs tree from next-20211110 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/MG692s2akANc1mz/MXD1yu.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGMQFoACgkQAVBC80lX
0GxcVgf/VqLLX6dRvrQSGIHQROWHyxWiosq8IrD1VNT4CxFwaSLYdzyCNCfLiAvS
GXnSEOwSc8ncJCs6I/qZ5ZOG8Sjop3l9gIPdGPlX02VcEVttt2j0Dp5Zagkkdbi5
tPVlnzl4qLXov1EZ+9SlF05BhMQZECuxP64egqHzCCnzTXO+C19qdJb52LauF+t4
mogShRKreQv6M9/hPljc5FhgyYCFQehzJrY9WfyN92wrBDPrcwDtwgwTZlj9Gdyy
WXQ31rb76Otif9WtdG05Dv0zRorUl1kzkIjm1HblBeid+J54CA1ZwHxgqoF++FLc
vbUqn0W6aHx7Ke/dr2Hi4CootV0xUg==
=HZ7Z
-----END PGP SIGNATURE-----

--Sig_/MG692s2akANc1mz/MXD1yu.--
