Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 577BF313294
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 13:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232537AbhBHMlg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 07:41:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbhBHMkj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Feb 2021 07:40:39 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E78AAC061786;
        Mon,  8 Feb 2021 04:39:58 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DZ5Fj5ZHzz9sWb;
        Mon,  8 Feb 2021 23:39:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612787994;
        bh=Vj40pNH27cPPWhxImfXvQCPBcljRNPthB+e2t72DD+o=;
        h=Date:From:To:Cc:Subject:From;
        b=gOmRDRWLTmivtcAjwIxzHoL/C0mqnJVysPatAJX7MkbU2//3wiUHf5mEpzcA3MzXl
         KMAS9HX6o3PSNl7rpc8+rO14f5QXZ1BvpFO6A4wWEp2nCZoiWzZcrj7Jm/1hJTV+Zc
         HkiVGkfwA2ONvPp2UHMpBcA//KzUNU/NpevbmvMP6wwhHKfFDnI79LkWMbygGN6fF4
         U0biVDkBxHxkx4Vy/yjihy8G796riKC0XpcfHFrc6MzoN/y7stRLT1OMFsYWIqIr+8
         Lz66dMbm777vWimxDtV1NEvV0t5OeadLZUC0YyBZzTIXddwoM9Y1Bdo5YerxBJT+Q4
         fPqywQuFn7XmQ==
Date:   Mon, 8 Feb 2021 23:39:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20210208233951.2b438d99@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1RGkhcRKW4jkWv=8QwCD5wP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1RGkhcRKW4jkWv=8QwCD5wP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

include/drm/gpu_scheduler.h:304: warning: Function parameter or member '_sc=
ore' not described in 'drm_gpu_scheduler'

Introduced by commit

  f2f12eb9c32b ("drm/scheduler: provide scheduler score externally")

--=20
Cheers,
Stephen Rothwell

--Sig_/1RGkhcRKW4jkWv=8QwCD5wP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAhMRcACgkQAVBC80lX
0GzfxQgAg0msFiUtp0qMNFgOCSJ1KO/yXtAsPEhvu0uXIE/78WXKImTU7SFRQbIT
pQwPF03oxeMqqN59o0VDXgpV7iM7o8PUa9u/a/ICK9+7z6z0t+PzPIeyeIwiCF2i
SKjYhJvjX2hvAvwYfuhG/AVYQQh/+nIzdeCiJquRzDBPt3oy53kMbUh1zd4TWeZw
IadDuJAUFLqMcYjL13HaKdIDCYwg9/8JeIGwRvEFAlXCpQjxpeCbrB5wSO7RU7A3
3xfnX2MooI5hdlmZXlSW9JFWMJGfnNFpmwUcg05ZVPWmyihsyjwsEeQqh0VYiowJ
6kc8+ewqdYkEOn8+eOdeC/0Ve3lNKA==
=uovO
-----END PGP SIGNATURE-----

--Sig_/1RGkhcRKW4jkWv=8QwCD5wP--
