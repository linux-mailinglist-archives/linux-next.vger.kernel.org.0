Return-Path: <linux-next+bounces-4990-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8569F5FE8
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2024 09:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDA751896263
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2024 08:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A3317799F;
	Wed, 18 Dec 2024 08:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dkg5Vzxy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B6F17625C
	for <linux-next@vger.kernel.org>; Wed, 18 Dec 2024 08:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734509019; cv=none; b=e3PSkegjf110jJ37Q/qu94QCcXbEbOUdYsw7JbPj5QGmgTK0dA3FGSPw1lJvglBUBL0tZuMk8o4dsATiwjHGpvgGG5CE7cixKblIo13seXPPLOqBF+7uzbJygDGJp58ViuKM/H2DEsJ9R7xNq/MB/VmRAn5yXqF5DaR0U6KetU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734509019; c=relaxed/simple;
	bh=Kxq7L21j8DeIs8M7Um4de5NolPYbgDa+nKBQMm2UYGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nfJ0lOb01SRlfF8jXPuVF3RNf6uTIMmU0WH4Co3/cSPdLcNYs7glOE0B7aucOmh8efLPCMeGeWGfV9AO0NeJZptmsZrGMB65pBnR/Svdoh3JMXpFmwkjLt9+NLTXVlaGTbRHuUr3drRlI2d1OmCwd116eXGHnwIfcGnY/QDzzRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dkg5Vzxy; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa68b513abcso1034706566b.0
        for <linux-next@vger.kernel.org>; Wed, 18 Dec 2024 00:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734509015; x=1735113815; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kxq7L21j8DeIs8M7Um4de5NolPYbgDa+nKBQMm2UYGs=;
        b=dkg5Vzxywrl6os+FiYR2becfxo4ykzQiV6iWFPhCx8cNofjVkfvQtDmAqVbn1xsEy3
         6cpXqFdwj2nqfDZwlZO6kEms0xi2xDubxCRdrJRRkx5NUgvgjZT+Xf+PdApCnBaUKElm
         uBdBUPvJECbIOB5q5jm10cDjloooW1MxWYCpcXo3xDinht5rgfDTszHOElhJ0oeYusXv
         0DScbhZ2aaldhcN9cJMonjqyXsAVDUxnc9CLCwp4GUOvX++udaCfdlxMPsriTegiDvb2
         0MgEv4pu0w2YWsrEo+Bp02tg9I+jMzi0+2dZ9SpcV7nAR1OxD1u7qaXpPfnY23kLmIAJ
         GB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734509015; x=1735113815;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kxq7L21j8DeIs8M7Um4de5NolPYbgDa+nKBQMm2UYGs=;
        b=A+DGbslkV4yajM+XTYGiRLKZgAEQp0XLJach1OsXJebbq11plE0oH55P5N8Rm1gHP/
         zlc5Ff/OuVMKvNs/e7p8o88jm7oKsSmZDfixYLJCHWVIAnvfzpEqomJPLGMfyK9ctQj/
         l8S7DXrh729Xr8pEijPpv0dNa8FJj29YOqXkMEjwO73u4DNr/ztj+rE8s/D7pyys7LKb
         4zNB/FGTSztNIbSEEXXHCNspXV4RpfUI9f8/2JOf4PNHbTQBPW4tig8S8+ubQazLSIL0
         gNNt/tMufmVqHpz7gwh4xiGoT5gxUzKshcjrFvfBTnZDWlFVSxyiEzq6OAgQfKslLHl+
         T2PA==
X-Forwarded-Encrypted: i=1; AJvYcCV0/Pt67NOSOz68kk9k6yyEwcE+Ukf6z2nBNOFA6QmKH1x8TNemeUcHgSHcxqM9Q0pmv0PemuuAxlvR@vger.kernel.org
X-Gm-Message-State: AOJu0YxdI1IyLb7WrG4IFZVVs36E+qyeHJkrgJAmL9sTbSkQgAITOPXE
	B15a+ks8qbiZ/OwLHd8y7nHVTTk4vbURgwHqK6BwDVlO8Lwtg2mVR+S7bXfReUoxGwucfYOQTex
	5hfs=
X-Gm-Gg: ASbGncsMAncN2XTRyjD29m7EwkVQH+Yhg69049IELnRMnnhzAyqFtbiQemmnWmjTisg
	QpLxyKBlkQoGMiPL3DlzjhEQVYNCDxRI70ekurbQGdMpvG4qXqRTafatZRoIrk8WMMaRb3qUUqu
	waiW8Vf8FuH3aUuUThfpMwVizARF4bhWeVBg1WVKeVxtzy/ob3kECkzZUFOyDS+VcxqhstK066b
	TXd5A72z1i0dFUF/5LINPelSti9Agl2+g7NcYdmazXP/ZUZ7P0yNKHx47g0XYvwKyCd5/0K7NmQ
	ZcOabF9ZXpjdJgG2QyrTMoEz27PA9uk268pbOnxarkgK7aAwgyD7g82jX7u72PQJQJoJI1pIiLR
	RryyQlg==
