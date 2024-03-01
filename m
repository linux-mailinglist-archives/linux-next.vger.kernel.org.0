Return-Path: <linux-next+bounces-1430-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BBB86DBED
	for <lists+linux-next@lfdr.de>; Fri,  1 Mar 2024 08:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E077289A26
	for <lists+linux-next@lfdr.de>; Fri,  1 Mar 2024 07:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4818069978;
	Fri,  1 Mar 2024 07:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2PxReUle"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB4F69941
	for <linux-next@vger.kernel.org>; Fri,  1 Mar 2024 07:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709277317; cv=none; b=cSf9Kmh2DsRL31SmXyblIo8/zc/W/Xl8U6yJjC+El2Sx6WTDaoPrMvUhm7V/Au8j4+SBYHXTlLX/oANUz1XTjbqDToa+daAguEIK4NVvyipmy6M2R5XFp3y5uw9W2inKIVU74rvKU+FhTvk8KQURKPaR8F7S8MoXviAYRnD1qPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709277317; c=relaxed/simple;
	bh=8OuCTxVKJb/Cx6IGfQwUhP2t+iUEWVsj+luyvTMkVlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iEHJd1ZwrjPU5BGV6xUzo0El1z2XH27OpEXh4f1Bxbt8TBWTduqDAfROjAQGxC/RMX7iD5eFl5+MH/9ZDKWD98X8gQ/s5IdKt2BY11XKYEvGCGxxRrn3sLk5r+kqjZovDIPS/V1PJpuWrHZCoUu2ZOr8GIJlyz07KBzbbh4KLcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2PxReUle; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5654ef0c61fso8294a12.0
        for <linux-next@vger.kernel.org>; Thu, 29 Feb 2024 23:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709277314; x=1709882114; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lbb5cNjjYs15V6zL2hETwrGWUOF8GKaGJLgAoJi0GJA=;
        b=2PxReUledP6l3T6/Hw/1A6zT36lAs0j4KxPq5TYeSK1FBWW3r6L5GCyVDUgxj6AMhK
         Nlo3n5ugMkEqbz7hH2rVVvrDQrvBWB7N2bpLWCGduWWTCg6DVtQ6pGSFwdp1Lsmk8axu
         R2BXslR0/Lr22mroXqZRFjnD2eoglhSJHTGC3ePPpoq+Ga6cBnCJlsqngqMPpS1GQUAx
         iPwF2aVJSH1JQefA/7LxgvS2yUxniJ0Qb/Gx8EcW3Kacxzt/M8NTV1zqvAtph3y5ZJgM
         Ryb4biXG58CX2FJD9RaRUTtu5TNoMmFOvdAwG0ijDIazqwYcuz/8wi58r8tAlU8l6Nf4
         WBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709277314; x=1709882114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lbb5cNjjYs15V6zL2hETwrGWUOF8GKaGJLgAoJi0GJA=;
        b=mkyfsF07jowbcQ4CwKsCA/c3+YmhbX44Z9K0AhePt88twBVobdZxSNzq5KQFPNCYLZ
         TEtPjVwQBvW2BsXbtl4IjbdwqtqffQXfo7N18UBYzQDFyIhyTCXpEyrkvwiksGLSfRtd
         whjwE2lq0LENDQrJs9HUKr3Lmx4+rNzTxDktE491uMu2/sxm+9H4GPW75cJbc0cRgHsB
         vnujz+QykKdJVGxZolW5RUaiw/y8iNmJkuEblK1nBDjjIz842IoQp1v2A+ncfJAEkwjQ
         YW5Mm5/9bd8RHYTJdflwPcp8QE2QIuuuHZxav/HoBmCDCV4Qi5YKkwoxUdVqaD8Vmo6F
         r4BQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5vAzokf5EXU6z+H3mGMdDv1aLroZwVzEZXKXKcY7Pk6472LYqEcB2SgwsI/6ns7Ag55NHMUMmPViVjH9CjCK1bLzCCteauRDLhg==
