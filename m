Return-Path: <linux-next+bounces-6088-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B39E5A758A0
	for <lists+linux-next@lfdr.de>; Sun, 30 Mar 2025 07:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3CB67A4D04
	for <lists+linux-next@lfdr.de>; Sun, 30 Mar 2025 05:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F7635942;
	Sun, 30 Mar 2025 05:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RRqgIDOX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111A912E7F
	for <linux-next@vger.kernel.org>; Sun, 30 Mar 2025 05:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743311535; cv=none; b=RDQl8MJbhXiPBiZ0X6Iv7fCMIENgFKXya9HHYuZ/uxG5UJudpcpGSKRnQBMJkIeDmrOpacRgluc8SBfWpOW+i0Q7ri8CSRE/g4vI0t7qL9NvTAB+hmg0GEjdBe2qYRW0tWsfPwolkw3SDoBh4Mqa7266JQP9+n/8rOaQ41bPJ0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743311535; c=relaxed/simple;
	bh=YWuJcaqzCAHmjaLDWXon6xxKY+EWuZj/edaxEVQyBgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kdaOWaDuw/LDN9PXZ6qdoWt+eSQdTLgOjLCBjenvZzH7zTu70Tjmsqwr/MPlyLOmE+5AM4Xa1PasEoqxv3wZQvF123oK5XwbOKmr8uByOjgzGOLMdHJ72D+u3jbTveqCeYWvHxS0rG/Rm7aPVrYN98Y0NPpH5qpbB9AeAHpFRMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RRqgIDOX; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4775ce8a4b0so12098041cf.1
        for <linux-next@vger.kernel.org>; Sat, 29 Mar 2025 22:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743311533; x=1743916333; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v+Z5h9JrG4VKKPpMRDMXdeMORGzOTH7R15k+Z0ZKEtI=;
        b=RRqgIDOXGrVEnkEtYyI8oiG5cypmJm5P4lDCXJjgnI4r56qJKX7usPfi4BphL3i+2A
         sZUzCul8Rngt/zuwhNSrvXuA3yvxsboOd384KXOASuUbqqMto/sU4A79ejVG8AfjLKTS
         noR1jfclsZ4Cl9EooyiY6F4oCCz9eVMSN5XxhkOOwLikiAra6FzxkrJvscJpyLOkfN+w
         g5HLsRYhyakkTLg1Z3fOtYIPNWGnk0lK4qlkl6HByQ+Ol92kYDX/7oCL5jIVaJTPg4Yz
         rmT9P1RD+3pseX0rEvjg4C5z4yuhTGU/+ZlfeDnFwZPQ3fzoSJxqZ2vj3M9DPSY9UIaQ
         osFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743311533; x=1743916333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+Z5h9JrG4VKKPpMRDMXdeMORGzOTH7R15k+Z0ZKEtI=;
        b=g2Jm9J3nCXfO8kUzXb3yyXk1dLlK9GBOJeaw1UwFP8ciWevu2Va+M4mkUzwinKg5uM
         zHG8ORRVKs5JOWdlYbHb8b8RNXR3vkHCD5q3X1LEM1xeaE563uknklA5b/b3QxHLz12C
         /C2ixHXL5jR4t34I716p96qKm54V7oSLf5cIvW1IOn4YGy7aCP1p4CbTS75qHu3yCBpo
         Yo17m8qbDJvBvmEEMB1h1lmSX206tmdKi4whj5wp2qh9BJpJiQflOtVR7SLUdi1MvdmL
         6t7vFUGYtmoEdVo4pSwLg2leiosLXx7NW0ixBEM0fX9jhTwDs3WET+7usf/Lpc3VFAyt
         0zOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZoY5tqVCilX2AXEYPByfJe1AzTaQ8Fo0TeVmoQyAOmmwPPc48sVkqFXDRNhnrwrtiimSyyI73MRjo@vger.kernel.org
X-Gm-Message-State: AOJu0YydE6DMxicXk8OAr5AVtubFUv8Jf7I3o8XIod7u3Kwuh1w8SiD6
	v70AoIR/Y87TH6y06IIPNdeRvM/GkasT8gi+GssY1R/V/L55M7E1qUnpZWDKsMEsnYnVdeLpOFe
	+iwmQhXcDUL5lxPf3GLlIXPATVOP3JBKha2HW
X-Gm-Gg: ASbGncuhQdH9o0+a3VOR76GvVDMwFbppziihXGFJvFy9iYxwDoELhhSoDGmAp+hoKLn
	AUCNSU2kA9IDQN8btPr6v3cP81ix3VOvB8q7VsPQMqWAWhC2ssNtNGdA2+yjh8TzJCF8S2TBAt/
	YXfOX1V3YLGEIdScZ5yskFCV5UWaY=
X-Google-Smtp-Source: AGHT+IFginpYH0GLYppqMhHhZN2boY1CevRWXB0X1bojwdSeH6RvTyK6a19sr+kf/52ZCAlQWrNKkRkTeOwztAjD5D0=
X-Received: by 2002:ad4:5fc9:0:b0:6e8:f470:2b0d with SMTP id
 6a1803df08f44-6eed5fcf561mr68651036d6.19.1743311532750; Sat, 29 Mar 2025
 22:12:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250329150529.331215-1-acarmina@redhat.com>
