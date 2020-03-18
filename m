Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53F22189B42
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 12:52:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgCRLwE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 07:52:04 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35293 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbgCRLwE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Mar 2020 07:52:04 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jEXEv-0007aE-N3; Wed, 18 Mar 2020 11:52:01 +0000
Subject: Re: linux-next: build failure after merge of the pm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200317185252.3cfeecde@canb.auug.org.au>
 <20200318224458.1980e10c@canb.auug.org.au>
From:   Colin Ian King <colin.king@canonical.com>
Autocrypt: addr=colin.king@canonical.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ddc7ae33-1b82-ae48-5a7e-e78144fb2a8b@canonical.com>
Date:   Wed, 18 Mar 2020 11:52:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200318224458.1980e10c@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="e9z7Xyaxgal6LXZAeI2w4FFwJHReLOTOG"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--e9z7Xyaxgal6LXZAeI2w4FFwJHReLOTOG
Content-Type: multipart/mixed; boundary="OnOhZmQc8m1Q55LrSH5kVB26fyntkRtHD";
 protected-headers="v1"
From: Colin Ian King <colin.king@canonical.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <ddc7ae33-1b82-ae48-5a7e-e78144fb2a8b@canonical.com>
Subject: Re: linux-next: build failure after merge of the pm tree
References: <20200317185252.3cfeecde@canb.auug.org.au>
 <20200318224458.1980e10c@canb.auug.org.au>
In-Reply-To: <20200318224458.1980e10c@canb.auug.org.au>

--OnOhZmQc8m1Q55LrSH5kVB26fyntkRtHD
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 18/03/2020 11:44, Stephen Rothwell wrote:
> Hi all,
>=20
> On Tue, 17 Mar 2020 18:52:52 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>>
>> Hi all,
>>
>> After merging the pm tree, today's linux-next build (x86_64 allnoconfi=
g)
>> failed like this:
>>
>> fs/libfs.c: In function 'memory_read_from_io_buffer':
>> fs/libfs.c:829:2: error: implicit declaration of function 'memcpy_from=
io' [-Werror=3Dimplicit-function-declaration]
>>   829 |  memcpy_fromio(to, from + pos, count);
>>       |  ^~~~~~~~~~~~~
>>
>> Caused by commit
>>
>>   08c07cefb304 ("ACPI: sysfs: copy ACPI data using io memory copying")=

>>
>> Missing include of linux/io.h?
>>
>> I have reverted that commit for today.
>=20
> This was fixed today (by including linux/ioh), but the latest update to=

> the pm tree has removed that include again.
>=20
Hopefully it won't be reverted from linux-next?

Colin


--OnOhZmQc8m1Q55LrSH5kVB26fyntkRtHD--

--e9z7Xyaxgal6LXZAeI2w4FFwJHReLOTOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEcGLapPABucZhZwDPaMKH38aoAiYFAl5yC2EACgkQaMKH38ao
Aiad7BAAp4bz2kU6GtjTa4a4rYMxTwoeyyYOSIK5/npKVKKTI1oLfIc9Wp9CaW36
qB6lzBnofLJBqt+POhYM28TCCkYM9HgRfdKrjVbakkd6/TtmoZ1EyCgWa1xS7Zcv
2rKMtued0yofV5jsDixwEnoCV3Zi9RfUfO8kC4Qg7GKn2v+lW4HLcunxJzvFDhDD
Q/2bsT8WEeGCZftqX0n2YOfNYobPsmS1z1tA5pIa654t1+2SAtdAu/1y74XppLpF
IAgYDRfmC4ssX/UhvcQ8HCDMWFsj37c2EG02O0F1N2dq99dwsWZfSXXgKCDL4vtI
AyKRIZGWGtP7EAXnEAJWGfEW5xav6ZLznQ9iqSTIiNayCxrhFicvyfySQFtOT3hG
mOjIdtKhSthTzMlkB25MvRHZWCBXLCBnY/vAb1rv7jp3toU5b1vJ8ADfs+66oo4U
YDaTuROEjKaEwmAPYvMsJPlNzjmtXB6jc0BULqq5vYrOzTo3ktgcbS64ZvPmhrvE
THEldzmWPbAQrtOYrqv70phzvWFGj3WwGKZg69H4ytq9BxUx1CaDqNwsS3Wt2Lez
boZx0uvbgIX1XWw5ZHrJnkU2T43coW7Sh41PnOfq5YQ0s6sm0f28BiFeIN8B91U7
vNqZGqOshNkhaDgXDbR94r5Mu5uE9LeN0Unwba23mUVx+I2MtfY=
=QiSk
-----END PGP SIGNATURE-----

--e9z7Xyaxgal6LXZAeI2w4FFwJHReLOTOG--
