Return-Path: <linux-next+bounces-5297-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 490E3A19454
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2025 15:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27E3A3A7A43
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2025 14:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F45170A15;
	Wed, 22 Jan 2025 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/edoKe0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF0D77111;
	Wed, 22 Jan 2025 14:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737557227; cv=none; b=AhuHC+3pqjBRS0GtLj4lvCZnwM0HXAjHvcfJcDpKICET9K4ul7frOHZtsC4DqmfIxYjo7ZqPp5xexj46X+VZzeQgEYIJm/UJTiUipHB4y3ufJJpOmN5tByZK5QAFMP7n3NI4+cqnaTB4mRAlMgfXHyaFLhvqQ1w6MaUUVwKFvCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737557227; c=relaxed/simple;
	bh=mWH1l8xN+kPhWeuesiiwO1oNDL8Ob46Y8DUXP0xLRT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jGDtmlSroO8qGPpPgpHuSZJgBauJk3eSCVc3BxgxMqNX5+ofaw9dYA1oQaWUQpUg49YMhjmQFR6YQiOEvtkF/4mtulc3XC5ey418w8HAVJQiyq7Tchgn7qowmZ1GDpzIgnAK/7uM60v7ON5IugtdAA388p/MbiD8ZoDlO1yQYxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/edoKe0; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so9503602a91.2;
        Wed, 22 Jan 2025 06:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737557225; x=1738162025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DTwmwXE6hvLZlylHXv7J9Xg/8DidTCd/7TCvUczShtk=;
        b=T/edoKe0+pHs18s9+4lPPbY6xWWIT0GTls0wBAkDNMJEFrPO4Wk7RUtFh0WGz7gc5w
         3n4BxAMz6YVB+xgjoLnVVKPqnnilf0Ma3E+31nq1KbhbHPuOGKfrbn0vzEEWSNPsRbs1
         Nnd0gSCoAqcTbGfm8csLv+hWwzUE1/MU4iHbASLtOZMEqIF1S1GP7C0qmLShGnI0erUO
         b0Q6rWU0YXZq+BU8NPZ1lrG5Zyn09jrqV1ntCc7GdRc7YGGv3hEIgBOQx16CCT4nkSeB
         NP/JYCdiN3C7A1wZ4XO9oT/NkizWjADY8IzRwo31VtvBHmBE4Ye3xeOXI/tTygUroDuO
         gH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737557225; x=1738162025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DTwmwXE6hvLZlylHXv7J9Xg/8DidTCd/7TCvUczShtk=;
        b=XrruubLZxfuF/HkzZGOe5i7awU8kZQT80snpl1+pL6g7ciL1r53nqezknFXq871J4s
         9r7hwIFcvCbaoWuFFHc/wT/5R22rhi0kFEjlQcyoNdiMeT5aOlPcqTPWtT++mBblenob
         MIhoRI/zaznO4pBdwAkUNOWm89VuNmcBnb6Za0H8Fimgvc/oteJnMiXs8qBDcUcV9rn6
         EhBJlkkbmSwFTWMQoRlgWyxifh77iqbHaJpL6GQoYSCG02l17zQq5j/VKkl099Bur/2T
         /quh7K6AqED6VOXrYrWx6OW4x30MLyH5LP3Q/9Stvpg+azHLx8AHWtNa+jb5dfWbOHVm
         zivg==
X-Forwarded-Encrypted: i=1; AJvYcCW8erMH0GugfnXR+R9M2JWn4N9ww5h+pe74nj797RyHAW0fJk7/nrG5Z0x39d3z7NAnLO9ElM5IvwY=@vger.kernel.org, AJvYcCXAuC6BoSeEITjpTHZgSTJ2A1tbhJ1nKXpzxvasUwz63UtwLenTye6MmMK/lI/F5qbclPpxoqflG9JxAQ==@vger.kernel.org, AJvYcCXz5d0q1UhxlqM4v94uzkJLSsl7lWtmuB75x50SrVGB1oWTYjk5v8Ea2beK9PqZWX5519gPI9J7+Xhu5ZCp@vger.kernel.org
X-Gm-Message-State: AOJu0YyTGudll7sdIdiiJv70jSBPD43ynua+7zCfMN9NCGzxFJyssPSD
	sk+hmS7GfUTZ4xRbRiuDRINWGA3Cy0dMko5v4E5BkN8BoEJmqVL5rQj0Dg==
