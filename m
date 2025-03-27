Return-Path: <linux-next+bounces-6049-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67955A73735
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 17:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAAEA88013B
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 16:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446802747B;
	Thu, 27 Mar 2025 16:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZgYFPyeN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300CE2AF1C
	for <linux-next@vger.kernel.org>; Thu, 27 Mar 2025 16:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093831; cv=none; b=KLhpB98lW4Z/s2fwmeNvK9+PyQMzo37aCFc6krmnWy6lUAe2YxLtPWYIK1UIzJFxMOtgNgq4qa5UUEKJciaZpi6EgiXAdCbHtMNXUEkmaIvC+Bi9+ch6Z3NDP6+5/R+X+N0xerBH9V65CSfL83ePlIsBAcVw8PPHQTIZQVvJI1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093831; c=relaxed/simple;
	bh=VSgzcBYwY2oX2th1qZYE/J0ND1I/Q4yGhZR5vEg4m40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V6VuioqTjJ26fN0sSiu7SA5/TX0U/I7tuZ6VL1IntsWwSpu931XWcLy6x3a6KMJlKnhCVOwszFTqVT2lvtKbDYh+of6KU/tlizYvUCjwo0zD73axBhFjFJFqj3RjV9Z3ZLRWmbd2/Zhj1uSfsmju/N98GHQKUJOndJa7KAi7i4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZgYFPyeN; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf848528aso10327665e9.2
        for <linux-next@vger.kernel.org>; Thu, 27 Mar 2025 09:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743093827; x=1743698627; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VSgzcBYwY2oX2th1qZYE/J0ND1I/Q4yGhZR5vEg4m40=;
        b=ZgYFPyeNp8Pb3hW+bMo9zVhKbdI1Mq+QwQROo67OySONII0wcbPwcQxRnqUrXGHJe/
         x9JMcVA62Z2ZGLl6lQdnYCgbr8eItHbjilf2Qt6OLZ4zSDuo7sYR3HWg/1Xg13/GS5Dr
         fWMTintuCsVQWE9+8rivLHvpEDb+Z6v/Q2k1R62VHlejqmmUXoS3Tl5j0fQHs34bGEaQ
         mXOUDgjT5sWeC8+7GyHzEg+hI3j1htJbidV13+C+8rjnIJapgxa7hNrXIbNXbXtSByfT
         TvjB42ajR6wv4bmrqsypm0W6EJj/SogskFUbQYo84mgAVlCX/6ssEmklTrsucymQ2KGl
         8hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093827; x=1743698627;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VSgzcBYwY2oX2th1qZYE/J0ND1I/Q4yGhZR5vEg4m40=;
        b=DGKNUOLcV1U4e4v2T6vA7yKBmLmT+SApQpO10VS3nOgQKRwvJs+exKxerROFiz7s0n
         bxXR6KaX1kEAb8YjMef/3i7UQkXE5Vlkcp4bR78KxbUPHTo4U7RlgkIqXqh/5EPpbzJz
         kJyJwxUWwv9Ack4VP0ZpHkrR8Mx44vuXDv3N+XRKpPw7KLqfoAtnyi8PFlmbClTOeq3W
         MChPDwYl8G+pdb0oxtaduzrG23/f9nmy63OhDOIvTUBGBDKC6XNgUt7GeWsLuHtys18p
         SiyD8f9arm46va5udJxjUOlSP/mNWrsEcEP3xNwOU3yc1p+YZuV4gyft2lhYmOhSqzoC
         WlqA==
X-Forwarded-Encrypted: i=1; AJvYcCUNkOiL1nveTONZ778alDhtkBtbsvD2N74hDr18kNAX3bLnG569xoh7/3Irw1Ix4Ky24aC6E7aq5X/Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwIOjJj4lgcTwzzzVuHyircBdoos6q5HJ+2St4K3dj0faQdBaQV
	1Ydor6s0927NuGV6CGpB0GBYQ+X60qkQ9YqIfVpZNPNyygCf6acy8YoCjLbkPVQ=
X-Gm-Gg: ASbGncvsGFCFY0XoT+EQhRZ7o3vxPqq5WbrRPfOBDR/z+LABRz1puPJiJRaSyyY+F/i
	Vqb0AaXVPTOqAp/h0mO2WpggwXcuwJHPL0Mcqm6fDCn+Xt5m267RLqW1T/OvI+S8JJM1Grrx2DG
	RHby0RqsfPTMJ5+lTegDMVXP116J317oGHxhfO2WAbbqGDVC5xSROOL9a4uOnntqo7vKXq/PVw5
	3fVCyA+gsJXW8K2D9BReSVOp5IlJ6Pf4SfCO4PEhOBMDFfJHv3vQtLtAN7fJEChES+UjAh9nzPh
	IQ/u2R+nUEqODVLyKqrfdsTucAxzPc022Z27VRxmuFOmrUmm+NhJmzarhxwWBxDaDlKHSHSztpL
	nJT1SEaamIlQ/SAPdUy6U+jQ6yIy65WSvXHIJiMDHJzOlJy7tQZ99GdthU8S97WkBknTH8A==
