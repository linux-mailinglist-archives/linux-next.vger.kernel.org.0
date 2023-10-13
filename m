Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3FF7C7AEC
	for <lists+linux-next@lfdr.de>; Fri, 13 Oct 2023 02:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344275AbjJMAkR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Oct 2023 20:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344236AbjJMAkO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Oct 2023 20:40:14 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC45F0;
        Thu, 12 Oct 2023 17:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1697157609;
        bh=c2E+wnfnch/++qUviGW3zzgvLwSXb8hc9dpb9K7clp0=;
        h=Date:From:To:Cc:Subject:From;
        b=DZ64D4cscn2vHDqa9l/5lrr+vKLyqJyAsnUAhL8D+HUA/cRGKcBvHaw+Bjsh8/gWj
         hbjm3+OZJAm6e3973XQVetu63KkGni3N03B/YEDe0ZImYEh5Wrp1tJB87PjkNmSZIB
         PE+bB0CZKJlO4HS06amE+fuTDYDYjy4Igx643PpJLr7N5c+EWWvF4XUqRByUhqGWVj
         Ml/9EXIqdqb1TdPVFcelnUCovyvxO3mUBVBws6sNe7ClcLgHnfDx1DO8nKE9afMjSh
         l5ToV+NmkoIavqFK9SkphM+krNUzmaXaNJDKRpSb8oCFcPqFP/Hq1KWpvaUlV0F2cr
         pPQy2sQGO3n7A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4S672K2kVmz4xRj;
        Fri, 13 Oct 2023 11:40:09 +1100 (AEDT)
Date:   Fri, 13 Oct 2023 11:40:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>
Cc:     bpf <bpf@vger.kernel.org>, Networking <netdev@vger.kernel.org>,
        Daan De Meyer <daan.j.demeyer@gmail.com>,
        Martin KaFai Lau <martin.lau@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the bpf-next tree
Message-ID: <20231013114007.2fb09691@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tGIXcxAJ+AiVabT4enlFNiZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tGIXcxAJ+AiVabT4enlFNiZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bpf-next tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

net/ipv4/af_inet.c: In function 'inet_getname':
net/ipv4/af_inet.c:791:13: warning: unused variable 'sin_addr_len' [-Wunuse=
d-variable]
  791 |         int sin_addr_len =3D sizeof(*sin);
      |             ^~~~~~~~~~~~

Introduced by commit

  fefba7d1ae19 ("bpf: Propagate modified uaddrlen from cgroup sockaddr prog=
rams")

--=20
Cheers,
Stephen Rothwell

--Sig_/tGIXcxAJ+AiVabT4enlFNiZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmUokecACgkQAVBC80lX
0GwKhgf/XFfs9GUzfa7Pb4oBCNclaiez5cSRE2iD2Uh26Usn7aWXCvEWfxXUBZBQ
n1nLa+xnZpvgKlbDC78bR5yg6cI/eTtR/vrLedVB6eGB/h+8t4292qck4VVlYdTp
A0G8oT94FAFZC7HfAtSIAE3vFj/BSZ8IMhK8FP/Wx4rvyBEG7ybNG39YpSXlq5Sa
Jx0dXJ6icujnNpfmOA4z5IPZhcTVfRdu0VvwJsh8y/zWe44yd1kVH6upqDxm5rSa
Pb3f9R23IAnQYIAwI2zQSlc1XMJPXyOl8OW30+F8y+R4MnusrRXf4VrcIF1fjjgt
WEONH7Iv5XeML/XDSAzh1EN7D4BcPw==
=IKz/
-----END PGP SIGNATURE-----

--Sig_/tGIXcxAJ+AiVabT4enlFNiZ--
