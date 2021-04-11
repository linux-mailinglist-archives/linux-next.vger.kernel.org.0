Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403AE35B74A
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 00:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235839AbhDKWqh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Apr 2021 18:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235638AbhDKWqh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 11 Apr 2021 18:46:37 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 111CEC061574;
        Sun, 11 Apr 2021 15:46:20 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FJRmn5SyLz9sVt;
        Mon, 12 Apr 2021 08:46:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618181178;
        bh=Oq0oK8FN9BKCYEtk1yIAwwIQKR7keb/Qfi16ynD1cDc=;
        h=Date:From:To:Cc:Subject:From;
        b=uyUR6ZV6XubzoeEIP8qtNxQ+eHCC6rzHZcoMhhWj4xnC584ijGdsi+ynaYyK0OMUu
         BGUbpGx5+dPgI3SMOgWQVWfeq6S+OH1xe/SRmdSrtwMjRb7mjGTN3Qsbb20E3cm+NP
         zl3LWDSRpcUl3AnH/Fmfnjg+dtwMRnbHoZVTFR5FnxrCQFU+T6z2IW/IPE0sGtTwc9
         kePdDjPGYH3wDCt93OUeB20xzogDM4QsPVr/SbZOQAncdKKkBX6OchS3PhG00qZYk6
         H31auWeGf4zd4NorFxikfA5pwA1H5ienU4gECjeCSd3YnaOmHJP2zTx4fiOrVB52lq
         BA5OtlnO6crRw==
Date:   Mon, 12 Apr 2021 08:46:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoffer Dall <cdall@cs.columbia.edu>,
        Marc Zyngier <maz@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the kvm-arm tree
Message-ID: <20210412084616.6046d943@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sRkWpSA3fLUxQJq6vSwASsW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sRkWpSA3fLUxQJq6vSwASsW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  a20c5c4f18ae ("Revert "KVM: arm64: Fully zero the vcpu state on reset"")

is missing a Signed-off-by from its author and committer.

Reverts are commits, too.

--=20
Cheers,
Stephen Rothwell

--Sig_/sRkWpSA3fLUxQJq6vSwASsW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBzfDgACgkQAVBC80lX
0GxEiwf/SLrFW8d8t5tUjpwHgSHh68Agyi+RtjgQ6EdqbeDxNyji1s71NtzrDqtF
VBHRetFkWzdudwnQWuhyK28kjrvmL5xqMsAsvkPU4izSfZ6sKpibcws8/FGB39Et
pceU4QBZPYGeEvfvN/Z2AqgkftXz4IrpmOpt00e2KBWL3Ds/IfpLGVYL+QfZTeUo
zCaar1sAcqQLYxfe9R+LX/Yr2Dt3MFlXrGlsfq6soZ1qzBCnPm88MT255psE5197
ojPPAr8GzQIU6c0eTARzu7Vp7Vc6VtrO6+Nn+61YVW0Rcq/I0HJdTlqwKQaXbAmz
EW50susXnMUZ/URLYmBGhhPnkBdNXg==
=MOGZ
-----END PGP SIGNATURE-----

--Sig_/sRkWpSA3fLUxQJq6vSwASsW--
