Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F12FC435D7C
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 10:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbhJUJAx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Oct 2021 05:00:53 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:52986 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbhJUJAw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Oct 2021 05:00:52 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 6EE3C1FD53;
        Thu, 21 Oct 2021 08:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1634806716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sbWYdz6Wz913HfScu1UZ7h+IgOLpDvOmE8sinRYcXJo=;
        b=CGoodxDtGTt1KyamyZ+qvhwJd0OoS15pawh/sq6LgX5HsjxeAulq9b54ZapH0QM0iOwRFD
        NlH2BmLe/kkR4oDBVgrk4vTiwk2LYmf78cFs1kZI8x149uIow+tFK0ywzFaQHSrxpv1bcD
        CUElY4+OojusG4lImRu2BsguVy7B3aY=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2ABB213BDA;
        Thu, 21 Oct 2021 08:58:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id L98tCLwrcWGdJQAAMHmgww
        (envelope-from <jgross@suse.com>); Thu, 21 Oct 2021 08:58:36 +0000
Subject: Re: linux-next: build warning after merge of the tip tree
To:     Peter Zijlstra <peterz@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210917115859.6cfc64a5@canb.auug.org.au>
 <20210920113809.18b9b70c@canb.auug.org.au>
 <20211021140340.139eab65@canb.auug.org.au>
 <YXErbb3TGDwUJXHw@hirez.programming.kicks-ass.net>
From:   Juergen Gross <jgross@suse.com>
Message-ID: <e33163e0-2c44-1e84-81ee-5df217ed19d9@suse.com>
Date:   Thu, 21 Oct 2021 10:58:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YXErbb3TGDwUJXHw@hirez.programming.kicks-ass.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Y7BwP2tQYFXqKzkPa0u4Tubk7qU0CQ12L"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Y7BwP2tQYFXqKzkPa0u4Tubk7qU0CQ12L
Content-Type: multipart/mixed; boundary="mRiJw3L4XPZGYibQSZmgW6XmiiJiSdIXw";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Peter Zijlstra <peterz@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <e33163e0-2c44-1e84-81ee-5df217ed19d9@suse.com>
Subject: Re: linux-next: build warning after merge of the tip tree
References: <20210917115859.6cfc64a5@canb.auug.org.au>
 <20210920113809.18b9b70c@canb.auug.org.au>
 <20211021140340.139eab65@canb.auug.org.au>
 <YXErbb3TGDwUJXHw@hirez.programming.kicks-ass.net>
In-Reply-To: <YXErbb3TGDwUJXHw@hirez.programming.kicks-ass.net>

--mRiJw3L4XPZGYibQSZmgW6XmiiJiSdIXw
Content-Type: multipart/mixed;
 boundary="------------00BB78E1F6D50CBA7692B7C0"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------00BB78E1F6D50CBA7692B7C0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 21.10.21 10:57, Peter Zijlstra wrote:
> On Thu, Oct 21, 2021 at 02:03:40PM +1100, Stephen Rothwell wrote:
>> vmlinux.o: warning: objtool: xen_irq_disable()+0xa: call to preempt_co=
unt_add() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: xen_irq_enable()+0xb: call to preempt_cou=
nt_add() leaves .noinstr.text section
>=20
> https://lkml.kernel.org/r/20210922103102.3589-1-jgross@suse.com
>=20
> Juergen, where are we with those patches?
>=20

Queued for 5.16.


Juergen

--------------00BB78E1F6D50CBA7692B7C0
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------00BB78E1F6D50CBA7692B7C0--

--mRiJw3L4XPZGYibQSZmgW6XmiiJiSdIXw--

--Y7BwP2tQYFXqKzkPa0u4Tubk7qU0CQ12L
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFxK7sFAwAAAAAACgkQsN6d1ii/Ey9H
3Qf+Os0di+N4ydcbM+DpOdFERXbZ6ZyiTEUm+KqB8GDZaulKv5BMr82RMmzGCrZXG5J2E7CnBSDs
T0eluHjWDXxT090z2JAftvJn8HfZ6SOtfWYe51LBHhkr4uGSuBDX+m8uqXLRZllvJjcB3IXntNlb
FBGamoI7r+iR92kwv7VzjOVgfR1wkTFfTBtxsV44WjV943aF78Z7twNHsdF/NuemS1YMVXzijw8X
Ikf5ANRYng3TL2S/u3qcu2ruNSeaZDUgaurTBqNpN2T+mbyVgmcEBgcVNGfOnPQXR6vP7//dLSng
XjXg7kf4JXYdidVzaeRmp4vqyzUJuImni3pDApMfjQ==
=ePVU
-----END PGP SIGNATURE-----

--Y7BwP2tQYFXqKzkPa0u4Tubk7qU0CQ12L--
