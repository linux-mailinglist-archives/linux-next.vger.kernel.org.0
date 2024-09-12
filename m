Return-Path: <linux-next+bounces-3780-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECC9976184
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 08:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20890281821
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 06:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ABAC18A6A9;
	Thu, 12 Sep 2024 06:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ENiLRyr0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16A218757C
	for <linux-next@vger.kernel.org>; Thu, 12 Sep 2024 06:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726122590; cv=none; b=l8LBjaLcH3WPSYloLPtB3PllMUpCAeh0X4Zr31qHVtnJF2QeIKamqUlJDH7p+lxV4pjPK/TAyPWy8CGXamOcBDZzj5OdqKWvKcZkAEkcWlvwVxjaOIqWKZ5d/vxojkm0jwQuXvX3ObPW9/ll16vjgQxY/Z7rhT//sZvqHFaZKjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726122590; c=relaxed/simple;
	bh=ys66xTX0tf0F0hi38imW4BH8GAaVMBPMpQF2SFVHhr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ghH/amR+BeQNLNxP56+yQ9+T09M9AQicl4q0syeewIuC+qOu/PsOACh2najxOKng5TruQPpyPyVnKEk9vHR9zNs7uXB2z9qBAQCyRtxMKvDm+VgiUUQcHFzfbYMSRqVi4HFXxqugTlM5pFq+fXh/wpyV0V+lqrugsOeCZLc9ACg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ENiLRyr0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cbc22e1c4so4279745e9.2
        for <linux-next@vger.kernel.org>; Wed, 11 Sep 2024 23:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726122586; x=1726727386; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ys66xTX0tf0F0hi38imW4BH8GAaVMBPMpQF2SFVHhr8=;
        b=ENiLRyr0B9COguBemr2bcpK40/iLTKUXSp68EfKAr+IL+gmRvgk7D91OZpCZrAzlXF
         9iHLDd1xk/fCnJPX+7ZlsouknYiChLSKX9xzaigaxZs0zDy9BqQvSXgosRqG+8/P1J79
         mYPE8GUn+lKciPYkZF0P7xVgfXk/6dTRwkunZWE0W5HwKknan2h+06xzVdaFXV6YWFz7
         ryR3ode8fi4sOG9RvUOw9LEpu61zJZUICrRYVrZoUGcfVF7zINAwiVApldv5woyNzqkn
         nUu81/DZrdf1Bpty01UvhhTZoG/4+bcK9Ebwd4ySGmdX8L0wwUDqZZZUecTw/iDgWG/+
         5afQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726122586; x=1726727386;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ys66xTX0tf0F0hi38imW4BH8GAaVMBPMpQF2SFVHhr8=;
        b=mXAGJQzFw5usjp+Ee0GgPiVBHZ/fJgEU7q6qAhZjrsPQVMK4MYqc1IeGirC3jcT96D
         /y5bX10xRX7ReL7cC1M8RV3BhbiVzhJOpJRou7J8gv4LwIRmKwrRF6QXQ15cek6kO8DZ
         aH2IzpAwHjhDxJPozpporyW0w3mY7QfslDSNM8+ACI8Mg8xJzzlc3EIvin+D7QRb5ZiX
         S2lK1WgtektjwPGqWz5znxqbyXszvmfjLcP2MVSMWeOlBFT6jdDrBtVLkm9TbdSc56iO
         rMbgHDggNdVpvSPVi3ccPzNrJSgLDZinjJlawPj0M2w8WAsDKR5iJ5njxlyDcUYp8Vb7
         mrFg==
X-Forwarded-Encrypted: i=1; AJvYcCUUFCaki7REw1IYG+D/Q2FN+csOGMWFktgcnQPgMMBgEL0BrDxK+MV0Ys/z864Euf+JksmwXC3pe06+@vger.kernel.org
X-Gm-Message-State: AOJu0YzmQFwSHOvA4chkLMZgcPKkpG2vV2V3BOr7YWOInW8OpDj5+maN
	KhLmJyeGAiIKV91A2/8dl/aWO7jxiaHg7aADXYiVIqR54u+keez42jra3HHtU0M=
X-Google-Smtp-Source: AGHT+IH0wNFofbqM0EIDc20lr1w+hVR27bR2gb22OT9ZFIGilR6z8clQZZB9uzQQh/22fCfGczC8dw==
X-Received: by 2002:a05:600c:3556:b0:426:6a53:e54f with SMTP id 5b1f17b1804b1-42cdb576a8fmr10929255e9.33.1726122585472;
        Wed, 11 Sep 2024 23:29:45 -0700 (PDT)
