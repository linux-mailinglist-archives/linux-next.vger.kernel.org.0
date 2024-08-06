Return-Path: <linux-next+bounces-3236-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF2B948743
	for <lists+linux-next@lfdr.de>; Tue,  6 Aug 2024 04:06:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FFD11C2275F
	for <lists+linux-next@lfdr.de>; Tue,  6 Aug 2024 02:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528D11F949;
	Tue,  6 Aug 2024 02:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1Gkh6mGA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B6E1946F
	for <linux-next@vger.kernel.org>; Tue,  6 Aug 2024 02:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722909994; cv=none; b=dpY7F870kZuptbAkZjCm2R9Uw18e/+XmpXewcsFRv31vQz+VW/o1ujL5O9k9wE0IlyW5JYZCnUJ2a+K/D46C12YihmssyaezeiW1LCLRSXolySi8yyB4SlLKY3TzFa94aUecBfx9pV0hr8hl7KeDCIkX8q+djNAH0iVtJEVcfJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722909994; c=relaxed/simple;
	bh=11JsLUmhIKQPphwWZQZj+1shcpRBXRg4Ry0jMgdxj+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NgaRKEqs+nYh0Zt4PG30Ax7U48MzS513nPXo2c9xGz4KoXWjTXI2xtMK3OztA0/t8z9eJwcERUoEVj1Trck+QN+MxbDGMNVQyUSkssgQ+7JW8lNpwA4Ri4vKErY0+ScexeALgVBzNbHZrGSqQ/xYpllsQIfFv/yjfy6w7f+wHJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1Gkh6mGA; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-44fdc70e695so228441cf.0
        for <linux-next@vger.kernel.org>; Mon, 05 Aug 2024 19:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722909991; x=1723514791; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+oFCt/ppLOkL/KMjlgNIklqYXkv7H17R8LnhUCiFCjM=;
        b=1Gkh6mGArIBOKntEw/W16Ut1qOyti9ZrQudNm8w53hC4wEfqnCfW5jcXW1gOHt27UJ
         kjU2v+gpkmZnUuzltSnDS/w/DM4sGbq3HCU3vfKuOtzX/1/TysD2lpscJfY24yYRWFRR
         fJItqilPReI5sZqA2LfziecpHM4aktvzmHIPZWresRQzsOUo/AtyD5jPq9pmsJpr8tLB
         ufhxurmh9S3zxIxZgDbo2V2P7kLmXCfSTrJto7qDiCkHdCXaTQiLY+rKOk0LYnW2YSBk
         GpsNzhJIgIwQOkECSHeEutXH1wPj03LQY+e8PiL+ctHq2V/EJpDmm5w3L8vr2Zg3tKIu
         7odA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722909991; x=1723514791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oFCt/ppLOkL/KMjlgNIklqYXkv7H17R8LnhUCiFCjM=;
        b=fZfbMiwmx8kmO3Qx/sYuhXJEaAB75vKNxHmRUfes2VD5uCsbBIp+gRN8t9Kb1i/Nls
         AWiZ5AbKQfd52QqF6F2W9mI2tead9Z8HGbzgHNeZAfDPYbW6Cc+volaDl7szR6VXqrWR
         eGNZxIbnhg6N/uVh3bV1tyvZE6IfpZDh7X3v0zn9Nv1/PnPStE8doFRoPu17AXRkeH/M
         fO+umO3QIgkfbo/HkdauWJHFGmki3AZ7Y5qBQRWay6Qo8xHxl7AHhJQ5WKo0FCJfF94w
         hr7ClgDbN+lPiMyE9UwPkocNIlGlLbHKUKNHO35ucv5pppJM833gCXTVtHUvdOLHvw2s
         45vw==
X-Forwarded-Encrypted: i=1; AJvYcCXWHnFfjw3b7DfCbgLzQj7C2o9kxe0z8+SW7toiQCt/NkM0Yga+HxW1hkixgCQ4Vih9FN4KGiF/g4PMW61YuMTtFsPXG6hO667I8w==
X-Gm-Message-State: AOJu0Yzcf9kTn5gvE3Ql9wmr81mmWAnrpm4xSIEkk2XMLbzvu9VhDUsb
	xapI9cw2DaUKtLgRESBQzZNi30/4sT4rXCM+YQ6yD6p3tcdQqEcU6pbSLz37MZPQ1VOkXNiiP3J
	J++VwkS4Jiv45oOg7/ibsPRLnXvVqIPazKVhB/R4yU6UaRsB3w0USwjg=
