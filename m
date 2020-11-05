Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28BD72A74DD
	for <lists+linux-next@lfdr.de>; Thu,  5 Nov 2020 02:22:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730751AbgKEBWb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Nov 2020 20:22:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727536AbgKEBWb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Nov 2020 20:22:31 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E02D7C0613CF;
        Wed,  4 Nov 2020 17:22:30 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRQjw5TzHz9sVD;
        Thu,  5 Nov 2020 12:22:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604539348;
        bh=o3kxhsPOoRuBD9yzt7+LHKfRVPr7Xjr6fTAJo5oQUqM=;
        h=Date:From:To:Cc:Subject:From;
        b=kc/wVsWhWd3Gd4exDJABRTSdweefBFs9vg4GIHk4IuXtjcns3oI/lNG4MwNUzpIed
         rT3GlpNB/VIPemLuse9OTbhDITUuaFx3DVg3n324yvVAg07pkGhI0NE5RjAJDgvWNC
         rZUMIy4Rm12TQMzCqpW2gzRCFvwI6akxlYmPWgHkdxisjBSRoV6k14eKc5iSxNnuX0
         RU5t5+EyX1vGsE/H8YnJr0KqqpUgsOLuFOdyCkW/nRKbr749ZNcfj1pP1SUv1coDGi
         H72PyH0Yo8jZszf+fVLqCNrrokGh4QK9yF+xLUOLi7MgHCKW4qIVhP56oAzHXMaF0C
         SwABiQEUWvRyw==
Date:   Thu, 5 Nov 2020 12:22:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Liviu Dudau <Liviu.Dudau@arm.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: removal of the mali-dp tree
Message-ID: <20201105122227.13e0d997@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0Bp/ru/azcjk8ljkyZrrmwU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0Bp/ru/azcjk8ljkyZrrmwU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The mali-dp tree (git://linux-arm.org/linux-ld#for-upstream/mali-dp)
has not been updated for more than a year and only contains a single
patch that has been merged elsewhere as a different commit.  I will
remove it from linux-next tomorrow.  If you want it reinstated, please
just let me know.

--=20
Cheers,
Stephen Rothwell

--Sig_/0Bp/ru/azcjk8ljkyZrrmwU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+jU9MACgkQAVBC80lX
0GxhVQgAhJQIXSpeH5uOUkJ9EeNwR10iegDM4v3vCLHi2bV0NAUXhX1qfLpqPkux
u+2azM0QbVAizF7yyOr3hcqv9nSWBF+0gCzFx05Pa8kIQDpWCjZ6GtDOEmHT0D5T
VHQED31v0gxMkUsi3f0wFlStwLfZrhd5bjhljAZZImPTr9jR5clp9yNT7eQUI8Bi
6vlZaX9Kq9N/WzkIe8WgLb+uPNezFTHNyF+cVJSZT4wJEimV/yj1kAzx30XvLvB1
L7rlzl32sM2F1tn1uTy/cTVe80Cenc7xrhRnjrLWr+jh31jIJiq3g0x2l0NcogOj
s92/s6zzlC2vdXLXgmom59hDQpnX+w==
=nHKp
-----END PGP SIGNATURE-----

--Sig_/0Bp/ru/azcjk8ljkyZrrmwU--