In-Reply-To: <20250329150529.331215-1-acarmina@redhat.com>
From: David Gow <davidgow@google.com>
Date: Sun, 30 Mar 2025 13:11:59 +0800
X-Gm-Features: AQ5f1JooguJgc3s96n2JzLR8eEnagdouWhjCy8iGfhlMWQXOVXQqVUnOKOUNKUs
Message-ID: <CABVgOS=s-NgS1tPOOPDstuVfTmsW9H0kP8nEQmtfFiubQeyvWw@mail.gmail.com>
Subject: Re: [PATCH] kunit: fixes backtrace suppression test module description
To: Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
	Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>, 
	Arthur Grillo <arthurgrillo@riseup.net>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Maxime Ripard <mripard@kernel.org>, Ville Syrjala <ville.syrjala@linux.intel.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>, 
	Alessandro Carminati <alessandro.carminati@gmail.com>, Jani Nikula <jani.nikula@intel.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000ab0ab406318858c5"

--000000000000ab0ab406318858c5
Content-Type: text/plain; charset="UTF-8"

On Sat, 29 Mar 2025 at 23:06, Alessandro Carminati <acarmina@redhat.com> wrote:
>
> Adds module description to the backtrace suppression test
>
> Fixes:  ("19f3496") kunit: add test cases for backtrace warning suppression
>
> Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> ---

The "Fixes" tag here should be immediately before the Signed-off-by
line, without a newline. Also, ideally the format should be something
like:
Fixes: d03d078df162 ("kunit: add test cases for backtrace warning suppression")

(But you'll need to make sure the commit hash matches the one which
actually lands -- I picked d03d078df162 from the current
mm-nonmm-unstable branch.)

Nevertheless, I like the content of this, so it should be either
accepted or rolled into a new version of the backtrace suppression
test.

Acked-by: David Gow <davidgow@google.com>

Cheers,
-- David

>  lib/kunit/backtrace-suppression-test.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/lib/kunit/backtrace-suppression-test.c b/lib/kunit/backtrace-suppression-test.c
> index 8b4125af2481..d4c5df09bba6 100644
> --- a/lib/kunit/backtrace-suppression-test.c
> +++ b/lib/kunit/backtrace-suppression-test.c
> @@ -102,3 +102,4 @@ static struct kunit_suite backtrace_suppression_test_suite = {
>  kunit_test_suites(&backtrace_suppression_test_suite);
>
>  MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("KUnit test to verify warning backtrace suppression");
> --
> 2.34.1
>

--000000000000ab0ab406318858c5
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUnQYJKoZIhvcNAQcCoIIUjjCCFIoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
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
YE9NAgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFHgsCGkO2Hex
N6ybc+GeQEb6790qMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQAs
exV05yVDmPhHRqOq9lAbfWOUvEf8zydxabZUHna6bayb83jD2eb9nMGGEprfuNBRmFg35sgF1TyN
+ieuQakvQYmY8tzK49hhHa2Y3qhGCTqYTHO3ypHvhHsZiGbL0gmdgB9P8ssVIws//34ae99GUOxo
XKTxPwwsQ5Arq42besv3/HXAW+4nRAT8d3ht5ZWCHc5rjL/vdGzu7PaYo3u0da69AZ8Sh4Gf5yoc
QANr2ZkMrxXbLmSmnRvbkQrzlZp2YbTFnczx46429D6q75/FNFOL1vAjxtRAPzkyACvW0eKvchza
TMvvD3IWERLlcBL5yXpENc3rI8/wVjqgAWYxlFg1b/4b/TCgYe2MZC0rx4Uh3zTIbmPNiHdN6QZ9
oDiYzWUcqWZ5jCO4bMKNlVJXeCvdANLHuhcC8FONj5VzNgYXs6gWkp9/Wt6XnQPX4dF4JBa8JdL/
cT46RJIzoiJHEx/8syO5FparZHIKbkunoq6niPsRaQUGeqWc56H4Z1sQXuBJN9fhqkIkG0Ywfrwt
uFrCoYIRlx4rSVHpBIKgnsgdm0SFQK72MPmIkfhfq9Fh0h8AjhF73sLO7K5BfwWkx1gwMySyNY0e
PCRYr6WEVOkUJS0a0fui693ymMPFLQAimmz8EpyFok4Ju066StkYO1dIgUIla4x61auxkWHwnzGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAcDMKctW1GQKDKqEUSh4
pjANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgBP3cE6Dpzx/52lRFIdz7ierlg4y3
obxFgA8OZlbe7hMwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
MzMwMDUxMjEzWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAiqLN4p9OQku0kFutJHSMEwcPbbywBi1ykXuT933p/xFVn4q/23H9z6Q4Gr9Qf5qf
whMoJMR1RicPUTdUW2Z/3gA3NihEHx2o1AQANneJF917NQEf7fblnUI6JgA3dgwClgI4dKSmxVZT
FDz9G0va5APKHcas01CfEpyKBspLwTFCfFteTBf6PWH1AAWIwi3azZSo6LHP6sQXgNnyOkgdvSNa
LH3mBx1zcUXxrvbsIxHonN0Ci+37lJOjEIaxC14Uzq9Ye4dUm3cmRdS+pr9JyrX+4wGfnbn+Yw3d
1U2uBPI2cw+1F+c1rcW6rvdA3SVcIOrrw9mqNekb7+WULTzzhA==
--000000000000ab0ab406318858c5--

