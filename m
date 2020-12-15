Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 126702DA739
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 05:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725835AbgLOEre (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 23:47:34 -0500
Received: from mout.gmx.net ([212.227.17.21]:38531 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbgLOEr0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 23:47:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1608007551;
        bh=ELn4lLfyUmkaZ+5v9UHSLTUcJ3ROklkjV70xqh4zJTQ=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=MNo0csiCC9mKB3a3ORA8aIORvfqplS6TQu9WClN2qiYQscyxrCXxQ9/xm6BZW84+T
         e3y6Qr0nb4+8oCxof6kr8yoMG/iRIlX0+9kEeS3yLYu8ThhxcA6848JXXZXoknMwFQ
         nTUGdFrNO5BdZE0xUnKre5TMGn4etxip2TxsjaQw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.190.227]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKKYx-1kXDHc0mAZ-00Lnlf; Tue, 15
 Dec 2020 05:45:51 +0100
Subject: Re: linux-next: manual merge of the parisc-hd tree with the
 asm-generic tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201102123841.39eb4216@canb.auug.org.au>
 <20201215064847.3676d9bf@canb.auug.org.au>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <0f001a81-b1d3-4df4-28db-b193812a1a42@gmx.de>
Date:   Tue, 15 Dec 2020 05:45:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20201215064847.3676d9bf@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RbgN7DPhguJdooLdNIODKKIV9piDWUDAK"
X-Provags-ID: V03:K1:H8Y6z8eWI557zzuIhlsNwO0KcR3mTqWujbrPda8KTp4N2x/rY6V
 TkDvgmtov67kYSrRGU7KDFYdLFzMXxSq9jvG9787RCmS/2QwCrTvD0ibnI8eASVKSmT5sWf
 a2BXaGiSMR7L+qKgD2fTWED9nxUL6628C4T3Eztqyd/6UiNgwDe079tE/7a0ZCeuxLNNjsJ
 ZRpFD2O0/cW1AHXYuoGyw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZwXoBQgJfgE=:hqsXlVaCUEU4lJl4Fn8ZN2
 elWXKn8QjiL1/AVz0E2qu2qAZo4wz/3EGsi1Krpn8xInGxYzCnFa/87fZC9o44/GNjtpSXYTE
 JIxSrKReo7filEINn4k4OfrIJIbDvMaAziva2VSMAUR3szSPU93TYETRbC9+p8iIJhQb0ZN+y
 W2hu1H5QhqJ/UrHimjm1qpMy1Ln6rdN5DdzU9LJgULlMf1aA8huL31xJLWfgyh5JIyoXKVy3w
 0lE5FzHFXhaXrg4F/SPBEkCE7h4dcsDmrYJRdXPXwOZLSylnuEZHbiMfqhEND0C0irgIgzn4Q
 j6BVlyFSoDxLscufqi/4GTPZG9fQS4hUQlO8SxO6e7oiDpxleK7QmANYcTnPG2DAJ2Bas76Jc
 DKPqj2XMPRKFUFMjTAOGb/M9Zf5d554lkVIf71dtDdSsORiouwt/SSMKdPEtFXVyr0VQ5IzNa
 6AvE4MOZVHl9H2T/d2+p3bZ3oW7lJ0axihZ7MweWbq/G5Yo5dQ0hm0TrFSKcExmtY70vy5/BY
 lmOYCCBGkLAa+uQ6FcTUFCuMCXANe5uRdArdbolhkv3jkxX3ZUylbEAWG3elBoliOOiWkr2SV
 F7Dz/adNOI3jSXOFf42w0GXVFO8PZyx+nGsseu9HBABfdN5xYBfA4hLmvBldY3FtGlvkyLcgI
 jmhOj9wIxyvNGhqGWeukDnnFJr8BgJXVqHQHfD9RuI9EovPmbSJVG5YWpmVgeuuiTUmfoCFL/
 c4CXGMJebHcNuklfBhMLI6hbd/BXaOhFj5gb+T1nck+r0imWJMNXM9EMnjnIK/HZSHgzUfARB
 /YJjNHZVGRcQuj2Y9Wpxjp/wn52ch5FScxgvbu1XJTSQ0i0klg9ptsYx7lDE3/ygXO6SaQMpY
 fxGG1H9dKYmaM/gat5/g==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RbgN7DPhguJdooLdNIODKKIV9piDWUDAK
Content-Type: multipart/mixed; boundary="rFcqKhEA5dbXqP4ufICt8hW5ZwQDbItAX"

--rFcqKhEA5dbXqP4ufICt8hW5ZwQDbItAX
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 12/14/20 8:48 PM, Stephen Rothwell wrote:
> Hi all,
>=20
> On Mon, 2 Nov 2020 12:38:41 +1100 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
>>
>> Today's linux-next merge of the parisc-hd tree got a conflict in:
>>
>>   arch/parisc/kernel/time.c
>>
>> between commit:
>>
>>   686092e7daaa ("parisc: use legacy_timer_tick")
>>
>> from the asm-generic tree and commit:
>>
>>   3b7ab4a74a2d ("parisc: Switch to clockevent based timers")
>>
>> from the parisc-hd tree.
>>
>> I fixed it up (I effectively reverted the former commit) and can carry=
 the
>> fix as necessary. This is now fixed as far as linux-next is concerned,=

>> but any non trivial conflicts should be mentioned to your upstream
>> maintainer when your tree is submitted for merging.  You may also want=

>> to consider cooperating with the maintainer of the conflicting tree to=

>> minimise any particularly complex conflicts.
>=20
> This is just a reminder that this conflict still exists.

I dropped the patch from the parisc-hd tree for now -=20
it needs more work and will not be part of the next merge window.

Thanks,
Helge


--rFcqKhEA5dbXqP4ufICt8hW5ZwQDbItAX--

--RbgN7DPhguJdooLdNIODKKIV9piDWUDAK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQS86RI+GtKfB8BJu973ErUQojoPXwUCX9g/fQAKCRD3ErUQojoP
X1GoAQDBvPNT92MOD0emIuQzyZSIr09tC/0DDzg6KjIoMGM96AEA/OQGItSnhbB0
FVMWIzuEp6p3FNoB/qqWu4YOEr3wyAg=
=S4SK
-----END PGP SIGNATURE-----

--RbgN7DPhguJdooLdNIODKKIV9piDWUDAK--