X-Google-Smtp-Source: AGHT+IGETcCS+lcvQ/bSXVfV+j4aKq6osQvey1TCkg1OOeguFpcPDmpGzo2tnIRTmUzy/vERexcqMA==
X-Received: by 2002:a05:6000:4203:b0:391:31c8:ba59 with SMTP id ffacd0b85a97d-39ad173eea2mr3280210f8f.4.1743093827292;
        Thu, 27 Mar 2025 09:43:47 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b? (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de. [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b662c1csm35842f8f.28.2025.03.27.09.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 09:43:46 -0700 (PDT)
Message-ID: <385a8a49-262e-45d5-a642-50b778014e7d@suse.com>
Date: Thu, 27 Mar 2025 17:43:45 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] xenbus: add module description
To: Arnd Bergmann <arnd@kernel.org>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20250324173242.1501003-1-arnd@kernel.org>
 <20250324173242.1501003-5-arnd@kernel.org>
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
In-Reply-To: <20250324173242.1501003-5-arnd@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------w8keZHt3rHXk8cRy2eo8QCgL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------w8keZHt3rHXk8cRy2eo8QCgL
Content-Type: multipart/mixed; boundary="------------F1AG3EiYN9pow4cgn9Y0uDto";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Arnd Bergmann <arnd@kernel.org>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <385a8a49-262e-45d5-a642-50b778014e7d@suse.com>
Subject: Re: [PATCH 05/10] xenbus: add module description
References: <20250324173242.1501003-1-arnd@kernel.org>
 <20250324173242.1501003-5-arnd@kernel.org>
In-Reply-To: <20250324173242.1501003-5-arnd@kernel.org>

--------------F1AG3EiYN9pow4cgn9Y0uDto
Content-Type: multipart/mixed; boundary="------------0xl5rnPzp8wogKixk8qdxDys"

--------------0xl5rnPzp8wogKixk8qdxDys
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDMuMjUgMTg6MzIsIEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+IEZyb206IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQo+IA0KPiBNb2R1bGVzIHdpdGhvdXQgYSBkZXNj
cmlwdGlvbiBub3cgY2F1c2UgYSB3YXJuaW5nOg0KPiANCj4gV0FSTklORzogbW9kcG9zdDog
bWlzc2luZyBNT0RVTEVfREVTQ1JJUFRJT04oKSBpbiBkcml2ZXJzL3hlbi94ZW5idXMveGVu
YnVzX3Byb2JlX2Zyb250ZW5kLm8NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21h
bm4gPGFybmRAYXJuZGIuZGU+DQo+IC0tLQ0KPiAgIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5i
dXNfcHJvYmVfZnJvbnRlbmQuYyB8IDEgKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNf
cHJvYmVfZnJvbnRlbmQuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfZnJv
bnRlbmQuYw0KPiBpbmRleCBmY2IzMzViYjdiMTguLjhiNzVmODIzNGJhZiAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9mcm9udGVuZC5jDQo+ICsr
KyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfZnJvbnRlbmQuYw0KPiBAQCAt
NTEzLDQgKzUxMyw1IEBAIHN0YXRpYyBpbnQgX19pbml0IGJvb3Rfd2FpdF9mb3JfZGV2aWNl
cyh2b2lkKQ0KPiAgIGxhdGVfaW5pdGNhbGwoYm9vdF93YWl0X2Zvcl9kZXZpY2VzKTsNCj4g
ICAjZW5kaWYNCj4gICANCj4gK01PRFVMRV9ERVNDUklQVElPTigiRnJvbnRlbmQgZm9yIFhl
biBidXMgcHJvYmUiKTsNCg0KTWF5IEkgc3VnZ2VzdCAiWGVuIFBWLWRldmljZSBmcm9udGVu
ZCBzdXBwb3J0IiBpbnN0ZWFkPw0KDQoNCkp1ZXJnZW4NCg0K
--------------0xl5rnPzp8wogKixk8qdxDys
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0xl5rnPzp8wogKixk8qdxDys--

--------------F1AG3EiYN9pow4cgn9Y0uDto--

--------------w8keZHt3rHXk8cRy2eo8QCgL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmflgEIFAwAAAAAACgkQsN6d1ii/Ey8l
Cgf/QdTgh0S8GyuOrXH4CS4NQcobLgn90Kiaq0zOu9lWQsP+ZmmErrpyL35QGksWt++2Im+FMNO2
FuJdlBfbDHZKy+I031s09fzIaMt/8xXpQF6e8HdDQHWWUzxzZ7tsHsaXOhGmi4wDh98P9MVL9nuG
6iJ7mRSSRW7VVoHl7A3DVUQxw4oxuiSkEl82OnBYre2bbyfl4j6PrsoFieGW+7a3LvJVqmH/sD6r
t14w6TWb3aT6AUnQCnabc0peyZA/QHbWSZnLVDmFnGvc0sa5FlpvfTNeVjyrj9QrAodBXewg8W2A
A/iQOgMOkxjoA3+jxig/eTaweP6QlcCcF2L06Jzi+g==
=jn45
-----END PGP SIGNATURE-----

--------------w8keZHt3rHXk8cRy2eo8QCgL--

