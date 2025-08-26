Return-Path: <linux-next+bounces-8103-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D434B358BF
	for <lists+linux-next@lfdr.de>; Tue, 26 Aug 2025 11:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C71AF5E674E
	for <lists+linux-next@lfdr.de>; Tue, 26 Aug 2025 09:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B24F2E2EFC;
	Tue, 26 Aug 2025 09:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TdFWioHN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E0A28725F
	for <linux-next@vger.kernel.org>; Tue, 26 Aug 2025 09:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756200277; cv=none; b=oNvYrlTm1LpcMs4teF/VVeqmVttIPlEsrOyNkEpaMfhtEQeA+pdGepm3HuDViyUEeVlNdigpuDFaK3B0QgsnW15JwtCmEVM51zDlGwnRfWHwqPoX+j/hDBQ3dKXyxvfwMcg7B5kQg7rPA1lhE6UlxQ+fSKSiiVJ+73Apf/6KmVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756200277; c=relaxed/simple;
	bh=J/IoKqS9L99rEz/sydfdH0xuUj3oAFhv5ezAvpTon20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uWibBE/A9e3F9RyyozQ7EAHhN03bT3G8MTiLK8he65Dax7LzWQ3MnhhnsJfeEq/wTqWoEqJ9Vh00XXqXcZgR7FmnqQbSuDnuOlain3pJWegGGCS1EBsS5FTH8YMLcHyrDFypS3En++Da1rgw8YSgmAcUGYIojGHOWEwL9zWKzMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TdFWioHN; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4b134f1c451so76972091cf.1
        for <linux-next@vger.kernel.org>; Tue, 26 Aug 2025 02:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756200274; x=1756805074; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J/IoKqS9L99rEz/sydfdH0xuUj3oAFhv5ezAvpTon20=;
        b=TdFWioHNkqgHXp+V4Ttg7W0udMM8ZtDapRHV4Y92TRUfZ8Xxcf0+2xLrh7JmsoH6s6
         u6IG4KFBUpT17AULiVhP2uB4IonC8mdumU2x0515uayxnA1pqIpGUbuMQzuc/pwW08kH
         LA/UFfQX3j5qCJBn71wdyywaZuDmIJEisfoePwJ0v4nnz6W3M+rexChOvT36EapYnkGt
         5q4SsIXYW4bT54jxvMc4xwScvz3KKKKpt5pQl9q3FKPqOqdKetp7VPL2hh4dq4rrForr
         ZCSgZxlUEND9b4ptUW1B4YBuaHhgKnTlMPcQBuXaWRBKM2gB07HE1FMbR6q0gwfDaOnS
         zVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200274; x=1756805074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/IoKqS9L99rEz/sydfdH0xuUj3oAFhv5ezAvpTon20=;
        b=D29lilTK+S3O3fdR9/LGfSm6EvnrDJHf0YegkIfcUE4XDeJRJ/VCvSBvGnHRgVdKHP
         mPz53Lg+B+GFlwccrygzbq4D0qw3WoC/b0ht8dlaWalFK/J1oRCMoYt2Tr7j3v+ufgUm
         MsJHWAbCn0PYCH4Fr54eCh7x8HdWQqe4NE/dktXn1APM4VgybRkDw1ohW3dQDTvMS+P5
         PK4qEj22mQU6BWaaFeY+WFVIlvbQFOfOaBaqqe2VJFUa0nF1d9iBkaui7g2+svQB/JmG
         yOyt8WUhCCk0IOffJJMSVGejlbnp5PWqa0GApPEnuAQB733zxBorKRb4VqHb7Nf+G3KY
         udqw==
X-Forwarded-Encrypted: i=1; AJvYcCVJSbl/6IWJZgV8aTv4n9ihK9dYwXPvseN6G6Ql65WtvTGCPy1kNoYOpZ9hZpaVTbzZ0Jx1Wa+wD6Sa@vger.kernel.org
X-Gm-Message-State: AOJu0YzqE4spTVIOFbViBXG35NexQHyinwfpPT8RYUgMkjbshPdfY0XH
	eoV8G35mj9XMmvBlfUxQ0ft0+xnGJqtYx7jveu/rd0kyKu9Z6tQpV0XAnO1J+a2WTvvOVWqWOnj
	aUQDD5mJJHpZoCbw9vEl+FZFul4qxQIE6ZNqRgRq/
X-Gm-Gg: ASbGnctF8uN6h/JeNMlWZFpffNv+2BVFma4cqhCrtvE1+XkuXqJXegq/cuwDpBdQD3z
	ceogHKYyJ8xpnDKOWazdeT2z8wk7NlyNa9DTUf+jlfUn0yMTRI0uAb/r07r2TcJuM2uScBrk3zG
	Sx2YdjPQxm6Fb+DlpT3t4hphF6Zpn5MRUkSdumLR6zVZEi+jGmxy3s9si86Lr3WN+Qxiia7S5DE
	Y/9RlEGvSdx
X-Google-Smtp-Source: AGHT+IFTHNJsjKTkjcVtDTMrM3RQM/3kwJpxGIvKJd8e7VYXr8rkRPtO2TzMsXRYIzi7fOj7AxGmOdYuZvx5c4r7JZk=
X-Received: by 2002:a05:6214:2a83:b0:70d:c245:d34a with SMTP id
 6a1803df08f44-70dc245ec56mr59784986d6.64.1756200273983; Tue, 26 Aug 2025
 02:24:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818120846.347d64b1@canb.auug.org.au> <1befd7ab-f343-450f-9484-0cef21fe2da8@linuxfoundation.org>
 <CABVgOSm2_FGfjQpUBttuUH5ZrMEqnaGkYVkN6N96wX7Qs8EE2Q@mail.gmail.com> <4d5bad8a-6afa-4284-8f78-b52e2cfedbf0@linuxfoundation.org>
