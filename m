Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2BEF6D3E50
	for <lists+linux-next@lfdr.de>; Mon,  3 Apr 2023 09:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbjDCHno (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Apr 2023 03:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbjDCHnn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 3 Apr 2023 03:43:43 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AEDBE399;
        Mon,  3 Apr 2023 00:43:15 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4PqjYH2Zsxz4x91;
        Mon,  3 Apr 2023 17:42:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1680507779;
        bh=I3QRj4CxcW86oeAu7hI13qDHxE79NhUmafu4FmN77hg=;
        h=Date:From:To:Cc:Subject:From;
        b=k6vL8qy3KNKmrTyh0A3u/tCzlqfvnZR46bDWbimO91AJMUeElG1q7+HE4SlnlkPhD
         a79MnU/nKJDypT8LtNyShtVQvgbwlKqXpL/IegeWArddw/28ZWI04cTA6O3RPVMmMa
         hYfmx3aA69muz9gBrCIAigw42qmZ5Xw9SYnPu/2g7rAw3A5i9hxDj0FDDbYOZio5kM
         jfTzHkp4cS3FsMT/YLr4M54GduocaTTiN27VejrUdWSm9BnLvu9821ISDN7hsEZOtQ
         KEtXatJHrkRDXWniHuth2ieIe9Ck7QuykvNn62VNj50s/9YrkGVXAqajofQq3trEH+
         Fm0MjQzCZE/3g==
Date:   Mon, 3 Apr 2023 17:42:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Alvin Lee <Alvin.Lee2@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20230403174257.334f658e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TEaWL/=boneSz6Fb601j+hS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TEaWL/=boneSz6Fb601j+hS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/display/dc/dc.h:878: warning: Function parameter or mem=
ber 'disable_fpo_optimizations' not described in 'dc_debug_options'

Introduced by commit

  ac18b610fd95 ("drm/amd/display: Enable FPO for configs that could reduce =
vlevel")

--=20
Cheers,
Stephen Rothwell

--Sig_/TEaWL/=boneSz6Fb601j+hS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmQqg4EACgkQAVBC80lX
0GyWjgf/eqAhp2kVHAdafqX6vRw7IOctbinIYLHQouAfD7x1KS//u2fCvt+SeCLz
d+n8oq/6+4Z4OGN/oZa92gul06tE237D0Eps2ooI37l869dnicJLITLf+vHeiGtB
7id2bzQrjlKNccAt5deZDr+eN2y8btqilJFXnc76X/1sTkwGcsjByUhbnsLXBxDt
rXr5ZfHBmfr4va2ojtX/7T5a6DRRf/h4Bd29iocgIGhb/LHGTAMD8obd/Llqcmso
CqK8umufv5TrSxqYTEFNXIv59S4t8yU4CIGM0Vkltf469VSKPak/+h4OAHQVYUg/
xhJjACVuvF88UvSwzYPvLr8JhoS6GA==
=KGu3
-----END PGP SIGNATURE-----

--Sig_/TEaWL/=boneSz6Fb601j+hS--
