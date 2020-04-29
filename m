Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2D661BD6E8
	for <lists+linux-next@lfdr.de>; Wed, 29 Apr 2020 10:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgD2IOJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Apr 2020 04:14:09 -0400
Received: from ozlabs.org ([203.11.71.1]:48853 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726355AbgD2IOJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Apr 2020 04:14:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49BrrZ2nKrz9sSM;
        Wed, 29 Apr 2020 18:14:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588148047;
        bh=aV0PEZPNtfTNVHHepqbBqkTosbZbpsGAfAJk+1cZnFs=;
        h=Date:From:To:Cc:Subject:From;
        b=Q+ify96+D3WB501DW64HOaDzCsOTz6olVhWC9SYpH/BYrDumMYmDxvrbm2RKqtaE4
         NqlPz0P444rxK9Cu0CTB4T8fU06v7xyaT//qNILtFBgF81aMHKPoGpZF2qK9z9R4YX
         B4OPDtJ1LxDn4I+ib+IZfz5d+tHH+SVXwVW2v9Ja12BcOcxSWAOdLeyrXAwSNxJcpu
         OS7988cT/RphFgwq3bq0PlXJdlYLWuEAEeJFD7o1xWWmxfzvT/KxexsttUl+Eze5Pe
         W8givRR/nqfsm+7tkvpSU7IPjAtJzmj2MCN/1Mo0d3PYQfs3GhVec4mttwY7LK3ZAs
         I/ucZFqXxn5yg==
Date:   Wed, 29 Apr 2020 18:14:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: linux-next: build warning after merge of the soundwire tree
Message-ID: <20200429181403.07a54d40@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T44KkzRtqgVZ2Lm5bKFtiq6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/T44KkzRtqgVZ2Lm5bKFtiq6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[Sorry that I did not report this earlier.]

After merging the soundwire tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/soundwire/intel_init.c:193:14: warning: 'sdw_intel_init' defined bu=
t not used [-Wunused-function]
  193 | static void *sdw_intel_init(acpi_handle *parent_handle,
      |              ^~~~~~~~~~~~~~

Introduced by commit

  2978a43e7690 ("soundwire: intel: Make sdw_intel_init static")

--=20
Cheers,
Stephen Rothwell

--Sig_/T44KkzRtqgVZ2Lm5bKFtiq6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6pN0sACgkQAVBC80lX
0GyiDgf+MeySdb0MFM9y5ONWf0wElC6K3bCe1yZVCiJQPTRVScyr22RQtX02vqHg
o4XZR4YggZVU9Q2FljgVr2dlP2ctxo9NXfitndY4Oxqk5182A8aWi2HwybJ96kbG
RgYkFLGrPmuneP6SgGdTq4eQvEq+INDmzerOWCCC+58w+X1XO+f9YDoQQJO8GlXG
JD7jBhmRjF51zCy3JQ7QImr/CR7YUEt/2vcr3sG+SgjZZG0ykKP7yH1gy6NWM6+x
veTNYxI7ffbQofbhopChdurUBsyV6uuSz7f0Q9TdhYhxutOzan3o/+Vy2TJPwQ96
iEuvXOa0P8i15bxjEHxuuxnJNkOyTw==
=uLAY
-----END PGP SIGNATURE-----

--Sig_/T44KkzRtqgVZ2Lm5bKFtiq6--
