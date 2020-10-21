Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26BAA29488B
	for <lists+linux-next@lfdr.de>; Wed, 21 Oct 2020 09:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395357AbgJUHDA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Oct 2020 03:03:00 -0400
Received: from ozlabs.org ([203.11.71.1]:51759 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2395355AbgJUHC7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Oct 2020 03:02:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CGLzh00cgz9sPB;
        Wed, 21 Oct 2020 18:02:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603263777;
        bh=PBo18bQKtsF/lO3vizK4a5rRM+ztOs+GYX1rmNeAeZM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LuIUW6QYG39994r4W76fkSK5APvTR1wFV2MvHbHfgeu0NxBwaOjDHXGNMeV0LYvZ6
         kSkL/QT9iItuNBJJ0jrXoW9AIHYNxKttjbvGxl1j6CKNJKGZHKQLkdBRjNxXaphxOJ
         vq3l3kCe3E6UPsjdbcptnvmSiNmSZAgObAN6o44Y7xBIGQUfV/r5uaM2y69gimVe+m
         Nk/2uLOLKf/LDTQj9S20PhpBqH2UCYTWeyJ30LulE3qcBZklhloNfu3ueHXRmdXyrg
         OPn7mQd0mS2s/WG2aTii/nkMA3/850SoMK7g3RPCL+wzp1gpND/HFKLQ4y+se/EpT7
         O53ief7ySLY7Q==
Date:   Wed, 21 Oct 2020 18:02:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Minchan Kim <minchan@kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: Re: linux-next: manual merge of the notifications tree with Linus'
 tree
Message-ID: <20201021180255.5673c548@canb.auug.org.au>
In-Reply-To: <20201021124733.344e5107@canb.auug.org.au>
References: <20201021124733.344e5107@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RuvA/c3QoF.woLzySkf7l_P";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RuvA/c3QoF.woLzySkf7l_P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 21 Oct 2020 12:47:33 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> diff --cc include/uapi/asm-generic/unistd.h
> index 2056318988f7,fcdca8c7d30a..000000000000
> --- a/include/uapi/asm-generic/unistd.h
> +++ b/include/uapi/asm-generic/unistd.h
> @@@ -857,8 -857,8 +857,10 @@@ __SYSCALL(__NR_openat2, sys_openat2
>   __SYSCALL(__NR_pidfd_getfd, sys_pidfd_getfd)
>   #define __NR_faccessat2 439
>   __SYSCALL(__NR_faccessat2, sys_faccessat2)
>  -#define __NR_watch_mount 440
>  +#define __NR_process_madvise 440
>  +__SYSCALL(__NR_process_madvise, sys_process_madvise)
> ++#define __NR_watch_mount 441
> + __SYSCALL(__NR_watch_mount, sys_watch_mount)
>  =20
>   #undef __NR_syscalls
>   #define __NR_syscalls 441

I missed updating __NR_syscalls to 442 which I will in tomorrow's merge
resolution.

--=20
Cheers,
Stephen Rothwell

--Sig_/RuvA/c3QoF.woLzySkf7l_P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+P3R8ACgkQAVBC80lX
0GyjGwgAlbpa+CAULtYzB8uAAjIjKRVUSatUih/+oAx+0dtGf6FZOx9pfASqM9Kx
p26cIT69HGHgsjKh5t0K4C60hPlk2lVwpReTBQdDNAuQKvzlKnRceuz2tv6eMkfq
rLyIXATbnd8/1/WWX1ZGrA49+SXhWfT++oDpBMHVKQ7tAMraKT4msfAvDKUDgimC
cRJDRxlC6uBWbRQohhIbHChfEPEJ36F488ODzqudnQpqrI2vjMUKl5KZlBIIW/OP
uvq/7DjQjPMxtF3qd84VMwqEnVvuAGKaxU7c0Erz6LoMNY0IQflb9MhZjw1b7OCC
hm9SaDMOSj4VVlqabnebMooFcvLcqw==
=/995
-----END PGP SIGNATURE-----

--Sig_/RuvA/c3QoF.woLzySkf7l_P--