X-Gm-Message-State: AOJu0YxD+2fzrQ3Ek3DEUUGKi47BUzo4ZmV+rQQ20p9r4RjwK34bEr7Y
	qfui2G04cfmaPJ7wXJSYtXFAEGLjGPBZbLJFI8O6aYVg55EW1kwTOSglxXo/YdE+UUkwI9ODoQ8
	GCiGthDDQBon0asuaEBgx2+QWx2HbHP51Rjo+
X-Google-Smtp-Source: AGHT+IGE2zEUbsEm+nc83ovvVoQ/70AldYILVAMhtedeufq5I1LUfH3K5s3/0m96lnE4cASKnATQHo79s0pinqrS6vQ=
X-Received: by 2002:aa7:cfce:0:b0:566:6e9f:e9d8 with SMTP id
 r14-20020aa7cfce000000b005666e9fe9d8mr49389edy.1.1709277313877; Thu, 29 Feb
 2024 23:15:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229152653.09ecf771@canb.auug.org.au> <be2e812c-3898-4be8-8a9d-e221acb837c3@linuxfoundation.org>
In-Reply-To: <be2e812c-3898-4be8-8a9d-e221acb837c3@linuxfoundation.org>
From: David Gow <davidgow@google.com>
Date: Fri, 1 Mar 2024 15:15:02 +0800
Message-ID: <CABVgOSmAmkOcY8hFnpPSgz5WZXFkez_BDGhKjBepbWFpKykfUg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the kunit-next tree
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Brendan Higgins <brendanhiggins@google.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, 
	DRI <dri-devel@lists.freedesktop.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000002361440612942319"