X-Google-Smtp-Source: AGHT+IEDBTC60kONpYwR6UyG4UliKfByKZr5pinFSljsKz5MjA7fNW4izNlv0lCi9qidOb5M27Osqw==
X-Received: by 2002:a17:907:7da8:b0:aa6:87e8:1d12 with SMTP id a640c23a62f3a-aabf48bf55dmr137514966b.45.1734509014877;
        Wed, 18 Dec 2024 00:03:34 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595? (p200300e587312800842d42a059923595.dip0.t-ipconnect.de. [2003:e5:8731:2800:842d:42a0:5992:3595])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96359dddsm534528566b.117.2024.12.18.00.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 00:03:34 -0800 (PST)
Message-ID: <fd5aa15f-40d7-433a-a046-f1cf5703f089@suse.com>
Date: Wed, 18 Dec 2024 09:03:33 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the origin tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20241218151302.788bd289@canb.auug.org.au>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20241218151302.788bd289@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------w8Xf0Z1JuG2AWQMdU2j6s4U5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------w8Xf0Z1JuG2AWQMdU2j6s4U5
Content-Type: multipart/mixed; boundary="------------Q3CRSZRj9RWqenTR9TsfmyG9";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <fd5aa15f-40d7-433a-a046-f1cf5703f089@suse.com>
Subject: Re: linux-next: build failure after merge of the origin tree
References: <20241218151302.788bd289@canb.auug.org.au>
In-Reply-To: <20241218151302.788bd289@canb.auug.org.au>

--------------Q3CRSZRj9RWqenTR9TsfmyG9
Content-Type: multipart/mixed; boundary="------------XnQHVqfhGLSGMDZCxqXPupJs"