Received: from ?IPV6:2003:e5:8741:4a00:60e5:7bee:fc48:e85c? (p200300e587414a0060e57beefc48e85c.dip0.t-ipconnect.de. [2003:e5:8741:4a00:60e5:7bee:fc48:e85c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956652ddsm13466080f8f.29.2024.09.11.23.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 23:29:45 -0700 (PDT)
Message-ID: <353d8403-1322-4c63-b1f5-cfc5b6c464f7@suse.com>
Date: Thu, 12 Sep 2024 08:29:44 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the xen-tip tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Xen Devel <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240912161333.1e65a06a@canb.auug.org.au>
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
In-Reply-To: <20240912161333.1e65a06a@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SWOURxvU00gWAyKCheA50OLJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SWOURxvU00gWAyKCheA50OLJ
Content-Type: multipart/mixed; boundary="------------shhELr50BGxZG8jYbV7CQsKN";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Xen Devel <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <353d8403-1322-4c63-b1f5-cfc5b6c464f7@suse.com>
Subject: Re: linux-next: build failure after merge of the xen-tip tree
References: <20240912161333.1e65a06a@canb.auug.org.au>
In-Reply-To: <20240912161333.1e65a06a@canb.auug.org.au>

--------------shhELr50BGxZG8jYbV7CQsKN
Content-Type: multipart/mixed; boundary="------------tsZ8HImO649cHk3JVfRC22iz"

--------------tsZ8HImO649cHk3JVfRC22iz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDkuMjQgMDg6MTMsIFN0ZXBoZW4gUm90aHdlbGwgd3JvdGU6DQo+IEhpIGFsbCwN
Cj4gDQo+IEFmdGVyIG1lcmdpbmcgdGhlIHhlbi10aXAgdHJlZSwgdG9kYXkncyBsaW51eC1u
ZXh0IGJ1aWxkICh4ODZfNjQNCj4gYWxsbW9kY29uZmlnKSBmYWlsZWQgbGlrZSB0aGlzOg0K
PiANCj4gRVJST1I6IG1vZHBvc3Q6ICJhY3BpX29zX2lvcmVtYXAiIFtkcml2ZXJzL2dwdS9k
cm0vZ21hNTAwL2dtYTUwMF9nZngua29dIHVuZGVmaW5lZCENCj4gDQo+IENhdXNlZCBieSBj
b21taXQNCj4gDQo+ICAgIGRlNDIzN2ZkNTE3NCAoInhlbjogYWxsb3cgbWFwcGluZyBBQ1BJ
IGRhdGEgdXNpbmcgYSBkaWZmZXJlbnQgcGh5c2ljYWwgYWRkcmVzcyIpDQo+IA0KPiBhY3Bp
X29zX2lvcmVtYXAgaXMgbm90IGV4cG9ydGVkIHRvIG1vZHVsZXMuDQoNCk5vdyBmaXhlZC4N
Cg0KVGhhbmtzLA0KDQoNCkp1ZXJnZW4NCg==
--------------tsZ8HImO649cHk3JVfRC22iz
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------tsZ8HImO649cHk3JVfRC22iz--

--------------shhELr50BGxZG8jYbV7CQsKN--

--------------SWOURxvU00gWAyKCheA50OLJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmbiilgFAwAAAAAACgkQsN6d1ii/Ey8w
WAf7BjXEcbwqKDUsPo1wXkMvrpKe2BNgRCj1I9L6qa5c5HAmHtccd5B6IhI2xPywWRxSdjmjwoLd
2/CMiMWaa/9XmqW4wCjiyUWo+En4eys6onXUJna170FE0Eg2fA8mztNzlaVd1oIrKW1n9lV6Je45
d1bhndO8OvocKoox0xqJ00zzXEQ1A3vFrZNRmcSy0tGRuXNVJ/4cdUt6tIEjtuc0jObWo5iI4Zgn
UIht9W95OLD5TXdvS/qiFRnOKBKoMIHqSmSSEM/E5N4aMcN5OVrrvniLlne4jhCzQkU8ScOK2GHt
Pjrj2RRR+zoWZ6C9p4+br+/SdJTidQjL+rXTXE12nw==
=7p/K
-----END PGP SIGNATURE-----

--------------SWOURxvU00gWAyKCheA50OLJ--