--0000000000002361440612942319
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Feb 2024 at 23:07, Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> Hi Stephen,
>
> On 2/28/24 21:26, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the kunit-next tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > In file included from drivers/gpu/drm/tests/drm_buddy_test.c:7:
> > drivers/gpu/drm/tests/drm_buddy_test.c: In function 'drm_test_buddy_alloc_range_bias':
> > drivers/gpu/drm/tests/drm_buddy_test.c:191:40: error: format '%u' expects a matching 'unsigned int' argument [-Werror=format=]
> >    191 |                                        "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
> >        |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > include/kunit/test.h:597:37: note: in definition of macro '_KUNIT_FAILED'
> >    597 |                                     fmt,                                       \
> >        |                                     ^~~
> > include/kunit/test.h:662:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
> >    662 |         KUNIT_UNARY_ASSERTION(test,                                            \
> >        |         ^~~~~~~~~~~~~~~~~~~~~
> > include/kunit/test.h:1233:9: note: in expansion of macro 'KUNIT_FALSE_MSG_ASSERTION'
> >   1233 |         KUNIT_FALSE_MSG_ASSERTION(test,                                        \
> >        |         ^~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/tests/drm_buddy_test.c:186:17: note: in expansion of macro 'KUNIT_ASSERT_FALSE_MSG'
> >    186 |                 KUNIT_ASSERT_FALSE_MSG(test,
> >        |                 ^~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/tests/drm_buddy_test.c:191:91: note: format string is defined here
> >    191 |                                        "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
> >        |                                                                                          ~^
> >        |                                                                                           |
> >        |                                                                                           unsigned int
> > cc1: all warnings being treated as errors
> >
> > Caused by commit
> >
> >    806cb2270237 ("kunit: Annotate _MSG assertion variants with gnu printf specifiers")
> >
>
> Thank you. I did allmodconfig build on kselftest kunit branch to make
> sure all is well, before I pushed the commits.
>
> > interacting with commit
> >
> >    c70703320e55 ("drm/tests/drm_buddy: add alloc_range_bias test")
>   >
> > from the drm-misc-fixes tree.
> >
> > I have applied the following patch for today (this should probably
> > actually be fixed in the drm-misc-fixes tree).
> >
>
> Danial, David,
>
> I can carry the fix through kselftest kunit if it works
> for all.

I'm happy for this to go in with the KUnit changes if that's the best
way to keep all of the printk formatting fixes together.


-- David

>
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Thu, 29 Feb 2024 15:18:36 +1100
> > Subject: [PATCH] fix up for "drm/tests/drm_buddy: add alloc_range_bias test"
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >   drivers/gpu/drm/tests/drm_buddy_test.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> > index 1e73e3f0d278..369edf587b44 100644
> > --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> > +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> > @@ -188,7 +188,7 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
> >                                                             bias_end, size, ps,
> >                                                             &allocated,
> >                                                             DRM_BUDDY_RANGE_ALLOCATION),
> > -                                    "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
> > +                                    "buddy_alloc failed with bias(%x-%x), size=%u\n",
> >                                      bias_start, bias_end, size);
> >               bias_rem -= size;
> >
>
> thanks,
> -- Shuah

--0000000000002361440612942319
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
7xDrOPfX3COqq162RFg/MFcGA1UdIARQME4wCQYHZ4EMAQUBATBBBgkrBgEEAaAyASgwNDAyBggr
BgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wDAYDVR0TAQH/
BAIwADCBmgYIKwYBBQUHAQEEgY0wgYowPgYIKwYBBQUHMAGGMmh0dHA6Ly9vY3NwLmdsb2JhbHNp
Z24uY29tL2NhL2dzYXRsYXNyM3NtaW1lY2EyMDIwMEgGCCsGAQUFBzAChjxodHRwOi8vc2VjdXJl
Lmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcnQwHwYDVR0jBBgw
FoAUfMwKaNei6x4schvRzV2Vb4378mMwRgYDVR0fBD8wPTA7oDmgN4Y1aHR0cDovL2NybC5nbG9i
YWxzaWduLmNvbS9jYS9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcmwwDQYJKoZIhvcNAQELBQADggEB
AK0lDd6/eSh3qHmXaw1YUfIFy07B25BEcTvWgOdla99gF1O7sOsdYaTz/DFkZI5ghjgaPJCovgla
mRMfNcxZCfoBtsB7mAS6iOYjuwFOZxi9cv6jhfiON6b89QWdMaPeDddg/F2Q0bxZ9Z2ZEBxyT34G
wlDp+1p6RAqlDpHifQJW16h5jWIIwYisvm5QyfxQEVc+XH1lt+taSzCfiBT0ZLgjB9Sg+zAo8ys6
5PHxFaT2a5Td/fj5yJ5hRSrqy/nj/hjT14w3/ZdX5uWg+cus6VjiiR/5qGSZRjHt8JoApD6t6/tg
ITv8ZEy6ByumbU23nkHTMOzzQSxczHkT+0q10/MxggJqMIICZgIBATBoMFQxCzAJBgNVBAYTAkJF
MRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFzIFIz
IFNNSU1FIENBIDIwMjACEAHS+TgZvH/tCq5FcDC0n9IwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZI
hvcNAQkEMSIEIB1vGBERpY4amejbW6EK7xRRKXbDOU5xNdsAoZLb4lWWMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MDMwMTA3MTUxNFowaQYJKoZIhvcNAQkPMVww
WjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkq
hkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQDDz17v
YIE7T7xw0wJHXZmJ7lXF0MCtGvkfO0Eja51hq2XbDOLZ4st+XGZyRu98QqNIGuAoFXeQpd40hhqY
PtFmfIPUGDENUnuYy8v2o9rhjz/0pr6R3IpTXXjJ5Mlc8GFWPx3OCVhOuGyVd6oEWdvNCgwebPdK
7EUlChKzuJO4Dsx9jXNyqiTJufS/xaNesJvgKG/AenDpnO6iEsSJePQm+7asOPRh9xXnl3rvlKxt
NURSX5OXWsREt+lmMd/uy52LBa3Fk9uZkXbQlKfm1af9L/6xaCIo/60jIWdlR8l67KfKftnxlDpB
CjqyGaQ8DbcgA6au29cdX1fW5c8exdN+
--0000000000002361440612942319--

