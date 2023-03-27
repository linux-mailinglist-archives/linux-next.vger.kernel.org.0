Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3773B6C993D
	for <lists+linux-next@lfdr.de>; Mon, 27 Mar 2023 03:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjC0BG5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 26 Mar 2023 21:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjC0BG4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 26 Mar 2023 21:06:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9CB04EDA
        for <linux-next@vger.kernel.org>; Sun, 26 Mar 2023 18:06:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 425E8B8013A
        for <linux-next@vger.kernel.org>; Mon, 27 Mar 2023 01:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88612C433D2;
        Mon, 27 Mar 2023 01:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679879211;
        bh=LvHo1jQu9qIZe6CRkTDaBbf4M+O3n4r82Q+hJbGuHr8=;
        h=Date:From:To:Cc:Subject:From;
        b=mh0C+H4w/DkGG/Ddij6ze3ba45kRKFUj1MZA7j8/aZsfnNLq86a+VADOGNDQsiwpM
         WbmdYG0ctRjFJ+4+XQDvHiKuUcKz2ZwNx8cZRzfoguNEsD+UK/4DIeBD8qi9eKWdCc
         A1ekCLi4kT6iD3+8wL1IVitgEQvOq3PaC9c9ZLeR/qVWoLA+wzyPT859dvgsPoyBAx
         X+liyYpMTLwPGZH4ACblA1QMwMBAO6Sgd86ZwP1vAiPjQSzwm4SPlKSb6F+mdiFrr3
         NZVdDZRRymZu1r3qLdMoFPAYRjWYGfqh5bgqs2twGuY0H/NKbo1yUIDWby3wFA1Wwi
         lhmmjfKcVcfFQ==
Date:   Mon, 27 Mar 2023 01:06:49 +0000
From:   Eric Van Hensbergen <ericvh@kernel.org>
To:     sfr@canb.auug.org.au
Cc:     v9fs-developer@lists.sourceforge.net, linux-next@vger.kernel.org
Subject: Add v9fs#fixes/next branch to linux-next pending-fixes
Message-ID: <ZCDsKfJ9fU6cwiZM@7e9e31583646>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VNd3RiT/yEyueBsp"
Content-Disposition: inline
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--VNd3RiT/yEyueBsp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Could we get the fixes/next branch of my v9fs tree=20
(https://git.kernel.org/pub/scm/linux/kernel/git/ericvh/v9fs.git/log/?h=3Df=
ixes/next)
added to linux-next pending-fixes branch?  Intent is to use that for
pending fixes that are reviewed, tested, and signed-off but intend to
send to Linus before the next merge window.  I'll continue to use
ericvh/for-next for features that are intended for the next merge
window.

Thanks,

   - eric

--VNd3RiT/yEyueBsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElpbw0ZalkJikytFRiP/V+0pf/5gFAmQg7CgACgkQiP/V+0pf
/5iPQQ//TY9GN3A8d5MQWO1U6XDOkG2uL/EupfNFg3FC3SKtxXf6ZHUYldFpNUkz
ta7YYXuAB+zCMRVqxiQ3YGnV7FMmqZXgVa9SyfRd+35qT5qjEuGK/sadCuQKF7ng
8QmKE9jNbs+ujxT/2vaK7b/u+2QCHtHfGwMHU93a8/z8diB0yEHKwVoerbaZOuSO
8LwkMoA1FToq131MLEBbTorab0f/mqS+aR2qqez64MuW0P9F5mvOMqk0l1R+hD1n
o+CjjsJo4qs6khb4ZKbZrfPeFcnFF6TiFl8/TsBzHAp7+9w65D2iX+i7jilIUkjM
A0C2roQtcYT2AAgRx+SoQJkpf8rC40+u9UIxf6fWn5Kl2paH3sFy5tBbBvs+3X2C
hLXXpcELdirg0BGnjvJE2qE10X83gIIKBnDHc6QRZaz9VuvH8ZjaQc7jpzYQtWZK
82qc83VHkQAMT973wQ1xT8mXPbcF2sNrJJS4Pq+shh1AK8CMqNX16LXJK83OtqFQ
KOrPJ/z0m2VS3cnJ+2/XuOQ7fDI2eqMsld7SiKKb7sym2qMNEk2/L9TnfHbh5UPU
otWl02uiOSKopCBw382KLG8ufeoNMTc2kirb87xvpVfbvpmPFMcUsyUYKiESWRtu
OjFHZO8ShwtYPXJHkd6xXioUs5E0kaA7hQ9e3C/jE4Qy0oS2vT4=
=Yiqi
-----END PGP SIGNATURE-----

--VNd3RiT/yEyueBsp--