X-Gm-Gg: ASbGncuGAVaMFEj2frDX9g+UwBsE9jO3TyQvpjqAPrBnnA/COR5G2xacXaBLtAKXNIA
	piuT+vgHVONb8DPbAgzCwKFyGEnpcLjGsIA/D7SPPLL8ltD21igBkR/Jj/WnidWhFyQRnR6oTgh
	DLkoqTkEpnBECcKfmPXDBdEYkhnV3HVF/3nSVWQhz4ZwFBlRuw48yOfIWHJCh8PNXQgiICgJDgc
	MD1yXhuWKzcmt+a7ZiVUHwq5HuNMj5ssLK4qq/zuP+aYbUHq/XeQT6xbQNg/oKpLh8acGQct6/x
	tqxAindtOfgdPKbLwPYQr4HrV2Cqs1o5SGihopef
X-Google-Smtp-Source: AGHT+IEFJfb8JdR0uxTB95f0hEiIqD55HlidaYwR/BiGXD5dnSl2tjMZjFye0YN2S0xhVu9KHzdayQ==
X-Received: by 2002:a17:90b:258c:b0:2ee:dd9b:e3e8 with SMTP id 98e67ed59e1d1-2f782c73b69mr31734721a91.8.1737557224891;
        Wed, 22 Jan 2025 06:47:04 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6aabc4bsm1774219a91.21.2025.01.22.06.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 06:47:04 -0800 (PST)
Message-ID: <1518fd0f-4b8e-406a-bd60-878c0c522bde@gmail.com>
Date: Wed, 22 Jan 2025 23:46:46 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the origin tree
To: Bagas Sanjaya <bagasdotme@gmail.com>, sfr@canb.auug.org.au
Cc: bhelgaas@google.com, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, mchehab+samsung@kernel.org,
 linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <20250122170335.148a23b0@canb.auug.org.au>
 <07507296-a37b-4543-97cb-0560ef7fb7b8@gmail.com> <Z5D1FzkmODr7YC8I@archie.me>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <Z5D1FzkmODr7YC8I@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Bagas Sanjaya wrote:
> On Wed, Jan 22, 2025 at 07:00:43PM +0900, Akira Yokosawa wrote:
>> [+CC: linux-doc]
>>
>> Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Today's linux-next build (htmldocs) produced this warning:
>>>
>>> Documentation/power/video.rst:213: WARNING: Footnote [#] is not referenced. [ref.footnote]
>>>
>>> This warning has presumably been there for a long time.
>>>
>>> I don't know what causes it - maybe it needs a space before the opening
>>> bracket?
>>
>> Stephen, fhve you upgraded your Sphinx recently?
>>
>> In "Bugs Fixed" section of Sphinx 8.1.0 changelog [1], there is an item which
>> reads:
>>
>>     - #12730: The UnreferencedFootnotesDetector transform has been improved
>>       to more consistently detect unreferenced footnotes. Note, the priority
>>       of the transform has been changed from 200 to 622, so that it now runs
>>       after the docutils Footnotes resolution transform. Patch by Chris Sewell.
>>
>> So the above warning is real and prior versions of Sphinx just can't flag it.
>>
>> To silence it, you need to get rid of the unreferenced footnote, I guess.
> 
> Hi Akira,
> 
> I think the culprit [#f3] footnote (that triggers the warning) refers to
> Toshiba Satellite P10-554 notebook, where s3_bios and s3_resume work only on
> uniprocessor kernel. The proper fix will be probably adding a space before
> the footnote.
> 

Ahh, you mean the referencing side of the footnote in that table.

Yes, you are right. I was lazy and didn't look closely at that jumbo change.
Point taken!

Thank you.

        Akira


