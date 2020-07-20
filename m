Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE7C225749
	for <lists+linux-next@lfdr.de>; Mon, 20 Jul 2020 07:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbgGTF7W (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jul 2020 01:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgGTF7W (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Jul 2020 01:59:22 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA50EC0619D2;
        Sun, 19 Jul 2020 22:59:21 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B99zB1h5cz9sR4;
        Mon, 20 Jul 2020 15:59:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595224758;
        bh=ilwXSUuQzp9spzFiL/T+eRwhknMRDNwY+IVvHUMC+tA=;
        h=Date:From:To:Cc:Subject:From;
        b=qtz0OWT13eFaczr2i4vKiOxL8cqWTGT1M3SUk6TbOGRLOb8NtAtVoQNhWXJiso6m4
         WMSa96IvttAoDTs6PUlj1vMDnqla5Qbp4TP4FQ2+2/YTvluD58xn//YVp9/cGcXrBu
         Zk3elSi5pdvE8+0q4QJ1ioRm1ywvDuxRKmB6tun9tfv1kWFEk1+o7S8nn4u6UfKQXs
         ZoLheiazZzObICyZPFfY4DWj5S3DUJryiAFv9KskR1hhlsGYIQ0nuCYKWxmepDF64a
         ZDXCBn7AiK4N2nRL/y9ilQ99Az+EHNXQJN0TFRGDdF9U0aBhg4zQfCfVzPQjR+L9QO
         5g9v1KgjuyGQQ==
Date:   Mon, 20 Jul 2020 15:59:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the seccomp tree with the kselftest
 tree
Message-ID: <20200720155917.607fff9b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tRJ57A5kyRqYB0=24Jc24ko";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tRJ57A5kyRqYB0=24Jc24ko
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the seccomp tree got a conflict in:

  tools/testing/selftests/seccomp/seccomp_bpf.c

between commit:

  4c6614dc86ad ("selftests/seccomp: Check ENOSYS under tracing")

from the kselftest tree and commit:

  11eb004ef7ea ("selftests/seccomp: Check ENOSYS under tracing")

from the seccomp tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/tRJ57A5kyRqYB0=24Jc24ko
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8VMrUACgkQAVBC80lX
0Gx2cQf7BL2mF+iLBACtiGk3iGAMq/WCRSBzf0xBCTqm+e9/6HZekbkDIuuUy1Qw
+2IXfpn+8tgxtTMz0FpkKHU23JOLm9lpaFWMwKSmwNSHAXfVjkCybY+WKPNL6+zp
o9H9ofRohc/2PmM+uv61xWfd5TPAMv7b6CbxAl89wizKO/FX/TLDTZTdMOXxSi1B
wpKVE17TBkMIOmBGLpQikyHgtTSEtP5uqmq+PxAPa7Et9IR9PAbk8H4yttmytuLu
rlQ9A2QUBTRMWPwa11u/AZDSH7VWcppLPLb4BmPq/nwCRfCqC2vZodkciHni2dzX
vjzwJEtyqtdpii0mvxVUwR4/A4DuZQ==
=aCl4
-----END PGP SIGNATURE-----

--Sig_/tRJ57A5kyRqYB0=24Jc24ko--