X-Google-Smtp-Source: AGHT+IGQUy2A5UwRQXnnU9QqbJxhMuJ33SylAufqb9RO1zaLOvNUtULnr1R2SwgHlhGuxnBxW7jWZ7kvQ3gUvf/QEzQ=
X-Received: by 2002:ac8:5a8e:0:b0:447:e59b:54eb with SMTP id
 d75a77b69052e-451bb72dd8fmr1578441cf.26.1722909990500; Mon, 05 Aug 2024
 19:06:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240806091818.7b417ee7@canb.auug.org.au>
In-Reply-To: <20240806091818.7b417ee7@canb.auug.org.au>
From: David Gow <davidgow@google.com>
Date: Tue, 6 Aug 2024 10:06:19 +0800
Message-ID: <CABVgOSmpcXOKFVYOm4jgJ7STxhA7o2k5SfQgxn=fzkAZYyW-rg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the kunit-fixes tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Brendan Higgins <brendanhiggins@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000feed96061efa3d4b"

--000000000000feed96061efa3d4b
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Aug 2024 at 07:18, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the kunit-fixes tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> ERROR: modpost: "__start_rodata" [lib/kunit/kunit.ko] undefined!
> ERROR: modpost: "__end_rodata" [lib/kunit/kunit.ko] undefined!
>
> Caused by commit
>
>   7d3c33b290b1 ("kunit: Device wrappers should also manage driver name")
>

Thanks. I think this should fix it:
https://lore.kernel.org/linux-kselftest/20240806020136.3481593-1-davidgow@google.com/

Cheers,
-- David

--000000000000feed96061efa3d4b
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPqgYJKoZIhvcNAQcCoIIPmzCCD5cCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg0EMIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
JEfDtvHU6wy3MSBE3/TrMFcGA1UdIARQME4wCQYHZ4EMAQUBATBBBgkrBgEEAaAyASgwNDAyBggr
BgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wDAYDVR0TAQH/
BAIwADCBmgYIKwYBBQUHAQEEgY0wgYowPgYIKwYBBQUHMAGGMmh0dHA6Ly9vY3NwLmdsb2JhbHNp
Z24uY29tL2NhL2dzYXRsYXNyM3NtaW1lY2EyMDIwMEgGCCsGAQUFBzAChjxodHRwOi8vc2VjdXJl
Lmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcnQwHwYDVR0jBBgw
FoAUfMwKaNei6x4schvRzV2Vb4378mMwRgYDVR0fBD8wPTA7oDmgN4Y1aHR0cDovL2NybC5nbG9i
YWxzaWduLmNvbS9jYS9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcmwwDQYJKoZIhvcNAQELBQADggEB
AGwXYwvLVjByVooZ+uKzQVW2nnClCIizd0jfARuMRTPNAWI2uOBSKoR0T6XWsGsVvX1vBF0FA+a9
DQOd8GYqzEaKOiHDIjq/o455YXkiKhPpxDSIM+7st/OZnlkRbgAyq4rAhAjbZlceKp+1vj0wIvCa
4evQZvJNnJvTb4Vcnqf4Xg2Pl57hSUAgejWvIGAxfiAKG8Zk09I9DNd84hucIS2UIgoRGGWw3eIg
GQs0EfiilyTgsH8iMOPqUJ1h4oX9z1FpaiJzfxcvcGG46SCieSFP0USs9aMl7GeERue37kBf14Pd
kOYIfx09Pcv/N6lHV6kXlzG0xeUuV3RxtLtszQgxggJqMIICZgIBATBoMFQxCzAJBgNVBAYTAkJF
MRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFzIFIz
IFNNSU1FIENBIDIwMjACEAFsPHWl8lqMEwx3lAnpufYwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZI
hvcNAQkEMSIEIFDdsR47XZK5Vbqs/JlsnL/mYdomoCvATyjHIpROVL3vMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MDgwNjAyMDYzMVowaQYJKoZIhvcNAQkPMVww
WjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkq
hkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAe0Ei/
O9sVgt0DkUqt8biKAU+ON5Ru2/JkMwpOpBegxevCxZBjpKWEvNPh9XJjZ7BIEzgaFHflz5S5hPTI
dP4yJbmVv8r0U5Ma011a62qKZc5o6b19B47F8/VvxUax8VeP2eiAGw7mx6bd/ZVgXRjZNE33q0hI
YIWKqh3ROqMPN/+z1eDAZmtMada3H1IYQbIqkGZ8rTYXf/FRMJijEj785z5Al/nC8NW5/DsC+A01
D60knznM6+U8T3GG4iIFny/kkiZU5lk2hdTyI6tXKPWb4+BqX53cL1q99gCOzPkWHI+87X0zOpAF
t/ZOdmSfMVrN3RGs+xiw8HbMOkm01VqF
--000000000000feed96061efa3d4b--

