Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18EA922BC5F
	for <lists+linux-next@lfdr.de>; Fri, 24 Jul 2020 05:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgGXDME (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Jul 2020 23:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgGXDMD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Jul 2020 23:12:03 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3AEAC0619D3;
        Thu, 23 Jul 2020 20:12:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BCZ4G4bQPz9sR4;
        Fri, 24 Jul 2020 13:11:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595560322;
        bh=CVN2/OeTuVHSV+bI6yvZoLyVhI53xwEE0w8uWXYe1/U=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DKbqYLo3ROBsDOBPWHfMirA1rYm/lN4qZhYd87VI0N+HUpsJBWJ31h+TQ7YBx1rYn
         LfgBLf1MGnZ+PK1lTOCDiX3XtiBxaOpf/inqr2J5O+AWCKg3IoPkKJLbCp1sC7j+qy
         eiJyz5OLXnbiUtkRfWSx2WUf18gXetqscmB/WeNtnsWmmKXMvAIJNZK+dVXDbhbzUt
         8u4W4IhSb6DLCY83wFQJv5fuL0T8+AEmGZMPPbD30f2b/6HIf3RruQd8SEIXcpgZ0q
         I32urIvtE0O2Zp1zOybrxCQiz7zoA8Wp7Yu5iK1QjKUbDfdiT8kENjJkJ33vQtFIvh
         tPptaBSo69ITA==
Date:   Fri, 24 Jul 2020 13:11:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Uladzislau Rezki <urezki@gmail.com>, Qian Cai <cai@lca.pw>,
        bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org,
        mingo@redhat.com, peterz@infradead.org,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de,
        x86@kernel.org, linux-next@vger.kernel.org, lpf.vector@gmail.com,
        Shakeel Butt <shakeelb@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Michal Hocko <mhocko@kernel.org>,
        Yafang Shao <laoar.shao@gmail.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Matthew Wilcox <willy@infradead.org>,
        Oleksiy Avramchenko <oleksiy.avramchenko@sonymobile.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Joerg Roedel <jroedel@suse.de>, Roman Gushchin <guro@fb.com>,
        Dennis Zhou <dennis@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: kernel BUG at mm/vmalloc.c:LINE! (2)
Message-ID: <20200724131157.0967019a@canb.auug.org.au>
In-Reply-To: <20200723195029.60933e30f5d3dd64d6a861b3@linux-foundation.org>
References: <000000000000588c2c05aa156b2b@google.com>
        <0000000000003cdc6c05aae24652@google.com>
        <20200720200618.GA9501@pc636>
        <20200722142759.GB4041@lca.pw>
        <20200722144650.GA19628@pc636>
        <20200723195029.60933e30f5d3dd64d6a861b3@linux-foundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sj3ujE1eBml=WsX12wN3D+r";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sj3ujE1eBml=WsX12wN3D+r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Thu, 23 Jul 2020 19:50:29 -0700 Andrew Morton <akpm@linux-foundation.org=
> wrote:
>
> All a bit mysterious.  I think it's best that we revert this from
> linux-next until we hear from Ingo.  I queued a patch - I expect
> Stephen will see and grab it, thanks.

Wiil do.

--=20
Cheers,
Stephen Rothwell

--Sig_/sj3ujE1eBml=WsX12wN3D+r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8aUX0ACgkQAVBC80lX
0Gzj/gf+OGUKW6dZSX9hBZfSUes4QaG1Oa7VSrpDXJ5gS1e8weyVnvH4D3MV3nde
LWB9/DYsXJhHOww5HaiWlXP8VwbrRvp5soaJmGbDMS9+/9L6IYGA1gy2Z/bNz7TB
jg/Skz7TTLqCMjILGZBJRgkvPyUHrWLrPcidrRXkVYPhNBPg+XoecNJ2YceSVeTh
NvDO5EnHNCP/plBr3icVV535yu6uQXT+s4fnWXBsSiokkUzBNF6SS5gyh9U8IPRa
ZQaG4hGBt03A95RhuhcSnlcMCxrI/JgWbJjp4atWN0gRdPRmEGiz6cpqtMzpn5+r
mk6EEIgTu94GZ33XVBYYX87UQ0Uzaw==
=CFUz
-----END PGP SIGNATURE-----

--Sig_/sj3ujE1eBml=WsX12wN3D+r--