--------------XnQHVqfhGLSGMDZCxqXPupJs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMTIuMjQgMDU6MTMsIFN0ZXBoZW4gUm90aHdlbGwgd3JvdGU6DQo+IEhpIGFsbCwN
Cj4gDQo+IEFmdGVyIG1lcmdpbmcgdGhlIG9yaWdpbiB0cmVlLCB0b2RheSdzIGxpbnV4LW5l
eHQgYnVpbGQgKGkzODYgZGVmY29uZmlnKQ0KPiBmYWlsZWQgbGlrZSB0aGlzOg0KPiANCj4g
eDg2XzY0LWxpbnV4LWdudS1sZDogYXJjaC94ODYva2VybmVsL3N0YXRpY19jYWxsLm86IGlu
IGZ1bmN0aW9uIGBfX3N0YXRpY19jYWxsX3VwZGF0ZV9lYXJseSc6DQo+IHN0YXRpY19jYWxs
LmM6KC5ub2luc3RyLnRleHQrMHgxNSk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHN0YXRp
Y19jYWxsX2luaXRpYWxpemVkJw0KPiANCj4gSW4gY2FzZSBpdCBtYXR0ZXJzLCB0aGlzIGlz
IGEgUG93ZXJQQyBob3N0ZWQgY3Jvc3MgYnVpbGQuDQo+IA0KPiBQcmVzdW1hYmx5IGNhdXNl
ZCBieSBjb21taXQNCj4gDQo+ICAgIDBlZjgwNDdiNzM3ZCAoIng4Ni9zdGF0aWMtY2FsbDog
cHJvdmlkZSBhIHdheSB0byBkbyB2ZXJ5IGVhcmx5IHN0YXRpYy1jYWxsIHVwZGF0ZXMiKQ0K
PiANCj4gc3RhdGljX2NhbGxfaW5pdGlhbGl6ZWQgaXMgZGVmaW5lZCBpbiBrZXJuZWwvc3Rh
dGljX2NhbGxfaW5saW5lLmMgd2hpY2ggaXMNCj4gb25seSBidWlsdCBpZiBIQVZFX1NUQVRJ
Q19DQUxMX0lOTElORSBpcyBkZWZpbmVkIGFuZCB0aGF0IGlzIG9ubHkgc2VsZWN0ZWQNCj4g
aWYgSEFWRV9PQkpUT09MIGlzIGRlZmluZWQgYW5kIHRoYXQgaXMgb25seSBzZWxlY3RlZCBp
ZiBYODZfNjQgaXMgZGVmaW5lZC4NCj4gDQo+IEkgaGF2ZSBhcHBsaWVkIHRoZSBmb2xsb3dp
bmcgaGFjayBmb3IgdG9kYXkgLSBwcm9iYWJseSBzb21ldGhpbmcgYmV0dGVyDQo+IGNhbiBi
ZSBkb25lLg0KDQpZZWFoLCBpdCBkb2Vzbid0IGNvdmVyIGFsbCBjYXNlcy4gSSBoYXZlIHNl
bnQgYSBwYXRjaCBmaXhpbmcgaXQgcHJvcGVybHkNCihmYW1vdXMgbGFzdCB3b3JkcykuDQoN
Cg0KSnVlcmdlbg0KDQo+IA0KPiBGcm9tOiBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5h
dXVnLm9yZy5hdT4NCj4gRGF0ZTogV2VkLCAxOCBEZWMgMjAyNCAxNTowNTowMyArMTEwMA0K
PiBTdWJqZWN0OiBbUEFUQ0hdIGZpeCB1cCBmb3IgIng4Ni9zdGF0aWMtY2FsbDogcHJvdmlk
ZSBhIHdheSB0byBkbyB2ZXJ5IGVhcmx5DQo+ICAgc3RhdGljLWNhbGwgdXBkYXRlcyINCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3Jn
LmF1Pg0KPiAtLS0NCj4gICBhcmNoL3g4Ni9rZXJuZWwvc3RhdGljX2NhbGwuYyB8IDIgKysN
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvYXJjaC94ODYva2VybmVsL3N0YXRpY19jYWxsLmMgYi9hcmNoL3g4Ni9rZXJuZWwvc3Rh
dGljX2NhbGwuYw0KPiBpbmRleCA5ZWVkMGMxNDRkYWQuLmRjYTQ0MGIxOGI5ZiAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC94ODYva2VybmVsL3N0YXRpY19jYWxsLmMNCj4gKysrIGIvYXJjaC94
ODYva2VybmVsL3N0YXRpY19jYWxsLmMNCj4gQEAgLTE3Niw3ICsxNzYsOSBAQCBub2luc3Ry
IHZvaWQgX19zdGF0aWNfY2FsbF91cGRhdGVfZWFybHkodm9pZCAqdHJhbXAsIHZvaWQgKmZ1
bmMpDQo+ICAgew0KPiAgIAlCVUdfT04oc3lzdGVtX3N0YXRlICE9IFNZU1RFTV9CT09USU5H
KTsNCj4gICAJQlVHX09OKCFlYXJseV9ib290X2lycXNfZGlzYWJsZWQpOw0KPiArI2lmZGVm
IENPTkZJR19IQVZFX1NUQVRJQ19DQUxMX0lOTElORQ0KPiAgIAlCVUdfT04oc3RhdGljX2Nh
bGxfaW5pdGlhbGl6ZWQpOw0KPiArI2VuZGlmDQo+ICAgCV9fdGV4dF9nZW5faW5zbih0cmFt
cCwgSk1QMzJfSU5TTl9PUENPREUsIHRyYW1wLCBmdW5jLCBKTVAzMl9JTlNOX1NJWkUpOw0K
PiAgIAlzeW5jX2NvcmUoKTsNCj4gICB9DQoNCg==
--------------XnQHVqfhGLSGMDZCxqXPupJs
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------XnQHVqfhGLSGMDZCxqXPupJs--

--------------Q3CRSZRj9RWqenTR9TsfmyG9--

--------------w8Xf0Z1JuG2AWQMdU2j6s4U5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdigdYFAwAAAAAACgkQsN6d1ii/Ey+x
YQf+M8tDZof4oZ32DQYyE0NNyctVGtf0DhFiGo1GFQDg08gkbZ5ULH3Nct/NnfiHGi6oFdbldFzJ
PPQ7KnOyZdacU+NfOagAvFqEkrxWXAj2InowlIhtIAqFgDPBpaqJZPg7qM+bfrRjUbNuM/yiniIx
O6+rBu7erKWhoOV4JcuePrEacfyVrZ0WI6Ts1DNG1EBvStk3cUZeoiypDg/BBma7uX3Q1RrKKv86
3hilI7M2Xn6S+K7x0+T1C2vmT6yvL2lc7AxBuWj0PWNI0w9PFhTA8mKKliX5MAlk2bQACYidQeq2
ASTxG1klfkyI0aUP5R/Gnm4QUeCcwzROpj5e5Kirvw==
=Ko2m
-----END PGP SIGNATURE-----

--------------w8Xf0Z1JuG2AWQMdU2j6s4U5--