In-Reply-To: <4d5bad8a-6afa-4284-8f78-b52e2cfedbf0@linuxfoundation.org>
From: David Gow <davidgow@google.com>
Date: Tue, 26 Aug 2025 17:24:20 +0800
X-Gm-Features: Ac12FXwGcOpH-4g4u_MhCddGrPfgc1DdLwDip9QVl_H6lfDrjvux2EAm6ueszSs
Message-ID: <CABVgOS=groSq6Dcdbb_PxFwikQTDodhA7gCAJBvv3jWzk8jrZQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the kunit-next tree
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Marie Zhussupova <marievic@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	KUnit Development <kunit-dev@googlegroups.com>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000879487063d413df0"

--000000000000879487063d413df0
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Aug 2025 at 10:15, Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 8/19/25 01:44, David Gow wrote:
> > On Tue, 19 Aug 2025 at 00:32, Shuah Khan <skhan@linuxfoundation.org> wrote:
> >>
> >> On 8/17/25 20:08, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> After merging the kunit-next tree, today's linux-next build (x86_64
> >>> allmodconfig) failed like this:
> >>
> >> Thank you Stephen. I did a allmodconfig build on 6.17-rc1 base - didn't
> >> see the error.
> >>
> >> Marie, David, can you take a look this. Looks like conflict with drm
> >> in next?
> >>
> >
> > Thanks, Shuah. I've managed to reproduce this with:
> > ./tools/testing/kunit/kunit.py run --arch x86_64 --kunitconfig
> > drivers/gpu/drm/xe
> >
> > These patches fix it (and a corresponding drm/xe test failure):
> > https://lore.kernel.org/linux-next/20250819073434.1411114-1-davidgow@google.com/T/#t
> >
> > Ideally, they'll be squashed into the corresponding patches, as
> > otherwise there'd be some temporary breakage during bisections. I can
> > squash these into the original series and re-send it out if that works
> > best for you.
> >
>
> David,
>
> Please squash them and resend - also I see a kernel test robot
> error in patch 1/2.
>
> I was going to squash them, but I saw the kernel test robot error patch.
>

Thanks, Shuah.

A v2 of the fix series, with the kernel test robot error fixed, is
here: https://lore.kernel.org/linux-kselftest/20250821135447.1618942-1-davidgow@google.com/

I've also squashed the fixes into a v4 of the original series here:
https://lore.kernel.org/linux-kselftest/20250826091341.1427123-1-davidgow@google.com/

Sorry for the mess!
-- David

--000000000000879487063d413df0
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
jmkLAgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFBp5bTxrTm/d
WMmRETO8lNkA4c7fMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQBF
tO3/N2l9hTaij/K0xCpLwIlrqpNo0nMAvvG5LPQQjSeHnTh06tWTgsPCOJ65GX+bqWRDwGTu8WTq
c5ihCNOikBs25j82yeLkfdbeN/tzRGUb2RD+8n9I3CnyMSG49U2s0ZdncsrIVFh47KW2TpHTF7R8
N1dri01wPg8hw4u0+XoczR2TiBrBOISKmAlkAi+P9ivT31gSHdbopoL4x0V2Ow9IOp0chrQQUZtP
KBytLhzUzd9wIsE0QMNDbw6jeG8+a4sd17zpXSbBywIGw7sEvPtnBjMaf5ib3kznlOne6tuDVx4y
QFExTCSrP3OTMUkNbpIdgzg2CHQ2aB8i8YsTZ8Q8Q8ztPJ+xDNsqBUeYxILLjTjxQQovToqipB3f
6IMyk+lWCdDS+iCLYZULV1BTHSdwp1NM3t4jZ8TMlV+JzAyRqz4lzSl8ptkFhKBJ7w2tDrZ3BEXB
8ASUByRxeh+pC1Z5/HhqfiWMVPjaWmlRRJVlRk+ObKIv2CblwxMYlo2Mn8rrbEDyfum1RTMW55Z6
Vumvw5QTHe29TYxSiusovM6OD5y0I+4zaIaYDx/AtF0mMOFXb1MDyynf1CDxhtkgnrBUseHSOU2e
MYs7IqzRap5xsgpJS+t7cp/P8fdlCNvsXss9zZa279tKwaxR0U2IzGxRGsWKGxDysn1HT6pqMDGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAUXA7LnOuRz2DvkWTeMc
0TANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgfvIKfvPN/H3iwHkgC1PkmYLNgJ1z
yP5rYSMR8mIZ190wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
ODI2MDkyNDM0WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAmomDLKAEAvvSi3NqDXw7dera09ZZhlkHbY4jAf+4t4TyNJP58QlBYoNyqruiRNMi
+pLrEeR7nXrGigKupQ0CPJnnBF+aMuUUdX258ObDd9qk8NZ2Y0RfkI/v811m3Z8+7X0RVqxlaX6K
MMjoSwsGPe9zE5IgOtHBUILG/1YKw2qgBCRDmj+xelY+DheS4Sursdc6jbqNj8G/3wd+A7zywALx
cp1Gl/BFhHmR47LcN/fFrS2FcgdkoDlABJOuD/nNfiUmnjCwP0u0AuTMXcAw1EDsevW9dIOpDMDz
N48Y0Esytpb3TMJpAAPdvC1nZSpOal9e6stSlQiSzQF8sXEhnw==
--000000000000879487063d413df0--

